USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[selectTest]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectTest] 
		as
		if exists(select * from Test )
		select t.stu_id as StudentID,t.exam_id as ExamID,  t.question_id as QuesID,t.answer as Answer from test t
		else
		
				RAISERROR ('the table is empty ', 16, 1)
				return;
GO
