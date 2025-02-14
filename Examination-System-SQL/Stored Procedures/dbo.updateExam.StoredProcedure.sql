USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[updateExam]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateExam] ( @Scoree int , @id int)
as 
begin 
	
	if not exists (select 1 from exam where exam_id = @id)
		begin
		print 'exam not found'
		return
		end
	begin try
	update exam set Exam_score = @Scoree where exam_id = @id
	end try
	begin catch
		print error_message()
	end catch

end ;
GO
