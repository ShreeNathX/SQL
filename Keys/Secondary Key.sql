CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- SECONDARY KEY
--  A column used for searching/filtering records but NOT
--  necessarily unique. Implemented using INDEX in MySQL.
-- ============================================================

CREATE TABLE employees_sk (
    emp_id  INT,
    name    VARCHAR(100),
    dept    VARCHAR(50),      -- Secondary Key (used to search by department)
    city    VARCHAR(50),
    salary  DECIMAL(10,2),

    PRIMARY KEY (emp_id),
    INDEX idx_dept (dept)     -- Secondary Key (index for fast search)
);

INSERT INTO employees_sk VALUES
(1,  'Aarav Sharma', 'IT',      'Delhi',     55000),
(2,  'Priya Mehta',  'HR',      'Mumbai',    48000),
(3,  'Rahul Joshi',  'IT',      'Pune',      62000),
(4,  'Sneha Patel',  'Finance', 'Chennai',   70000),
(5,  'Karan Singh',  'IT',      'Delhi',     58000),
(6,  'Ananya Das',   'HR',      'Kolkata',   45000),
(7,  'Rohan Gupta',  'Finance', 'Mumbai',    75000),
(8,  'Divya Rao',    'IT',      'Bangalore', 60000),
(9,  'Arjun Nair',   'HR',      'Hyderabad', 47000),
(10, 'Pooja Iyer',   'Finance', 'Delhi',     80000);

-- Using Secondary Key to search/filter records
SELECT * FROM employees_sk WHERE dept = 'IT';
SELECT * FROM employees_sk WHERE dept = 'HR';
SELECT * FROM employees_sk WHERE dept = 'Finance';