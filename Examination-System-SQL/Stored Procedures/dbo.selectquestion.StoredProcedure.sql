USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[selectquestion]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectquestion]
as
	if exists(select * from question)
	select  q.id as Q_ID, q.title as Qtitle,q.type as TypeOfQuestion,q.correct_answer as right_Answer,q.grade as gradeQu,courseId as Course_ID  from question q
	else
	select 'table is empty' as message
GO
