USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[deletequestionChoices]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deletequestionChoices] @QId int, @ChioceId int
as
	if exists(select * from questionChoices where que_id=@QId and choice_id=@ChioceId)
	begin
		delete from questionChoices where que_id=@QId and choice_id=@ChioceId
	end
	else
		RAISERROR ('the combination of QId and ChioceId is not exists to Delete', 16, 1)
					return;
GO
