USE [SchoolManagementDb]

SELECT 
	FirstName,
	LastName,
	DateOfBirth,
	StaffId
FROM Lecturers
WHERE DateOfBirth IS NULL

---------------------------------------------

USE [SchoolManagementDb]

SELECT 
	FirstName [First Name],
	LastName [Last Name],
	DateOfBirth [Date Of Birth],
	StaffId,
	CASE 
		WHEN StaffId IS NULL THEN 'Not Onboarded'
		ELSE StaffId
	END [Staff Id]
FROM Lecturers