USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertBranchDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertBranchDepartment] @BranchID INT, @DeptID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO BranchDepartment (branch_id, dept_id)
        VALUES (@BranchID, @DeptID)
		  print 'BranchDepartment information Inserted successfully.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
