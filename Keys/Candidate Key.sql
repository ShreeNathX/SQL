CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- CANDIDATE KEY
-- ============================================================
 
CREATE TABLE employees_ck (
    emp_id  VARCHAR(10),
    email   VARCHAR(100) NOT NULL,
    name    VARCHAR(100),
    dept    VARCHAR(50),
    salary  DECIMAL(10,2),
 
    PRIMARY KEY (emp_id),       -- Candidate Key 1 chosen as PK
    UNIQUE (email)              -- Candidate Key 2 (also unique, not null)
);
 
INSERT INTO employees_ck VALUES
('E001', 'amit@corp.com',   'Amit Kumar',    'HR',      50000),
('E002', 'neha@corp.com',   'Neha Verma',    'Finance', 60000),
('E003', 'suresh@corp.com', 'Suresh Yadav',  'IT',      75000),
('E004', 'lata@corp.com',   'Lata Mishra',   'HR',      55000),
('E005', 'ravi@corp.com',   'Ravi Shankar',  'IT',      80000),
('E006', 'meena@corp.com',  'Meena Bose',    'Finance', 62000),
('E007', 'ajay@corp.com',   'Ajay Tripathi', 'IT',      90000),
('E008', 'sonia@corp.com',  'Sonia Roy',     'HR',      53000),
('E009', 'deepak@corp.com', 'Deepak Jain',   'Finance', 68000),
('E010', 'rashmi@corp.com', 'Rashmi Singh',  'IT',      77000);