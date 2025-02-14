USE [iti]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[stu_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[answer] [varchar](max) NOT NULL,
	[grade] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC,
	[exam_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_exam]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_question] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_question]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_student] FOREIGN KEY([stu_id])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_student]
GO
