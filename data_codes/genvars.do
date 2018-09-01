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
Argentina 2016 2017
Bolivia 2015 2016 2017
Colombia 2016 2017
Ecuador 2016
Paraguay 2016
Peru 2015 2016 2017
Uruguay 2015 2016 2017


gen erat=.
replace erat=16.5627069251411 if a1n=="Argentina" & fiyear==2017
replace erat=14.7581750873396 if a1n=="Argentina" & fiyear==2016


replace erat=2.9036575 if (country_year=="Argentina2006")
replace erat=3.71010683052328 if (country_year=="Argentina2010")
replace erat=8.0660625 if (country_year=="Bolivia2006")
replace erat=7.02 if (country_year=="Bolivia2010")
replace erat=559.7675 if (country_year=="Chile2006")
replace erat=560.85989484127 if (country_year=="Chile2010")
replace erat=2320.83417666667 if (country_year=="Colombia2006")
replace erat=2158.25590299025 if (country_year=="Colombia2010")
*replace erat=25000 if (country_year=="Ecuador2006")
replace erat=1 if (country_year=="Ecuador2006")
replace erat=1 if (country_year=="Ecuador2010")
replace erat=8.75 if (country_year=="ElSalvador2006")
replace erat=8.75 if (country_year=="Elsalvador2010")
replace erat=7.63394416666667 if (country_year=="Guatemala2006")
replace erat=8.16155541666667 if (country_year=="Guatemala2010")
replace erat=18.8323416666667 if (country_year=="Honduras2006")
replace erat=18.8951 if (country_year=="Honduras2010")
replace erat=10.8978916666667 if (country_year=="Mexico2006")
replace erat=13.513475 if (country_year=="Mexico2010")
replace erat=16.7333295340502 if (country_year=="Nicaragua2006")
replace erat=20.3394818701997 if (country_year=="Nicaragua2010")
replace erat=1 if (country_year=="Panama2006")
replace erat=1 if (country_year=="Panama2010")
replace erat=6177.95833333333 if (country_year=="Paraguay2006")
replace erat=4965.39166666667 if (country_year=="Paraguay2010")
replace erat=3.29584166666667 if (country_year=="Peru2006")
replace erat=3.01150833333333 if (country_year=="Peru2010")
replace erat=24.4786 if (country_year=="Uruguay2006")
replace erat=22.5679833333333 if (country_year=="Uruguay2010")
replace erat=2.08975 if (country_year=="Venezuela2006")
replace erat=2.147 if (country_year=="Venezuela2010")
*drop if (country_year=="Ecuador2006" | country_year=="Ecuador2010")
drop if (country_year=="Venezuela2006" | country_year=="Venezuela2010")
gen cpiusa=.
replace cpiusa=1 if (year==1)
replace cpiusa=1.09849974398361 if (year==2)
replace d2=. if (d2==-9 | d2==-8)
gen Y=(d2/erat)/cpiusa


*########################################=====CHRIS=====###################################
