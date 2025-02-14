USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertExam]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[InsertExam] (@exam_Id int , @course_Id int , @Exam_Score int)
as 
begin	
	declare @course int 
	select @course= id  from Course where id = @course_Id
	if  @course is  null
		begin
			print ' this course doesnt exists '
			return
		end
	else 
	begin
		begin try 
			insert into exam(exam_id,course_id , Exam_score)
			values(@exam_Id , @course_Id , @Exam_Score)
			return
		end try
		begin catch
			print error_message()
		end catch
	end
end ;
GO
