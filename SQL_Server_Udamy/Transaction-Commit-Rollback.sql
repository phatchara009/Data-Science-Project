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
ROLLBACK -- Undo สิ่งที่ทำได้
select * from Lecturers


BEGIN TRANSACTION
	DELETE FROM Lecturers
select * from Lecturers
---------------------------------
COMMIT -- ยืนยันสิ่งที่ทำ แก้ไขไม่ได้แล้ว
select * from Lecturers

