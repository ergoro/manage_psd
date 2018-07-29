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
regress sg monitor target pmanage mt tp pm i.country i.sector

*check sector variable a4a
