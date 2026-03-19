use learnkeys;

-- Composite Key (Multiple columns as PK)

Create table attendance(
	student_id int,
    subject_id int,
    date date,
    status varchar(10),
    remarks varchar(50),
    
    primary key (student_id, subject_id)
);

INSERT INTO attendance VALUES
(1, 101, '2024-01-01', 'Present', '-'),
(1, 102, '2024-01-01', 'Absent', '-'),
(2, 101, '2024-01-01', 'Present', '-'),
(2, 102, '2024-01-01', 'Present', '-'),
(3, 101, '2024-01-01', 'Absent', '-'),
(3, 102, '2024-01-01', 'Present', '-'),
(4, 101, '2024-01-01', 'Present', '-'),
(5, 101, '2024-01-01', 'Absent', '-'),
(6, 102, '2024-01-01', 'Present', '-'),
(7, 101, '2024-01-01', 'Present', '-');
