CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Default Constraint
-- ============================================================

Create table shop(
	order_id int,
    status varchar(20) default "Pending"		-- When we don't insert entries then it automatically insert it
);

insert into shop (order_id) values
(101),
(203);

Select * from shop;

-- ==================
-- Output:
-- order_id status
-- 101	    Pending
-- 203	    Pending
-- ===================