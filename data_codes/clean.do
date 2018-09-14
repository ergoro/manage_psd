*########################################=====ERICK=====###################################


sort country
	by country: sum Y LC LW K M E if d1a2==1810
	twoway (scatter y lc, mlabel(idstd)) if d1a2==1810, ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Labor cost (log)") caption("Source: LAC, ES")
		twoway (scatter y lc, mlabel(country)) if d1a2==1810, ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Labor cost (log)") caption("Source: LAC, ES")
	twoway (scatter y k, mlabel(idstd)) if d1a2==1810, ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital (log)") caption("Source: LAC, ES")
		twoway (scatter y k, mlabel(country)) if d1a2==1810, ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital (log)") caption("Source: LAC, ES")
	twoway (scatter y m, mlabel(idstd)) if d1a2==1810, ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Raw mat. & Int. Goods (log)") caption("Source: LAC, ES")
		twoway (scatter y m, mlabel(country)) if d1a2==1810, ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Raw mat. & Int. Goods (log)") caption("Source: LAC, ES")
regress y lc if d1a2==1810
	lvr2plot, mlabel(idstd) title("Labor cost (log)")
predict stdresid, rstandard
replace lc=. if stdresid>3 & d1a2==1810
replace lc=. if stdresid<-3 & d1a2==1810
replace LC=. if stdresid>3 & d1a2==1810
replace LC=. if stdresid<-3 & d1a2==1810
extremes stdresid idstd if d1a2==1810
drop stdresid
regress y lw if d1a2==1810
	lvr2plot, mlabel(idstd) title("Labor cost (log)")
predict stdresid, rstandard
replace lw=. if stdresid>3 & d1a2==1810
replace lw=. if stdresid<-3 & d1a2==1810
replace LW=. if stdresid>3 & d1a2==1810
replace LW=. if stdresid<-3 & d1a2==1810
extremes stdresid idstd if d1a2==1810
drop stdresid
regress y k if d1a2==1810
	lvr2plot, mlabel(idstd) title("Capital (log)")
predict stdresid, rstandard
replace k=. if stdresid>3 & d1a2==1810
replace k=. if stdresid<-3 & d1a2==1810
replace K=. if stdresid>3 & d1a2==1810
replace K=. if stdresid<-3 & d1a2==1810
extremes stdresid idstd if d1a2==1810
drop stdresid
regress y m if d1a2==1810
	lvr2plot, mlabel(idstd) title("Raw mat. & Int. Goods (log)")
predict stdresid, rstandard
replace m=. if stdresid>3 & d1a2==1810
replace m=. if stdresid<-3 & d1a2==1810
replace M=. if stdresid>3 & d1a2==1810
replace M=. if stdresid<-3 & d1a2==1810
extremes stdresid idstd if d1a2==1810
drop stdresid


*########################################=====CHRIS=====###################################
