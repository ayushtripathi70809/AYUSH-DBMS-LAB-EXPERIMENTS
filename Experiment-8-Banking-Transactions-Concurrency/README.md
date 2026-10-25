# Experiment 8: Banking Transactions and Concurrency Control

## Aim

To implement banking-style transactions using BEGIN, COMMIT, ROLLBACK, and SAVEPOINT. To simulate partial transaction failures and demonstrate isolation levels and concurrency anomalies using two database sessions.

## Requirements

* MySQL 8.0 or above
* MySQL Workbench or MySQL Command Line Client

## Description

This experiment demonstrates transaction management in a banking database. It uses transaction control commands to transfer money between accounts, handle partial failures, and maintain data consistency. Isolation levels and concurrency anomalies are demonstrated using two database sessions.

## Procedure

1. Create a Bank table with account details and balances.
2. Insert sample bank account records.
3. Use BEGIN or START TRANSACTION to start a transaction.
4. Use COMMIT to save changes permanently.
5. Use ROLLBACK to undo changes.
6. Use SAVEPOINT to create a checkpoint within a transaction.
7. Simulate partial transaction failures.
8. Set transaction isolation levels.
9. Use two database sessions to demonstrate concurrency behavior.

## Concepts Used

* Transaction Management
* BEGIN and START TRANSACTION
* COMMIT
* ROLLBACK
* SAVEPOINT
* Transaction Isolation Levels
* Concurrency Control
* Concurrency Anomalies

## Expected Output

* Successful execution of banking transactions.
* Demonstration of COMMIT, ROLLBACK, and SAVEPOINT.
* Observation of transaction behavior under different isolation levels.
* Demonstration of concurrency behavior using two database sessions.

## Result

Banking-style transactions are implemented successfully using SQL transaction control commands. Partial failures, isolation levels, and concurrency behavior are demonstrated using two database sessions.
