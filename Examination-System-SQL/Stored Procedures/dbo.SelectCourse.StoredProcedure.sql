USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectCourse]
As
Begin
	select*
	from Course
End
GO
