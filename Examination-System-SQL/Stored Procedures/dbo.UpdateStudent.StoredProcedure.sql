USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateStudent](@stId int, @fname varchar(20), @lname varchar(20), @gender char(1),@age int)
as
begin
begin try
	 if not exists (select 1 from student where id=@stId)
	 begin
	 print 'Student does not exist.';
	 return;
	 end
	if @gender not in ('m','M','f','F')
	begin
	print 'Invalid Gender . It must be [f or F or m or M]';
	return;
	end
	update Student
    set fname = @fname,
        lname = @lname,
        gender = upper(@gender),
        age = @age
    where id = @stId;
    print 'Student information updated successfully.';
	return;
end try
begin catch
print error_message();
end catch
end
GO
