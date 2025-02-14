USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructor]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateInstructor](@insId int,@insName varchar(20) , @salary decimal)
as
begin
begin try
	 if not exists (select 1 from Instructor where id=@insId)
	 begin
	 print 'Instructor does not exist.';
	 return;
	 end
	update Instructor
    set ins__name = @insName,
	ins_salary=@salary
    where id = @insId;
    print 'Instructor information updated successfully.';
	return;
end try
begin catch
print error_message();
end catch
end
GO
