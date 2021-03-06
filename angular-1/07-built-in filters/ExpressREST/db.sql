USE [Sample]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_emp_dept]') AND parent_object_id = OBJECT_ID(N'[dbo].[emp]'))
ALTER TABLE [dbo].[emp] DROP CONSTRAINT [FK_emp_dept]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp]') AND type in (N'U'))
DROP TABLE [dbo].[emp]
GO
/****** Object:  Table [dbo].[dept]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dept]') AND type in (N'U'))
DROP TABLE [dbo].[dept]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Update]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_Emp_Update]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Insert2]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Insert2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_Emp_Insert2]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Insert1]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Insert1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_Emp_Insert1]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Insert]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_Emp_Insert]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_GetList]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_Emp_GetList]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Delete]    Script Date: 12/31/2015 8:59:52 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_Emp_Delete]
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Delete]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Emp_Delete]
(
	@Original_empno int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [emp] WHERE (([empno] = @Original_empno))' 
END
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_GetList]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Emp_GetList]
AS
	SET NOCOUNT ON;
SELECT     empno, ename, sal, deptno
FROM         emp' 
END
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Insert]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Emp_Insert]
(
	@empno int,
	@ename varchar(50),
	@sal float,
	@deptno int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [emp] ([empno], [ename], [sal], [deptno]) VALUES (@empno, @ename, @sal, @deptno);
	
SELECT empno, ename, sal, deptno FROM emp WHERE (empno = @empno)' 
END
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Insert1]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Insert1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Emp_Insert1]
AS
	SET NOCOUNT OFF;
begin tran
INSERT INTO [emp] ([empno], [ename], [sal], [deptno]) VALUES (9002, ''oooo'', 4500, 10);
commit tran

	
' 
END
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Insert2]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Insert2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Emp_Insert2]
AS
	SET NOCOUNT OFF;
INSERT INTO [emp] ([empno], [ename], [sal], [deptno]) VALUES (9001, ''pppp'', 4500, 10);
	
' 
END
GO
/****** Object:  StoredProcedure [dbo].[p_Emp_Update]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Emp_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Emp_Update]
(
	@empno int,
	@ename varchar(50),
	@sal float,
	@deptno int,
	@Original_empno int
)
AS
	SET NOCOUNT OFF;
UPDATE [emp] SET [empno] = @empno, [ename] = @ename, [sal] = @sal, [deptno] = @deptno WHERE (([empno] = @Original_empno));
	
SELECT empno, ename, sal, deptno FROM emp WHERE (empno = @empno)' 
END
GO
/****** Object:  Table [dbo].[dept]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dept]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dept](
	[deptno] [int] NOT NULL,
	[dname] [varchar](50) NULL,
 CONSTRAINT [PK_dept] PRIMARY KEY CLUSTERED 
(
	[deptno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[emp]    Script Date: 12/31/2015 8:59:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emp](
	[empno] [int] NOT NULL,
	[ename] [varchar](50) NULL,
	[sal] [float] NULL,
	[hiredate] [datetime] NULL,
	[dob] [datetime] NULL,
	[deptno] [int] NULL,
 CONSTRAINT [PK_emp] PRIMARY KEY CLUSTERED 
(
	[empno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[dept] ([deptno], [dname]) VALUES (10, N'Accounting')
GO
INSERT [dbo].[dept] ([deptno], [dname]) VALUES (20, N'Sales')
GO
INSERT [dbo].[dept] ([deptno], [dname]) VALUES (30, N'Research')
GO
INSERT [dbo].[dept] ([deptno], [dname]) VALUES (40, N'IT')
GO
INSERT [dbo].[dept] ([deptno], [dname]) VALUES (50, N'Legal')
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1001, N'Scott', 2400, CAST(0x0000878B00000000 AS DateTime), CAST(0x0000796400E6B680 AS DateTime), 10)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1002, N'Thomas', 3400, CAST(0x0000820D00000000 AS DateTime), CAST(0x0000747E004A2860 AS DateTime), 20)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1003, N'Aaron', 4600, CAST(0x000081F300000000 AS DateTime), CAST(0x00007489008530E0 AS DateTime), 10)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1004, N'Jason', 3700, CAST(0x000080B600000000 AS DateTime), CAST(0x0000729F00858090 AS DateTime), 20)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1005, N'Kelvin', 7600, CAST(0x000084AA00000000 AS DateTime), CAST(0x0000758F0064AF64 AS DateTime), 30)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1006, N'Grant', 3709, CAST(0x0000836200000000 AS DateTime), CAST(0x00006F88011369DC AS DateTime), 20)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1007, N'Ivan', 2900, CAST(0x0000825200000000 AS DateTime), CAST(0x00007C17014995D4 AS DateTime), 30)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1008, N'Hardy', 8700, CAST(0x0000854D00000000 AS DateTime), CAST(0x000076E9008D6288 AS DateTime), 20)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1009, N'Peter', 5000, CAST(0x0000870A00000000 AS DateTime), CAST(0x00007628017E5C60 AS DateTime), 10)
GO
INSERT [dbo].[emp] ([empno], [ename], [sal], [hiredate], [dob], [deptno]) VALUES (1010, N'Ronald', 8200, CAST(0x000081D400000000 AS DateTime), CAST(0x000075D0005C2BB4 AS DateTime), 30)
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_emp_dept]') AND parent_object_id = OBJECT_ID(N'[dbo].[emp]'))
ALTER TABLE [dbo].[emp]  WITH CHECK ADD  CONSTRAINT [FK_emp_dept] FOREIGN KEY([deptno])
REFERENCES [dbo].[dept] ([deptno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_emp_dept]') AND parent_object_id = OBJECT_ID(N'[dbo].[emp]'))
ALTER TABLE [dbo].[emp] CHECK CONSTRAINT [FK_emp_dept]
GO
