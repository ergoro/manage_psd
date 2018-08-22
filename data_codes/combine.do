*########################################=====ERICK=====###################################
*Append datasets
cd "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management"

use "Argentina-2017-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Argentina-2017-full data_NEW.dta", replace
use "Bolivia-2017-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Bolivia-2017-full data_NEW.dta", replace
use "DominicanRepublic-2016-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\DominicanRepublic-2016-full data_NEW.dta", replace
use "Ecuador-2017-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Ecuador-2017-full data_NEW.dta", replace
use "ElSalvador-2016-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\ElSalvador-2016-full data_NEW.dta", replace
use "Honduras-2016-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Honduras-2016-full data_NEW.dta", replace
use "Nicaragua-2016-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Nicaragua-2016-full data_NEW.dta", replace
use "Paraguay-2017-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Paraguay-2017-full data_NEW.dta", replace
use "Peru-2017-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Peru-2017-full data_NEW.dta", replace
use "Uruguay-2017-full data.dta", clear
decode a1, gen(a1n)
decode a2, gen(a2n)
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\Uruguay-2017-full data_NEW.dta", replace

use "Argentina-2017-full data_NEW.dta", clear
append using "Bolivia-2017-full data_NEW.dta",
append using "DominicanRepublic-2016-full data_NEW.dta"
append using "Ecuador-2017-full data_NEW.dta"
append using "ElSalvador-2016-full data_NEW.dta"
append using "Honduras-2016-full data_NEW.dta"
append using "Nicaragua-2016-full data_NEW.dta"
append using "Paraguay-2017-full data_NEW.dta"
append using "Peru-2017-full data_NEW.dta"
append using "Uruguay-2017-full data_NEW.dta"
save "C:\Users\Erick Gonzales\Documents\1_Contributions\benkyoukai\KG\data_management\lac_data_management.dta", replace

/*
use "Argentina-2017-full data.dta", clear
append using "Bolivia-2017-full data.dta"
append using "DominicanRepublic-2016-full data.dta"
append using "Ecuador-2017-full data.dta"
append using "ElSalvador-2016-full data.dta"
append using "Honduras-2016-full data.dta"
append using "Nicaragua-2016-full data.dta"
append using "Paraguay-2017-full data.dta"
append using "Peru-2017-full data.dta"
append using "Uruguay-2017-full data.dta"
*/


*########################################=====CHRIS=====###################################

