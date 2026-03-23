CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- UNIQUE KEY
-- ============================================================
 
CREATE TABLE users (
    user_id   INT AUTO_INCREMENT,
    username  VARCHAR(50)  NOT NULL,
    phone     VARCHAR(15),             -- Allows one NULL
    city      VARCHAR(50),
    plan      VARCHAR(20),
 
    PRIMARY KEY (user_id),
    UNIQUE (username),                 -- Unique Key
    UNIQUE (phone)                     -- Unique Key (one NULL allowed)
);
 
INSERT INTO users (username, phone, city, plan) VALUES
('aarav_s',  '9876543210', 'Delhi',     'Pro'),
('priya_m',  '9123456789', 'Mumbai',    'Free'),
('rahul_j',  '9988776655', 'Pune',      'Pro'),
('sneha_p',  NULL,         'Chennai',   'Free'),
('karan_s',  '9001122334', 'Kolkata',   'Pro'),
('ananya_d', '9556677889', 'Hyderabad', 'Free'),
('rohan_g',  '9443322110', 'Bangalore', 'Pro'),
('divya_r',  '9771234567', 'Jaipur',    'Free'),
('arjun_n',  '9654321098', 'Ahmedabad', 'Pro'),
('pooja_i',  '9321098765', 'Bhopal',    'Free');