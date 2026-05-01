/* ZFinancial Engineering Assessment
   Database: Microsoft SQL Server (SSMS)
   Data Integrity Standard: GAAP / High-Precision Decimal
*/

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'FinancialEngineeringDB')
BEGIN
CREATE DATABASE FinancialEngineeringDB;
END
GO

USE FinancialEngineeringDB;
GO

IF OBJECT_ID('dbo.FinancialTasks', 'U') IS NOT NULL
    DROP TABLE dbo.FinancialTasks;
GO

CREATE TABLE dbo.FinancialTasks (
    TaskID      INT PRIMARY KEY,
    ModelName   VARCHAR(100) NOT NULL,
    Principal   DECIMAL(19, 4),   
    AnnualRate  DECIMAL(19, 4),   
    TermYears   INT,
    Frequency   INT DEFAULT 1     
);
GO

INSERT INTO dbo.FinancialTasks 
    (TaskID, ModelName, Principal, AnnualRate, TermYears, Frequency)
VALUES 
    (1, 'Simple Interest', 4500.00, 0.07, 5, 1),
    (2, 'Compound Interest', 12000.00, 0.065, 8, 1),
    (3, 'Hire Purchase', 18700.00, 0.11, 3, 1),
    (4, 'Inflation Analysis', 1550.00, 0.055, 12, 1),
    (5, 'Reducing Balance Depreciation', 480000.00, 0.18, 6, 1),
    (6, 'Quarterly Compounding', 95000.00, 0.09, 4, 4),
    (7, 'Monthly Loan Accrual', 30000.00, 0.14, 1, 12),
    (8, 'Capital Doubling Time', 15000.00, 0.125, 0, 1),
    (9, 'Effective Annual Rate', 1.00, 0.132, 1, 12),
    (10, 'Semi-Annual Growth', 2500000.00, 0.15, 10, 2);
GO

SELECT * FROM dbo.FinancialTasks;

/* PRACTICAL ASSESSMENT QUESTIONS AND FORMULAS:

   1.  Simple Interest: I = P * r * t
   2.  Annual Compound: A = P * (1 + r)^n
   3.  Hire Purchase Installment: Monthly = [P * (1 + r * t)] / 36
   4.  Inflation Projection: A = P * (1 + i)^n
   5.  Reducing Balance Depreciation: A = P * (1 - i)^n
   6.  Quarterly Compound: A = P * (1 + r/4)^(4 * n)
   7.  Monthly Loan Accrual: I = [P * (1 + r/12)^12] - P
   8.  Doubling Time (Simple): t = 1 / r
   9.  Effective Annual Rate: EAR = (1 + r/m)^m - 1
   10. Semi-Annual Growth: A = P * (1 + r/2)^(2 * n)
*/
