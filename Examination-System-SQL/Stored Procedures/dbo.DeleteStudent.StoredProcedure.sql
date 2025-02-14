USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteStudent](@stId int)
as
begin
begin try
 if not exists (select 1 from student where id=@stId)
	 begin
	 print 'Student does not exist.';
	 return;
	 end
	 delete student where id=@stId;
	 print 'Student Deleted successfully.';
	 return;
end try
begin catch
print error_message();
end catch
end
GO
