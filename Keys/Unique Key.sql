use LearnKeys;

-- Unique Key (No duplicates allowed)
Create table users(
	user_id int, 
    username varchar(50),
    email varchar(100),
    phone varchar(15),
    city varchar(50)
);

insert into users values
(1, "Amit Sharma", "amit.sharma@gmail.com", '9876543210', 'Dheli'),
(2, "Rahul  Verma", "rahul.verma@gmail.com", '9765432108', "Mumbai"),
(3, 'Priya Singh', 'priya.singh@gmail.com', '9988776655', 'Pune'),
(4, 'Sneha Patel', 'sneha.patel@gmail.com', '9876540123', 'Indore'),
(5, 'Karan Mehta', 'karan.mehta@gmail.com', '9012345678', 'Bhopal'),
(6, "Neha Gupta", "neha.gupta@gmail.com", "9854321708", "Dheli"),
(7, 'Ravi Kumar', 'ravi.kumar@gmail.com', "9977663328", "Mumbai"),
(8, 'Pooja Jain', "pooja.jain@gmail.com", '9076904567', "Pune"),
(9, "Arjun Yadav", "arjun.yadav@gmail.com", "9876456723", "Indore"),
(10, 'Meena Das', 'meena.das@gmail.com', "9856236756", 'Bhopal');