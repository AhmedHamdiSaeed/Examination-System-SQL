USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[GenerateExam]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GenerateExam]
@cou_id  int, @ex_score int,@NumTFQuestions int,
    @NumMCQQuestions int
As
Begin 
   if not exists (select 1 from Course where id = @cou_id )
	   Begin
		 print 'Course not found';
		 return;
	   End
   Else
		Begin
		declare @ex_id int
		select @ex_id = max(exam_id) from exam;
		set @ex_id = coalesce(@ex_id, 0) + 1;
		    insert into exam(exam_id,course_id,Exam_score)
		    values(@ex_id,@cou_id,@ex_score)
			 -- Select True/False questions related to the same course
			insert into exam_question(exam_id, ques_id)
			select top (@NumTFQuestions) @ex_id, q.id
			from question q
			where q.type='TF' and  q.courseId =@cou_id
			order by NEWID();

			-- Select MCQ questions related to the same course
			insert into exam_question(exam_id, ques_id)
			select top (@NumMCQQuestions) @ex_id, q.id
			from question q
			where q.type='MCQ' and  q.courseId =@cou_id
			order by NEWID();
			select q.*
			from exam_question eq, question q, exam e
			where eq.exam_id = e.exam_id and eq.ques_id= q.id and eq.exam_id= @ex_id
			 
		End

End
GO
