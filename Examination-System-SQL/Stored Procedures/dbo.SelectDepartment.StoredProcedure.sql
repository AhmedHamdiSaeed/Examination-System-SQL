USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectDepartment]
    @DeptID INT = NULL,
    @DeptName NVARCHAR(10) = NULL
AS
BEGIN
    BEGIN TRY
        IF @DeptID IS NOT NULL
        BEGIN
		 IF NOT EXISTS (SELECT * FROM Department WHERE ID = @DeptID)
            BEGIN
                PRINT 'Department does not exist.';
                RETURN;
            END
            ELSE
            BEGIN
            SELECT * FROM Department WHERE ID = @DeptID;
            END
        END
        ELSE IF @DeptName IS NOT NULL
        BEGIN
		IF NOT EXISTS (SELECT * FROM Department WHERE DeptName = @DeptName)
            BEGIN
                PRINT 'Department does not exist.';
                RETURN;
            END
            ELSE
            BEGIN
            SELECT * FROM Department WHERE DeptName = @DeptName;
            END
        END
        ELSE
        BEGIN
            PRINT 'Please provide either @DeptID or @DeptName.';
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
