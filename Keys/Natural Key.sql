CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- NATURAL KEY
-- ============================================================
 
CREATE TABLE citizens (
    aadhaar_no  CHAR(14),        -- Natural Key (real-world identifier)
    full_name   VARCHAR(100) NOT NULL,
    dob         DATE,
    state       VARCHAR(50),
    gender      CHAR(1),
 
    PRIMARY KEY (aadhaar_no)
);
 
INSERT INTO citizens VALUES
('1234 5678 9012', 'Akash Verma',     '1990-05-12', 'UP',      'M'),
('2345 6789 0123', 'Babita Yadav',    '1988-09-23', 'Bihar',   'F'),
('3456 7890 1234', 'Chirag Mehta',    '1995-03-15', 'Gujarat', 'M'),
('4567 8901 2345', 'Deepika Nair',    '1992-11-07', 'Kerala',  'F'),
('5678 9012 3456', 'Ekansh Joshi',    '1987-07-19', 'MP',      'M'),
('6789 0123 4567', 'Farida Begum',    '1993-02-28', 'WB',      'F'),
('7890 1234 5678', 'Ganesh Pillai',   '1991-12-04', 'TN',      'M'),
('8901 2345 6789', 'Harsha Rao',      '1996-08-30', 'AP',      'F'),
('9012 3456 7890', 'Irfaan Siddiqui', '1989-06-16', 'MH',      'M'),
('0123 4567 8901', 'Jyoti Kumari',    '1994-04-09', 'RJ',      'F');