USE [SchoolManagementDb]

select * from Enrollments
select * from Classes
select * from Courses

--------------------------------------------------------------

-- Select distinct
SELECT DISTINCT * FROM Enrollments

SELECT 
	DISTINCT StudentId
FROM Enrollments

SELECT 
	DISTINCT e.StudentId, 
	s.FirstName + ' ' + s.LastName [Student Name] 
FROM Enrollments e
INNER JOIN Students s on s.Id = e.StudentId

--------------------------------------------------------------

-- group by

SELECT 
	CourseId, 
	co.Code, 
	co.Name 
FROM Classes c
INNER JOIN Courses co on co.Id = c.CourseId
GROUP BY CourseId, co.Code, co.Name

SELECT 
	CourseId, 
	co.Code, 
	co.Name 
FROM Classes c
INNER JOIN Courses co on co.Id = c.CourseId
WHERE LecturerId = 1
GROUP BY CourseId, co.Code, co.Name

----------------------------------------------------

SELECT 
	COUNT(StudentId) [Number of Classes]
FROM Enrollments

SELECT 
	s.StudentId,
	s.FirstName,
	s.LastName,
	COUNT(s.StudentId) [Number of Classes]
FROM Enrollments e
INNER JOIN Students s on s.Id = e.StudentId
GROUP BY s.StudentId, s.FirstName, s.LastName

----------------------------------------------------

-- Aggregate Functions

SELECT
	s.[StudentId] [Student Id],
	s.FirstName + ' ' + s.LastName [Student Name],
	AVG([Grade]) [Average Grade],
	MIN([Grade]) [Lowest Grade],
	MAX([Grade]) [Highest Grade],
	COUNT(Grade) [Number of Classes]
FROM [SchoolManagementDb].[dbo].[Enrollments] e
INNER JOIN Students s on s.id = e.StudentId
WHERE ClassId = 1
GROUP BY s.[StudentId], s.FirstName, s.LastName

SELECT
	COUNT(Id) [How many Students],
	AVG(Grade) [Average Class Grade],
	Min(Grade) [Lowest Class Grade],
	MAX(Grade) [Highest Class Grade]
FROM [Enrollments]
WHERE Id = 1

SELECT 
	s.[StudentId] [Student Id],
	s.FirstName + ' ' + s.LastName [Student Name],
	AVG([Grade]) [Average Grade],
	SUM(co.[Credits]) [Number of Credits]
FROM Enrollments e
INNER JOIN Classes cl on cl.Id = e.ClassId
INNER JOIN Courses co on cl.Id = cl.CourseId
INNER JOIN Students s on s.Id = e.StudentId
GROUP BY s.[StudentId], s.FirstName, s.LastName

----------------------------------------------------

-- HAVING

-- Can't Use this
--SELECT 
--	s.[StudentId] [Student Id],
--	s.FirstName + ' ' + s.LastName [Student Name],
--	AVG([Grade]) [Average Grade],
--	SUM(co.[Credits]) [Number of Credits]
--FROM Enrollments e
--INNER JOIN Classes cl on cl.Id = e.ClassId
--INNER JOIN Courses co on cl.Id = cl.CourseId
--INNER JOIN Students s on s.Id = e.StudentId
--WHERE AVG([Grade]) >= 60
--GROUP BY s.[StudentId], s.FirstName, s.LastName

-- Use This
SELECT 
	s.[StudentId] [Student Id],
	s.FirstName + ' ' + s.LastName [Student Name],
	AVG([Grade]) [Average Grade],
	SUM(co.[Credits]) [Number of Credits]
FROM Enrollments e
INNER JOIN Classes cl on cl.Id = e.ClassId
INNER JOIN Courses co on cl.Id = cl.CourseId
INNER JOIN Students s on s.Id = e.StudentId
GROUP BY s.[StudentId], s.FirstName, s.LastName
HAVING AVG([Grade]) >= 60