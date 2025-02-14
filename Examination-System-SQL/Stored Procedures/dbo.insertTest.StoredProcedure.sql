USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[insertTest]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create  proc [dbo].[insertTest] @StudentID int,@ExamID int, @QuestionID int,@Answer varchar(max)
		as
		if exists(select * from student where id=@StudentID)
		begin
			if exists(select * from exam where exam_id=@ExamID)
		begin
				if exists(select * from question where id=@QuestionID)
		begin
			declare @QuestionGrade int,@correctAnswer varchar(max),@grade int
			select @QuestionGrade=grade, @correctAnswer=correct_answer from question q where q.id=@QuestionID 
			if(@correctAnswer=@Answer)
			begin
				set @grade=@QuestionGrade
			end
			else
			begin
			set @grade=0
			end
			if not exists(select * from test where stu_id=@StudentID and exam_id=@ExamID and question_id=@QuestionID)
			begin
			insert into Test values(@StudentID,@ExamID,@QuestionID,@Answer,@grade)
			end
			else
					RAISERROR (' the combination of StudentID,ExamID,QuestionID already exists ', 16, 1)
					return;
		end
		else
			RAISERROR (' not found this QuestionID in Exam', 16, 1)
				return;
		end
		else
			RAISERROR (' not found this ExamID in Exam', 16, 1)
				return;
		end
		else
			RAISERROR (' not found this StudentID in students ', 16, 1)
				return;
	
GO
