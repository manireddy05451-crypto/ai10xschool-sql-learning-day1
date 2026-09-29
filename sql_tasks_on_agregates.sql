use company_db;



CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    age INT,
    salary INT,
    experience INT
);


-- 4. Insert Values
INSERT INTO employees1
(emp_id, emp_name, department, age, salary, experience)
VALUES
(1, 'Ravi', 'IT', 24, 35000, 1),
(2, 'Priya', 'HR', 28, 45000, 4),
(3, 'Kiran', 'IT', 26, 50000, 3),
(4, 'Anjali', 'Finance', 30, 55000, 6),
(5, 'Suresh', 'IT', 29, 60000, 5),
(6, 'Divya', 'HR', 25, 40000, 2),
(7, 'Arun', 'Finance', 32, 70000, 8),
(8, 'Sneha', 'IT', 27, 48000, 3),
(9, 'Rahul', 'Sales', 31, 42000, 5),
(10, 'Pooja', 'Sales', 26, 38000, 2);

select * from employees1;
-- TASKS FOR PRSTICR QUSTIONS----------------------------------------------------

-- Write a query to find the total salary of all employees.
select sum(salary) from employees1;

-- Write a query to find the average salary of employees.
select avg(salary) from employees1;

-- Write a query to find the highest salary in the Employees table.
select max(salary) from employees1;

-- Write a query to find the lowest salary in the Employees table.
select min(salary) from employees1;

-- Write a query to count the number of employees in each department.
select department ,count(*) from employees1 group by department;

-- Write a query to find the total salary paid in each department.
select department,sum(salary) from employees1 group by department;

-- Write a query to find the average salary of employees in each department.
select department ,avg(salary) from employees group by department;

-- Write a query to display the maximum salary in each department.
select department,max(salary) from employees1 group by department;

-- Write a query to display the minimum salary in each department.
select department,min(salary) from employees1 group by department;


select department, avg(salary) from employees1 where salary >60000 group by department;
