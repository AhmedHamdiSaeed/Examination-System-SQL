USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertCourse]
@cou_name varchar(50)
As
Begin
declare @cou_id int
 select @cou_id = max(id) from Course;
    set @cou_id = coalesce(@cou_id, 0) + 1;
	insert into Course(id,Crs_name)
	values(@cou_id,@cou_name)
	print 'Course information Inserted successfully.';
End
GO
