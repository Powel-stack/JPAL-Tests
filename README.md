A randomized control trial with 432 small and medium enterprises in Mexico shows positive impact of access to 1
year of management consulting services on total factor productivity and return on assets. Owners also had an increase
in “entrepreneurial spirit” (an index that measures entrepreneurial confidence and goal setting). Using Mexican social
security data, we find a persistent large increase (about 50 percent) in the number of employees and total wage bill
even 5 years after the program. We document large heterogeneity in the specific managerial practices that improved
as a result of the consulting, with the most prominent being marketing, financial accounting, and long-term business
planning.
Section 1: Handling Data
1. Record all of your work using a dofile/R script named Your Lastname_JPALexam.do / Your
Lastname_JPALexam.R. Include up to 5 informative header lines in the file.
2. The maindata.xls file contains the raw data for the baseline and first endline, while the longterm.xls file
contains data from the second, long-term follow-up endline. Load these datasets into your software program
and combine them.
3. The social_security variable contains personally identifiable information—if it were released people could
determine who the firm’s owner is. Remove this variable from the dataset, but save it in such a way that you
can merge it back to the main dataset if needed.
Section 2: Cleaning Data
1. Use the codebook to label the sec variable and its values.
2. The codebook mentions a categorical variable indicating which quartile of 2008 costs a firm fell into, which
is missing from the data. Create this variable. Save the dataset with all of these changes as finaldata.dta or
finaldata.Rdata. You will need this dataset for the next two sections.
Section 3: Analyzing Data
Each of the following questions in section 3 is about code in the AnalysisVisualization.do/ AnalysisVisualization.R file.
This code was sent to you by a hypothetical RA on the project, but it has errors. Please copy this code into the
same R script or do file you used for sections 1-2, and fix the code there.
1. Notice how the RA imports the data into the software. Will this code work on your computer? Change this
so that it will replicate easily on various computers.
2. The RA wanted to standardize the number of times a firm had applied for a bank loan. How can you tell this
was done incorrectly?
a. Create a standardized version of the variable loan_bank_number called std_numb_bankloan2 and graph
the histogram of it to confirm it is correctly coded.
3. The RA performs 2 LATE regression to determine the effect of participating in the program on sales. Is the
coefficient on in_program the same in both models? How can you tell?
a. Explain why adding controls does or does not change the coefficient.3
Section 4: Interpreting Results
1. In Section 3, question 2, why did the RA need to instrument for the in_program variable?
2. Use the model 𝑜𝑢𝑡𝑐𝑜𝑚𝑒𝑖𝑡 = 𝛽0 + 𝛽1 ∗ 𝑡𝑟𝑒𝑎𝑡𝑚𝑒𝑛𝑡𝑖𝑡 + 𝜖𝑖𝑡 to determine for which of the following
outcomes the treatment effect is significant: sales, profits, costs, and having a trademark. Explain how you
know whether each effect is significant.
