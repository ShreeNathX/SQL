Create database LearnKeys;
use LearnKeys;

-- Primary Key Implementation
Create table employees(
	emp_id int primary key,
    name varchar(50),
    department varchar(50),
    salary int,
    age int
);

insert into employees values
(1, 'Amit', 'IT', 50000, 25),
(2, 'Rahul', 'HR', 40000, 26),
(3, 'Priya', 'IT', 55000, 24),
(4, 'Sneha', 'Finance', 60000, 27),
(5, 'Karan', 'IT', 52000, 28),
(6, 'Neha', 'HR', 45000, 25),
(7, 'Rabi', 'Finance', 58000, 29),
(8, 'Pooja', 'IT', 53000, 23),
(9, 'Arjun', 'HR', 470000, 26),
(10, 'Meena', 'Finance', 61000, 30);




