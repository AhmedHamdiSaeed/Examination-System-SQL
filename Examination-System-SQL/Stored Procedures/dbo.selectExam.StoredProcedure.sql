USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[selectExam]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[selectExam] (@examId int )
as 
begin 
	begin try
		select * from exam where exam_id = @examId
	end try
	begin catch
		print error_message() ;
	end catch
end 
GO
