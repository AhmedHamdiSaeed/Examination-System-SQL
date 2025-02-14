USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertInstructor]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertInstructor](@insName varchar(20) , @salary decimal)
as
begin
begin try
declare @iId int;
    select @iId = max(id) from Instructor;
    set @iId = coalesce(@iId, 0) + 1;
  insert into Instructor(id,ins__name,ins_salary)
  values (@iId,@insName,@salary);
  print 'Instructor information Inserted successfully.';
  return;
  end try
begin catch
print error_message();
end catch
end;
GO
