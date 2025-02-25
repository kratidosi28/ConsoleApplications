USE [master]
GO
/****** Object:  Database [ConsoleApplication3Db]    Script Date: 3/27/2020 11:16:19 AM ******/
CREATE DATABASE [ConsoleApplication3Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsoleApplication3Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleApplication3Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConsoleApplication3Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleApplication3Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConsoleApplication3Db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsoleApplication3Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsoleApplication3Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsoleApplication3Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsoleApplication3Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConsoleApplication3Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsoleApplication3Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET RECOVERY FULL 
GO
ALTER DATABASE [ConsoleApplication3Db] SET  MULTI_USER 
GO
ALTER DATABASE [ConsoleApplication3Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsoleApplication3Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsoleApplication3Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsoleApplication3Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConsoleApplication3Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConsoleApplication3Db', N'ON'
GO
ALTER DATABASE [ConsoleApplication3Db] SET QUERY_STORE = OFF
GO
USE [ConsoleApplication3Db]
GO
/****** Object:  Table [dbo].[ToysCategory]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToysCategory](
	[ToysCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ToysCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ToysCategory] PRIMARY KEY CLUSTERED 
(
	[ToysCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toys]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toys](
	[ToyId] [int] IDENTITY(1,1) NOT NULL,
	[ToyName] [varchar](50) NOT NULL,
	[ToyPrice] [varchar](50) NOT NULL,
	[ToyDescription] [varchar](50) NOT NULL,
	[ToyBrand] [varchar](50) NOT NULL,
	[ToysCategoryId] [int] NOT NULL,
	[PlantId] [int] NOT NULL,
 CONSTRAINT [PK_Toys] PRIMARY KEY CLUSTERED 
(
	[ToyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PlantId] [int] IDENTITY(1,1) NOT NULL,
	[PlantName] [varchar](50) NOT NULL,
	[PlantLocation] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Plants] PRIMARY KEY CLUSTERED 
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vToys]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vToys]
AS
SELECT dbo.Toys.ToyName, dbo.Toys.ToyPrice, dbo.Toys.ToyDescription, dbo.Toys.ToyBrand, dbo.ToysCategory.ToysCategoryName, dbo.Plants.PlantName, dbo.ToysCategory.ToysCategoryId, dbo.Toys.PlantId
FROM     dbo.Toys INNER JOIN
                  dbo.ToysCategory ON dbo.Toys.ToysCategoryId = dbo.ToysCategory.ToysCategoryId INNER JOIN
                  dbo.Plants ON dbo.Toys.PlantId = dbo.Plants.PlantId
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyEmailId] [varchar](50) NOT NULL,
	[CompanyLocation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddresses]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddresses](
	[CustomerAddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerAddress] [varchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[CustomerAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerMobileNumber] [varchar](50) NOT NULL,
	[CustomerEmail] [varchar](50) NOT NULL,
	[CustomerGender] [varchar](50) NOT NULL,
	[CustomerAge] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/27/2020 11:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[OrderTotalPrice] [int] NOT NULL,
	[CustomerAddressId] [int] NOT NULL,
	[ToyId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddresses_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddresses] CHECK CONSTRAINT [FK_CustomerAddresses_Customers]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_CustomerAddresses] FOREIGN KEY([CustomerAddressId])
REFERENCES [dbo].[CustomerAddresses] ([CustomerAddressId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_CustomerAddresses]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderDetails] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderDetails] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderDetails1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderDetails] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderDetails1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Toys] FOREIGN KEY([ToyId])
REFERENCES [dbo].[Toys] ([ToyId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Toys]
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_Companies]
GO
ALTER TABLE [dbo].[Toys]  WITH CHECK ADD  CONSTRAINT [FK_Toys_Plants] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([PlantId])
GO
ALTER TABLE [dbo].[Toys] CHECK CONSTRAINT [FK_Toys_Plants]
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
         Begin Table = "Toys"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ToysCategory"
            Begin Extent = 
               Top = 7
               Left = 294
               Bottom = 126
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plants"
            Begin Extent = 
               Top = 7
               Left = 567
               Bottom = 170
               Right = 761
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vToys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vToys'
GO
USE [master]
GO
ALTER DATABASE [ConsoleApplication3Db] SET  READ_WRITE 
GO
