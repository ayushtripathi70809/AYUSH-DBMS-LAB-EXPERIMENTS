Experiment 4: SQL Joins, Subqueries and Query Execution Plans

Aim

To execute SQL queries using INNER JOIN, LEFT JOIN, SELF JOIN, 3-way JOIN, correlated subqueries, EXISTS, simulated INTERSECT and EXCEPT, and to compare query execution plans using EXPLAIN.

Software Required

* MySQL
* ByteXL SQL Lab
* GitHub

Database Schema

This experiment uses the Employee-Department-Project database.

Tables Used

1. Department – Stores department details such as department ID, name and location.
2. Project – Stores project details such as project ID, project name, budget and department ID.
3. Employee – Stores employee details such as employee ID, name, salary, job title, department ID and project ID.

Concepts Covered

1. INNER JOIN
2. LEFT JOIN
3. SELF JOIN
4. Three-Table JOIN
5. Correlated Subquery
6. EXISTS Operator
7. Simulated INTERSECT using IN
8. Simulated EXCEPT using NOT IN
9. EXPLAIN for INNER JOIN
10. EXPLAIN for LEFT JOIN
11. EXPLAIN for Correlated Subquery
12. EXPLAIN for EXISTS

Procedure

1. Create the Department, Project and Employee tables.
2. Insert sample records into all three tables.
3. Execute an INNER JOIN to display employees with their departments.
4. Execute a LEFT JOIN to display all departments and their employees.
5. Use a SELF JOIN to find employees working in the same department.
6. Perform a three-table JOIN on Employee, Project and Department.
7. Execute a correlated subquery to find employees earning more than their department’s average salary.
8. Use EXISTS to find departments that have associated projects.
9. Simulate INTERSECT and EXCEPT using IN and NOT IN.
10. Use EXPLAIN to examine query execution plans.

Source Code

The SQL queries are provided in queries.sql.

Output

The output includes employee and department details, employees working in the same department, project information, correlated subquery results, EXISTS results, simulated INTERSECT and EXCEPT results, and EXPLAIN execution plans.

Result

Successfully executed SQL queries using different JOIN operations, subqueries, set-operation alternatives and EXPLAIN to analyze query execution plans.

Conclusion

This experiment demonstrates how SQL JOINs combine related tables, how subqueries filter data, and how EXPLAIN helps inspect query execution plans.
