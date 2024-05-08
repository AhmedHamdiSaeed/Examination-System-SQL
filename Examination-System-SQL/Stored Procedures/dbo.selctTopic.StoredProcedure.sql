USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[selctTopic]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[selctTopic](@id int)
as 
begin
	select * from topic where topic_id = @id
	if @@ROWCOUNT = 0
		print 'there is no topic with that id '
end
GO
