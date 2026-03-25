CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Foreign Key Constraint
-- ============================================================

create table orders(
	order_id int primary key,
    Student_ID int,
    foreign key (student_id) references student (Student_Id)
);

