USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[updateTopic]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateTopic](@topic_id int , @topic_Name varchar(max))
as 
begin
	
	begin try
		 exec selctTopic @topic_id 
		 if @@ROWCOUNT > 0 
		update topic set topic_name = @topic_Name where topic_id = @topic_id
	end try
	begin catch
		print error_message()
	end catch

end
GO
