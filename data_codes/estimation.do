*########################################=====ERICK=====###################################
*====Estimation
*==factor analysis
factor moquan moqual taquan taqual pmquan pmqual, pcf
rotate
/*
predict m1 m2 m3
egen m1m=rmean(pmquan pmqual)
egen m2m=rmean(taquan taqual)
egen m3m=rmean(moquan moqual)
graph matrix m1 m2 m3 m1m m2m m3m, half
corr m1 m2 m3 m1m m2m m3m
pwcorr m1 m2 m3 m1m m2m m3m
sum m1 m2 m3 m1m m2m m3m
sum m1m m2m m3m monitor target pmanage
*/

factor monitor target pmanage, pcf
rotate
*predict m1 m2 m3

*==regression
regress sg moquan taquan pmquan mo_ta mo_pm ta_pm i.country i.sector
regress sg moquan taquan pmquan mo_ta mo_pm ta_pm i.city i.sector


replace monitor=monitor/100
sum monitor


regress sg monitor target pmanage mt tp pm i.country i.sector

*check sector variable a4a
<<<<<<< HEAD
*Additions

**Rescale variable
foreach var in monitor target pmanage {
gen `var'_r = `var'/100
}

**Winsor and Trim
winsor sg, gen(Wsg) p(0.005) high

trimplot sg,over(a6a) percent
trimmean sg, percent(0(5)50)
clonevar Tsg=sg
_pctile Tsg, nq(100)
return list   
replace Tsg=. if sg>r(r97) 

clonevar Msg=sg
recode Msg (50/max=.)


**New variables
clonevar year=a14y
clonevar size=a6a
recode size (4=1)

recode sg (50/max=.)
egen clust01=group(city size)
egen clust02=group(city size sector)
recode a7 (1=1) (2=0), gen(largefirm)


***Reg
reg Wsg  i.city i.sector i.year  monitor_r target_r pmanage_r  , r cluster(clust02)
outreg2   using result01, ctitle("") drop(i.city i.sector i.year) label bdec(3) se  excel nocons replace ///
addtext(Country, Yes, Sector, Yes, Year, Yes)
test (monitor_r target_r pmanage_r)
reg Wsg  i.city i.sector i.year  c.monitor_r##c.target_r##c.pmanage_r , r cluster(clust02)
outreg2   using result01, ctitle("") drop(i.city i.sector i.year)  label bdec(3) se  excel nocons append ///
addtext(Country, Yes, Sector, Yes, Year, Yes)
test (monitor_r target_r pmanage_r)
=======



*########################################=====CHRIS=====###################################

