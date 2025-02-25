USE [master]
GO
/****** Object:  Database [ConsoleApplication2Db]    Script Date: 3/26/2020 1:26:11 PM ******/
CREATE DATABASE [ConsoleApplication2Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsoleApplication2Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleApplication2Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConsoleApplication2Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleApplication2Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConsoleApplication2Db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsoleApplication2Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsoleApplication2Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsoleApplication2Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsoleApplication2Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConsoleApplication2Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsoleApplication2Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET RECOVERY FULL 
GO
ALTER DATABASE [ConsoleApplication2Db] SET  MULTI_USER 
GO
ALTER DATABASE [ConsoleApplication2Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsoleApplication2Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsoleApplication2Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsoleApplication2Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConsoleApplication2Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConsoleApplication2Db', N'ON'
GO
ALTER DATABASE [ConsoleApplication2Db] SET QUERY_STORE = OFF
GO
USE [ConsoleApplication2Db]
GO
/****** Object:  Table [dbo].[specialist]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialist](
	[SpecialistId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialistIn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_specialist] PRIMARY KEY CLUSTERED 
(
	[SpecialistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[SpecialistId] [int] NOT NULL,
	[Experience] [varchar](50) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ConsultancyFees] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vDoctors]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDoctors]
AS
SELECT dbo.Doctors.DoctorName, dbo.Doctors.Experience, dbo.Doctors.Email, dbo.Doctors.ConsultancyFees, dbo.Doctors.Address, dbo.Doctors.MobileNumber, dbo.specialist.SpecialistIn, dbo.Doctors.DoctorId
FROM     dbo.Doctors INNER JOIN
                  dbo.specialist ON dbo.Doctors.SpecialistId = dbo.specialist.SpecialistId
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[PatientAge] [int] NOT NULL,
	[PatientGender] [varchar](50) NOT NULL,
	[PatientDisease] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorSubscriptions]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSubscriptions](
	[DoctorSubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineId] [int] NOT NULL,
	[AppointmentId] [int] NOT NULL,
 CONSTRAINT [PK_DoctorSubscriptions] PRIMARY KEY CLUSTERED 
(
	[DoctorSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[AppointmentTime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vsubscription]    Script Date: 3/26/2020 1:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vsubscription]
AS
SELECT dbo.DoctorSubscriptions.DoctorSubscriptionId, dbo.Medicines.MedicineName, dbo.DoctorSubscriptions.AppointmentId, dbo.Doctors.DoctorName, dbo.Patients.PatientName
FROM     dbo.Medicines INNER JOIN
                  dbo.DoctorSubscriptions ON dbo.Medicines.MedicineId = dbo.DoctorSubscriptions.MedicineId INNER JOIN
                  dbo.Appointments ON dbo.DoctorSubscriptions.AppointmentId = dbo.Appointments.AppointmentId INNER JOIN
                  dbo.Doctors ON dbo.Appointments.DoctorId = dbo.Doctors.DoctorId INNER JOIN
                  dbo.Patients ON dbo.Appointments.PatientId = dbo.Patients.PatientId
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_specialist] FOREIGN KEY([SpecialistId])
REFERENCES [dbo].[specialist] ([SpecialistId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_specialist]
GO
ALTER TABLE [dbo].[DoctorSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_DoctorSubscriptions_Appointments] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[DoctorSubscriptions] CHECK CONSTRAINT [FK_DoctorSubscriptions_Appointments]
GO
ALTER TABLE [dbo].[DoctorSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_DoctorSubscriptions_Medicines] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([MedicineId])
GO
ALTER TABLE [dbo].[DoctorSubscriptions] CHECK CONSTRAINT [FK_DoctorSubscriptions_Medicines]
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
         Begin Table = "specialist"
            Begin Extent = 
               Top = 7
               Left = 299
               Bottom = 126
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 251
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vDoctors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vDoctors'
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
         Begin Table = "Medicines"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Appointments"
            Begin Extent = 
               Top = 7
               Left = 292
               Bottom = 170
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DoctorSubscriptions"
            Begin Extent = 
               Top = 7
               Left = 556
               Bottom = 148
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 7
               Left = 840
               Bottom = 170
               Right = 1043
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 7
               Left = 1091
               Bottom = 170
               Right = 1285
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
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vsubscription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vsubscription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vsubscription'
GO
USE [master]
GO
ALTER DATABASE [ConsoleApplication2Db] SET  READ_WRITE 
GO
