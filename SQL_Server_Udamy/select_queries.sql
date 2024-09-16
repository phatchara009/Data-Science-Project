SELECT TOP (1000) [Id]
      ,[Name]
      ,[Code]
      ,[Credits]
  FROM [SchoolManagementDb].[dbo].[Courses]

SELECT * FROM Lecturers 
WHERE FirstName = 'Tajay' 
	OR LastName = 'Tajay'

SELECT * FROM Lecturers 
WHERE FirstName = 'Wilson' 
	OR LastName = 'Tajay'

-- Using wildcard to specify what string must start with
SELECT * FROM Lecturers WHERE FirstName LIKE 'W%'

-- Using wildcard to specify what string must end with
SELECT * FROM Lecturers WHERE FirstName LIKE '%r'

-- Using wildcard to specify what string must contain
SELECT * FROM Lecturers WHERE FirstName LIKE '%t%'

-- Using Math comparisons
SELECT * FROM Courses WHERE Credits > 3;
SELECT * FROM Courses WHERE Credits < 3;
SELECT * FROM Courses WHERE Credits >= 3;
SELECT * FROM Courses WHERE Credits <= 3;