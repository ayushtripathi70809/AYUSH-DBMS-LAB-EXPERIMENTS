# Experiment 7: Database Normalization

## Aim

To identify functional dependencies in a denormalized Sales table and normalize it step-by-step from UNF to 3NF and BCNF. To verify lossless join and dependency preservation using SQL queries.

## Requirements

* MySQL 8.0 or above
* MySQL Workbench or MySQL Command Line Client

## Description

This experiment demonstrates database normalization using a denormalized Sales table. Functional dependencies are identified, and the table is decomposed step-by-step into First Normal Form (1NF), Second Normal Form (2NF), Third Normal Form (3NF), and Boyce-Codd Normal Form (BCNF).

## Procedure

1. Create a denormalized Sales table.
2. Identify the functional dependencies.
3. Convert the table into 1NF by ensuring atomic values.
4. Convert the table into 2NF by removing partial dependencies.
5. Convert the table into 3NF by removing transitive dependencies.
6. Decompose the tables into BCNF.
7. Verify lossless join using SQL JOIN queries.
8. Check dependency preservation against the original functional dependencies.

## Concepts Used

* Functional Dependencies
* First Normal Form (1NF)
* Second Normal Form (2NF)
* Third Normal Form (3NF)
* Boyce-Codd Normal Form (BCNF)
* Lossless Join
* Dependency Preservation

## Expected Output

* Identification of functional dependencies.
* Normalized tables from UNF to BCNF.
* Successful reconstruction of sales data using JOIN queries.
* Verification of lossless join and dependency preservation.

## Result

The denormalized Sales table is normalized step-by-step up to BCNF. Lossless join and dependency preservation are evaluated using SQL queries.
