SELECT * FROM portfolio_projects.financial_loan;
-- Bank Loan Data Analysis 
-- KPI'S: 
-- Total Applications 
SELECT COUNT(ï»¿id) AS Total_Loan_Applications 
FROM financial_loan
;
-- MTD Total Loan Applications
SELECT COUNT(ï»¿id) AS MTD_Total_Loan_Applications
FROM financial_loan
WHERE MONTH(issue_date)=12
;

SELECT COUNT(ï»¿id) AS PTD_Total_Loan_Applications
FROM financial_loan
WHERE MONTH(issue_date)=11
;

-- Total Funded Amount 
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
;
-- MTD Total Funded amount 
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date)=12
;
-- PMTD Total Funded amount 
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date)=11
;

-- Total Payments Recieved 
SELECT SUM(total_payment) AS Total_Payment_Received
FROM financial_loan
;
-- MTD Total Funded amount 
SELECT SUM(total_payment) AS MTD_Total_Payment_Rceived
FROM financial_loan
WHERE MONTH(issue_date)=12
;
-- PMTD Total Funded amount 
SELECT SUM(total_payment) AS PMTD_Total_Payment_Received
FROM financial_loan
WHERE MONTH(issue_date)=11
;

---------------------------------------------------------------------------- 
-- Average interest rate 
SELECT ROUND(AVG(int_rate)*100,2) AS AVG_interest_rate
FROM financial_loan
;
-- MTD Average Interest rate
SELECT ROUND(AVG(int_rate)*100,2) AS MTD_AVG_interest_rate
FROM financial_loan
WHERE MONTH(issue_date)=12
;

-- PMTD Average Interest rate 
SELECT ROUND(AVG(int_rate)*100,2) AS PMTD_AVG_interest_rate
FROM financial_loan
WHERE MONTH(issue_date)=11
;
--------------------------------------------------------------------------------
-- Average dti
SELECT ROUND(AVG(dti)*100,2) AS AVG_DTI
FROM financial_loan
;
-- MTD Average DTI
SELECT ROUND(AVG(dti)*100,2) AS MTD_AVG_DTI
FROM financial_loan
WHERE MONTH(issue_date)=12
;

-- PMTD Average DTI
SELECT ROUND(AVG(dti)*100,2) AS PMTD_AVG_DTI
FROM financial_loan
WHERE MONTH(issue_date)=11
;
-----------------------------------------------------------------------------------
-- Good Loans Issues 
SELECT DISTINCT(loan_status) FROM financial_loan;
-- Good Loan Percentage 
SELECT ROUND(COUNT(CASE WHEN loan_status="Fully Paid" OR loan_status="Current" THEN ï»¿id
                END) /COUNT(ï»¿id)*100,2) AS Good_Loan_Percentage
FROM financial_loan
;

-- Good Loan Applications 
SELECT COUNT(ï»¿id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status="Fully Paid" or loan_status="Current"
;

-- Good Loan Funded Amount 
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM financial_loan
WHERE loan_status="Fully Paid" OR loan_status="Current"
;

SELECT SUM(total_payment) AS Good_Loan_Amount_Received FROM financial_loan
WHERE loan_status="Fully Paid" OR loan_status="Current"
;
------------------------------------------------------------------------------------
-- Bad Loan Percentage 
SELECT ROUND(COUNT(CASE WHEN loan_status="Charged Off"  THEN ï»¿id
                END) /COUNT(ï»¿id)*100,2) AS Bad_Loan_Percentage
FROM financial_loan
;

-- Bad Loan Applications 
SELECT COUNT(ï»¿id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status="Charged Off" 
;

-- Bad Loan Funded Amount 
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM financial_loan
WHERE loan_status="Charged Off" 
;
-- Bad Loan Total Amount Received 
SELECT SUM(total_payment) AS Bad_Loan_Amount_Received FROM financial_loan
WHERE loan_status="Charged Off" 
;
--------------------------------------------------------------------------------
-- loan status Analysis 
SELECT loan_status,
COUNT(ï»¿id) AS LoanCount,
SUM(total_payment) AS Total_Amount_Received,
SUM(loan_amount) AS Total_Funded_Amount,
ROUND(AVG(int_rate)*100,2) AS AVG_interest_rate,
ROUND(AVG(dti)*100,2) AS AVG_DTI
FROM financial_loan
GROUP BY loan_status
ORDER BY loan_status DESC 
;
-- LOAN STATUS MTD 
SELECT loan_status,
SUM(total_payment) AS Total_Amount_Received,
SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date)=12
GROUP BY loan_status
ORDER BY loan_status DESC 
;
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
-- BANK LOAN REPORT|OVERVIEW 
-- MONTH ANALYSIS
SELECT 
	DISTINCT(MONTH(issue_date)) AS Month_Number,
    MONTHNAME(issue_date) AS Month_Name,
    COUNT(ï»¿id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY Month_Number,Month_Name
ORDER BY Month_Number ASC
;
---------------------------------------------------------------------------------------
-- MONTH ANALYSIS
SELECT 
	DISTINCT(address_state) AS State,
    COUNT(ï»¿id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY State
ORDER BY State ASC
;

-- Term Analysis 
SELECT 
	DISTINCT(term) AS Term,
    COUNT(ï»¿id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY Term
ORDER BY Term ASC
;

-- Employee Lenght Analysis 
SELECT 
	DISTINCT(emp_length) AS Employee_Length,
    COUNT(ï»¿id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY Employee_Length
ORDER BY Employee_Length ASC
;

-- Purpose Analysis 
SELECT 
	DISTINCT(purpose) AS Purpose,
    COUNT(ï»¿id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY Purpose
ORDER BY Purpose ASC
;

-- Home Ownership Analysis 
SELECT 
	DISTINCT(home_ownership) AS Home_Ownership,
    COUNT(ï»¿id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY  Home_Ownership
ORDER BY  Home_Ownership ASC
;
---------------------------------------------------------------------------------