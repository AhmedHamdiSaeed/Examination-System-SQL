USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[insertQuestion]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertQuestion] @Q_ID int, @Qtitle varchar(max),@TypeOfQuestion nchar(10),@right_Answer varchar(max),@gradeQu int,@Course_ID int
as
	if @Q_ID is not null
	begin
			if not exists(select * from question where id=@Q_ID)  
		begin
			if @Qtitle is not null
			begin
				if(@TypeOfQuestion is not null)
				begin
					if(@right_Answer is not null)
					begin
						if(@gradeQu is not null)
						begin					
							if(@Course_ID is not null)
							begin
								insert into question values(@Q_ID,@Qtitle,@TypeOfQuestion,@right_Answer,@gradeQu,@Course_ID)
							end
							else
							RAISERROR ('the Course_ID required', 16, 1)
							return;
						end
						else
						RAISERROR ('the gradeQu required', 16, 1)
						return;
					end
					else
					RAISERROR ('the right_Answer required', 16, 1)
					return;
				end
			else
			RAISERROR ('the TypeOfQuestionis required', 16, 1)
			return;
			end
			else
			RAISERROR ('the  QTitle is required', 16, 1)
						return;
		end
		else
		RAISERROR ('the  Q_ID is already exists', 16, 1)
									return;
	end
	else
	RAISERROR ('the  Q_ID is required', 16, 1)
				return;
GO
