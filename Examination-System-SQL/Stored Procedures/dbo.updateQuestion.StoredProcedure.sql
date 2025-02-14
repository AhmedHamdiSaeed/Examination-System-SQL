USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[updateQuestion]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateQuestion] @Q_ID int, @Qtitle varchar(max)=null,@TypeOfQuestion nchar(10)=null,@right_Answer varchar(max)=null,@gradeQu int=null,@Course_ID int=null
as
	begin
		if exists(select 1 from question where id=@Q_ID)
		begin
			 if @Course_ID is not null
			begin 
					if exists(select * from Course where id=@Course_ID)
					begin
					SET NOCOUNT ON;
						update question set courseId=@Course_ID  where id=@Q_ID
										print 'courseId updated'
						
					end
					else
							RAISERROR ('can not set this courseId is not refere to Course', 16, 1)
							return;
											
			end
			if @Qtitle is not null 
			begin
			SET NOCOUNT ON;
				update question set title=@Qtitle  where id=@Q_ID
								print 'title updated'
				
			end
			 if @TypeOfQuestion is not null
			begin 
			SET NOCOUNT ON;
				update question set type=@TypeOfQuestion  where id=@Q_ID
				print 'type updated'
				
			end
			 if @right_Answer is not null
			begin 
			SET NOCOUNT ON;
						update question set correct_answer=@right_Answer  where id=@Q_ID
										print 'correct_answer updated'
						
			end
			 if @gradeQu is not null
			begin 
			SET NOCOUNT ON;
						update question set grade=@gradeQu  where id=@Q_ID
										print 'grade updated'
						
			end
		
			if   @Qtitle is null and @TypeOfQuestion is null and @right_Answer is null and @gradeQu is null and @Course_ID is null
				RAISERROR ('must insert any column to update', 16, 1)
				return;
		end
		else
				RAISERROR ('the  Q_ID is not exists to Update', 16, 1)
				
	end
GO
