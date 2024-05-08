USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[deleteTopic]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[deleteTopic](@id int )
as
begin 
	begin try
		 select * from topic where topic_id = @id
		 if @@ROWCOUNT > 0 
			 delete from topic where topic_id = @id
		else 
			print 'this topic not found'
			
	end try
	begin catch
		print error_message()
	end catch
end
GO
