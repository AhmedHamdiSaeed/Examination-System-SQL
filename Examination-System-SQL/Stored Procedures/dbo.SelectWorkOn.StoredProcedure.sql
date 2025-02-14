USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectWorkOn]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectWorkOn](@insId int , @deptId int)
as
begin
begin try
	if not exists (select 1 from Instructor where id=@insId)
	 begin
	 print 'Instructor does not exist.';
	 return;
	 end
	 if not exists (select 1 from Department where id=@deptId)
	 begin
	 print 'Department does not exist.';
	 return;
	 end
	 select * from  Works_On 
	 where ins_id=@insId and dept_id= @deptId;
	 return;
end try
begin catch
print error_message();
end catch
end
GO
