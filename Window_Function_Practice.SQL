/*
Data Table: finance_transactions

| transaction_id | employee | department | category | amount  | transaction_date |
| -------------- | -------- | ---------- | -------- | ------- | ---------------- |
| 1              | Alice    | Finance    | Travel   | 450.00  | 2024-01-05       |
| 2              | Bob      | HR         | Training | 900.00  | 2024-01-08       |
| 3              | Alice    | Finance    | Supplies | 120.00  | 2024-01-10       |
| 4              | Carol    | IT         | Software | 1500.00 | 2024-01-11       |
| 5              | Alice    | Finance    | Travel   | 300.00  | 2024-01-13       |
| 6              | Bob      | HR         | Supplies | 200.00  | 2024-01-14       |
| 7              | Denise   | Finance    | Travel   | 600.00  | 2024-01-18       |
| 8              | Carol    | IT         | Hardware | 2300.00 | 2024-01-21       |

*/


-- 1. Calculate each employee’s total spend and their % contribution to their department’s total spend.

SELECT 
    employee,
    department,
    amount,
    SUM(amount) OVER (PARTITION BY department) AS dept_total,
    amount / SUM(amount) OVER (PARTITION BY department) AS percent_contribution
FROM
    finance_transactions


-- 2. Rank expenses within each department (highest to lowest).

SELECT
    department,
    employee,
    amount,
    RANK() OVER (PARTITION BY department ORDER BY amount DESC) AS expenses
FROM
    finance_transactions


-- 3. Identify each employee’s cumulative spend over time

SELECT
    employee,
    amount,
    transaction_date,
    SUM(amount) OVER (PARTITION BY employee ORDER BY transaction_date) AS running_total
FROM
    finance_transactions


-- 4. Show each employee’s spend vs. their previous transaction

SELECT
    employee,
    transaction_date,
    amount,
    LAG(amount) OVER (PARTITION BY employee ORDER BY transaction_date)
FROM
    finance_transactions