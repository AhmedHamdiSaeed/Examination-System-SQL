USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertStuCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertStuCourse]
@cou_id int,
@stu_id int
As
Begin
    IF NOT EXISTS (Select 1 From Course Where id = @cou_id)
		Begin
			 print 'Course does not exist.';
			 return;
		End
	Else IF NOT EXISTS (Select 1 From student Where id = @stu_id)
		Begin
			 print 'Student does not exist.';
			 return;
		End
	Else IF  EXISTS (Select 1 From Stu_course Where stu_id = @stu_id and Crs_id= @cou_id )
		Begin
			 print 'Already exist ...';
			 return;
		End
	Else
		Begin
				INSERT INTO Stu_course (stu_id, Crs_id)
				VALUES (@stu_id, @cou_id);
				return;
		End
	
End
GO
