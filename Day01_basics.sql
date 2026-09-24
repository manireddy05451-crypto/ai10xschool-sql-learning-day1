-- ============================================================
-- Day 01: DBMS & SQL Fundamentals
-- Ecosystem: ai10x school | AI/ML Full Stack
-- ============================================================

/*
1. WHAT IS DBMS & RDBMS?
-------------------------
- DBMS (Database Management System): Software used to store, manage, and retrieve data efficiently.
- RDBMS (Relational DBMS): Stores data in tabular format (rows and columns) with relationships between tables.
- Examples: MySQL, PostgreSQL, Oracle, SQLite.

2. WHAT IS SQL?
----------------
- SQL (Structured Query Language): Standard language used to interact with Relational Databases.

3. SQL COMMAND CATEGORIES & SYNTAX:
-------------------------------------
- DDL (Data Definition Language)   : Defines table structure.
  Commands: CREATE, ALTER, DROP, TRUNCATE
- DML (Data Manipulation Language) : Manages data inside tables.
  Commands: INSERT, UPDATE, DELETE
- DQL (Data Query Language)        : Retrieves/queries data.
  Command : SELECT
- DCL (Data Control Language)      : Manages access permissions.
  Commands: GRANT, REVOKE
- TCL (Transaction Control Language): Manages transactions.
  Commands: COMMIT, ROLLBACK, SAVEPOINT
*/

-- ============================================================
-- MySQL Workbench Practice Queries
-- ============================================================

-- 1. Create and select a new database
CREATE DATABASE ai10x_practice;
USE ai10x_practice;

-- 2. DDL: Create a Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course VARCHAR(50),
    joining_date DATE
);

-- 3. DML: Insert records into the table
INSERT INTO students (student_id, name, course, joining_date)
VALUES 
(1, 'Pawan', 'AI/ML Full Stack', '2026-09-25'),
(2, 'Rahul', 'Data Science', '2026-09-25');

-- 4. DQL: Retrieve and filter data
-- Fetch all records
SELECT * FROM students;

-- Fetch specific columns with condition
SELECT name, course 
FROM students 
WHERE student_id = 1;
