USE [SchoolManagementDb]

-- Transaction create a staging area for changes

/*
	BEGIN TRANSACTION
		SQL COMMANDS... 
		SQL COMMANDS... 
		SQL COMMANDS... 
		SQL COMMANDS... 
	COMMIT - To Confirm
	ROLLBACK - To Undo
*/

BEGIN TRANSACTION
	DELETE FROM Lecturers
select * from Lecturers
---------------------------------
ROLLBACK -- Undo ��觷�����
select * from Lecturers


BEGIN TRANSACTION
	DELETE FROM Lecturers
select * from Lecturers
---------------------------------
COMMIT -- �׹�ѹ��觷��� ������������
select * from Lecturers

