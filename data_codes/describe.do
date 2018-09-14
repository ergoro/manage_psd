*########################################=====ERICK=====###################################
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


*Describe standardized vars
sort a1n
by a1n: tabstat monitor target pmanage sg, stat(mean sd min p50 max iqr cv skewness kurtosis n)
by a1n: tabstat moquan moqual taquan taqual pmquan pmqual sg, stat(mean sd min p50 max iqr cv skewness kurtosis n)
graph bar monitor target pmanage
graph bar moquan moqual taquan taqual pmquan pmqual
graph bar monitor moquan moqual target taquan taqual pmanage pmquan pmqual
graph bar monitor, over(a1n, label(angle(45)))
graph bar target, over(a1n, label(angle(45)))
graph bar pmanage, over(a1n, label(angle(45)))
graph bar moquan, over(a1n, label(angle(45)))
graph bar moqual, over(a1n, label(angle(45)))
graph bar taquan, over(a1n, label(angle(45)))
graph bar taqual, over(a1n, label(angle(45)))
graph bar pmquan, over(a1n, label(angle(45)))
graph bar pmqual, over(a1n, label(angle(45)))

graph bar monitor target pmanage, over(a1n, label(angle(45)))
	bysort a1n: sum monitor target pmanage
	drop if a1n=="Nicaragua" | a1n=="El Salvador" | a1n=="Dominican Republic" | a1n=="Honduras"
graph bar moquan moqual taquan taqual pmquan pmqual, over(a1n, label(angle(45)))
graph bar monitor moquan moqual target taquan taqual pmanage pmquan pmqual, over(a1n, label(angle(45)))

graph bar monitor moquan moqual, over(a1n, label(angle(45)))
graph bar target taquan taqual, over(a1n, label(angle(45)))
graph bar pmanage pmquan pmqual, over(a1n, label(angle(45)))

*########################################=====CHRIS=====###################################
