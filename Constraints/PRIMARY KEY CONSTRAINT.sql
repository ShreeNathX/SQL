CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Primary Key Constraint
-- ============================================================

create table Department(
	dept_id int primary key,
    dept_name varchar(50)
);

insert into department values
(10, "HR"),
(20, "IT");