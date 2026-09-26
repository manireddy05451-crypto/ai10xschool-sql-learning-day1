-- ============================================================
-- Day 03: SQL Clauses Practice & Order of Execution
-- Ecosystem: ai10x school | AI/ML Full Stack
-- ============================================================

/*
1. IMPORTANT SQL CLAUSES:
-------------------------
- WHERE    : Filters individual rows before aggregation.
- DISTINCT : Eliminates duplicate rows in the result set.
- ORDER BY : Sorts the records in ASC (Ascending) or DESC (Descending) order.
- GROUP BY : Groups rows that have the same values into summary rows.
- HAVING   : Filters aggregated data (used only after GROUP BY).
- LIMIT    : Constrains the maximum number of rows returned.

2. SQL QUERY EXECUTION ORDER (Very Important for Interviews):
-------------------------------------------------------------
1. FROM / JOIN  -> Identifies the tables
2. WHERE        -> Filters rows
3. GROUP BY     -> Groups the data
4. HAVING       -> Filters aggregated groups
5. SELECT       -> Selects requested columns
6. DISTINCT     -> Removes duplicates
7. ORDER BY     -> Sorts the final data
8. LIMIT        -> Fetches specified row count
*/

USE ai10x_practice;

-- ------------------------------------------------------------
-- 1. Sample Table: Sales & Orders
-- ------------------------------------------------------------
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(10, 2),
    order_date DATE
);

-- Insert Sample Data
INSERT INTO orders (order_id, customer_name, city, category, amount, order_date)
VALUES
(1, 'Pawan', 'Hyderabad', 'Electronics', 15000.00, '2026-09-01'),
(2, 'Rahul', 'Bangalore', 'Clothing', 3500.00, '2026-09-02'),
(3, 'Sneha', 'Hyderabad', 'Electronics', 42000.00, '2026-09-03'),
(4, 'Amit', 'Chennai', 'Grocery', 1200.00, '2026-09-04'),
(5, 'Pooja', 'Bangalore', 'Electronics', 25000.00, '2026-09-05'),
(6, 'Kiran', 'Hyderabad', 'Clothing', 4500.00, '2026-09-06'),
(7, 'Vikram', 'Chennai', 'Grocery', 2800.00, '2026-09-07');

-- ------------------------------------------------------------
-- 2. Practice Queries using Clauses
-- ------------------------------------------------------------

-- DISTINCT Clause: Get unique cities
SELECT DISTINCT city FROM orders;

-- WHERE Clause: Filter orders above 3000
SELECT * FROM orders 
WHERE amount > 3000;

-- ORDER BY Clause: Sort amounts in descending order
SELECT customer_name, amount 
FROM orders 
ORDER BY amount DESC;

-- LIMIT Clause: Get top 3 highest orders
SELECT customer_name, amount 
FROM orders 
ORDER BY amount DESC 
LIMIT 3;

-- GROUP BY Clause: Total sales per category
SELECT category, SUM(amount) AS total_sales, COUNT(order_id) AS total_orders
FROM orders
GROUP BY category;

-- HAVING Clause: Show categories where total sales exceed 10000
SELECT category, SUM(amount) AS total_sales
FROM orders
GROUP BY category
HAVING SUM(amount) > 10000;

-- Combining all clauses together
SELECT city, category, AVG(amount) AS avg_amount
FROM orders
WHERE amount >= 2000
GROUP BY city, category
HAVING AVG(amount) > 3000
ORDER BY avg_amount DESC
LIMIT 5;
