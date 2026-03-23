CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- FOREIGN KEY
-- ============================================================
 
CREATE TABLE departments (
    dept_id   VARCHAR(5),
    dept_name VARCHAR(50),
    location  VARCHAR(50),
    head      VARCHAR(100),
    budget    DECIMAL(12,2),
 
    PRIMARY KEY (dept_id)
);
 
INSERT INTO departments VALUES
('D01', 'Engineering', 'Bangalore', 'Mr. Rajiv',  5000000),
('D02', 'HR',          'Mumbai',    'Ms. Anita',  2000000),
('D03', 'Finance',     'Delhi',     'Mr. Kapoor', 3000000);
 
CREATE TABLE employees_fk (
    emp_id  VARCHAR(10),
    name    VARCHAR(100),
    role    VARCHAR(50),
    dept_id VARCHAR(5),          -- Foreign Key column
    salary  DECIMAL(10,2),
 
    PRIMARY KEY (emp_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
 
INSERT INTO employees_fk VALUES
('E001', 'Arun Khanna',     'Developer',  'D01', 85000),
('E002', 'Bhavna Todi',     'HR Exec',    'D02', 50000),
('E003', 'Chetan Bose',     'Analyst',    'D03', 70000),
('E004', 'Deepa Menon',     'Tester',     'D01', 65000),
('E005', 'Elan Rajan',      'Designer',   'D01', 72000),
('E006', 'Farhan Sheikh',   'Recruiter',  'D02', 48000),
('E007', 'Gita Nair',       'Accountant', 'D03', 68000),
('E008', 'Hari Pillai',     'Manager',    'D01', 110000),
('E009', 'Indira Sethi',    'CFO Assist', 'D03', 90000),
('E010', 'Jayesh Kulkarni', 'DevOps',     'D01', 95000);