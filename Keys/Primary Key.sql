CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;
 
-- ============================================================
-- PRIMARY KEY
-- ============================================================
 
CREATE TABLE students (
    student_id  INT,
    name        VARCHAR(100),
    email       VARCHAR(100),
    dept        VARCHAR(50),
    age         INT,
 
    PRIMARY KEY (student_id)
);
 
INSERT INTO students VALUES
(1,  'Aarav Sharma', 'aarav@uni.edu',  'CS',      20),
(2,  'Priya Mehta',  'priya@uni.edu',  'IT',      21),
(3,  'Rahul Joshi',  'rahul@uni.edu',  'CS',      22),
(4,  'Sneha Patel',  'sneha@uni.edu',  'Math',    20),
(5,  'Karan Singh',  'karan@uni.edu',  'Physics', 23),
(6,  'Ananya Das',   'ananya@uni.edu', 'IT',      21),
(7,  'Rohan Gupta',  'rohan@uni.edu',  'CS',      22),
(8,  'Divya Rao',    'divya@uni.edu',  'Math',    20),
(9,  'Arjun Nair',   'arjun@uni.edu',  'Physics', 24),
(10, 'Pooja Iyer',   'pooja@uni.edu',  'CS',      21);