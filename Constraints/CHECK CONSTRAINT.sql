CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Check Constraint
-- ============================================================

create table employee(
	emp_id int,
    age int check(age >= 18)				-- If condition is true then only accept entries else return error
);