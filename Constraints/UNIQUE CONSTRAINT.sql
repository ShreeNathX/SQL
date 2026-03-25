CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Unique Constraint
-- ============================================================

create table users(
	user_id int,
    email varchar(100) unique				-- No duplicate entries are allowed
);


insert into users values
(1, "a@gmail.com"),
(2, "b@gmail.com");