USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranch]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateBranch]( @BranchID INT,  @Location_Name NVARCHAR(10))
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Branch WHERE ID = @BranchID)
        BEGIN
            PRINT 'Branch does not exist.';
            RETURN;
        END
        
        UPDATE Branch
        SET Location_Name = @Location_Name
        WHERE ID = @BranchID;
        
        PRINT 'Branch information updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
