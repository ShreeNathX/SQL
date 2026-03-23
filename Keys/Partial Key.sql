CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- PARTIAL KEY  (Weak Entity)
-- ============================================================
 
CREATE TABLE employee_strong (
    emp_id      VARCHAR(10),
    emp_name    VARCHAR(100),
    department  VARCHAR(50),
    designation VARCHAR(50),
    salary      DECIMAL(10,2),
 
    PRIMARY KEY (emp_id)
);
 
INSERT INTO employee_strong VALUES
('E001', 'Mohan Lal',   'Engineering', 'Manager',   120000),
('E002', 'Savita Rao',  'HR',          'Executive',  55000),
('E003', 'Tarun Ghosh', 'Finance',     'Analyst',    75000);
 
CREATE TABLE dependents (
    emp_id    VARCHAR(10),
    dep_no    INT,               -- Partial Key (unique only within each emp_id)
    dep_name  VARCHAR(100),
    relation  VARCHAR(30),
    age       INT,
 
    PRIMARY KEY (emp_id, dep_no),   -- emp_id + dep_no = full unique identifier
    FOREIGN KEY (emp_id) REFERENCES employee_strong(emp_id)
        ON DELETE CASCADE
);
 
INSERT INTO dependents VALUES
('E001', 1, 'Sushma Lal',   'Wife',     40),
('E001', 2, 'Raj Lal',      'Son',      15),
('E001', 3, 'Anu Lal',      'Daughter', 12),
('E001', 4, 'Hari Lal',     'Father',   70),
('E002', 1, 'Arun Rao',     'Husband',  42),
('E002', 2, 'Mini Rao',     'Daughter', 10),
('E002', 3, 'Sita Rao',     'Mother',   68),
('E003', 1, 'Kaveri Ghosh', 'Wife',     35),
('E003', 2, 'Sonu Ghosh',   'Son',       8),
('E003', 3, 'Gita Ghosh',   'Mother',   65);