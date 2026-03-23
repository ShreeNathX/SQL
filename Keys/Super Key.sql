CREATE DATABASE IF NOT EXISTS learnkeys;
USE learnkeys;

-- ============================================================
-- SUPER KEY
-- ============================================================
 
CREATE TABLE products (
    product_id  VARCHAR(10),
    barcode     VARCHAR(20) NOT NULL,
    name        VARCHAR(100),
    category    VARCHAR(50),
    price       DECIMAL(8,2),
 
    PRIMARY KEY (product_id),   -- Super Key (minimal = candidate key)
    UNIQUE (barcode)            -- Super Key (minimal = candidate key)
    -- {product_id, name}          → also a super key (has redundant column)
    -- {product_id, barcode}       → also a super key
    -- {product_id, name, category}→ also a super key
);
 
INSERT INTO products VALUES
('P001', '8901030859924', 'Parle-G Biscuit', 'Food',      10.00),
('P002', '8906037491015', 'Maggi Noodles',   'Food',      14.00),
('P003', '8901526100267', 'Dairy Milk',       'Chocolate', 20.00),
('P004', '8904116100015', 'Munch',            'Chocolate', 10.00),
('P005', '8901030001635', 'Hide & Seek',      'Food',      30.00),
('P006', '8906019100039', 'KitKat',           'Chocolate', 40.00),
('P007', '8901120000065', 'Lays Classic',     'Snack',     20.00),
('P008', '8906026291041', 'Kurkure',          'Snack',     20.00),
('P009', '8904117300205', 'Bingo Mad Angles', 'Snack',     20.00),
('P010', '8901030860296', 'Monaco Biscuit',   'Food',      15.00);