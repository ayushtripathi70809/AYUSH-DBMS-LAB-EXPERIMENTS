-- EXPERIMENT 5: SQL Views and Recursive CTE
-- Self-contained sample script for MySQL
-- Drop dependent views and tables so the script can be run again.
DROP VIEW IF EXISTS Employee_Hierarchy;
DROP VIEW IF EXISTS Employee_Salary_View;
DROP VIEW IF EXISTS Department_Salary_Summary;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- 1. Create and populate Department
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL
);

INSERT INTO Department (Dept_ID, Dept_Name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Sales'),
(5, 'Operations');

-- 2. Create and populate Employee
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Job_Title VARCHAR(100) NOT NULL,
    Dept_ID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    Manager_ID INT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

INSERT INTO Employee (Emp_ID, Emp_Name, Job_Title, Dept_ID, Salary) VALUES
(1, 'Ava Patel', 'Analyst', 1, 52000),
(2, 'Noah Kim', 'Coordinator', 1, 48000),
(3, 'Mia Chen', 'Specialist', 2, 56000),
(4, 'Liam Garcia', 'Director', 3, 95000),
(5, 'Isla Brown', 'Engineer', 3, 72000),
(6, 'Ethan Davis', 'Engineer', 3, 70000),
(7, 'Sophia Wilson', 'Designer', 3, 68000),
(8, 'Lucas Moore', 'Engineer', 3, 74000),
(9, 'Amelia Taylor', 'Accountant', 2, 61000),
(10, 'Oliver Anderson', 'Finance Manager', 2, 82000),
(11, 'Harper Thomas', 'Accountant', 2, 59000),
(12, 'Elijah Jackson', 'Analyst', 2, 57000),
(13, 'Evelyn White', 'Sales Representative', 4, 54000),
(14, 'James Harris', 'Sales Manager', 4, 85000),
(15, 'Abigail Martin', 'Sales Representative', 4, 53000),
(16, 'Benjamin Thompson', 'Sales Representative', 4, 55000),
(17, 'Emily Lee', 'Sales Representative', 4, 52000),
(18, 'Henry Walker', 'Sales Representative', 4, 56000),
(19, 'Ella Hall', 'Operations Analyst', 5, 58000),
(20, 'Alexander Allen', 'Operations Manager', 5, 80000),
(21, 'Scarlett Young', 'Operations Analyst', 5, 60000),
(22, 'Michael King', 'Operations Associate', 5, 49000),
(23, 'Grace Wright', 'Operations Associate', 5, 51000),
(24, 'Daniel Scott', 'Operations Associate', 5, 50000),
(25, 'Chloe Green', 'Engineering Manager', 3, 90000),
(26, 'Matthew Baker', 'Engineer', 3, 75000),
(27, 'Victoria Adams', 'Engineer', 3, 73000),
(28, 'Joseph Nelson', 'Engineer', 3, 71000),
(29, 'Lily Carter', 'QA Engineer', 3, 69000),
(30, 'Samuel Mitchell', 'QA Engineer', 3, 67000);

-- 3. Set employee reporting relationships
UPDATE Employee
SET Manager_ID = CASE
    WHEN Emp_ID = 4 THEN NULL
    WHEN Emp_ID IN (1, 2, 3, 5, 6, 7, 8) THEN 4
    WHEN Emp_ID IN (9, 11, 12) THEN 10
    WHEN Emp_ID IN (13, 15, 16, 17, 18) THEN 14
    WHEN Emp_ID IN (19, 21, 22, 23, 24) THEN 20
    WHEN Emp_ID IN (26, 27, 28, 29, 30) THEN 25
    ELSE NULL
END;

-- 4. Create Department Salary Summary View
CREATE OR REPLACE VIEW Department_Salary_Summary AS
SELECT
    D.Dept_ID,
    D.Dept_Name,
    COUNT(E.Emp_ID) AS Employee_Count,
    AVG(E.Salary) AS Average_Salary,
    MAX(E.Salary) AS Maximum_Salary,
    MIN(E.Salary) AS Minimum_Salary
FROM Department D
LEFT JOIN Employee E ON D.Dept_ID = E.Dept_ID
GROUP BY D.Dept_ID, D.Dept_Name;

-- Display department salary summary
SELECT * FROM Department_Salary_Summary;

-- 5. Create Employee Hierarchy View
CREATE OR REPLACE VIEW Employee_Hierarchy AS
SELECT
    E.Emp_ID,
    E.Emp_Name,
    E.Job_Title,
    E.Dept_ID,
    E.Manager_ID,
    M.Emp_Name AS Manager_Name
FROM Employee E
LEFT JOIN Employee M ON E.Manager_ID = M.Emp_ID;

-- Display employee hierarchy
SELECT * FROM Employee_Hierarchy;

-- 6. Create a simple updatable view
CREATE OR REPLACE VIEW Employee_Salary_View AS
SELECT Emp_ID, Emp_Name, Salary
FROM Employee;

-- Test updating data through the simple view
UPDATE Employee_Salary_View
SET Salary = Salary + 1000
WHERE Emp_ID = 1;

-- Verify the updated salary
SELECT * FROM Employee_Salary_View
WHERE Emp_ID = 1;

-- Aggregate views are generally not directly updatable; display its output
SELECT * FROM Department_Salary_Summary;

-- 7. Recursive CTE: Display employee reporting chains
WITH RECURSIVE Employee_Chain AS (
    SELECT
        Emp_ID,
        Emp_Name,
        Manager_ID,
        1 AS Hierarchy_Level,
        CAST(Emp_Name AS CHAR(1000)) AS Reporting_Chain
    FROM Employee
    WHERE Manager_ID IS NULL

    UNION ALL

    SELECT
        E.Emp_ID,
        E.Emp_Name,
        E.Manager_ID,
        C.Hierarchy_Level + 1,
        CONCAT(C.Reporting_Chain, ' -> ', E.Emp_Name)
    FROM Employee E
    INNER JOIN Employee_Chain C ON E.Manager_ID = C.Emp_ID
)
SELECT
    Emp_ID,
    Emp_Name,
    Manager_ID,
    Hierarchy_Level,
    Reporting_Chain
FROM Employee_Chain
ORDER BY Hierarchy_Level, Emp_ID;
