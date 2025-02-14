USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateInsCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[UpdateInsCourse]
 @old_cou_id int,
    @new_cou_id int,
@ins_id int
As
Begin
 IF  EXISTS (Select 1 From ins_course Where course_id = @old_cou_id AND ins_id = @ins_id)

		Begin
			Update ins_course
			Set course_id = @new_cou_id
			Where course_id = @old_cou_id AND ins_id = @ins_id;
			print 'ins_course record updated successfully.';
			return;
		End
	Else
        Begin
            print 'Record with the given course_id and ins_id does not exist in ins_course table.';
			return;
        End

End
GO
