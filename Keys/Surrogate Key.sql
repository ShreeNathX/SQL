CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- SURROGATE KEY
-- ============================================================
 
CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT,   -- Surrogate Key (system generated)
    customer_name VARCHAR(100),
    product       VARCHAR(100),
    amount        DECIMAL(10,2),
    order_date    DATE,
 
    PRIMARY KEY (order_id)
);
 
INSERT INTO orders (customer_name, product, amount, order_date) VALUES
('Anil Kapoor',   'Laptop',     55000, '2024-01-10'),
('Bela Trivedi',  'Phone',      18000, '2024-01-11'),
('Chandan Roy',   'Tablet',     25000, '2024-01-12'),
('Disha Agarwal', 'Headphones',  3500, '2024-01-13'),
('Eshan Mitra',   'Keyboard',    2200, '2024-01-14'),
('Falguni Shah',  'Mouse',        800, '2024-01-15'),
('Gaurav Pal',    'Monitor',    12000, '2024-01-16'),
('Hema Dixit',    'Webcam',      2500, '2024-01-17'),
('Irfan Khan',    'Printer',     8000, '2024-01-18'),
('Jaya Laxmi',    'Router',      3000, '2024-01-19');