use college_db;
show tables;
-- Step 1: Database create chesi use cheyadam
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- Step 2: Old tables unte drop cheyadam (clean slate)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers1;

-- Step 3: Customers table create cheyadam (Parent Table)
CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- Step 4: Customers table lo data insert cheyadam (customer_id: 1, 2, 3, 4)
INSERT INTO customers1 (customer_id, customer_name, email) VALUES
(1, 'Mani', 'mani@gmail.com'),
(2, 'Reddy', 'reddy@gmail.com'),
(3, 'Kiran', 'kiran@gmail.com'),
(4, 'Suresh', 'suresh@gmail.com');

-- Step 5: Orders table create cheyadam (Child Table with Foreign Key)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id)
);

-- Step 6: Orders table lo data insert cheyadam
-- Ikkada customer_id values (1, 2, 3) customers1 table lo unnavi mathrame vadam
INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2026-03-01', 1500),
(102, 2, '2026-03-05', 2500),
(103, 1, '2026-03-10', 800),
(104, 3, '2026-03-12', 3200);


select*from customers1;
select*from orders;

select customers1.customer_id,
       customers1.customer_name,
       customers1.email ,
       orders.order_id,
       orders.order_date,
       orders.amount
       from customers1 inner join orders on customers1.customer_id=orders.customer_id;
       
       select customers1.customer_id,
       customers1.customer_name,
       customers1.email ,
       orders.order_id,
       orders.order_date,
       orders.amount
       from customers1 right join orders on customers1.customer_id=orders.customer_id;
delete from customers1 where customer_name='mani';
set sql_safe_updates=0;
select* from customers1 inner join orders;



CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Mani', NULL),    -- Mani CEO/Top Boss, manager leru
(2, 'Reddy', 1),      -- Reddy manager Mani
(3, 'Kiran', 1),      -- Kiran manager Mani
(4, 'Suresh', 2);     -- Suresh manager Reddy

SELECT 
    E.emp_name AS Employee,
    M.emp_name AS Manager
FROM employees E
right join employees M
ON E.manager_id = M.emp_id;

-- Step 1: Left Join
SELECT 
    customers1.customer_id,
    customers1.customer_name,
    orders.order_id,
    orders.amount
FROM customers1
LEFT JOIN orders 
ON customers1.customer_id = orders.customer_id

UNION

-- Step 2: Right Join
SELECT 
    customers1.customer_id,
    customers1.customer_name,
    orders.order_id,
    orders.amount
FROM customers1
RIGHT JOIN orders 
ON customers1.customer_id = orders.customer_id;
