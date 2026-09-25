-- ============================================================
-- Day 02: SQL Constraints & Operators Practice
-- Ecosystem: ai10x school | AI/ML Full Stack
-- ============================================================

/*
1. SQL CONSTRAINTS (Rules enforced on data columns):
---------------------------------------------------
- NOT NULL    : Ensures that a column cannot have a NULL value.
- UNIQUE      : Ensures that all values in a column are distinct/different.
- PRIMARY KEY : Uniquely identifies each record (NOT NULL + UNIQUE).
- CHECK       : Ensures values satisfy a specific condition.
- DEFAULT     : Sets a default value if no value is passed during insert.

2. SQL OPERATORS:
-----------------
- Comparison  : =, !=, <>, >, <, >=, <=
- Logical     : AND, OR, NOT
- Range       : BETWEEN ... AND ...
- Membership  : IN (...), NOT IN (...)
- Pattern     : LIKE ('%a', 'a%', '%a%')
- Arithmetic  : +, -, *, /, %
*/

USE ai10x_practice;

-- ------------------------------------------------------------
-- 1. Table Creation with Constraints
-- ------------------------------------------------------------
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    age INT CHECK (age >= 18),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2) DEFAULT 30000.00,
    department VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'Active'
);

-- ------------------------------------------------------------
-- 2. Insert Sample Records
-- ------------------------------------------------------------
INSERT INTO employees (emp_id, first_name, last_name, age, email, salary, department)
VALUES
(101, 'Pawan', 'Reddy', 21, 'pawan@example.com', 65000.00, 'AI/ML'),
(102, 'Kiran', 'Kumar', 24, 'kiran@example.com', 45000.00, 'Data Science'),
(103, 'Sneha', 'Sharma', 28, 'sneha@example.com', 75000.00, 'Backend'),
(104, 'Amit', 'Verma', 19, 'amit@example.com', 32000.00, 'Testing'),
(105, 'Pooja', 'Rao', 26, 'pooja@example.com', 52000.00, 'AI/ML');

-- ------------------------------------------------------------
-- 3. Practice Queries Using Operators
-- ------------------------------------------------------------

-- Comparison & Logical (AND / OR)
SELECT * FROM employees
WHERE department = 'AI/ML' AND salary >= 60000;

-- Range Operator (BETWEEN)
SELECT first_name, age, salary FROM employees
WHERE age BETWEEN 20 AND 25;

-- Membership Operator (IN)
SELECT first_name, department FROM employees
WHERE department IN ('Data Science', 'Backend');

-- Pattern Matching Operator (LIKE)
-- Names starting with 'P'
SELECT * FROM employees
WHERE first_name LIKE 'P%';

-- Arithmetic Operators (Calculate 10% bonus)
SELECT first_name, salary, (salary * 0.10) AS bonus, (salary + (salary * 0.10)) AS total_salary
FROM employees;
