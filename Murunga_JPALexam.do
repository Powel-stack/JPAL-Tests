*****Section 1: Handling Data*****
1.* Name: Murunga_JPALexam
* Date: 28th March 2024
* General Purpose: J-PAL Statistical Programming Exam
* Purpose: Handling and cleaning data for JPAL statistical programming exam
* Description: This do-file processes the datasets for analysis.
* Author: Powel Murunga
* Setting up
clear all
set more off
2.* Import the first dataset
import delimited "C:\\Users\\ADMIN\\Desktop\\JPAL\\maindata.csv", clear

* Convert 'followup' from string to numeric with unique codes
encode followup, gen(followup_num)

* Save the intermediate file with the new numeric 'followup' variable
save "C:\\Users\\ADMIN\\Desktop\\JPAL\\maindata_encoded.dta", replace

* Repeat the process for the second dataset
import delimited "C:\\Users\\ADMIN\\Desktop\\JPAL\\longterm.csv", clear
encode followup, gen(followup_num)

* Save the intermediate file for the second dataset
save "C:\\Users\\ADMIN\\Desktop\\JPAL\\longterm_encoded.dta", replace

* Now merge the datasets using the new followup_num variable as part of the key
use "C:\\Users\\ADMIN\\Desktop\\JPAL\\maindata_encoded.dta", clear
merge 1:1 folio followup_num using "C:\\Users\\ADMIN\\Desktop\\JPAL\\longterm_encoded.dta"
* After merging the datasets
* Check the results of the merge
tabulate _merge
* Preserve and remove social_security variable
3.preserve
keep folio social_security
save "C:\\Users\\ADMIN\\Desktop\\JPAL\\social_security.dta", replace
restore
drop social_security


*****Section 2: Cleaning Data*****

* Label the 'sec' variable according to the codebook
label define sec_labels 1 "industry" 2 "commerce" 3 "service" -997 "don't know"
label values sec sec_labels
* To convert 'sec' to an integer if it is currently read as a string due to the negative value, use:
destring sec, replace force

* After labeling, you can check to make sure labels are correctly applied
tab sec
Assuming 'total_costs_2008' is the variable with cost data, replace missing coded as -997 with '.'
* This ensures they are not factored into the quartile calculation
recode total_costs_2008 (-997 = .)
* Creating the quartile variable for 2008 costs
* Ensure that costs are numeric and non-negative before proceeding
gen cost_quartiles = .
su total_costs_2008, detail
* Only create quartiles for non-missing, non-negative values
replace cost_quartiles = cond(total_costs_2008 >= 0, xtile(total_costs_2008, 4, minmax), .)
* Create the quartile variable for 2008 costs
* First, we will generate a temporary variable that categorizes the costs
* Assuming 'total_costs_2008' is the correct variable name
egen quartile_2008_costs = xtile(total_costs_2008, 4), label
* Now label the quartiles for better interpretation
label define quartile_2008 1 "1st Quartile - Lowest" 2 "2nd Quartile" 3 "3rd Quartile" 4 "4th Quartile - Highest"
label values quartile_2008_costs quartile_2008
* Check the new quartile variable
tab quartile_2008_costs
*******OR ALTERNATIVELY**** (for older version of stata)
* Replace negative values or non-applicable values with missing values if necessary
replace total_costs_2008 = . if total_costs_2008 < 0
* Use the xtile command directly to create quartile variables
xtile quartile_2008_costs = total_costs_2008, nq(4)
* Now label the quartiles for better interpretation
label define quartile_2008 1 "1st Quartile - Lowest" 2 "2nd Quartile" 3 "3rd Quartile" 4 "4th Quartile - Highest"
* Check the labels
tab quartile_2008_costs
* Save the updated dataset
 save "C:\Users\ADMIN\Desktop\JPAL\finaldata.dta"
file C:\Users\ADMIN\Desktop\JPAL\finaldata.dta saved


Section 3: Analyzing Data
S3 Q1. Importing the Data
* This line changes the directory to where the do-file is saved
cd "`c(pwd)'"
* Now you can load the data assuming it's in the same directory as the do-file
use "finaldata.dta", clear

