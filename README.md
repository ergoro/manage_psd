# trust_psd_LAC_EA_SSA
## Short paper on trust, cooperation and private sector development

## 1. Project Overview
This research project executes the analyses below using Stata and data collected from applicants to the free mentorship service for applying to scholarships offered by Tu Beca Bolivia (TBB):

## 2. Data Sources and sample
The data source comes from a sample of 241 out of the 890 applicantions submitted to TBB during the 2017 version.

## 3. Structuring and cleaning dataset

This module has two sections.

### Structuring
- Inputs
  - [Data from quetionnaire, "2017_evaluation_application" (.csv file](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_evaluation_application.csv)
- Code
  - [structure](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_app_eval_structure.do)
- Outputs
  - [Dataset ready for Stata use (.dta file)](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_application_eval.dta)
  
### Cleaning
- Inputs
  - [Data ready for Stata use "2017_application_eval" (.dta file)](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_application_eval.dta)
- Code
  - [cleaning data](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_app_eval_clean.do)
- Outputs
  - [Dataset ready for analysis (.dta file)]

## 4. Analyze data
 
- [Inputs]
  - [Data from previous step (.dta file)]
- Code:
  - [data analysis](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_app_eval_analyze.do)
- [Outputs]
  - [analysis results]
  
 ## 5. Main code
 
- [Inputs]
  - [NA]
- Code:
  - [code that executes all the other steps](https://github.com/ergoro/2017_tbb_eval_application/blob/master/2017_app_eval_main.do)
- [Outputs]
  - [Analysis note](https://docs.google.com/document/d/1mOQQ4t6Sa5SFIvdoRW2JKK1XS17hu_9zzFQIL-aAzIg/edit?usp=sharing)
