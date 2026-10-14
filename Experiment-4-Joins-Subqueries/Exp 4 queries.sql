-- EXPERIMENT 4
-- SQL Joins, Subqueries and EXPLAIN
-- Reset the sample tables so this script can be rerun
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Budget DECIMAL(12, 2) NOT NULL,
    Dept_ID INT NOT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Dept_ID INT NOT NULL,
    Project_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);

INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES
(1, 'Engineering', 'Delhi'),
(2, 'Finance', 'Mumbai'),
(3, 'Human Resources', 'Delhi'),
(4, 'Marketing', 'Chennai');

INSERT INTO Project (Project_ID, Project_Name, Budget, Dept_ID) VALUES
(101, 'Website Redesign', 150000.00, 1),
(102, 'Mobile App', 250000.00, 1),
(103, 'Annual Audit', 80000.00, 2),
(104, 'Hiring Portal', 60000.00, 3);

INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID, Project_ID) VALUES
(1, 'Asha', 85000.00, 1, 101),
(2, 'Ravi', 72000.00, 1, 102),
(3, 'Meera', 58000.00, 1, 101),
(4, 'Kabir', 68000.00, 2, 103),
(5, 'Nina', 75000.00, 2, 103),
(6, 'Arjun', 62000.00, 3, 104),
(7, 'Leela', 54000.00, 4, NULL);

-- 1. INNER JOIN
SELECT E.Emp_ID, E.Emp_Name, E.Salary,
       D.Dept_Name, D.Location
FROM Employee E
INNER JOIN Department D
ON E.Dept_ID = D.Dept_ID;

-- 2. LEFT JOIN
SELECT D.Dept_ID, D.Dept_Name,
       E.Emp_Name, E.Salary
FROM Department D
LEFT JOIN Employee E
ON D.Dept_ID = E.Dept_ID;

-- 3. SELF JOIN
-- Find employees working in the same department
SELECT E1.Emp_Name AS Employee1,
       E2.Emp_Name AS Employee2,
       E1.Dept_ID
FROM Employee E1
JOIN Employee E2
ON E1.Dept_ID = E2.Dept_ID
AND E1.Emp_ID < E2.Emp_ID;

-- 4. THREE-TABLE JOIN
SELECT E.Emp_Name, E.Salary,
       D.Dept_Name, P.Project_Name, P.Budget
FROM Employee E
INNER JOIN Department D
ON E.Dept_ID = D.Dept_ID
INNER JOIN Project P
ON E.Project_ID = P.Project_ID;

-- 5. CORRELATED SUBQUERY
-- Employees earning more than their department average
SELECT E.Emp_ID, E.Emp_Name, E.Salary, E.Dept_ID
FROM Employee E
WHERE E.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employee E2
    WHERE E2.Dept_ID = E.Dept_ID
);

-- 6. EXISTS
-- Employees whose department has at least one project
SELECT E.Emp_ID, E.Emp_Name, E.Dept_ID
FROM Employee E
WHERE EXISTS (
    SELECT 1
    FROM Project P
    WHERE P.Dept_ID = E.Dept_ID
);

-- 7. SIMULATED INTERSECT
-- Employees in Delhi departments earning over 60000
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Dept_ID IN (
    SELECT Dept_ID
    FROM Department
    WHERE Location = 'Delhi'
)
AND Salary > 60000;

-- 8. SIMULATED EXCEPT
-- Employees not belonging to Delhi departments
SELECT Emp_ID, Emp_Name, Dept_ID
FROM Employee
WHERE Dept_ID NOT IN (
    SELECT Dept_ID
    FROM Department
    WHERE Location = 'Delhi'
);

-- 9. EXPLAIN: INNER JOIN
EXPLAIN
SELECT E.Emp_Name, D.Dept_Name
FROM Employee E
INNER JOIN Department D
ON E.Dept_ID = D.Dept_ID;

-- 10. EXPLAIN: LEFT JOIN
EXPLAIN
SELECT D.Dept_Name, E.Emp_Name
FROM Department D
LEFT JOIN Employee E
ON D.Dept_ID = E.Dept_ID;

-- 11. EXPLAIN: CORRELATED SUBQUERY
EXPLAIN
SELECT E.Emp_Name, E.Salary
FROM Employee E
WHERE E.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employee E2
    WHERE E2.Dept_ID = E.Dept_ID
);

-- 12. EXPLAIN: EXISTS
EXPLAIN
SELECT E.Emp_Name
FROM Employee E
WHERE EXISTS (
    SELECT 1
    FROM Project P
    WHERE P.Dept_ID = E.Dept_ID
);
