Use LearnKeys;

-- Foreign Key (Relationship between tables)

CREATE TABLE departments (				-- Parent Table
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    head VARCHAR(50),
    budget INT
);

CREATE TABLE staff (					-- Child Table
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    role VARCHAR(50),
    salary INT,
    
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1, 'IT', 'Delhi', 'Mr. Sharma', 500000),
(2, 'HR', 'Mumbai', 'Ms. Verma', 300000),
(3, 'Finance', 'Pune', 'Mr. Iyer', 400000),
(4, 'Marketing', 'Indore', 'Ms. Patel', 350000),
(5, 'Operations', 'Bhopal', 'Mr. Khan', 450000);

INSERT INTO staff VALUES
(1, 'Amit', 1, 'Manager', 50000),
(2, 'Rahul', 2, 'Executive', 40000),
(3, 'Priya', 1, 'Developer', 55000),
(4, 'Sneha', 3, 'Analyst', 60000),
(5, 'Karan', 2, 'Executive', 52000),
(6, 'Neha', 1, 'HR', 45000),
(7, 'Ravi', 3, 'Manager', 58000),
(8, 'Pooja', 1, 'Developer', 53000),
(9, 'Arjun', 2, 'HR', 47000),
(10, 'Meena', 3, 'Analyst', 61000);
