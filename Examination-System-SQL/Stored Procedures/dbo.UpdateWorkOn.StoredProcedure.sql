USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateWorkOn]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateWorkOn](@insId int , @deptId int)
as
begin
begin try
	if exists (select 1 from Works_On where ins_id=@insId and dept_id=@deptId)
	begin
	update Works_On 
	set ins_id=@insId,
	dept_id=@deptId
	where ins_id = @insId and dept_id = @deptId;
	print 'WorkOn record updated successfully.';
	return;
	end
	else
        begin
            print 'Record with the given insId and deptId does not exist in WorkOn table.';
			return;
        end
end try
begin catch
print error_message();
end catch
end
GO
