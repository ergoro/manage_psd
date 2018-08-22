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

*test


*########################################=====CHRIS=====###################################
