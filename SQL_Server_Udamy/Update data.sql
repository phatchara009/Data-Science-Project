USE [SchoolManagementDb]

SELECT * FROM Lecturers

UPDATE Lecturers SET 
	DateOfBirth = '1998-02-05', 
	FirstName = 'Britt'
WHERE Id = 4

SELECT * FROM Lecturers
