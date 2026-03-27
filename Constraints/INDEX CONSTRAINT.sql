CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Index / Performance Constraint
-- ============================================================

create table consumers(
	customer_id int,
    cus_name varchar(50)
);

insert into consumers values
(101, "Hema"),
(102, "Rina");

create index idx_customer on consumers(cus_name);