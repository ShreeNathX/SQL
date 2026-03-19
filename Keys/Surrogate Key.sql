use learnkeys;

-- Surrogate Key (Auto-generated ID)

Create table orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,			-- Surrogate Key
    customer_name varchar(50),
    product varchar(50),
    amount int,
    order_date DATE
);

INSERT INTO orders (customer_name, product, amount, order_date) VALUES
('Amit', 'Laptop', 50000, '2024-01-01'),
('Rahul', 'Phone', 20000, '2024-01-02'),
('Priya', 'Tablet', 15000, '2024-01-03'),
('Sneha', 'Watch', 5000, '2024-01-04'),
('Karan', 'Shoes', 3000, '2024-01-05'),
('Neha', 'Bag', 2000, '2024-01-06'),
('Ravi', 'TV', 40000, '2024-01-07'),
('Pooja', 'Camera', 25000, '2024-01-08'),
('Arjun', 'Headphones', 3000, '2024-01-09'),
('Meena', 'Monitor', 12000, '2024-01-10');

select * from orders;

/* 
Output:
order_id customer_name product amount order_date
1	Amit	Laptop	50000	2024-01-01
2	Rahul	Phone	20000	2024-01-02
3	Priya	Tablet	15000	2024-01-03
4	Sneha	Watch	5000	2024-01-04
5	Karan	Shoes	3000	2024-01-05
6	Neha	Bag	2000	2024-01-06
7	Ravi	TV	40000	2024-01-07
8	Pooja	Camera	25000	2024-01-08
9	Arjun	Headphones	3000	2024-01-09
10	Meena	Monitor	12000	2024-01-10
*/
