CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- COMPOSITE KEY
-- ============================================================
 
CREATE TABLE attendance (
    student_id  INT,
    subject_id  INT,
    date        DATE,
    status      VARCHAR(10),
    remarks     VARCHAR(50),
 
    PRIMARY KEY (student_id, subject_id)   -- Composite Key
);
 
INSERT INTO attendance VALUES
(1, 101, '2024-01-01', 'Present', '-'),
(1, 102, '2024-01-01', 'Absent',  '-'),
(2, 101, '2024-01-01', 'Present', '-'),
(2, 102, '2024-01-01', 'Present', '-'),
(3, 101, '2024-01-01', 'Absent',  '-'),
(3, 102, '2024-01-01', 'Present', '-'),
(4, 101, '2024-01-01', 'Present', '-'),
(5, 101, '2024-01-01', 'Absent',  '-'),
(6, 102, '2024-01-01', 'Present', '-'),
(7, 101, '2024-01-01', 'Present', '-');