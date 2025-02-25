USE [master]
GO
/****** Object:  Database [Company]    Script Date: 3/27/2020 11:33:27 PM ******/
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Company.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Company_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Company] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Company] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Company] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Company] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Company] SET ARITHABORT OFF 
GO
ALTER DATABASE [Company] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Company] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Company] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Company] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Company] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company] SET RECOVERY FULL 
GO
ALTER DATABASE [Company] SET  MULTI_USER 
GO
ALTER DATABASE [Company] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Company] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Company] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Company', N'ON'
GO
ALTER DATABASE [Company] SET QUERY_STORE = OFF
GO
USE [Company]
GO
/****** Object:  Table [dbo].[ProjectsList]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsList](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTitle] [varchar](50) NOT NULL,
	[ProjectDefinition] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProjectsList] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[EmployeeAge] [int] NOT NULL,
	[EmployeeSalary] [bigint] NOT NULL,
	[EmployeeAddress] [varchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[EmployeeDesignation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignProjects]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignProjects](
	[AssignProjectId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ProjectRole] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AssignProjects] PRIMARY KEY CLUSTERED 
(
	[AssignProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAssignProjects]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAssignProjects]
AS
SELECT dbo.AssignProjects.AssignProjectId, dbo.ProjectsList.ProjectTitle, dbo.Employees.EmployeeName, dbo.AssignProjects.ProjectRole, dbo.AssignProjects.ProjectId
FROM     dbo.AssignProjects INNER JOIN
                  dbo.ProjectsList ON dbo.AssignProjects.ProjectId = dbo.ProjectsList.ProjectId INNER JOIN
                  dbo.Employees ON dbo.AssignProjects.EmployeeId = dbo.Employees.EmployeeId
GO
/****** Object:  Table [dbo].[EmployeeVacations]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeVacations](
	[EmployeeVacationId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[VacationDays] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeVacations] PRIMARY KEY CLUSTERED 
(
	[EmployeeVacationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vEmpOnVacations]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmpOnVacations]
AS
SELECT dbo.EmployeeVacations.VacationDays, dbo.EmployeeVacations.EmployeeVacationId, dbo.Employees.EmployeeName
FROM     dbo.Employees INNER JOIN
                  dbo.EmployeeVacations ON dbo.Employees.EmployeeId = dbo.EmployeeVacations.EmployeeId
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyLocation] [varchar](50) NOT NULL,
	[CompanyCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompaniesCategory]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesCategory](
	[CompanyCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompaniesCategory] PRIMARY KEY CLUSTERED 
(
	[CompanyCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyDepartments]    Script Date: 3/27/2020 11:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDepartments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_CompanyDepartments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssignProjects]  WITH CHECK ADD  CONSTRAINT [FK_AssignProjects_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[AssignProjects] CHECK CONSTRAINT [FK_AssignProjects_Employees]
GO
ALTER TABLE [dbo].[AssignProjects]  WITH CHECK ADD  CONSTRAINT [FK_AssignProjects_ProjectsList] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectsList] ([ProjectId])
GO
ALTER TABLE [dbo].[AssignProjects] CHECK CONSTRAINT [FK_AssignProjects_ProjectsList]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Companies]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Companies1] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Companies1]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_CompaniesCategory] FOREIGN KEY([CompanyCategoryId])
REFERENCES [dbo].[CompaniesCategory] ([CompanyCategoryId])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_CompaniesCategory]
GO
ALTER TABLE [dbo].[CompanyDepartments]  WITH CHECK ADD  CONSTRAINT [FK_CompanyDepartments_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyDepartments] CHECK CONSTRAINT [FK_CompanyDepartments_Companies]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_CompanyDepartments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[CompanyDepartments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_CompanyDepartments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[EmployeeVacations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeVacations_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeVacations] CHECK CONSTRAINT [FK_EmployeeVacations_Employees]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssignProjects"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectsList"
            Begin Extent = 
               Top = 7
               Left = 293
               Bottom = 148
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 7
               Left = 548
               Bottom = 170
               Right = 789
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAssignProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAssignProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employees"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmployeeVacations"
            Begin Extent = 
               Top = 7
               Left = 337
               Bottom = 148
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEmpOnVacations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEmpOnVacations'
GO
USE [master]
GO
ALTER DATABASE [Company] SET  READ_WRITE 
GO
