CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Not Null Constraint
-- ============================================================

create table student(
	Student_ID int,
    name varchar(50) not null				-- Row should be filled otherwise throw error
);

insert into student values
(101, "Ravi"),
(103, "Neha");