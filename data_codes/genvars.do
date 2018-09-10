*########################################=====ERICK=====###################################
*generate vars

*====Constructing variables
*sales growth (three years)
gen sg=((d2-n3)/n3)
*country
encode a1n, generate(country)
*city
encode a2n, generate(city)
*sector
gen sector=a4a
*year
bysort a1n: tab a20y a14y
gen fiyear=a20y

*management vars with linear transformation
*monitoring
gen moquan=ASCr2
replace moquan=0 if moquan==4
sum moquan
replace moquan=(0-moquan)/(0-3)
gen moqual=ASCr1
replace moqual=0 if moqual==4
sum moqual
replace moqual=(0-moqual)/(0-3)
gen monitor=(0.5*moquan)+(0.5*moqual)
*target setting
gen taquan=ASCr8
sum taquan
replace taquan=(1-taquan)/(1-4)
gen taqual=ASCr7
sum taqual
replace taqual=(6-taqual)/(6-1)
gen target=(0.5*taquan)+(0.5*taqual)
*OBSERVE DETAILS OF OPERATION
*people management
gen pmquan=ASCr111
sum pmquan
replace pmquan=(2-pmquan)/(2-1)
gen pmqual=ASCr11t
sum ASCr11t
replace pmqual=(1-pmqual)/(1-4)
gen pmanage=(0.5*pmquan)+(0.5*pmqual)
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

*Productivity variables
*SALES (Y)
*(total annual sales)
*The sales variable is in national currency. I want to convert it to 2005 USD
*exchange rates:
bysort a1n: tab fiyear
*Argentina 2016 2017
*Bolivia 2015 2016 2017
*Colombia 2016 2017
*Ecuador 2016
*Paraguay 2016
*Peru 2015 2016 2017
*Uruguay 2015 2016 2017

gen erat=.
replace erat=16.5627069251411 if a1n=="Argentina" & fiyear==2017
replace erat=14.7581750873396 if a1n=="Argentina" & fiyear==2016
replace erat=6.91 if a1n=="Bolivia" & fiyear==2017
replace erat=6.91 if a1n=="Bolivia" & fiyear==2016
replace erat=6.91 if a1n=="Bolivia" & fiyear==2015
replace erat=2951.3274023476 if a1n=="Colombia" & fiyear==2017
replace erat=3054.12167321081 if a1n=="Colombia" & fiyear==2016
replace erat=1 if a1n=="Ecuador" & fiyear==2016
replace erat=5670.51743118687 if a1n=="Paraguay" & fiyear==2016
replace erat=3.2604884908321 if a1n=="Peru" & fiyear==2017
replace erat=3.37506158720665 if a1n=="Peru" & fiyear==2016
replace erat=3.18443924152237 if a1n=="Peru" & fiyear==2015
replace erat=28.6764 if a1n=="Uruguay" & fiyear==2017
replace erat=30.1626 if a1n=="Uruguay" & fiyear==2016
replace erat=27.3273666666667 if a1n=="Uruguay" & fiyear==2015

gen cpiusa=.
replace cpiusa=1 if (year==1)
replace cpiusa=1.09849974398361 if (year==2)
replace d2=. if (d2==-9 | d2==-8)
gen Y=(d2/erat)/cpiusa


*########################################=====CHRIS=====###################################
