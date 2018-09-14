*Production Function
preserve
keep if d1a2==1810
	*OLS
regress va k lc
	outreg2 using myfile, tex replace ctitle(OLS)
	*LP
*levpet va, free(lc) proxy(e) capital(k) valueadded reps(250)
*	outreg2 using myfile, tex replace ctitle(LP)
	*ACF
*acfest va, state(k) proxy(e) free(lc) nbs(200) va
*	outreg2 using myfile, tex replace ctitle(ACF)
	*Stochastic
frontier va k lc, iter(100)
	outreg2 using myfile, tex ctitle(Stochastic)
restore

*TFP
preserve
keep if d1a2==1810
	*OLS
regress va k lc
generate tfp_ols=va-((_b[k])*k)-((_b[lc])*lc)
	*LP
*levpet va, free(lc) proxy(e) capital(k) valueadded reps(250)
*generate tfp_lp=va-((_b[k])*k)-((_b[lc])*lc)
	*ACF
*acfest va, state(k) proxy(e) free(lc) nbs(200) va
*generate tfp_acf=va-((_b[k])*k)-((_b[lc])*lc)
	*Stochastic
frontier va k lc, iter(100)
generate tfp_stch=va-((_b[k])*k)-((_b[lc])*lc)
sum tfp_ols tfp_stch
*tfp_lp tfp_acf tfp_gee tfp_re tfp_fe
restore
