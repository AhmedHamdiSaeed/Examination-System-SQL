USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[insertintTopic]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[insertintTopic](@course_Id int , @topic_Name varchar(max))
as
begin
	begin try
		insert into topic(course_id, topic_name) values (@course_Id, @topic_Name)	
	end try
	begin catch
		print error_message()
	end catch

end
GO
