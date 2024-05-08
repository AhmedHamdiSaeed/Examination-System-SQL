USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[selectquestionChoices]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectquestionChoices]
as
	if exists(select * from questionChoices)
	select  qc.que_id as QId, qc.choice_id as ChoiceeID  from questionChoices qc
	else
	select 'table is empty' as message
GO
