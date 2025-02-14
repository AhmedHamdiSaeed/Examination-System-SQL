USE [iti]
GO
/****** Object:  Table [dbo].[exam_question]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_question](
	[exam_id] [int] NOT NULL,
	[ques_id] [int] NOT NULL,
 CONSTRAINT [PK_exam_question] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[ques_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exam_question]  WITH CHECK ADD  CONSTRAINT [FK_exam_question_exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exam_question] CHECK CONSTRAINT [FK_exam_question_exam]
GO
ALTER TABLE [dbo].[exam_question]  WITH CHECK ADD  CONSTRAINT [FK_exam_question_question] FOREIGN KEY([ques_id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[exam_question] CHECK CONSTRAINT [FK_exam_question_question]
GO
