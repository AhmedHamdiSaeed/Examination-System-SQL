USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[updatequestionChoices]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------
--update
create proc  [dbo].[updatequestionChoices] @oldQId int, @newQId int, @oldChoiceID int, @newChoiceID int
as
if(@oldQId!=@newQId) or ( @oldChoiceID!= @newChoiceID)
begin
	if(@oldQId!=@newQId) and ( @oldChoiceID!= @newChoiceID)
	begin
		if exists(select * from questionChoices where que_id=@oldQId and choice_id=@oldChoiceID)
			begin
						if exists(select * from question q where q.id=@newQId)
						begin
							if exists(select * from choices c where c.id=@newChoiceID )
								begin
										if not exists (select * from questionChoices qc where qc.que_id=@newQId and qc.choice_id=@newChoiceID )
								begin
									update questionChoices  set que_id=@newQId ,choice_id=@newChoiceID where que_id=@newQId and choice_id=@newChoiceID
									return;
								end
							else
									RAISERROR ('the combination of newQId and newChoiceID is already exists', 16, 1)
												return;
								end
								else
									RAISERROR ('the newChoiceID is not choices', 16, 1)
														return;
						end
						else
								RAISERROR ('the newQId is not Question', 16, 1)
														return;							
			end
			else
					RAISERROR ('the combination of oldQId and oldChoiceID is not exists to update', 16, 1)
														return;
	end
	else if(@oldQId=@newQId)
	begin
		if exists(select * from questionChoices qc where qc.que_id=@oldQId)
		begin	
			if exists(select * from questionChoices qc  where qc.choice_id=@oldChoiceID)
				begin
					if exists (select * from choices c where c.id=@newChoiceID)
						begin 
							if not exists (select * from questionChoices qc where qc.que_id=@newQId and qc.choice_id=@newChoiceID )
								begin
									update questionChoices set choice_id=@newChoiceID where que_id=@oldQId and choice_id=@oldChoiceID
									return;
								end
							else
									RAISERROR ('the combination of newQId and newChoiceID is already exists', 16, 1)
												return;
						end
					else
							RAISERROR ('the newQuId is not question', 16, 1)
										return;
				end
			else
					RAISERROR ('the oldChoiceID is not exists to update', 16, 1)
								return;
		end
		else
		begin
				RAISERROR ('the oldQId is not exists ', 16, 1)
							return;
		end
	end
	else 
	begin
		if exists(select  * from questionChoices where choice_id=@oldChoiceID)
			begin
				if exists(select  * from questionChoices where que_id=@oldQId)
				begin
					if not exists(select  * from questionChoices where que_id=@newQId and  choice_id=@newChoiceID)
					begin
						update questionChoices set que_id=@newQId where que_id=@oldQId and choice_id=@oldChoiceID
									return;
					end
					else
						RAISERROR ('the combination of newQId and newChoiceID is already exists', 16, 1)
									return;
				end
				else
				     	RAISERROR ('the oldQId is not exists to update', 16, 1)
							return;
			end
		else
				RAISERROR ('the oldChoiceID is not exists to update', 16, 1)
							return;
	end
end
else
		RAISERROR ('must insert different IDs for ExId or QuId to update', 16, 1)
					return;
GO
