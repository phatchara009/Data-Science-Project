USE [SchoolManagementDb]
GO

CREATE VIEW vw_StudentEnrollmentDetails AS
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
GROUP BY s.[StudentId], s.FirstName, s.LastName;

------------------------------------------------------------------------------------------------------

ALTER VIEW [dbo].vw_ClassCoursesAndProgrammes AS
SELECT 
	dbo.Courses.Name AS [Course Nme], 
	dbo.Courses.Code AS [Course Code], 
	dbo.Courses.Credits, 
	dbo.ProgrammesOfStudy.Name AS [Programme Name]
FROM dbo.Classes 
INNER JOIN dbo.Courses ON dbo.Classes.CourseId = dbo.Courses.Id 
INNER JOIN dbo.ProgrammesOfStudy ON dbo.Courses.ProgrammeOfStudyId = dbo.ProgrammesOfStudy.Id
GROUP BY dbo.Courses.Name, dbo.Courses.Code, dbo.Courses.Credits, dbo.ProgrammesOfStudy.Name;

------------------------------------------------------------------------------------------------------

DROP VIEW [vw_ClassCoursesAndProgrammes]