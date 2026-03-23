CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- ALTERNATE KEY
-- ============================================================
 
CREATE TABLE bank_accounts (
    account_no  VARCHAR(10),
    pan_number  VARCHAR(10) NOT NULL,
    holder_name VARCHAR(100),
    branch      VARCHAR(50),
    balance     DECIMAL(12,2),
 
    PRIMARY KEY (account_no),   -- Chosen as PK
    UNIQUE (pan_number)         -- Alternate Key (could have been PK)
);
 
INSERT INTO bank_accounts VALUES
('ACC1001', 'ABCDE1234F', 'Ramesh Jha',     'Delhi',     15000.00),
('ACC1002', 'FGHIJ5678K', 'Sunita Rani',    'Mumbai',    32000.00),
('ACC1003', 'LMNOP9012Q', 'Vikram Bahl',    'Chennai',    8000.00),
('ACC1004', 'RSTUV3456W', 'Kavita Devi',    'Kolkata',   52000.00),
('ACC1005', 'XYZAB7890C', 'Manish Tiwari',  'Pune',      19000.00),
('ACC1006', 'DEFGH2345I', 'Geeta Sharma',   'Delhi',     44000.00),
('ACC1007', 'JKLMN6789O', 'Vivek Naidu',    'Hyderabad', 27000.00),
('ACC1008', 'PQRST1234U', 'Ankita Bose',    'Bangalore', 63000.00),
('ACC1009', 'VWXYZ5678A', 'Dinesh Kumar',   'Jaipur',    11000.00),
('ACC1010', 'BCDEF9012G', 'Preethi Raj',    'Kochi',     38000.00);