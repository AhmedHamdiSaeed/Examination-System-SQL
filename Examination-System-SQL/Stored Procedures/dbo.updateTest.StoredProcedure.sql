USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[updateTest]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateTest]  
    @StudentID INT,
    @ExamID INT, 
    @QuestionID INT,
    @NewStudentID INT = NULL,
    @NewExamID INT = NULL,
    @NewQuestionID INT = NULL,
    @NewAnswer VARCHAR(MAX) = NULL,
    @newGrade INT = NULL
AS
BEGIN
    IF NOT EXISTS(SELECT 1 FROM Test WHERE stu_id = @StudentID AND exam_id = @ExamID AND question_id = @QuestionID)
    BEGIN
        RAISERROR ('The combination of StudentID, ExamID, QuestionID does not exist to update', 16, 1)
        RETURN;
    END
    IF @NewStudentID IS NULL AND @NewExamID IS NULL AND @NewQuestionID IS NULL AND @NewAnswer IS NULL AND @newGrade IS NULL 
    BEGIN
        RAISERROR ('You must insert a new value for at least one column to update', 16, 1)
        RETURN;
    END
    IF @NewStudentID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM student WHERE id = @NewStudentID)
    BEGIN
        RAISERROR ('The newStudentID does not exist in the students table', 16, 1)
        RETURN;
    END

    IF @NewExamID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM exam WHERE exam_id = @NewExamID)
    BEGIN
        RAISERROR ('The newExamID does not exist in the exam table', 16, 1)
        RETURN;
    END

    IF @NewQuestionID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM question WHERE id = @NewQuestionID)
    BEGIN
        RAISERROR ('The newQuestionID does not exist in the question table', 16, 1)
        RETURN;
    ENd
	IF NOT EXISTS(
        SELECT 1 
        FROM Test 
        WHERE stu_id = ISNULL(@NewStudentID, @StudentID) 
          AND exam_id = ISNULL(@NewExamID, @ExamID) 
          AND question_id = ISNULL(@NewQuestionID, @QuestionID)
    )
	begin
        UPDATE Test
        SET 
            stu_id = ISNULL(@NewStudentID, stu_id),
            exam_id = ISNULL(@NewExamID, exam_id),
            question_id = ISNULL(@NewQuestionID, question_id),
            answer = ISNULL(@NewAnswer, answer),
		    grade = ISNULL(@newGrade, grade)
        WHERE stu_id = @StudentID 
          AND exam_id = @ExamID 
          AND question_id = @QuestionID;

		  	if @NewStudentID is not null
				print 'stuID updated'
			if @newExamID is not null
				print 'ExamID updated'
			if @newQuestionID is not null
				print 'QuestionIDu updated'
			if @newAnswer is not null
				print 'Answer updated'
			if @newGrade is not null
				print 'grade updated'
	end
    ELSE
    BEGIN
        RAISERROR ('Cannot update to new values because the combination already exists in Test', 16, 1)
        RETURN;
    END
ENd
GO
