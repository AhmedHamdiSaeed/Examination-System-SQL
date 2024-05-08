USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructor]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteInstructor](@insId int)
as
begin
begin try
 if not exists (select 1 from Instructor where id=@insId)
	 begin
	 print 'Instructor does not exist.';
	 return;
	 end
	 delete Instructor where id=@insId;
	 print 'Instructor Deleted successfully.';
	 return;
end try
begin catch
print error_message();
end catch
end
GO
