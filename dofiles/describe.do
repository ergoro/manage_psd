cd "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\data"
use "lac_data_management.dta", clear

*====Structuring data
tab a1n
tab a2n
sort a1n
by a1n: tab a2n
egen ASCr11t=rowtotal(ASCr112 ASCr11)
label define ASCr11t2 -9 "Don't know (spontaneous)" -7 "Does not apply" 1 "Their own performance as measured by tagets" 2 "Their team or shift performance as measured by targets" 3 "Their establishment's performance as measured by targets" 4 "Their company[s performance as measured by targets" 5 "No performance bonuses"
label values ASCr11t ASCr11t2
replace ASCr11t=. if ASCr11t==0
replace ASCr111=2 if ASCr11==5
replace ASCr11t=. if ASCr11t==5
replace ASCr111=1 if ASCr11t==1
replace ASCr111=1 if ASCr11t==2
replace ASCr111=1 if ASCr11t==3
replace ASCr111=1 if ASCr11t==4

*====Cleaning data
*What Best Describes What Happened When Problem In The Production Process Arose?
tab ASCr1 a1n
tab ASCr1 a1n, nolab
replace ASCr1=. if ASCr1==-9
*How Many Production Performance Indicators Were Monitored At This Establishment?
tab ASCr2 a1n, nolab
replace ASCr2=. if ASCr2==-9
*How Easy To Achieve Its Production Targets?
tab ASCr7
tab ASCr7, nolab
replace ASCr7=. if ASCr7==-9
*Who Was Aware Of The Production Targets At This Establishment?
tab ASCr8
tab ASCr8, nolab
replace ASCr8=. if ASCr8==-9
*Does this establishment offer performance bonus to managers
tab ASCr111
/*
*If randomly selected, what Were Managers' Performance Bonuses Usually Based On?
tab ASCr112
tab ASCr112, nolab
replace ASCr112=. if ASCr112==-9
*What Were Managers' Performance Bonuses Usually Based On?
tab ASCr11
tab ASCr11, nolab
replace ASCr11=. if ASCr11==-9
replace ASCr11=. if ASCr11==-7
*/
*What Were Managers' Performance Bonuses Usually Based On (combined)?
tab ASCr11t
replace ASCr11t=. if ASCr11t==6
replace ASCr11t=. if ASCr11t==9
tab ASCr11t, nolab
replace ASCr11t=. if ASCr11t==-9 
replace ASCr11t=. if ASCr11t==-7
*annual sales
tab d2, nolabel
replace d2=. if d2==-9 
*annual sales three years ago
tab n3
tab n3, nolabel
replace n3=. if n3==-9
replace n3=. if n3==-7 

*====Constructing variables
*sales growth (three years)
gen sg=((d2-n3)/n3)
*management vars with linear transformation
*monitoring
gen moquan=ASCr2
replace moquan=0 if moquan==4
sum moquan
replace moquan=(0-moquan)/(0-3)*100
gen moqual=ASCr1
replace moqual=0 if moqual==4
sum moqual
replace moqual=(0-moqual)/(0-3)*100
gen monitor=(0.5*moquan)+(0.5*moqual)
*target setting
gen taquan=ASCr8
sum taquan
replace taquan=(1-taquan)/(1-4)*100
gen taqual=ASCr7
sum taqual
replace taqual=(6-taqual)/(6-1)*100
gen target=(0.5*taquan)+(0.5*taquan)
*OBSERVE DETAILS OF OPERATION
*people management
gen pmquan=ASCr111
sum pmquan
replace pmquan=(2-pmquan)/(2-1)*100
gen pmqual=ASCr11t
sum ASCr11t
replace pmqual=(1-pmqual)/(1-4)*100
gen pmanage=(0.5*pmquan)+(0.5*pmquan)
/*
*monitoring
gen moquan=ASCr2
tab moquan
replace moquan=0 if moquan==4
tab moquan
gen moqual=ASCr1
replace moqual=0 if moqual==4
tab moqual
*target setting
gen taquan=ASCr7
gen taqual=ASCr8
*people management
gen pmquan=ASCr111
gen pmqual=ASCr11t
*/
*interaction terms
gen mo_ta=moquan*taquan
gen mo_pm=moquan*pmquan
gen ta_pm=taquan*pmquan
gen mt=monitor*target
gen tp=target*pmanage
gen pm=pmanage*monitor
*country
encode a1n, generate(country)
*city
encode a2n, generate(city)
*sector
gen sector=a4a

*====Descriptive statistics
sort a1n
by a1n: sum ASCr1 ASCr2 ASCr7 ASCr8 ASCr111 ASCr11t
by a1n: tabstat ASCr1 ASCr2 ASCr7 ASCr8 ASCr111 ASCr11t, stat(mean sd min p50 max iqr cv skewness kurtosis n)
by a1n: sum d2 n3 sg
sum ASCr1 ASCr2 ASCr7 ASCr8 ASCr111 ASCr11t
tabstat ASCr1 ASCr2 ASCr7 ASCr8 ASCr111 ASCr11t, stat(mean sd min p50 max iqr cv skewness kurtosis n)
sum d2 n3 sg
sort a1n
by a1n: tabstat monitor target pmanage sg, stat(mean sd min p50 max iqr cv skewness kurtosis n)
tabstat monitor target pmanage sg, stat(mean sd min p50 max iqr cv skewness kurtosis n)

*====Estimation
regress sg moquan taquan pmquan mo_ta mo_pm ta_pm i.country i.sector
regress sg moquan taquan pmquan mo_ta mo_pm ta_pm i.city i.sector
regress sg monitor target pmanage mt tp pm i.country i.sector

*check sector variable a4a
