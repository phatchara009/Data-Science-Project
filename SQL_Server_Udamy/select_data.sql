USE [SchoolManagementDb]

SELECT * FROM Lecturers;
SELECT * FROM Courses;

SELECT 
	FirstName,
	LastName,
	StaffId
FROM Lecturers;

----------------------------------------------

SELECT TOP (1000) [Id]
      ,[Name]
      ,[Code]
      ,[Credits]
  FROM [SchoolManagementDb].[dbo].[Courses]
