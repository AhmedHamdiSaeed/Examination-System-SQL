USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectBranch]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectBranch] (@BranchID INT = NULL, @LocationName NVARCHAR(10) = NULL)
AS
BEGIN
    BEGIN TRY
        IF @BranchID IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT * FROM Branch WHERE ID = @BranchID)
            BEGIN
                PRINT 'Branch does not exist.';
                RETURN;
            END
            ELSE
            BEGIN
                SELECT * FROM Branch WHERE ID = @BranchID;
            END
        END
        ELSE IF @LocationName IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT * FROM Branch WHERE LOWER(Location_Name) = LOWER(@LocationName))
            BEGIN
                PRINT 'Branch does not exist.';
                RETURN;
            END
            ELSE
            BEGIN
                SELECT * FROM Branch WHERE LOWER(Location_Name) = LOWER(@LocationName);
            END
        END
        ELSE
        BEGIN
            PRINT 'Please provide either @BranchID or @LocationName.';
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
