USE [master]
GO
/****** Object:  Database [ConsoleApplication1Db]    Script Date: 3/24/2020 8:30:10 PM ******/
CREATE DATABASE [ConsoleApplication1Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsoleApplication1Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleApplication1Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConsoleApplication1Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleApplication1Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConsoleApplication1Db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsoleApplication1Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsoleApplication1Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsoleApplication1Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsoleApplication1Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConsoleApplication1Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsoleApplication1Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET RECOVERY FULL 
GO
ALTER DATABASE [ConsoleApplication1Db] SET  MULTI_USER 
GO
ALTER DATABASE [ConsoleApplication1Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsoleApplication1Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsoleApplication1Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsoleApplication1Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConsoleApplication1Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConsoleApplication1Db', N'ON'
GO
ALTER DATABASE [ConsoleApplication1Db] SET QUERY_STORE = OFF
GO
USE [ConsoleApplication1Db]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 3/24/2020 8:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[movieId] [int] IDENTITY(1,1) NOT NULL,
	[movieName] [varchar](max) NOT NULL,
	[movieReleaseYear] [int] NOT NULL,
	[movieLanguage] [varchar](50) NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[movieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 3/24/2020 8:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[actorId] [int] IDENTITY(1,1) NOT NULL,
	[actorName] [varchar](50) NOT NULL,
	[actorGender] [varchar](50) NOT NULL,
	[actorAge] [int] NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[actorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieCasting]    Script Date: 3/24/2020 8:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCasting](
	[movieCastingId] [int] IDENTITY(1,1) NOT NULL,
	[movieId] [int] NOT NULL,
	[actorId] [int] NOT NULL,
 CONSTRAINT [PK_MovieCasting] PRIMARY KEY CLUSTERED 
(
	[movieCastingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MovieCastingView]    Script Date: 3/24/2020 8:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MovieCastingView]
AS
SELECT dbo.MovieCasting.movieId, dbo.MovieCasting.movieCastingId, dbo.MovieCasting.actorId, dbo.Movies.movieName, dbo.Movies.movieReleaseYear, dbo.Actors.actorName, dbo.Actors.actorGender
FROM     dbo.MovieCasting INNER JOIN
                  dbo.Movies ON dbo.MovieCasting.movieId = dbo.Movies.movieId INNER JOIN
                  dbo.Actors ON dbo.MovieCasting.actorId = dbo.Actors.actorId
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/24/2020 8:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovieCasting]  WITH CHECK ADD  CONSTRAINT [FK_MovieCasting_Actors] FOREIGN KEY([actorId])
REFERENCES [dbo].[Actors] ([actorId])
GO
ALTER TABLE [dbo].[MovieCasting] CHECK CONSTRAINT [FK_MovieCasting_Actors]
GO
ALTER TABLE [dbo].[MovieCasting]  WITH CHECK ADD  CONSTRAINT [FK_MovieCasting_Movies] FOREIGN KEY([movieId])
REFERENCES [dbo].[Movies] ([movieId])
GO
ALTER TABLE [dbo].[MovieCasting] CHECK CONSTRAINT [FK_MovieCasting_Movies]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Categories]
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
         Begin Table = "MovieCasting"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 7
               Left = 294
               Bottom = 170
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Actors"
            Begin Extent = 
               Top = 7
               Left = 558
               Bottom = 170
               Right = 752
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MovieCastingView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MovieCastingView'
GO
USE [master]
GO
ALTER DATABASE [ConsoleApplication1Db] SET  READ_WRITE 
GO
