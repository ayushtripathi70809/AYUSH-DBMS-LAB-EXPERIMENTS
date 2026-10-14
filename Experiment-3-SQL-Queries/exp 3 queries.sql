-- EXPERIMENT 3
-- Employee-Department-Project Database
-- Total: 5 Departments, 8 Projects, 30 Employees

-- 1. Create Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- 2. Create Project Table
CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Budget DECIMAL(12,2),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 3. Create Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Job_Title VARCHAR(50),
    Dept_ID INT,
    Project_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);

-- 4. Insert Department Data
INSERT INTO Department VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Bangalore'),
(5, 'Operations', 'Pune');

-- 5. Insert Project Data
INSERT INTO Project VALUES
(101, 'Website Development', 500000, 1),
(102, 'Mobile Application', 400000, 1),
(103, 'Recruitment System', 150000, 2),
(104, 'Financial Analysis', 300000, 3),
(105, 'Digital Marketing', 200000, 4),
(106, 'Sales Management', 250000, 4),
(107, 'Supply Chain', 350000, 5),
(108, 'Inventory System', 180000, 5);

-- 6. Insert 30 Employees
INSERT INTO Employee VALUES
(1, 'Amit', 75000, 'Developer', 1, 101),
(2, 'Neha', 65000, 'Developer', 1, 101),
(3, 'Rahul', 55000, 'Tester', 1, 102),
(4, 'Priya', 80000, 'Manager', 1, 102),
(5, 'Karan', 45000, 'Support', 1, 101),
(6, 'Sneha', 60000, 'Analyst', 1, 102),
(7, 'Vikas', 72000, 'Developer', 1, 101),
(8, 'Anjali', 50000, 'Tester', 1, 102),
(9, 'Rohit', 48000, 'HR Executive', 2, 103),
(10, 'Pooja', 52000, 'HR Manager', 2, 103),
(11, 'Manish', 42000, 'Recruiter', 2, 103),
(12, 'Simran', 58000, 'HR Executive', 2, 103),
(13, 'Deepak', 62000, 'Accountant', 3, 104),
(14, 'Kavita', 70000, 'Finance Manager', 3, 104),
(15, 'Arjun', 54000, 'Analyst', 3, 104),
(16, 'Meena', 46000, 'Accountant', 3, 104),
(17, 'Varun', 68000, 'Analyst', 3, 104),
(18, 'Isha', 59000, 'Accountant', 3, 104),
(19, 'Sahil', 51000, 'Marketing Executive', 4, 105),
(20, 'Riya', 73000, 'Marketing Manager', 4, 105),
(21, 'Mohit', 47000, 'SEO Executive', 4, 105),
(22, 'Tanya', 56000, 'Content Writer', 4, 106),
(23, 'Nikhil', 64000, 'Sales Executive', 4, 106),
(24, 'Aarti', 49000, 'Marketing Executive', 4, 106),
(25, 'Ajay', 61000, 'Operations Manager', 5, 107),
(26, 'Swati', 53000, 'Coordinator', 5, 107),
(27, 'Ramesh', 44000, 'Store Executive', 5, 108),
(28, 'Komal', 57000, 'Analyst', 5, 108),
(29, 'Yash', 69000, 'Operations Executive', 5, 107),
(30, 'Nisha', 50000, 'Coordinator', 5, 108);

-- 7. Selection: Salary greater than 50000
SELECT * FROM Employee
WHERE Salary > 50000;

-- 8. Projection: Display employee name and salary
SELECT Emp_Name, Salary
FROM Employee;

-- 9. COUNT: Total employees
SELECT COUNT(*) AS Total_Employees
FROM Employee;

-- 10. SUM: Total salary
SELECT SUM(Salary) AS Total_Salary
FROM Employee;

-- 11. AVG: Average salary
SELECT AVG(Salary) AS Average_Salary
FROM Employee;

-- 12. MAX: Highest salary
SELECT MAX(Salary) AS Highest_Salary
FROM Employee;

-- 13. MIN: Lowest salary
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee;

-- 14. GROUP BY: Employee count by department
SELECT Dept_ID, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_ID;

-- 15. Average salary by department
SELECT Dept_ID, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Dept_ID;

-- 16. HAVING: Departments with more than 5 employees
SELECT Dept_ID, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_ID
HAVING COUNT(*) > 5;

-- 17. CASE: Salary categories
SELECT Emp_Name, Salary,
CASE
    WHEN Salary >= 70000 THEN 'High'
    WHEN Salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS Salary_Category
FROM Employee;

-- 18. ORDER BY: Salary ascending
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary ASC;

-- 19. ORDER BY: Salary descending
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 20. Combined query: Average salary by department
SELECT Dept_ID, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Dept_ID
HAVING AVG(Salary) > 55000
ORDER BY Average_Salary DESC;