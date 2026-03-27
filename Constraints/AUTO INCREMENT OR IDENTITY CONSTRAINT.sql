CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Auto Increment / Identity Constraint
-- ============================================================
create table product(
	product_id int auto_increment primary key,
    name varchar(50)
);

insert into product(name) values
("Shoes"),
("Cap");

select * from product;

-- ========================
-- Output
-- product_id name
--			1 Shoes
--			2 Cap
-- ========================
