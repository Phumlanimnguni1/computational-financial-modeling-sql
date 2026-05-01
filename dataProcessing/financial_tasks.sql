/* ZFinancial Engineering Assessment
   Database: Microsoft SQL Server (SSMS)
   Data Integrity Standard: GAAP / High-Precision Decimal
*/

--PRACTICAL ASSESSMENT QUESTIONS AND FORMULAS:

   --1.  Simple Interest: I = P * r * t
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST(Principal * AnnualRate * TermYears AS DECIMAL(19, 2)) AS Interest
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 1

   --2.  Annual Compound: A = P * (1 + r)^n
   SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST(Principal * POWER(1 + AnnualRate, TermYears) AS DECIMAL(19, 2)) AS AccumulatedBalance
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 2

   --3.  Hire Purchase Installment: Monthly = [P * (1 + r * t)] / 36 
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST((Principal * (1 + (AnnualRate * TermYears))) / (TermYears * 12) AS DECIMAL(19, 2)) AS MonthlyInstallment
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 3

   --4.  Inflation Projection: A = P * (1 + i)^n
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST(Principal * POWER(1 + AnnualRate, TermYears) AS DECIMAL(19, 2)) AS FutureCost
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 4

   --5.  Reducing Balance Depreciation: A = P * (1 - i)^n   
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST(Principal * POWER(1 - AnnualRate, TermYears) AS DECIMAL(19, 2)) AS BookValue
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 5

   --6.  Quarterly Compound: A = P * (1 + r/4)^(4 * n)
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    Frequency,
    CAST(Principal * POWER(1 + (AnnualRate / Frequency), (Frequency * TermYears)) AS DECIMAL(19, 2)) AS FinalValue
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 6

   --7.  Monthly Loan Accrual: I = [P * (1 + r/12)^12] - P
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST((Principal * POWER(1 + (AnnualRate / Frequency), Frequency * TermYears)) - Principal AS DECIMAL(19, 2)) AS TotalInterest
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 7

   --8.  Doubling Time (Simple): t = 1 / r 
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    CAST(1 / AnnualRate AS DECIMAL(19, 2)) AS DoublingTime
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 8

   --9.  Effective Annual Rate: EAR = (1 + r/m)^m - 1
SELECT 
    TaskID,
    ModelName,
    AnnualRate,
    Frequency,
    CAST(POWER(1 + (AnnualRate / Frequency), Frequency) - 1 AS DECIMAL(19, 4)) AS EffectiveAnnualRate
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 9

   --10. Semi-Annual Growth: A = P * (1 + r/2)^(2 * n)
SELECT 
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    CAST(Principal * POWER(1 + (AnnualRate / Frequency), (Frequency * TermYears)) AS DECIMAL(19, 2)) AS FinalInvestmentValue
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 10
