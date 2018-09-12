*########################################=====ERICK=====###################################
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




CHECK:
sort panel
	by panel: sum Y LC K M E if d1a2n==18
	twoway (scatter y lc, mlabel(idstd)) if d1a2n==18, by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Labor cost (log)") caption("Source: LAC, ES")
	twoway (scatter y k, mlabel(idstd)) if d1a2n==18, by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital (log)") caption("Source: LAC, ES")
	twoway (scatter y m, mlabel(idstd)) if d1a2n==18, by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Raw mat. & Int. Goods (log)") caption("Source: LAC, ES")
regress y lc if d1a2n==18
	lvr2plot, mlabel(idstd) title("Labor cost (log)")
predict stdresid, rstandard
replace lc=. if stdresid>3
replace lc=. if stdresid<-3
replace LC=. if stdresid>3
replace LC=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y k if d1a2n==18
	lvr2plot, mlabel(idstd) title("Capital (log)")
predict stdresid, rstandard
replace k=. if stdresid>3
replace k=. if stdresid<-3
replace K=. if stdresid>3
replace K=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y m if d1a2n==18
	lvr2plot, mlabel(idstd) title("Raw mat. & Int. Goods (log)")
predict stdresid, rstandard
replace m=. if stdresid>3
replace m=. if stdresid<-3
replace M=. if stdresid>3
replace M=. if stdresid<-3
extremes stdresid idstd
drop stdresid

sort panel
	by panel: sum Y LC K M E if d1a2n==36
	twoway (scatter y lc, mlabel(idstd)) if d1a2n==36, by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Labor cost (log)") caption("Source: LAC, ES")
	twoway (scatter y k, mlabel(idstd)) if d1a2n==36, by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital (log)") caption("Source: LAC, ES")
	twoway (scatter y m, mlabel(idstd)) if d1a2n==36, by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Raw mat. & Int. Goods (log)") caption("Source: LAC, ES")
regress y lc if d1a2n==36
	lvr2plot, mlabel(idstd) title("Labor cost (log)")
predict stdresid, rstandard
replace lc=. if stdresid>3
replace lc=. if stdresid<-3
replace LC=. if stdresid>3
replace LC=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y k if d1a2n==36
	lvr2plot, mlabel(idstd) title("Capital (log)")
predict stdresid, rstandard
replace k=. if stdresid>3
replace k=. if stdresid<-3
replace K=. if stdresid>3
replace K=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y m if d1a2n==36
	lvr2plot, mlabel(idstd) title("Raw mat. & Int. Goods (log)")
predict stdresid, rstandard
replace m=. if stdresid>3
replace m=. if stdresid<-3
replace M=. if stdresid>3
replace M=. if stdresid<-3
extremes stdresid idstd
drop stdresid






sort panel
	by panel: sum Y LW LC K K1 M E F OC
	twoway (scatter y lw, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Workers (log)") caption("Source: LAC, ES")
	twoway (scatter y lc, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Labor cost (log)") caption("Source: LAC, ES")
	twoway (scatter y k, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital (log)") caption("Source: LAC, ES")
	twoway (scatter y k1, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital estimated (log)") caption("Source: LAC, ES")
	twoway (scatter y m, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Raw mat. & Int. Goods (log)") caption("Source: LAC, ES")
	*Comparing the two capital variables
	twoway (scatter k k1, mlabel(idstd)), ysize(20) xsize(20) ytitle("Capital (log)") xtitle("Capital estimated (log)") caption("Source: LAC, ES")
	twoway (scatter K K1, mlabel(idstd)), ysize(20) xsize(20) ytitle("Capital") xtitle("Capital estimated") caption("Source: LAC, ES")
	pwcorr k k1, sig star(.001)
	pwcorr K K1, sig star(.001)
quietly{
regress y lw
	lvr2plot, mlabel(idstd) title("Workers (log)")
predict stdresid, rstandard
replace lw=. if stdresid>3
replace lw=. if stdresid<-3
replace LW=. if stdresid>3
replace LW=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y lc
	lvr2plot, mlabel(idstd) title("Labor cost (log)")
predict stdresid, rstandard
replace lc=. if stdresid>3
replace lc=. if stdresid<-3
replace LC=. if stdresid>3
replace LC=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y k
	lvr2plot, mlabel(idstd) title("Capital (log)")
predict stdresid, rstandard
replace k=. if stdresid>3
replace k=. if stdresid<-3
replace K=. if stdresid>3
replace K=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y k1
	lvr2plot, mlabel(idstd) title("Capital estimated(log)")
predict stdresid, rstandard
replace k1=. if stdresid>3
replace k1=. if stdresid<-3
replace K1=. if stdresid>3
replace K1=. if stdresid<-3
extremes stdresid idstd
drop stdresid
regress y m
	lvr2plot, mlabel(idstd) title("Raw mat. & Int. Goods (log)")
predict stdresid, rstandard
replace m=. if stdresid>3
replace m=. if stdresid<-3
replace M=. if stdresid>3
replace M=. if stdresid<-3
extremes stdresid idstd
drop stdresid
}


*########################################=====CHRIS=====###################################
