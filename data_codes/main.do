*########################################=====ERICK=====###################################
*MAIN
cd "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\Management\manage_psd\data_codes"
use "lac_data_management.dta", clear

*gen vars
	do genvars.do
*describe
	do describe.do
*gen vars
	do clean.do
*tfp
	do tfp.do
*estimation
	do estimation.do
*robustness analysis
*hello Chris


*########################################=====CHRIS=====###################################
