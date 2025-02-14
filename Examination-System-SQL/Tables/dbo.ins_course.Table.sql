USE [iti]
GO
/****** Object:  Table [dbo].[ins_course]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ins_course](
	[ins_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
 CONSTRAINT [PK_ins_course] PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ins_course]  WITH CHECK ADD  CONSTRAINT [FK_ins_course_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ins_course] CHECK CONSTRAINT [FK_ins_course_Course]
GO
ALTER TABLE [dbo].[ins_course]  WITH CHECK ADD  CONSTRAINT [FK_ins_course_Instructor] FOREIGN KEY([ins_id])
REFERENCES [dbo].[Instructor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ins_course] CHECK CONSTRAINT [FK_ins_course_Instructor]
GO
