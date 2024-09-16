USE [SchoolManagementDb]

select * from Students
select * from ProgrammesOfStudy

SELECT * FROM Students
	INNER JOIN ProgrammesOfStudy 
		ON Students.ProgrammeOfStudyId = ProgrammesOfStudy.Id

SELECT 
	Students.StudentId, 
	Students.FirstName, 
	Students.LastName,
	ProgrammesOfStudy.Name,
	ProgrammesOfStudy.DurationInYears
FROM Students
	INNER JOIN ProgrammesOfStudy 
		ON Students.ProgrammeOfStudyId = ProgrammesOfStudy.Id

SELECT 
	Students.StudentId [Student Id], 
	Students.FirstName [First Name], 
	Students.LastName [Last Name],
	ProgrammesOfStudy.Name [Programmes Of Study],
	ProgrammesOfStudy.DurationInYears [Estimate Duration In Years]
FROM Students
	INNER JOIN ProgrammesOfStudy 
		ON Students.ProgrammeOfStudyId = ProgrammesOfStudy.Id

SELECT * FROM Classes
INNER JOIN Lecturers ON Classes.LecturerId = Lecturers.Id
INNER JOIN Courses ON Classes.CourseId = Courses.Id

SELECT 
	co.Name [Course Name],
	co.Code [Course Code],
	l.FirstName + ' ' + l.LastName [Lecturer],
	c.Time [Class Time]
FROM Classes c
INNER JOIN Lecturers l ON c.LecturerId = l.Id
INNER JOIN Courses co ON c.CourseId = co.Id