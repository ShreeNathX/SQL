CREATE DATABASE IF NOT EXISTS LearnConstraints;
USE LearnConstraints;

-- ============================================================
-- Composite Constraint (Multi-Column Constraint)
-- ============================================================

create table enrollment(
	student_id int,
    course_id int,
    age int,
    primary key (student_id, course_id)			-- Combo of two or more column can be primary key
);