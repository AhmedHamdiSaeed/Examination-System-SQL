USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[updateExam_questions]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[updateExam_questions] @oldExId int, @newExId int, @oldQuId int, @newQuId int
as
if(@oldExId!=@newExId) or ( @oldQuId!= @newQuId)
begin
	if(@oldExId!=@newExId) and ( @oldQuId!= @newQuId)
	begin
		if exists(select * from exam_question where exam_id=@oldExId and ques_id=@oldQuId)
			begin
						if exists(select * from exam e where e.exam_id=@newExId)
						begin
							if exists(select * from question q where q.id=@newQuId )
								begin
										if not exists (select * from exam_question eq where eq.exam_id=@newExId and eq.ques_id=@newQuId )
								begin
									update exam_question  set exam_id=@newExId ,ques_id=@newQuId where exam_id=@oldExId and ques_id=@oldQuId
									return;
								end
							else
									RAISERROR ('the newExId and newQuId is already exists', 16, 1)
												return;
								end
								else
									RAISERROR ('the newQuId is not question', 16, 1)
														return;
						end
						else
								RAISERROR ('the newExId is not exam', 16, 1)
														return;							
			end
			else
					RAISERROR ('the combination of oldExId and oldQeId is not exists to update', 16, 1)
														return;
	end
	else if(@oldExId=@newExId)
	begin
		if exists(select * from exam_question eq where eq.exam_id=@oldExId)
		begin	
			if exists(select * from exam_question where ques_id=@oldQuId)
				begin
					if exists (select * from question q where q.id=@newQuId)
						begin 
							if not exists (select * from exam_question eq where eq.exam_id=@oldExId and eq.ques_id=@newQuId )
								begin
									update exam_question set ques_id=@newQuId where exam_id=@oldExId and ques_id=@oldQuId
									return;
								end
							else
									RAISERROR ('the ExId and newQuId is already exists', 16, 1)
												return;
						end
					else
							RAISERROR ('the newQuId is not question', 16, 1)
										return;
				end
			else
					RAISERROR ('the oldQuId is not exists to update', 16, 1)
								return;
		end
		else
		begin
				RAISERROR ('the oldExId is not exists ', 16, 1)
							return;
		end
	end
	else 
	begin
		if exists(select  * from exam_question where ques_id=@oldQuId)
			begin
				if exists(select  * from exam_question where ques_id=@oldExId)
				begin
					if not exists(select  * from exam_question where exam_id=@newExId and ques_id=@oldQuId)
					begin
						update exam_question set exam_id=@newExId where exam_id=@oldExId and ques_id=@oldQuId
									return;
					end
					else
						RAISERROR ('the newExId and QuId is already exists', 16, 1)
									return;
				end
				else
				     	RAISERROR ('the oldExId is not exists to update', 16, 1)
							return;
			end
		else
				RAISERROR ('the oldQuId is not exists', 16, 1)
							return;
	end
end
else
		RAISERROR ('must insert different IDs for ExId or QuId to update', 16, 1)
					return;
GO
