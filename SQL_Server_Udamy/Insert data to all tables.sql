use [SchoolManagementDb]

-----------------------------------------------------------------

insert into [dbo].[ProgrammesOfStudy] values
('Bsc. in Information Technology', 4),
('Bsc. in Teaching', 2),
('ASc. in Gardening', 2),
('ASc. in Finance', 2)

select * from ProgrammesOfStudy

-----------------------------------------------------------------

insert into students values 
('Peter', 'Johnson', '1991-08-09', '1478523685', 1),
('Peter', 'Pan', '1991-08-09', '1478523756', 2),
('John', 'Paul', '1991-08-09', '1478523678', 3),
('Matthew', 'Swanson', '1991-08-09', '1278523696', 3)

select * from students

-----------------------------------------------------------------

INSERT INTO Lecturers 
VALUES ('Trevoir', 'Williams', '2000-12-25', '1011209434'),
	   ('Rhodrey', 'Shaw', '1995-12-25', '1011209435'),
	   ('Wilson', 'Brittany', NULL, '1011209436'),
	   ('Howard', 'Bryant', NULL, '1011209437'),
	   ('Wilson', 'Foster', NULL, '1011209438');

select * from Lecturers

-----------------------------------------------------------------

insert into Courses values
('Database Development'		,'DB101',	3,	1),
('C++ Development'			,'CP101',	3,	1),
('C# Programming'			,'CS101',	4,	1)

select * from Courses

-----------------------------------------------------------------

insert into classes values
(1, 1, '12:00'), 
(1, 3, '13:00'), 
(2, 1, '10:00'), 
(4, 1, '08:00'), 
(5, 2, '15:00')

select * from classes

-----------------------------------------------------------------

insert into Enrollments values
(1, 1, NULL), 
(1, 3, NULL), 
(2, 1, NULL), 
(3, 1, NULL), 
(4, 2, NULL)

select * from Enrollments

-----------------------------------------------------------------