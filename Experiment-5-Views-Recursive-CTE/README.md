Experiment 5: SQL Views and Recursive CTE

Aim

To create SQL views for department salary summary and employee hierarchy, test the updatability of views, and implement a recursive CTE to display reporting chains.

Software Required

* MySQL
* ByteXL SQL Lab
* GitHub

Database Schema

This experiment uses the Department and Employee tables.

Tables Used

1. Department – Stores department IDs, department names and locations.
2. Employee – Stores employee IDs, names, salaries, job titles, department IDs and manager IDs.

Concepts Covered

1. Creating SQL Views
2. Department Salary Summary View
3. Aggregate Functions in Views
4. Employee Hierarchy View
5. Self-Referencing Manager Relationship
6. Updating Data Through a View
7. Recursive Common Table Expression (CTE)
8. Displaying Employee Reporting Chains

Procedure

1. Create the Department and Employee tables.
2. Insert sample data into the tables.
3. Create a view to display department-wise employee count and salary summary.
4. Add a manager relationship to the Employee table.
5. Create a view to display employee and manager details.
6. Test whether the view allows data updates.
7. Use a recursive CTE to display employee reporting chains.
8. Execute the queries and observe the results.

Source Code

The SQL queries are provided in queries.sql.

Output

The output includes department-wise salary summaries, employee-manager details, view update results and recursive employee reporting chains.

Result

Successfully created and queried SQL views, tested view updatability, and implemented a recursive CTE to display employee reporting hierarchies.

Conclusion

This experiment demonstrates how SQL views simplify data access and how recursive CTEs can represent hierarchical relationships between employees and managers.
