USE [master]
GO
/****** Object:  Database [LogicUniversity]    Script Date: 05-Feb-17 3:17:32 PM ******/
CREATE DATABASE [LogicUniversity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogicUniversity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LogicUniversity.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LogicUniversity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LogicUniversity_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Logic] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Logic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogicUniversity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogicUniversity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogicUniversity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogicUniversity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogicUniversity] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogicUniversity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LogicUniversity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogicUniversity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogicUniversity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogicUniversity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogicUniversity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogicUniversity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogicUniversity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogicUniversity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogicUniversity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LogicUniversity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogicUniversity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogicUniversity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogicUniversity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogicUniversity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogicUniversity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LogicUniversity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogicUniversity] SET RECOVERY FULL 
GO
ALTER DATABASE [LogicUniversity] SET  MULTI_USER 
GO
ALTER DATABASE [LogicUniversity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogicUniversity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogicUniversity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogicUniversity] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LogicUniversity] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LogicUniversity', N'ON'
GO
USE [LogicUniversity]
GO
/****** Object:  User [NT AUTHORITY\LOCAL SERVICE]    Script Date: 05-Feb-17 3:17:32 PM ******/
CREATE USER [NT AUTHORITY\LOCAL SERVICE] FOR LOGIN [NT AUTHORITY\LOCAL SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\LOCAL SERVICE]
GO
/****** Object:  Table [dbo].[Adjustment]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adjustment](
	[VoucherNo] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[ConfirmedBy] [varchar](150) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_AdjustmentItem] PRIMARY KEY CLUSTERED 
(
	[VoucherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_CategoryName] PRIMARY KEY CLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CollectionPoint]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CollectionPoint](
	[CollectionPointName] [varchar](500) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CollectionPoint] PRIMARY KEY CLUSTERED 
(
	[CollectionPointName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](150) NOT NULL,
	[ContactName] [varchar](150) NULL,
	[Phone] [int] NULL,
	[Fax] [int] NULL,
	[HeadName] [varchar](150) NULL,
	[CollectionPointName] [varchar](500) NULL,
	[CollectionTime] [varchar](50) NULL,
	[Representative] [varchar](150) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[ReorderLevel] [int] NULL,
	[ReorderQty] [int] NULL,
	[UnitOfMeasure] [varchar](50) NULL,
	[CurrentQty] [int] NULL,
	[CategoryName] [varchar](150) NOT NULL,
	[Price] [float] NULL,
	[Bin] [varchar](10) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemAdjustment]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemAdjustment](
	[VoucherNo] [varchar](50) NOT NULL,
	[ItemID] [varchar](50) NOT NULL,
	[AdjustedQty] [int] NULL,
	[Reason] [varchar](500) NULL,
	[AdjsutmentStatus] [varchar](50) NULL,
 CONSTRAINT [PK_ItemAdjustment] PRIMARY KEY CLUSTERED 
(
	[VoucherNo] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseItem]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseItem](
	[PONo] [varchar](50) NOT NULL,
	[ItemID] [varchar](50) NOT NULL,
	[Qty] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_PurchaseItem] PRIMARY KEY CLUSTERED 
(
	[PONo] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PONo] [varchar](50) NOT NULL,
	[PODate] [date] NULL,
	[SupplierID] [varchar](50) NOT NULL,
	[DeliveryDate] [date] NULL,
	[DONo] [varchar](50) NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PONo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Requisition]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Requisition](
	[RequisitionID] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Requisition] PRIMARY KEY CLUSTERED 
(
	[RequisitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequisitionItem]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequisitionItem](
	[RequisitionID] [varchar](50) NOT NULL,
	[ItemID] [varchar](50) NOT NULL,
	[RequiredQty] [int] NULL,
	[FulfilledQty] [int] NULL,
	[FulfilledStatus] [varchar](50) NULL,
	[AllocatedQty] [int] NULL,
	[DeliveredQty] [int] NULL,
 CONSTRAINT [PK_RequisitionItem] PRIMARY KEY CLUSTERED 
(
	[RequisitionID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [varchar](50) NOT NULL,
	[SupplierName] [varchar](150) NULL,
	[ContactName] [varchar](150) NULL,
	[Phone] [int] NULL,
	[Fax] [int] NULL,
	[Address] [varchar](500) NULL,
	[GSTNo] [varchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierItem]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierItem](
	[ItemID] [varchar](50) NOT NULL,
	[SupplierID] [varchar](50) NOT NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_SupplierItem] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 05-Feb-17 3:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[RoleName] [varchar](150) NOT NULL,
	[Email] [varchar](150) NULL,
	[Phone] [int] NULL,
	[DepartmentID] [varchar](50) NOT NULL,
	[Whatsapp] [int] NULL,
	[Photo] [image] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000001', N'S001', CAST(N'2016-10-12' AS Date), N'Mr Kiong Jian', N'Approved')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000002', N'S001', CAST(N'2016-11-15' AS Date), N'Mr Kiong Jian', N'Approved')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000003', N'U001', CAST(N'2017-01-26' AS Date), N'U002', N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000004', N'S001', CAST(N'2017-01-31' AS Date), N'U002', N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000005', N'S001', CAST(N'2017-01-31' AS Date), N'U002', N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000006', N'S001', CAST(N'2017-01-17' AS Date), NULL, N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000007', N'S004', CAST(N'2017-01-31' AS Date), NULL, N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000008', N'S005', CAST(N'2017-01-23' AS Date), NULL, N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000009', N'S005', CAST(N'2017-01-24' AS Date), NULL, N'Pending')
INSERT [dbo].[Adjustment] ([VoucherNo], [UserID], [Date], [ConfirmedBy], [Status]) VALUES (N'10000010', N'S004', CAST(N'2017-01-25' AS Date), NULL, N'Pending')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Clip')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Envelope')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Eraser')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Exercise')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'File')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Pad')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Paper')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Pen')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Puncher')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Ruler')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Scissors')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Sharpener')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Shorthand')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Stapler')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Tacks')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Tape')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Tparency')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Tray')
INSERT [dbo].[CollectionPoint] ([CollectionPointName], [UserID]) VALUES (N'Administration Building', N'S001')
INSERT [dbo].[CollectionPoint] ([CollectionPointName], [UserID]) VALUES (N'Engineering School', N'S004')
INSERT [dbo].[CollectionPoint] ([CollectionPointName], [UserID]) VALUES (N'Management School', N'S001')
INSERT [dbo].[CollectionPoint] ([CollectionPointName], [UserID]) VALUES (N'Medical School', N'S004')
INSERT [dbo].[CollectionPoint] ([CollectionPointName], [UserID]) VALUES (N'Science School', N'S005')
INSERT [dbo].[CollectionPoint] ([CollectionPointName], [UserID]) VALUES (N'University Hospital ', N'S005')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'BIOL', N'Biology Department', N'Mr Lenny Ng', 8903499, 8934232, N'Prof Esther', N'University Hospital', N'9:30 AM', N'')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'BIZM', N'Business Management Department', N'Mr Kyaw Kyaw Aung', 8934543, 8934543, N'Prof Kyaw', N'Administration Building', N'11:00AM', NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'COMM', N'Commerce Department', N'Mr Mohd. Azman', 8741284, 8921256, N'Dr. Chia Leow Bee', N'Administration Building', N'9:30 AM', N'')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'CPSC', N'Computer Science', N'Mr Wee Kian Fatt', 8901235, 8921457, N'Dr. Soh Kian Wee', N'Science School', N'9:30 AM', NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'ENGL', N'English Department', N'Mrs Pamela Kow', 8742234, 8921456, N'Prof Ezra Pound', N'Management School', N'11:00 AM', NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'ENGR', N'Engineering Department', N'Mr Peter Tan Ah Meng', 8901266, 8921465, N'Prof Tan', N'Engineering School', N'9:30 AM', N'ada')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'REGR', N'Registrar Department', N'Mr Helen Ho', 8901266, 8921465, N'Mrs Low Kway Boo', N'Medical School', N'11:00 AM', NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ContactName], [Phone], [Fax], [HeadName], [CollectionPointName], [CollectionTime], [Representative]) VALUES (N'STORE', N'Stationery Store', N'Ms Esther Tan', 99099123, 99099123, N'Mr Henry Ng', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'C001', N'Clips Double 1''''', 50, 35, N'Dozen', 40, N'Clip', 0.4, N'A1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'C002', N'Clips Double 2''''', 50, 30, N'Dozen', 44, N'Clip', 0.39, N'A2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'C003', N'Clips Double 3/4''''', 50, 30, N'Dozen', 45, N'Clip', 0.9, N'A3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'C004', N'Clpis Paper Large', 50, 30, N'Box', 78, N'Clip', 1, N'A4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'C005', N'Clpis Paper Medium', 50, 30, N'Box', 65, N'Clip', 0.8, N'A5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'C006', N'Clpis Paper Small', 50, 30, N'Box', 56, N'Clip', 0.87, N'A6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E001', N'Envelope Brown (3''''*6'''')', 600, 400, N'Each', 678, N'Envelope', 0.5, N'B1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E002', N'Envelope Brown (3''''*6'''') w/Window', 600, 400, N'Each', 786, N'Envelope', 0.55, N'B2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E003', N'Envelope Brown (5''''*7'''')', 600, 400, N'Each', 677, N'Envelope', 0.6, N'B3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E004', N'Envelope Brown (5''''*7'''') w/Window', 600, 400, N'Each', 588, N'Envelope', 0.67, N'B4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E005', N'Envelope White (3''''*6'''')', 600, 400, N'Each', 456, N'Envelope', 0.67, N'B5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E006', N'Envelope White (3''''*6'''') w/Window', 600, 400, N'Each', 564, N'Envelope', 1.2, N'B6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E007', N'Envelope White (5''''*7'''')', 600, 400, N'Each', 623, N'Envelope', 0.6, N'C1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E008', N'Envelope White (5''''*7'''') w/Window', 600, 400, N'Each', 645, N'Envelope', 1.1, N'C2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E020', N'Eraser (Hard)', 50, 20, N'Each', 67, N'Eraser', 0.3, N'C3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E021', N'Eraser (Soft)', 50, 20, N'Each', 78, N'Eraser', 0.5, N'C4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E030', N'Exercise Book (100 pg)', 100, 50, N'Each', 56, N'Exercise', 5, N'C5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E031', N'Exercise Book (120 pg)', 100, 50, N'Each', 123, N'Exercise', 2.5, N'C6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E032', N'Exercise Book A4 Hardcover (100 pg)', 100, 50, N'Each', 167, N'Exercise', 3.3, N'D1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E033', N'Exercise Book A4 Hardcover (120 pg)', 100, 50, N'Each', 178, N'Exercise', 5, N'D2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E034', N'Exercise Book A4 Hardcover (200 pg)', 100, 50, N'Each', 134, N'Exercise', 5.5, N'D3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E035', N'Exercise Book Hardcover (100 pg)', 100, 50, N'Each', 109, N'Exercise', 5.5, N'D4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'E036', N'Exercise Book Hardcover (120 pg)', 100, 50, N'Each', 180, N'Exercise', 6.3, N'D5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F020', N'File Separator', 100, 50, N'Set', 107, N'File', 3.2, N'D6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F021', N'File-Blue Plain', 200, 100, N'Each', 209, N'File', 4.5, N'E1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F022', N'File-Blue with Logo', 200, 100, N'Each', 212, N'File', 4, N'E2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F023', N'File-Brown w/o Logo', 200, 150, N'Each', 234, N'File', 4.5, N'E3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F024', N'File-Brown with Logo', 200, 150, N'Each', 235, N'File', 4.5, N'E4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F031', N'Folder Plastic Blue', 200, 150, N'Each', 266, N'File', 7.1, N'E5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F032', N'Folder Plastic Clear', 200, 150, N'Each', 272, N'File', 7.1, N'E6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F033', N'Folder Plastic Green', 200, 150, N'Each', 245, N'File', 7.1, N'F1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F034', N'Folder Plastic Pink', 200, 150, N'Each', 287, N'File', 7.5, N'F2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'F035', N'Folder Plastic Yellow', 200, 150, N'Each', 189, N'File', 7, N'F3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H011', N'Highlighter Blue', 100, 80, N'Box', 198, N'Pen', 2.4, N'F4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H012', N'Highlighter Green', 100, 80, N'Box', 187, N'Pen', 2.6, N'F5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H013', N'Highlighter Pink', 100, 80, N'Box', 167, N'Pen', 2.4, N'F6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H014', N'Highlighter Yellow', 100, 80, N'Box', 178, N'Pen', 2.5, N'G1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H031', N'Hole Puncher 2 holes', 50, 20, N'Each', 67, N'Puncher', 10.2, N'G2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H032', N'Hole Puncher 3 holes', 50, 20, N'Each', 67, N'Puncher', 10.2, N'G3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'H033', N'Hole Puncher Adjustable', 50, 20, N'Each', 45, N'Puncher', 10.2, N'G4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P010', N'Pad Postit Memo 1''''*2''''', 100, 60, N'Packet', 145, N'Pad', 6.6, N'G5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P011', N'Pad Postit Memo 1/2''''*1''''', 100, 60, N'Packet', 156, N'Pad', 6.6, N'G6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P012', N'Pad Postit Memo 1/2''''*2''''', 100, 60, N'Packet', 176, N'Pad', 6.6, N'H1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P013', N'Pad Postit Memo 2''''*3''''', 100, 60, N'Packet', 143, N'Pad', 6.5, N'H2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P014', N'Pad Postit Memo 2''''*4''''', 100, 60, N'Packet', 198, N'Pad', 6.5, N'H3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P015', N'Pad Postit Memo 2''''*4''''', 100, 60, N'Packet', 187, N'Pad', 6.6, N'H4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P016', N'Pad Postit Memo 3/4''''*2''''', 100, 60, N'Packet', 214, N'Pad', 6.6, N'H5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P020', N'Paper Photostat A3', 500, 500, N'Box', 675, N'Paper', 12.2, N'H6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P021', N'Paper Photostat A4', 500, 500, N'Box', 567, N'Paper', 12.2, N'I1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P030', N'Pen Ballpoint Black', 100, 50, N'Dozen', 153, N'Pen', 3.5, N'I2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P031', N'Pen Ballpoint Blue', 100, 50, N'Dozen', 187, N'Pen', 3.5, N'I3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P032', N'Pen Ballpoint Red', 100, 50, N'Dozen', 247, N'Pen', 3.5, N'I4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P033', N'Pen Felt Tip Black', 100, 50, N'Dozen', 187, N'Pen', 3.5, N'I5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P034', N'Pen Felt Tip Blue', 100, 50, N'Dozen', 198, N'Pen', 3.5, N'I6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P035', N'Pen Felt Tip Red', 100, 50, N'Dozen', 109, N'Pen', 3.5, N'J1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P036', N'Pen Transparency Permanent', 100, 50, N'Packet', 154, N'Pen', 4, N'J2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P037', N'Pen Transparency Soluble', 100, 50, N'Packet', 165, N'Pen', 4.4, N'J3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P038', N'Pen Whiteboard Marker Black', 100, 50, N'Box', 187, N'Pen', 4.8, N'J4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P039', N'Pen Whiteboard Marker Blue', 100, 50, N'Box', 165, N'Pen', 5, N'J5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P040', N'Pen Whiteboard Marker Green', 100, 50, N'Box', 198, N'Pen', 5, N'J6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P041', N'Pen Whiteboard Marker Red', 100, 50, N'Box', 108, N'Pen', 5, N'K1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P042', N'Pencil 2B', 100, 50, N'Dozen', 105, N'Pen', 3.3, N'K2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P043', N'Pencil 2B with Eraser End', 100, 50, N'Dozen', 198, N'Pen', 3.6, N'K3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P044', N'Pencil 4H', 100, 50, N'Dozen', 165, N'Pen', 4.1, N'K4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P045', N'Pencil B', 100, 50, N'Dozen', 183, N'Pen', 5.1, N'K5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'P046', N'Pencil 2B with Eraser End', 100, 50, N'Dozen', 191, N'Pen', 5.1, N'K6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'R001', N'Ruler 6''''', 50, 20, N'Dozen', 87, N'Ruler', 10.5, N'L1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'R002', N'Ruler 12''''', 50, 20, N'Dozen', 54, N'Ruler', 10, N'L2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S010', N'Shorthand Book (100 pg)', 100, 80, N'Each', 23, N'Shorthand', 15, N'L3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S011', N'Shorthand Book (120 pg)', 100, 80, N'Each', 54, N'Shorthand', 15, N'L4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S012', N'Shorthand Book (80 pg)', 100, 80, N'Each', 12, N'Shorthand', 15, N'L5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S020', N'Stapler No. 28', 50, 20, N'Each', 98, N'Stapler', 8, N'L6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S021', N'Stapler No. 36', 50, 20, N'Each', 15, N'Stapler', 8.5, N'M1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S022', N'Stapler No. 28', 50, 20, N'Box', 59, N'Stapler', 8, N'M2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S023', N'Stapler No. 36', 50, 20, N'Box', 89, N'Stapler', 8.5, N'M3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S040', N'Scotch Tape', 50, 20, N'Each', 23, N'Tape', 12, N'M4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S041', N'Scotch Tape Dispenser', 50, 20, N'Each', 89, N'Tape', 12.5, N'M5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S100', N'Scissors', 50, 20, N'Each', 56, N'Scissors', 15, N'M6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'S101', N'Sharpener', 50, 20, N'Each', 78, N'Sharpener', 4.5, N'N1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T001', N'Thumb Tacks Large', 10, 10, N'Box', 14, N'Tacks', 2, N'N2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T002', N'Thumb Tacks Medium', 10, 10, N'Box', 24, N'Tacks', 2, N'N3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T003', N'Thumb Tacks Small', 10, 10, N'Box', 17, N'Tacks', 5, N'N4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T020', N'Transparency Blue', 100, 200, N'Box', 243, N'Tparency', 10, N'N5')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T021', N'Transparency Clear', 500, 400, N'Box', 768, N'Tparency', 10, N'N6')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T022', N'Transparency Green', 100, 200, N'Box', 167, N'Tparency', 10, N'O1')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T023', N'Transparency Red', 100, 200, N'Box', 197, N'Tparency', 10, N'O2')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T024', N'Transparency Reverse Blue', 100, 200, N'Box', 135, N'Tparency', 10.5, N'O3')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T025', N'Transparency Cover 3M', 500, 400, N'Box', 512, N'Tparency', 10.5, N'O4')
INSERT [dbo].[Item] ([ItemID], [Description], [ReorderLevel], [ReorderQty], [UnitOfMeasure], [CurrentQty], [CategoryName], [Price], [Bin]) VALUES (N'T100', N'Trays In/Out', 20, 10, N'Set', 37, N'Tray', 13, N'O5')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000001', N'F032', 5, N'Logo Lost', N'Approved')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000002', N'P032', 4, N'Ink doesn''t come put', N'Approved')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000003', N'E001', 1, N'Tear mark at the corner', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000004', N'E031', 1, N'Damage by Rain', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000005', N'H013', 2, N'Damaged', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000006', N'S011', 25, N'Lost', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000007', N'T100', 30, N'Lost', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000008', N'E021', 10, N'Damaged', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000009', N'C005', 9, N'Damaged ', N'Pending')
INSERT [dbo].[ItemAdjustment] ([VoucherNo], [ItemID], [AdjustedQty], [Reason], [AdjsutmentStatus]) VALUES (N'10000010', N'E034', 6, N'Damaged', N'Pending')
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10001', N'C001', 50, 0.4)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10002', N'C002', 50, 0.39)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10003', N'C005', 50, 1)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10004', N'C004', 50, 1.2)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10005', N'C001', 50, 0.4)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10009', N'C003', 30, 0.45)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10010', N'C003', 30, 0.45)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10011', N'C003', 70, 0.45)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10012', N'C003', 20, 0.45)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10013', N'C003', 30, 0.45)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10014', N'C003', 30, 0.45)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10015', N'S040', 50, 12)
INSERT [dbo].[PurchaseItem] ([PONo], [ItemID], [Qty], [Price]) VALUES (N'10016', N'S021', 50, 8.5)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10001', CAST(N'2016-10-02' AS Date), N'ALPA', CAST(N'2016-10-05' AS Date), N'DO83942')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10002', CAST(N'2016-10-03' AS Date), N'BANES', CAST(N'2016-10-06' AS Date), N'DO83494')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10003', CAST(N'2016-10-09' AS Date), N'EARTH', CAST(N'2016-10-12' AS Date), N'DO89421')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10004', CAST(N'2016-10-11' AS Date), N'GREEN', CAST(N'2016-10-14' AS Date), N'DO48392')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10005', CAST(N'2016-10-10' AS Date), N'ALPA', CAST(N'2016-10-13' AS Date), N'DO48731')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10006', CAST(N'2016-10-13' AS Date), N'BANES', CAST(N'2016-10-16' AS Date), N'DO34033')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10007', CAST(N'2016-10-12' AS Date), N'ALPA', CAST(N'2016-10-12' AS Date), N'DO83923')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10008', CAST(N'2016-10-04' AS Date), N'WHIT', CAST(N'2016-10-21' AS Date), N'DO89430')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10009', CAST(N'2017-01-26' AS Date), N'ALPA', CAST(N'2017-01-26' AS Date), N'DO90763')
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10010', CAST(N'2017-01-26' AS Date), N'ALPA', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10011', CAST(N'2017-01-26' AS Date), N'ALPA', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10012', CAST(N'2017-01-26' AS Date), N'ALPA', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10013', CAST(N'2017-01-31' AS Date), N'ALPA', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10014', CAST(N'2017-01-31' AS Date), N'BANES', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10015', CAST(N'2017-01-16' AS Date), N'GREEN', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PONo], [PODate], [SupplierID], [DeliveryDate], [DONo]) VALUES (N'10016', CAST(N'2017-01-17' AS Date), N'ALPA', NULL, NULL)
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10001', N'D001', CAST(N'2016-10-03' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10002', N'D001', CAST(N'2016-10-05' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10003', N'D003', CAST(N'2016-10-12' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10004', N'D005', CAST(N'2016-10-15' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10005', N'D007', CAST(N'2016-10-16' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10006', N'D003', CAST(N'2016-10-16' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10007', N'D005', CAST(N'2016-10-17' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10008', N'D007', CAST(N'2016-10-14' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10009', N'D001', CAST(N'2016-10-21' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10010', N'D003', CAST(N'2016-10-22' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10011', N'D005', CAST(N'2016-10-22' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10012', N'D005', CAST(N'2016-11-02' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10013', N'D001', CAST(N'2016-11-03' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10014', N'D005', CAST(N'2016-11-05' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10015', N'D018', CAST(N'2016-10-23' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10016', N'D018', CAST(N'2016-11-06' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10017', N'D017', CAST(N'2016-10-29' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10018', N'D017', CAST(N'2016-11-30' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10019', N'D002', CAST(N'2017-01-30' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10020', N'D003', CAST(N'2017-01-31' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10021', N'D025', CAST(N'2016-11-17' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10022', N'D024', CAST(N'2016-10-10' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10023', N'D018', CAST(N'2016-10-10' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10024', N'D013', CAST(N'2016-10-17' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10025', N'D016', CAST(N'2016-10-11' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10026', N'D002', CAST(N'2016-11-07' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10027', N'D003', CAST(N'2016-11-08' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10028', N'D010', CAST(N'2016-11-09' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10029', N'D028', CAST(N'2016-11-06' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10030', N'D030', CAST(N'2016-11-06' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10031', N'D029', CAST(N'2016-11-07' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10032', N'D033', CAST(N'2016-11-13' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10033', N'D035', CAST(N'2016-11-20' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10034', N'D015', CAST(N'2016-11-21' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10035', N'D016', CAST(N'2016-11-22' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10036', N'D018', CAST(N'2016-11-27' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10037', N'D011', CAST(N'2016-11-27' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10038', N'D003', CAST(N'2016-11-28' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10039', N'D019', CAST(N'2016-11-28' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10040', N'D002', CAST(N'2016-12-01' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10041', N'D003', CAST(N'2016-12-02' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10042', N'D005', CAST(N'2016-12-05' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10043', N'D007', CAST(N'2016-12-06' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10044', N'D009', CAST(N'2016-12-07' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10045', N'D011', CAST(N'2016-12-12' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10046', N'D031', CAST(N'2016-12-05' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10047', N'D025', CAST(N'2016-12-19' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10048', N'D031', CAST(N'2016-12-02' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10049', N'D028', CAST(N'2016-12-27' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10050', N'D033', CAST(N'2016-12-21' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10051', N'D002', CAST(N'2017-01-02' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10052', N'D005', CAST(N'2017-01-03' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10053', N'D009', CAST(N'2017-01-09' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10054', N'D011', CAST(N'2017-01-10' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10055', N'D014', CAST(N'2017-01-11' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10056', N'D017', CAST(N'2017-01-16' AS Date), N'Approved')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10057', N'D034', CAST(N'2017-01-30' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10058', N'D026', CAST(N'2017-01-31' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10059', N'D002', CAST(N'2017-01-30' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10060', N'D009', CAST(N'2017-02-01' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10061', N'D019', CAST(N'2017-02-01' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10062', N'D016', CAST(N'2017-01-30' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10063', N'D007', CAST(N'2017-01-31' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10064', N'D011', CAST(N'2016-01-30' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10065', N'D018', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10066', N'D031', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10067', N'D022', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10068', N'D013', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10069', N'D014', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10070', N'D015', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10071', N'D016', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10072', N'D017', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10073', N'D018', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10074', N'D019', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10075', N'D020', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10076', N'D021', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10077', N'D021', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10078', N'D022', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10079', N'D023', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10080', N'D024', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10081', N'D025', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10082', N'D028', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10083', N'D029', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10084', N'D030', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10085', N'D031', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10086', N'D032', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10087', N'D034', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10088', N'D035', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10089', N'D034', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10090', N'D033', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10091', N'D032', CAST(N'2017-01-16' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10092', N'D031', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10093', N'D030', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10094', N'D029', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10095', N'D028', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10096', N'D025', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10097', N'D024', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10098', N'D023', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10099', N'D022', CAST(N'2017-01-17' AS Date), N'Pending')
INSERT [dbo].[Requisition] ([RequisitionID], [UserID], [Date], [Status]) VALUES (N'10100', N'D021', CAST(N'2017-01-17' AS Date), N'Pending')
GO
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10001', N'C001', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10001', N'C002', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10001', N'E001', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10001', N'P031', 8, 8, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10001', N'P032', 4, 4, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10002', N'E002', 4, 4, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10002', N'S040', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10003', N'S100', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10004', N'P045', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10004', N'P046', 6, 6, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10005', N'E001', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10005', N'R001', 15, 15, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10005', N'S022', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10006', N'E004', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10006', N'F022', 20, 20, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10007', N'F023', 20, 20, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10008', N'E035', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10008', N'E036', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10009', N'P032', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10010', N'F023', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10011', N'T002', 15, 15, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10012', N'P032', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10013', N'C001', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10013', N'T002', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10014', N'F023', 8, 8, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10015', N'C001', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10015', N'E001', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10016', N'C001', 12, 12, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10017', N'C001', 28, 28, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10018', N'C001', 15, 15, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10019', N'H012', 1, 0, N'Pending', 0, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10020', N'C001', 15, 0, N'Pending', 0, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10021', N'P036', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10021', N'T020', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10021', N'T100', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10022', N'P034', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10022', N'P035', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10022', N'P036', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10023', N'P010', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10023', N'P034', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10023', N'P041', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10024', N'R002', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10024', N'S010', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10025', N'H012', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10025', N'P032', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10025', N'S020', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10026', N'C001', 4, 4, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10027', N'F031', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10027', N'P031', 20, 20, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10028', N'T100', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10029', N'P040', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10029', N'S023', 4, 4, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10030', N'E033', 9, 9, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10030', N'P032', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10031', N'C003', 18, 18, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10032', N'E020', 8, 8, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10033', N'F020', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10034', N'C006', 7, 7, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10034', N'P031', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10035', N'E032', 4, 4, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10035', N'T023', 21, 21, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10036', N'P040', 9, 9, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10037', N'P044', 6, 6, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10038', N'T023', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10039', N'P021', 6, 6, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10040', N'H011', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10040', N'P036', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10041', N'F031', 22, 22, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10041', N'P021', 11, 11, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10042', N'H033', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10042', N'R001', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10043', N'C002', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10043', N'E033', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10043', N'P010', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10044', N'C005', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10045', N'E036', 30, 30, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10046', N'F020', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10046', N'F021', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10046', N'F022', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10047', N'E007', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10048', N'C004', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10048', N'C005', 10, 10, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10049', N'E021', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10050', N'C001', 15, 15, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10050', N'F020', 6, 6, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10051', N'E032', 5, 5, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10051', N'R002', 4, 4, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10052', N'F022', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10053', N'P021', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10053', N'S101', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10054', N'H033', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10054', N'T001', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10055', N'P030', 1, 1, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10055', N'P031', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10055', N'P032', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10056', N'E020', 3, 3, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10056', N'P036', 2, 2, N'Fulfilled', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10057', N'F024', 2, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10058', N'P012', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10059', N'E031', 12, 0, N'Pending', NULL, NULL)
GO
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10060', N'C002', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10060', N'P033', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10061', N'E033', 4, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10062', N'T023', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10063', N'P037', 9, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10064', N'F024', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10065', N'H031', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10066', N'P021', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10067', N'C002', 19, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10068', N'C001', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10069', N'C003', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10070', N'E020', 6, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10071', N'E021', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10072', N'P032', 20, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10073', N'T100', 8, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10074', N'E034', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10075', N'E032', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10076', N'R001', 6, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10077', N'R002', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10078', N'E031', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10079', N'C002', 15, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10080', N'C004', 12, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10081', N'C002', 8, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10082', N'P044', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10083', N'P045', 12, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10084', N'P030', 9, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10085', N'P020', 20, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10086', N'P021', 24, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10087', N'E020', 7, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10088', N'C004', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10089', N'P016', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10090', N'P015', 5, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10091', N'H013', 8, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10092', N'H012', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10093', N'H011', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10094', N'F020', 3, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10095', N'F021', 4, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10096', N'E036', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10097', N'E035', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10098', N'E007', 15, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10099', N'E006', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[RequisitionItem] ([RequisitionID], [ItemID], [RequiredQty], [FulfilledQty], [FulfilledStatus], [AllocatedQty], [DeliveredQty]) VALUES (N'10100', N'C003', 10, 0, N'Pending', NULL, NULL)
INSERT [dbo].[Role] ([RoleName]) VALUES (N'Department Head')
INSERT [dbo].[Role] ([RoleName]) VALUES (N'Department Representative')
INSERT [dbo].[Role] ([RoleName]) VALUES (N'Department Staff')
INSERT [dbo].[Role] ([RoleName]) VALUES (N'Store Clerk')
INSERT [dbo].[Role] ([RoleName]) VALUES (N'Store Manager')
INSERT [dbo].[Role] ([RoleName]) VALUES (N'Store Supervisor')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'ALPA', N'ALPHA Office Supplies', N'Ms Irene Tan', 4619928, 4612238, N'Blk 1128,  Ang Mo Kio Industrial Park #02-1108 Ang Mo Kio Street 62 Singapore 622262', N'MR-8500440-2')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'BANES', N'BANES Shop', N'Mr Loh Ah Pek', 4781234, 4792434, N'Blk 124, Alexandra Road #03-04 Banes Building Singapore 550315', N'MR-8200420-2')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'CHEP', N'Cheap Stationer', N'Mr Soh Kway Koh', 3453234, 4742434, N'Blk 34,  Clementi Road #07-02 Ban Ban Soh Building Singapore 110525', N'Nil')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'EARTH', N'EARTH Office Supplies', N'Ms Cynthia Toy', 8934233, 8934235, N'Blk 31 Woodlands Street 18, #10-11', N'MR-8550532-1')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'GREEN', N'GREENERY Stationery Store', N'Mr Kenny Teh', 9834232, 9834234, N'Blk 496 Clementi Street 36, #05-24', N'MR-8550023-2')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'MPRL', N'MPRL Stationery Store', N'Ms Sarah Foo', 2199949, 3199949, N'Blk 34 Boon Lay Street 14, #13-05', N'MR-8550002-1')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'OFUN', N'Offices and Universities Stationer', N'Ms Anne Ooi Wai Ling', 9908901, 9908902, N'Blk 322 Woodlands Street 77, #10-12', N'Nil')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'OMEG', N'OMEGA Stationery Supplier', N'Mr Ronnie Ho', 7671233, 7671234, N'Blk 11, Hillview Avenue #03-04, Singapore 679036', N'MR-8555330-1')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'SHRT', N'SHRT Staioner', N'Mr Chris Peh Jia Shuo', 2343543, 2343540, N'18 Sengkang View, #12-40', N'MR-8500012-2')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'SSC', N'Student Stationery Club', N'Mr John Kerry', 9878345, 9878453, N'BLK', N'MR-8500440-1')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [ContactName], [Phone], [Fax], [Address], [GSTNo]) VALUES (N'WHIT', N'WHITESTAR Stationery Store', N'Mr Tan Ah Ng', 8934232, 8934233, N'Blk 372 Bukit Merah Street 38, #05-15', N'Nil')
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C001', N'ALPA', 0.4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C002', N'ALPA', 0.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C003', N'ALPA', 0.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C004', N'ALPA', 1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C005', N'ALPA', 0.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C006', N'ALPA', 1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E001', N'ALPA', 0.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E006', N'ALPA', 1.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E007', N'ALPA', 0.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E020', N'ALPA', 0.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E031', N'ALPA', 3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E034', N'ALPA', 6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E035', N'ALPA', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E036', N'ALPA', 6.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F023', N'ALPA', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F024', N'ALPA', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F034', N'ALPA', 8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H011', N'ALPA', 2.4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H012', N'ALPA', 2.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H013', N'ALPA', 2.4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H014', N'ALPA', 2.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P010', N'ALPA', 6.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P011', N'ALPA', 6.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P014', N'ALPA', 6.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P015', N'ALPA', 6.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P020', N'ALPA', 13)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P030', N'ALPA', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P031', N'ALPA', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P032', N'ALPA', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P033', N'ALPA', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P034', N'ALPA', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P038', N'ALPA', 4.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P039', N'ALPA', 5.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P040', N'ALPA', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P041', N'ALPA', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P046', N'ALPA', 5.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'R001', N'ALPA', 10.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'R002', N'ALPA', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S010', N'ALPA', 16)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S011', N'ALPA', 15)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S012', N'ALPA', 15)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S020', N'ALPA', 8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S021', N'ALPA', 8.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S022', N'ALPA', 8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S023', N'ALPA', 8.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T001', N'ALPA', 2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T002', N'ALPA', 2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T022', N'ALPA', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T023', N'ALPA', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T024', N'ALPA', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T025', N'ALPA', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C001', N'BANES', 0.45)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C002', N'BANES', 0.39)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C003', N'BANES', 1.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E002', N'BANES', 0.55)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E006', N'BANES', 1.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E007', N'BANES', 0.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E020', N'BANES', 0.35)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E031', N'BANES', 2.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E035', N'BANES', 5.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F023', N'BANES', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F024', N'BANES', 5.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F031', N'BANES', 7.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F034', N'BANES', 7.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H011', N'BANES', 2.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H012', N'BANES', 2.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H013', N'BANES', 2.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H014', N'BANES', 3.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P010', N'BANES', 6.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P015', N'BANES', 6.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P030', N'BANES', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P034', N'BANES', 3.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P036', N'BANES', 6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P038', N'BANES', 5.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'R001', N'BANES', 10.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'R002', N'BANES', 10.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S011', N'BANES', 15.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S021', N'BANES', 9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T022', N'BANES', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T024', N'BANES', 10.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C001', N'CHEP', 0.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C002', N'CHEP', 0.45)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C003', N'CHEP', 0.98)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C005', N'CHEP', 0.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E003', N'CHEP', 0.75)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E006', N'CHEP', 1.4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E007', N'CHEP', 0.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E034', N'CHEP', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E035', N'CHEP', 6.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E036', N'CHEP', 6.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F035', N'CHEP', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H011', N'CHEP', 2.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H012', N'CHEP', 2.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H013', N'CHEP', 2.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H032', N'CHEP', 10.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H033', N'CHEP', 10.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P010', N'CHEP', 6.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P016', N'CHEP', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P020', N'CHEP', 12.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P030', N'CHEP', 3.5)
GO
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P031', N'CHEP', 3.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P034', N'CHEP', 4.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P039', N'CHEP', 5.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P040', N'CHEP', 5.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P041', N'CHEP', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P045', N'CHEP', 5.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'R001', N'CHEP', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'R002', N'CHEP', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S011', N'CHEP', 16)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S012', N'CHEP', 16)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S020', N'CHEP', 9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S021', N'CHEP', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S022', N'CHEP', 9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S023', N'CHEP', 9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S100', N'CHEP', 15)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T001', N'CHEP', 3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T002', N'CHEP', 3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T022', N'CHEP', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T024', N'CHEP', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T025', N'CHEP', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C004', N'EARTH', 1.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C005', N'EARTH', 1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E003', N'EARTH', 0.65)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E033', N'EARTH', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F020', N'EARTH', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F034', N'EARTH', 9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F035', N'EARTH', 8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H033', N'EARTH', 10.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P016', N'EARTH', 6.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P042', N'EARTH', 3.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P046', N'EARTH', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S100', N'EARTH', 16)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T001', N'EARTH', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T025', N'EARTH', 10.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C004', N'GREEN', 1.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E021', N'GREEN', 0.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F020', N'GREEN', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F021', N'GREEN', 4.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F022', N'GREEN', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F023', N'GREEN', 4.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F024', N'GREEN', 4.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F033', N'GREEN', 7.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F035', N'GREEN', 9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H031', N'GREEN', 11.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H032', N'GREEN', 10.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P011', N'GREEN', 6.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P013', N'GREEN', 6.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P016', N'GREEN', 6.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P021', N'GREEN', 13.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P032', N'GREEN', 4.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P039', N'GREEN', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P042', N'GREEN', 3.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S012', N'GREEN', 17)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S022', N'GREEN', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S040', N'GREEN', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S041', N'GREEN', 13.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T023', N'GREEN', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E001', N'MPRL', 0.55)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E008', N'MPRL', 1.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E021', N'MPRL', 0.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E032', N'MPRL', 3.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E034', N'MPRL', 5.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F031', N'MPRL', 7.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F033', N'MPRL', 7.4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P037', N'MPRL', 4.4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P045', N'MPRL', 5.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T002', N'MPRL', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T020', N'MPRL', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E001', N'OFUN', 0.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E005', N'OFUN', 0.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E008', N'OFUN', 1.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E032', N'OFUN', 3.3)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E036', N'OFUN', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F032', N'OFUN', 7.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H031', N'OFUN', 10.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P011', N'OFUN', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P015', N'OFUN', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P031', N'OFUN', 4.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P035', N'OFUN', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P043', N'OFUN', 4.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S040', N'OFUN', 13)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T020', N'OFUN', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T100', N'OFUN', 14.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E003', N'OMEG', 0.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E008', N'OMEG', 1.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F033', N'OMEG', 7.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H031', N'OMEG', 10.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P035', N'OMEG', 3.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P043', N'OMEG', 3.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P044', N'OMEG', 4.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S040', N'OMEG', 14)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T003', N'OMEG', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T020', N'OMEG', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T021', N'OMEG', 12)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C006', N'SHRT', 0.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E002', N'SHRT', 0.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F020', N'SHRT', 3.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F021', N'SHRT', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F022', N'SHRT', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F032', N'SHRT', 7.3)
GO
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P012', N'SHRT', 7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P013', N'SHRT', 6.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P014', N'SHRT', 6.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P037', N'SHRT', 5.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P041', N'SHRT', 5.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P043', N'SHRT', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P044', N'SHRT', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S010', N'SHRT', 15)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S020', N'SHRT', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S023', N'SHRT', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S101', N'SHRT', 4.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T003', N'SHRT', 6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T021', N'SHRT', 10)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E002', N'SSC', 0.7)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E005', N'SSC', 0.87)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E020', N'SSC', 0.39)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E031', N'SSC', 3.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E032', N'SSC', 4.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E033', N'SSC', 5.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F021', N'SSC', 5.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F022', N'SSC', 5.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F031', N'SSC', 8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H032', N'SSC', 11.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H033', N'SSC', 11.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P012', N'SSC', 6.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P013', N'SSC', 6.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P014', N'SSC', 6.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P020', N'SSC', 12.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P021', N'SSC', 12.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P032', N'SSC', 3.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P033', N'SSC', 4.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P035', N'SSC', 4.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P036', N'SSC', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P037', N'SSC', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P038', N'SSC', 5.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P040', N'SSC', 5.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P042', N'SSC', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P045', N'SSC', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S041', N'SSC', 12.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S100', N'SSC', 17)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S101', N'SSC', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T003', N'SSC', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T021', N'SSC', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T100', N'SSC', 13)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'C006', N'WHIT', 0.87)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E005', N'WHIT', 0.76)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E021', N'WHIT', 0.6)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'E033', N'WHIT', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'F032', N'WHIT', 7.1)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'H014', N'WHIT', 2.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P012', N'WHIT', 6.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P021', N'WHIT', 12.2)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P033', N'WHIT', 3.8)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P036', N'WHIT', 4)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P044', N'WHIT', 5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'P046', N'WHIT', 5.9)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S010', N'WHIT', 15.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S041', N'WHIT', 14.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'S101', N'WHIT', 5.5)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T023', N'WHIT', 11)
INSERT [dbo].[SupplierItem] ([ItemID], [SupplierID], [Price]) VALUES (N'T100', N'WHIT', 14)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D001', N'123456', N'Mr Tan Liong Choon', N'Department Head', N'isstlc@nus.edu.sg', 86506316, N'COMM', 98098011, NULL, CAST(N'2017-03-05' AS Date), CAST(N'2017-01-31' AS Date))
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D002', N'111111', N'Ms Catherine', N'Department Staff', N'catherine@gmail.com', 98098012, N'COMM', 98098012, NULL, CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D003', N'111111', N'Mr Erica Tan', N'Department Staff', N'ericatan@gmail.com', 98034892, N'BIOL', 98034892, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D004', N'222222', N'Stephen Kok', N'Department Head', N'stephenkok@gmail.com', 89983489, N'BIOL', 89983489, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D005', N'333333', N'Nathaniel Kumar', N'Department Staff', N'nathaniel@gmail.com', 90899089, N'CPSC', 90899089, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D006', N'444444', N'Georgina Lum', N'Department Head', N'georginalum@gmail.com', 34890934, N'CPSC', 34890934, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D007', N'555555', N'Teh Weiliang Roman', N'Department Staff', N'tehweilang@gmail.com', 89093298, N'ENGL', 89093298, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D008', N'666666', N'Spencer Sng', N'Department Head', N'spencer@gmail.com', 90892312, N'ENGL', 90892312, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D009', N'111111', N'James Webb', N'Department Staff', N'james@gmail.com', 77712010, N'COMM', 77712010, NULL, CAST(N'2017-02-03' AS Date), CAST(N'2017-03-04' AS Date))
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D010', N'000122', N'Rachel Berry', N'Department Staff', N'rachel@gmail.com', 90239045, N'COMM', 90239045, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D011', N'090923', N'Nicole Smith', N'Department Staff', N'nicole@gmail.com', 70664022, N'COMM', 70664022, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D012', N'093489', N'Ryan Flores', N'Department Head', N'ryan@gmail.com', 89432453, N'BIZM', 89432453, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D013', N'999999', N'Christine Wilson', N'Department Staff', N'christine@gmail.cmo', 89347889, N'BIZM', 89347889, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D014', N'909034', N'Ernest Ferguson', N'Department Staff', N'ernestferguson@gmail.com', 45678999, N'BIZM', 45678999, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D015', N'849900', N'Judith Burton', N'Department Staff', N'judith@gmail.com', 90903090, N'BIOL', 90903090, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D016', N'568900', N'Michelle Reynolds', N'Department Staff', N'michelle@gmail.com', 90893245, N'BIOL', 90893245, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D017', N'909012', N'John Rogers', N'Department Staff', N'johnrogers@gmail.com', 90000001, N'BIOL', 90000001, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D018', N'110001', N'Kimberly Howard', N'Department Staff', N'kimberly@gmail.com', 91000001, N'ENGL', 91000001, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D019', N'210002', N'Joshua Wallace', N'Department Staff', N'joshua@gmail.com', 92009011, N'ENGL', 92009011, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D020', N'312002', N'Nancy Myers', N'Department Staff', N'nancy@gmail.com', 93000931, N'ENGL', 93000931, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D021', N'390421', N'Kenneth Thompson', N'Department Staff', N'kenneth@gmail.com', 93209452, N'CPSC', 93209452, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D022', N'999112', N'Walter Hansen', N'Department Staff', N'walter@gmail.com', 34982389, N'CPSC', 34982389, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D023', N'000001', N'Julia Smidth', N'Department Staff', N'juliasmidth@gmail.com', 34567890, N'CPSC', 34567890, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D024', N'111221', N'Betty Ford', N'Department Staff ', N'betty@gmail.com', 89334999, N'BIZM', 89334999, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D025', N'111111', N'Theresa Murry', N'Department Staff', N'theresa@gmail.com', 90348920, N'BIZM', 90348920, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D026', N'111111', N'Prof Tan', N'Department Head', N'tantan@gmail.com', 98459034, N'ENGR', 98459034, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D027', N'111111', N'Mrs Low Kway Boo', N'Department Head', N'lowkwaybo@gmail.com', 38940909, N'REGR', 38940909, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D028', N'121212', N'Preeti Lieu', N'Department Staff', N'preeti@gmail.com', 45939898, N'ENGR', 45939898, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D029', N'111111', N'Emma Gafoor', N'Department Staff', N'emmegafoor@gmail.com', 43988900, N'ENGR', 43988900, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D030', N'222222', N'Nettie Phua', N'Department Staff', N'nettie@gmail.com', 90348909, N'ENGR', 90348909, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D031', N'333333', N'Jessica Lau', N'Department Staff', N'jessica@gmail.com', 90348799, N'ENGR', 90348799, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D032', N'111111', N'Adrian Han', N'Department Staff', N'adrianhan@gmail.com', 39098099, N'REGR', 39098099, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D033', N'222222', N'Yusuf Riduan', N'Department Staff', N'yusuf@gmail.com', 43890900, N'REGR', 43890900, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D034', N'000000', N'Rodger Seow Xianyi', N'Department Staff', N'rodger@gmail.com', 39842939, N'REGR', 39842939, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D035', N'111111', N'Yao Xin Jaime Jordon', N'Department Representative', N'yaoxinjaime@gmail.com', 83409090, N'REGR', 83409090, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D036', N'AzrJla4yOL', N'Lisa Warren', N'Department Staff', N'lwarren0@cbslocal.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D037', N'yIDUA9cgTTX', N'Emily Hunt', N'Department Staff', N'ehunt1@hubpages.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D038', N'g0rYs4K', N'Anthony Harvey', N'Department Staff', N'aharvey2@huffingtonpost.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D039', N'Cm3Vyd', N'Eric Adams', N'Department Staff', N'eadams3@google.cn', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D040', N'T6TqnRK', N'Patrick Wright', N'Department Staff', N'pwright4@zimbio.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D041', N'DzkqjFv', N'Albert Stone', N'Department Staff', N'astone5@wisc.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D042', N'tf6moIFcyOv', N'Patricia Reynolds', N'Department Staff', N'preynolds6@eventbrite.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D043', N'OusyRNGZ', N'Samuel Richards', N'Department Staff', N'srichards7@woothemes.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D044', N'KBIv2NcGNp64', N'Donald Peterson', N'Department Staff', N'dpeterson8@nsw.gov.au', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D045', N'44ILYbaTdiC', N'Emily Stephens', N'Department Staff', N'estephens9@qq.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D046', N'lH0Oe8lr9g', N'Barbara Ruiz', N'Department Staff', N'bruiza@geocities.jp', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D047', N'EWfnLw0y', N'Bobby Hayes', N'Department Staff', N'bhayesb@tmall.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D048', N'Wo4DNGmUvO', N'Kevin Boyd', N'Department Staff', N'kboydc@pagesperso-orange.fr', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D049', N'8RC3CQtNH9', N'Larry Ramirez', N'Department Staff', N'lramirezd@godaddy.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D050', N'lrsEbpOakI', N'Linda Hayes', N'Department Staff', N'lhayese@google.fr', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D051', N'E4aEAFq7W', N'Russell Wright', N'Department Staff', N'rwrightf@squidoo.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D052', N'RKY1ytCnBR', N'Lois Foster', N'Department Staff', N'lfosterg@umich.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D053', N'Y8wVhnbPr', N'Walter Jones', N'Department Staff', N'wjonesh@nytimes.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D054', N'HAjF4D', N'Mark Alvarez', N'Department Staff', N'malvarezi@linkedin.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D055', N'Ai3Zv9yM', N'Todd Bennett', N'Department Staff', N'tbennettj@nationalgeographic.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D056', N'FlbZQ8', N'Martha Lee', N'Department Staff', N'mleek@diigo.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D057', N'ybLmD0', N'Christina Oliver', N'Department Staff', N'coliverl@bloglovin.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D058', N't6njqA0k7a', N'Bruce Boyd', N'Department Staff', N'bboydm@illinois.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D059', N'1FGgBXss', N'Jonathan Bailey', N'Department Staff', N'jbaileyn@discovery.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D060', N'prOjYly', N'Shirley Bell', N'Department Staff', N'sbello@goo.ne.jp', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D061', N'2yH1oeW5HYOl', N'Linda Lynch', N'Department Staff', N'llynchp@state.tx.us', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D062', N'GFJHl9ieGvo5', N'Rebecca Wagner', N'Department Staff', N'rwagnerq@mtv.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D063', N'cbGjdg', N'Wayne Nguyen', N'Department Staff', N'wnguyenr@4shared.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D064', N'Bw1i0o1Kr6D', N'Brandon Fisher', N'Department Staff', N'bfishers@technorati.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D065', N'UjOxZOev', N'Raymond Harper', N'Department Staff', N'rharpert@howstuffworks.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D066', N'1KaYlvgp', N'Tina Day', N'Department Staff', N'tdayu@bbc.co.uk', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D067', N'EVVnsZgLWKVp', N'Bruce Lane', N'Department Staff', N'blanev@cbc.ca', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D068', N'bcST1Y', N'Angela Garrett', N'Department Staff', N'agarrettw@exblog.jp', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D069', N'34jIo6', N'Fred Ferguson', N'Department Staff', N'ffergusonx@stanford.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D070', N'O4ZTMR4', N'Sarah Ray', N'Department Staff', N'srayy@imgur.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D071', N'KEOoDvbO', N'Lisa Jones', N'Department Staff', N'ljonesz@skype.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D072', N'CtiiUSVTAEf', N'Jack Bell', N'Department Staff', N'jbell10@privacy.gov.au', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D073', N'onsWO4TgK', N'Larry Stewart', N'Department Staff', N'lstewart11@hostgator.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D074', N'n5OYcAw', N'Maria Allen', N'Department Staff', N'mallen12@reference.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D075', N'B8WxQm7', N'Susan Lee', N'Department Staff', N'slee13@msu.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D076', N'zHRToWI', N'Eugene Mcdonald', N'Department Staff', N'emcdonald14@auda.org.au', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D077', N'fPsTiXywEP0', N'Harry Gonzales', N'Department Staff', N'hgonzales15@flickr.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D078', N'R9sgCo', N'Joan Hawkins', N'Department Staff', N'jhawkins16@altervista.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D079', N'SUvSXE', N'Benjamin Nichols', N'Department Staff', N'bnichols17@youku.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D080', N'zdrNGMTZvB8', N'Frank Ward', N'Department Staff', N'fward18@phpbb.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D081', N'TwX05e1n5', N'Peter Owens', N'Department Staff', N'powens19@pen.io', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D082', N'7Vo7pdq', N'Maria Spencer', N'Department Staff', N'mspencer1a@shop-pro.jp', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D083', N'M7pFb3Ii7TuO', N'Gloria Wilson', N'Department Staff', N'gwilson1b@archive.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D084', N'mrdoPBD', N'Randy Rogers', N'Department Staff', N'rrogers1c@nifty.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D085', N'x3AiUaU', N'Jacqueline Castillo', N'Department Staff', N'jcastillo1d@imageshack.us', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D086', N'ENbnBu', N'Christopher Simmons', N'Department Staff', N'csimmons1e@utexas.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D087', N'QJMfWwn', N'Amy Palmer', N'Department Staff', N'apalmer1f@weebly.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D088', N'dBlcJmG', N'Jean Morris', N'Department Staff', N'jmorris1g@archive.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D089', N'TEK2g5JF6di', N'Cheryl Sullivan', N'Department Staff', N'csullivan1h@1688.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D090', N'KR7aisB', N'Justin Garcia', N'Department Staff', N'jgarcia1i@samsung.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D091', N'LWhTNqzva5F', N'Randy Matthews', N'Department Staff', N'rmatthews1j@earthlink.net', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D092', N'q7hi9E3QicZ', N'Stephanie Ferguson', N'Department Staff', N'sferguson1k@weebly.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D093', N'7y7wIyCGhX', N'Tammy Cole', N'Department Staff', N'tcole1l@bbb.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D094', N'guRdEfbWz', N'Wayne Murphy', N'Department Staff', N'wmurphy1m@flickr.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D095', N'Mzyq8Zle3m', N'Paula Ramirez', N'Department Staff', N'pramirez1n@google.com.br', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D096', N'3aSO82CnMbp', N'Craig Long', N'Department Staff', N'clong1o@apache.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D097', N'6H3uTmbfB', N'Daniel Mcdonald', N'Department Staff', N'dmcdonald1p@altervista.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D098', N'yK53Dj1Q', N'Gary Cooper', N'Department Staff', N'gcooper1q@bigcartel.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D099', N'YvGyOMZx', N'Eugene Ferguson', N'Department Staff', N'eferguson1r@simplemachines.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D100', N'lbrVskkI98h', N'Howard Baker', N'Department Staff', N'hbaker1s@trellian.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D101', N'aFkagCxOS2L', N'Jacqueline Kim', N'Department Staff', N'jkim1t@pbs.org', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D102', N'AJywUJ', N'Karen Mcdonald', N'Department Staff', N'kmcdonald1u@indiegogo.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D103', N'9upNboA5u3', N'Maria Nichols', N'Department Staff', N'mnichols1v@upenn.edu', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D104', N'VITl1qysTB', N'Jimmy Sanchez', N'Department Staff', N'jsanchez1w@flavors.me', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D105', N'KC7XdnCd8', N'Jose Bowman', N'Department Staff', N'jbowman1x@house.gov', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D106', N'WnULcnktzu', N'Kathy Green', N'Department Staff', N'kgreen1y@jiathis.com', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D107', N'8NPdRrPGPw', N'Michael Stevens', N'Department Staff', N'mstevens1z@t.co', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D108', N'V5cejRa5ww', N'Beverly Hanson', N'Department Staff', N'bhanson20@hatena.ne.jp', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D109', N'YbUREtpfRQDE', N'Anna Ruiz', N'Department Staff', N'aruiz21@slideshare.net', NULL, N'BIZM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D110', N'm8ZvUN4u0', N'Cynthia Myers', N'Department Staff', N'cmyers22@constantcontact.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D111', N'LMTKa3RPb4Qm', N'Anne Johnson', N'Department Staff', N'ajohnson23@de.vu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D112', N'DjyqLMJIrj', N'Diane Gilbert', N'Department Staff', N'dgilbert24@desdev.cn', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D113', N'eQk2GJ07', N'Ronald Perry', N'Department Staff', N'rperry25@facebook.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D114', N'Emb4JxfeFinO', N'Stephen Carroll', N'Department Staff', N'scarroll26@studiopress.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D115', N'S3KCi5Op', N'Emily Morales', N'Department Staff', N'emorales27@who.int', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D116', N'weo2Rc', N'Ryan Lane', N'Department Staff', N'rlane28@businesswire.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D117', N'VsnSb2bL1', N'Virginia Lawson', N'Department Staff', N'vlawson29@deviantart.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D118', N'XjBxKO9', N'Laura Banks', N'Department Staff', N'lbanks2a@toplist.cz', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D119', N'2R55HsS69E', N'Kimberly Carroll', N'Department Staff', N'kcarroll2b@mac.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D120', N'bFZxSsgpeIvE', N'Stephen Hart', N'Department Staff', N'shart2c@wiley.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D121', N'b6DNkvPOW5', N'Tammy Gardner', N'Department Staff', N'tgardner2d@aol.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D122', N'pW3G9QVtxkb8', N'Jeremy Perkins', N'Department Staff', N'jperkins2e@epa.gov', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D123', N'50dcNNtclv', N'Julie Jacobs', N'Department Staff', N'jjacobs2f@friendfeed.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D124', N'T3EKd3', N'Kathleen Banks', N'Department Staff', N'kbanks2g@reverbnation.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D125', N'2OP5mUI', N'Karen Stanley', N'Department Staff', N'kstanley2h@nsw.gov.au', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D126', N'h9fPDTK', N'Robin Gordon', N'Department Staff', N'rgordon2i@discuz.net', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D127', N'X36KeE8OphSQ', N'Justin Turner', N'Department Staff', N'jturner2j@eventbrite.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D128', N'0bJfaVGgZ', N'Jesse Vasquez', N'Department Staff', N'jvasquez2k@vkontakte.ru', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D129', N'IGkmNHvlko1y', N'Marilyn Taylor', N'Department Staff', N'mtaylor2l@mtv.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D130', N'v7EDK24', N'Mildred Wilson', N'Department Staff', N'mwilson2m@ifeng.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D131', N'wSrodK', N'Nicole Bradley', N'Department Staff', N'nbradley2n@purevolume.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D132', N'exqqXIlu9w1', N'Matthew Porter', N'Department Staff', N'mporter2o@domainmarket.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D133', N'DYbf3q', N'Thomas Mcdonald', N'Department Staff', N'tmcdonald2p@prlog.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D134', N'2aC3tJ99PX', N'Ernest Bryant', N'Department Staff', N'ebryant2q@cornell.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D135', N'O6N7yez', N'Roger Fernandez', N'Department Staff', N'rfernandez2r@dailymail.co.uk', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D136', N'jp8caP4Vd', N'Victor Hart', N'Department Staff', N'vhart2s@independent.co.uk', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D137', N'ox5WRY6CO', N'Ronald Torres', N'Department Staff', N'rtorres2t@phoca.cz', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D138', N'w5JLfKk', N'Rebecca Phillips', N'Department Staff', N'rphillips2u@state.tx.us', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D139', N'ACM731U9rn', N'Kimberly Harvey', N'Department Staff', N'kharvey2v@skype.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D140', N'niGkFYjiX8vI', N'Eric Jackson', N'Department Staff', N'ejackson2w@e-recht24.de', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D141', N'x4u9CIPGZfV', N'Sarah Fields', N'Department Staff', N'sfields2x@indiegogo.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D142', N'uFOLJL9BUPJ9', N'Phyllis Day', N'Department Staff', N'pday2y@ustream.tv', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D143', N'5c1a8hnpY', N'Diana Porter', N'Department Staff', N'dporter2z@prnewswire.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D144', N'M6p7sFd3o8m', N'Jimmy Stanley', N'Department Staff', N'jstanley30@berkeley.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D145', N'DueKQ3d', N'Robin Watkins', N'Department Staff', N'rwatkins31@indiegogo.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D146', N'eqIMOATYg0F7', N'Kathleen Ross', N'Department Staff', N'kross32@people.com.cn', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D147', N'fX1jQw2q', N'Daniel Rogers', N'Department Staff', N'drogers33@yahoo.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D148', N'Z6hI7uYRb62', N'Michael Morrison', N'Department Staff', N'mmorrison34@ehow.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D149', N'Hx58xdQJqj7', N'Billy Burke', N'Department Staff', N'bburke35@diigo.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D150', N'3Vu9i57d4F', N'Doris Hawkins', N'Department Staff', N'dhawkins36@berkeley.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D151', N'Bp8NA5z', N'Juan Stone', N'Department Staff', N'jstone37@1und1.de', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D152', N'59VLjq1ytjo', N'Beverly Long', N'Department Staff', N'blong38@gov.uk', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D153', N'71dkDaa', N'Juan Gonzalez', N'Department Staff', N'jgonzalez39@mapquest.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D154', N'Gnc40b1', N'Patrick Campbell', N'Department Staff', N'pcampbell3a@hud.gov', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D155', N'7IdHD9LqUlaj', N'Julia Gonzales', N'Department Staff', N'jgonzales3b@toplist.cz', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D156', N'jmUKYRqd', N'Ryan Patterson', N'Department Staff', N'rpatterson3c@jugem.jp', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D157', N'VWP4TFMI', N'Bobby Hansen', N'Department Staff', N'bhansen3d@un.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D158', N'h7agfsPm', N'Rachel Sims', N'Department Staff', N'rsims3e@latimes.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D159', N'0ew4kxA', N'Rebecca Reyes', N'Department Staff', N'rreyes3f@prweb.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D160', N'7xNMvZhs', N'Jack Simpson', N'Department Staff', N'jsimpson3g@tamu.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D161', N'1agMCh', N'Howard Scott', N'Department Staff', N'hscott3h@prweb.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D162', N'7RSQgy1DN', N'Jeremy Moreno', N'Department Staff', N'jmoreno3i@de.vu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D163', N'nZXSIXEwhm2O', N'Paul Wilson', N'Department Staff', N'pwilson3j@youku.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D164', N'idXOszidZWR', N'Norma George', N'Department Staff', N'ngeorge3k@prlog.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D165', N'PL8YzJ8', N'Jerry Black', N'Department Staff', N'jblack3l@linkedin.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D166', N'HOryDMDnpX4X', N'Joshua Cook', N'Department Staff', N'jcook3m@blogtalkradio.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D167', N'hyKAZhUS', N'Evelyn Meyer', N'Department Staff', N'emeyer3n@tamu.edu', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D168', N'WkxULCPFbj3B', N'Bonnie Elliott', N'Department Staff', N'belliott3o@marriott.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D169', N'FjvPN8MZE', N'Joshua Gutierrez', N'Department Staff', N'jgutierrez3p@flavors.me', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D170', N'X489t9IEM', N'Donald Porter', N'Department Staff', N'dporter3q@auda.org.au', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D171', N'PaGo9gOtDPg', N'Lisa Perkins', N'Department Staff', N'lperkins3r@comsenz.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D172', N'KdaYI7SU', N'Amanda Chapman', N'Department Staff', N'achapman3s@ocn.ne.jp', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D173', N'GPW7MHkR5', N'Walter Snyder', N'Department Staff', N'wsnyder3t@jimdo.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D174', N'X5BEQ1n', N'Brandon Cruz', N'Department Staff', N'bcruz3u@cam.ac.uk', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D175', N'qSXuqtp', N'Paul Young', N'Department Staff', N'pyoung3v@tmall.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D176', N'1Ee4paZD', N'Heather Reyes', N'Department Staff', N'hreyes3w@gmpg.org', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D177', N'aGPMESlz5', N'Joyce Perkins', N'Department Staff', N'jperkins3x@i2i.jp', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D178', N'ErtLiQaGbub', N'Joe Gonzales', N'Department Staff', N'jgonzales3y@woothemes.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D179', N'cvkUg45JO', N'Jose Snyder', N'Department Staff', N'jsnyder3z@cpanel.net', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D180', N'Rcy4erESh', N'Timothy Johnson', N'Department Staff', N'tjohnson40@cafepress.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D181', N'kuaDLw0', N'Henry Wilson', N'Department Staff', N'hwilson41@163.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D182', N'aiwiWfGFj', N'Carl Daniels', N'Department Staff', N'cdaniels42@amazon.de', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D183', N'54eBf5Yc', N'Earl Hawkins', N'Department Staff', N'ehawkins43@statcounter.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D184', N'Qy9jvtH5quN', N'Ann Gonzalez', N'Department Staff', N'agonzalez44@bing.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D185', N'zXcjzE8khGa', N'Susan Gutierrez', N'Department Staff', N'sgutierrez45@sina.com.cn', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D186', N'5BWab44L', N'Lisa Black', N'Department Staff', N'lblack46@comsenz.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D187', N'86tfAk3sad6U', N'Jean Sims', N'Department Staff', N'jsims47@lycos.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D188', N'liHjQlQcvxH', N'Howard Foster', N'Department Staff', N'hfoster48@elpais.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D189', N'aiGLgPm4x', N'Amanda Bowman', N'Department Staff', N'abowman49@bandcamp.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D190', N'TcSn7Nci', N'Justin Russell', N'Department Staff', N'jrussell4a@ibm.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D191', N'YlhFda7QMZwT', N'Samuel Cole', N'Department Staff', N'scole4b@cbc.ca', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D192', N'lP8n40jIqJTJ', N'Pamela Mason', N'Department Staff', N'pmason4c@umn.edu', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D193', N'OQVoqkR', N'Phyllis Owens', N'Department Staff', N'powens4d@hugedomains.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D194', N'IJy0XWTkMLwx', N'Victor Thomas', N'Department Staff', N'vthomas4e@macromedia.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D195', N'u3wWKAb', N'William Greene', N'Department Staff', N'wgreene4f@who.int', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D196', N'B3GBEqUpD', N'Keith Richards', N'Department Staff', N'krichards4g@paginegialle.it', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D197', N'CCb9UISm', N'Nicole Ward', N'Department Staff', N'nward4h@marriott.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D198', N'F8XOYfS', N'Elizabeth Cooper', N'Department Staff', N'ecooper4i@goodreads.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D199', N'qtFyVz20bZF', N'Craig Boyd', N'Department Staff', N'cboyd4j@issuu.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D200', N'3WFUwUYloIiB', N'Frank Henry', N'Department Staff', N'fhenry4k@illinois.edu', NULL, N'ENGL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D201', N'EfvyuJpndf', N'Christopher Murray', N'Department Staff', N'cmurray4l@nationalgeographic.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D202', N'1suaf9KU', N'Christopher Adams', N'Department Staff', N'cadams4m@google.com.au', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D203', N'kxsT2n0lC', N'Cynthia Parker', N'Department Staff', N'cparker4n@histats.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D204', N'cvO0yuIBE', N'Donna Henry', N'Department Staff', N'dhenry4o@howstuffworks.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D205', N'XeBfQZYLLEHy', N'Amanda Knight', N'Department Staff', N'aknight4p@privacy.gov.au', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D206', N'W7OnhqzQ6', N'Adam Burke', N'Department Staff', N'aburke4q@epa.gov', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D207', N'rKZWYEOm8', N'Amanda Kelly', N'Department Staff', N'akelly4r@symantec.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D208', N'VQhuIl4rHbX', N'Larry Bryant', N'Department Staff', N'lbryant4s@goodreads.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D209', N'SRRtOG5PTy', N'Nicole Gordon', N'Department Staff', N'ngordon4t@chronoengine.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D210', N'mCjCiIlIboE', N'Johnny Fox', N'Department Staff', N'jfox4u@livejournal.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D211', N'kyTYSdILETqX', N'Steven Nguyen', N'Department Staff', N'snguyen4v@merriam-webster.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D212', N'EMSzx5EvO', N'Debra Peters', N'Department Staff', N'dpeters4w@privacy.gov.au', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D213', N's4dJP9Be', N'Phyllis Wells', N'Department Staff', N'pwells4x@creativecommons.org', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D214', N'0bwSeRKvJm', N'Aaron Long', N'Department Staff', N'along4y@acquirethisname.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D215', N'Ibec9H6j39Yq', N'Nancy Adams', N'Department Staff', N'nadams4z@e-recht24.de', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D216', N'blvuX4er3u', N'Todd Richards', N'Department Staff', N'trichards50@globo.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D217', N'5z9CGqAmK', N'Kenneth Nguyen', N'Department Staff', N'knguyen51@ustream.tv', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D218', N'19nowZKg9', N'Adam Carter', N'Department Staff', N'acarter52@abc.net.au', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D219', N'eqFLua6dh', N'Martha Morgan', N'Department Staff', N'mmorgan53@51.la', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D220', N'9LFGPsHB', N'Bruce Murray', N'Department Staff', N'bmurray54@mashable.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D221', N'SVGfncXb3R', N'Walter Romero', N'Department Staff', N'wromero55@yahoo.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D222', N'H4YP3v7cnnT', N'Bruce Wood', N'Department Staff', N'bwood56@mayoclinic.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D223', N'86IX0R', N'Samuel Murray', N'Department Staff', N'smurray57@linkedin.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D224', N'FqiUJpyZoG', N'Walter Harper', N'Department Staff', N'wharper58@addthis.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D225', N'5aPiq5g', N'Jonathan Welch', N'Department Staff', N'jwelch59@apple.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D226', N'NIZWTso7LZ', N'Michelle Kelley', N'Department Staff', N'mkelley5a@goo.ne.jp', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D227', N'l6Sjd9jTNBAl', N'Evelyn Little', N'Department Staff', N'elittle5b@domainmarket.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D228', N'rQs1qDXUO', N'Shawn Collins', N'Department Staff', N'scollins5c@unblog.fr', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D229', N'gM6UK9Rch8z', N'Katherine James', N'Department Staff', N'kjames5d@telegraph.co.uk', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D230', N'0e30zT96JEaW', N'Robin Hunt', N'Department Staff', N'rhunt5e@instagram.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D231', N'blQmNy11t', N'Justin Myers', N'Department Staff', N'jmyers5f@oracle.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D232', N'Hv08hP42S0i', N'Margaret Kim', N'Department Staff', N'mkim5g@purevolume.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D233', N'P0oah1J2rSmr', N'Barbara Morrison', N'Department Staff', N'bmorrison5h@infoseek.co.jp', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D234', N'RxH93h2', N'Cheryl Howard', N'Department Staff', N'choward5i@bloomberg.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D235', N'47OWLDZCuG', N'Paul Jenkins', N'Department Staff', N'pjenkins5j@blog.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D236', N'xpvkgazn', N'Ronald Allen', N'Department Staff', N'rallen5k@eepurl.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D237', N'fG5eRB1', N'Rebecca Henry', N'Department Staff', N'rhenry5l@constantcontact.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D238', N'LjR0SLiZ', N'Irene Allen', N'Department Staff', N'iallen5m@trellian.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D239', N'0QSd2R7vj', N'Sharon Perkins', N'Department Staff', N'sperkins5n@reverbnation.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D240', N'nJutm334', N'Matthew Dixon', N'Department Staff', N'mdixon5o@desdev.cn', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D241', N'N4rzeq6', N'Kenneth Smith', N'Department Staff', N'ksmith5p@vimeo.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D242', N'b1oUraax2e', N'Ruth Fox', N'Department Staff', N'rfox5q@theguardian.com', NULL, N'ENGL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D243', N'gg97PZrQwg2', N'Mark Coleman', N'Department Staff', N'mcoleman5r@prweb.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D244', N'Z6cITQOmv', N'Kenneth Welch', N'Department Staff', N'kwelch5s@nymag.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D245', N'fOxuEM1dEsI', N'Jean Wheeler', N'Department Staff', N'jwheeler5t@eventbrite.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D246', N'XXhLcwR', N'Debra Scott', N'Department Staff', N'dscott5u@npr.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D247', N'OIKXzG', N'Mark Weaver', N'Department Staff', N'mweaver5v@tinyurl.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D248', N'XWqGpXGL', N'Anne Robinson', N'Department Staff', N'arobinson5w@nba.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D249', N'F9eefgKVX', N'Christina Duncan', N'Department Staff', N'cduncan5x@youtu.be', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D250', N'RwwfdlCxiXvt', N'Donald Pierce', N'Department Staff', N'dpierce5y@zdnet.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D251', N'KPH672oKQ', N'Lisa Mitchell', N'Department Staff', N'lmitchell5z@sourceforge.net', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D252', N'EcnGUkq', N'Elizabeth Woods', N'Department Staff', N'ewoods60@cdbaby.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D253', N'xP2WOCHZA0', N'Eric George', N'Department Staff', N'egeorge61@51.la', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D254', N'H3NmnJDH', N'Willie Anderson', N'Department Staff', N'wanderson62@odnoklassniki.ru', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D255', N'mGjehZvo3d', N'Karen Carroll', N'Department Staff', N'kcarroll63@senate.gov', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D256', N'kjkjenXcGv', N'Frank Hunt', N'Department Staff', N'fhunt64@eventbrite.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D257', N'RBxIYPCGBCv', N'Joe Little', N'Department Staff', N'jlittle65@gravatar.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D258', N'jHgKSHGmHh2f', N'Harold Cunningham', N'Department Staff', N'hcunningham66@exblog.jp', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D259', N'iZLmbMwno', N'Susan Gordon', N'Department Staff', N'sgordon67@mtv.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D260', N'6vjxuSMnS1M', N'Jonathan Hall', N'Department Staff', N'jhall68@free.fr', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D261', N'EwBOjSmvz', N'Mark Wheeler', N'Department Staff', N'mwheeler69@elpais.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D262', N'RxvayXvnUgA', N'Amy Wallace', N'Department Staff', N'awallace6a@archive.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D263', N'0RQX4So8xUp', N'Cynthia Stone', N'Department Staff', N'cstone6b@tinyurl.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D264', N'c8rJaF2s', N'Nicole Kelly', N'Department Staff', N'nkelly6c@opera.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D265', N'Urm0IKLCyGRm', N'Annie Rogers', N'Department Staff', N'arogers6d@tripadvisor.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D266', N'NaZbxqj', N'Andrew Bell', N'Department Staff', N'abell6e@reuters.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D267', N'ZbXga4I0nvi', N'Ralph Baker', N'Department Staff', N'rbaker6f@shutterfly.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D268', N'joU98kJmwLR', N'Stephen Gray', N'Department Staff', N'sgray6g@ovh.net', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D269', N'IyPS0h4ykQIV', N'Melissa Adams', N'Department Staff', N'madams6h@exblog.jp', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D270', N'Lrgzy2fu7Cv7', N'Christopher Carroll', N'Department Staff', N'ccarroll6i@mit.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D271', N'TapLnSftow', N'Roger Stevens', N'Department Staff', N'rstevens6j@cbslocal.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D272', N'WBR5SSLb', N'Willie Thompson', N'Department Staff', N'wthompson6k@163.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D273', N'PDR1VTLu', N'Joshua Anderson', N'Department Staff', N'janderson6l@360.cn', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D274', N'efSgC96uuq', N'Wanda Mendoza', N'Department Staff', N'wmendoza6m@newsvine.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D275', N'GSzk0jrQ8JPk', N'Justin Gutierrez', N'Department Staff', N'jgutierrez6n@bloglovin.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D276', N'iShXaUoBvWtY', N'Gregory Jordan', N'Department Staff', N'gjordan6o@mozilla.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D277', N'LqTjiWTl', N'Raymond Hansen', N'Department Staff', N'rhansen6p@nps.gov', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D278', N'45Q9FD', N'Andrew Gonzalez', N'Department Staff', N'agonzalez6q@nasa.gov', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D279', N'ww2yHFVaRFiO', N'Shawn Turner', N'Department Staff', N'sturner6r@europa.eu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D280', N'uQWd3ZKYble', N'Kathleen Mitchell', N'Department Staff', N'kmitchell6s@umn.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D281', N'4YdmIf', N'Judy Kim', N'Department Staff', N'jkim6t@yandex.ru', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D282', N'X1isWarg0wWb', N'Eric Cole', N'Department Staff', N'ecole6u@arizona.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D283', N'bP64Uib', N'Kathleen Howard', N'Department Staff', N'khoward6v@networkadvertising.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D284', N'JiaUelKhOB', N'Jeremy Henry', N'Department Staff', N'jhenry6w@csmonitor.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D285', N'BjblQ4X', N'Earl Lynch', N'Department Staff', N'elynch6x@cargocollective.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D286', N'u7CyDxF', N'Alan Payne', N'Department Staff', N'apayne6y@shutterfly.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D287', N'ZOJA3Hf', N'Bobby Cruz', N'Department Staff', N'bcruz6z@hatena.ne.jp', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D288', N'BLzPIcJBHvER', N'Larry Nichols', N'Department Staff', N'lnichols70@blogger.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D289', N'm6AZOsuyFSKO', N'Norma Crawford', N'Department Staff', N'ncrawford71@oakley.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D290', N'PJFxAKml', N'Albert Romero', N'Department Staff', N'aromero72@imdb.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D291', N'OUJIlG', N'Louise Morales', N'Department Staff', N'lmorales73@360.cn', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D292', N'8vE4VlIJoA38', N'Michael Lopez', N'Department Staff', N'mlopez74@google.it', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D293', N'fuCcJE4mxE', N'Terry Kelly', N'Department Staff', N'tkelly75@vinaora.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D294', N'coGQ4ic', N'Maria Harper', N'Department Staff', N'mharper76@wikispaces.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D295', N'silBlFy5zeXT', N'Douglas Simmons', N'Department Staff', N'dsimmons77@microsoft.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D296', N'eKkI64', N'Christina Turner', N'Department Staff', N'cturner78@reuters.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D297', N'1FSYHZNvTJ', N'Steven Garrett', N'Department Staff', N'sgarrett79@state.tx.us', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D298', N'yCS6dhLrB', N'Linda Fox', N'Department Staff', N'lfox7a@blog.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D299', N'ZbB3jt', N'Carlos Montgomery', N'Department Staff', N'cmontgomery7b@twitter.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D300', N'IpnN3LlNM', N'Julia Ferguson', N'Department Staff', N'jferguson7c@nytimes.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D301', N'RgtZwISyE', N'Todd Perez', N'Department Staff', N'tperez7d@usatoday.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D302', N'SSFGGOHR2', N'Marilyn Perry', N'Department Staff', N'mperry7e@ebay.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D303', N'7b2ErR', N'Phyllis Jones', N'Department Staff', N'pjones7f@de.vu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D304', N'ZExnYhG', N'Karen Black', N'Department Staff', N'kblack7g@virginia.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D305', N'NQCd55ef', N'Ryan Lane', N'Department Staff', N'rlane7h@bbc.co.uk', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D306', N'LgSSBRaW', N'Roy Lynch', N'Department Staff', N'rlynch7i@chronoengine.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D307', N'iXTdq5f', N'Teresa Gonzalez', N'Department Staff', N'tgonzalez7j@aol.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D308', N'udHcZ2Brr', N'Adam Diaz', N'Department Staff', N'adiaz7k@time.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D309', N'SIYNkF', N'Scott Green', N'Department Staff', N'sgreen7l@rakuten.co.jp', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D310', N'bc5y9dzd2N', N'Charles Snyder', N'Department Staff', N'csnyder7m@ezinearticles.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D311', N'PWQCIJ', N'Ashley Stone', N'Department Staff', N'astone7n@yelp.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D312', N'9D2i3x9JJWcD', N'Ernest Mcdonald', N'Department Staff', N'emcdonald7o@dion.ne.jp', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D313', N'82viSB7RC', N'Andrew Bailey', N'Department Staff', N'abailey7p@bizjournals.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D314', N'i2yquNjGz', N'Diane Hunt', N'Department Staff', N'dhunt7q@trellian.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D315', N'nyUrHzL', N'Carlos Knight', N'Department Staff', N'cknight7r@yelp.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D316', N'ZlTwB1xu', N'Paula Stevens', N'Department Staff', N'pstevens7s@phpbb.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D317', N'auGW2O4iKk', N'Timothy Griffin', N'Department Staff', N'tgriffin7t@nationalgeographic.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D318', N'Ye37SlcbwzsV', N'Linda Edwards', N'Department Staff', N'ledwards7u@last.fm', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D319', N'fchbr9', N'Frank Watson', N'Department Staff', N'fwatson7v@nymag.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D320', N'4qhpfM2xW', N'Phyllis Gordon', N'Department Staff', N'pgordon7w@networkadvertising.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D321', N'KijNY49xa', N'Jessica Medina', N'Department Staff', N'jmedina7x@cloudflare.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D322', N'M7hEtq', N'Arthur Butler', N'Department Staff', N'abutler7y@gnu.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D323', N'ZRl0KX', N'Kathryn Jackson', N'Department Staff', N'kjackson7z@economist.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D324', N'a3MMfNG7lCKY', N'Jacqueline Allen', N'Department Staff', N'jallen80@hugedomains.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D325', N'EfBgPU6', N'Jack Wheeler', N'Department Staff', N'jwheeler81@merriam-webster.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D326', N'1DiMToG', N'Karen Turner', N'Department Staff', N'kturner82@cpanel.net', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D327', N'45R5G6Gumo', N'Phyllis Wells', N'Department Staff', N'pwells83@live.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D328', N'VmqsrK', N'Billy Jordan', N'Department Staff', N'bjordan84@dailymotion.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D329', N'm1OVs8MuuTH', N'Brenda Dean', N'Department Staff', N'bdean85@de.vu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D330', N'TYVoCOu', N'Kathleen Anderson', N'Department Staff', N'kanderson86@unc.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D331', N'24kmMqH2ga', N'Peter Fernandez', N'Department Staff', N'pfernandez87@privacy.gov.au', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D332', N'sDYoyE4eS', N'Philip Duncan', N'Department Staff', N'pduncan88@soundcloud.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D333', N'yHuaQi', N'Wanda Gardner', N'Department Staff', N'wgardner89@marriott.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D334', N'H4karp9', N'Richard Cruz', N'Department Staff', N'rcruz8a@theglobeandmail.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D335', N'DcuhyNor', N'Lori Myers', N'Department Staff', N'lmyers8b@sogou.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D336', N'ZfbbGr1', N'John Gray', N'Department Staff', N'jgray8c@topsy.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D337', N'F582u1LXvl', N'Ernest Lynch', N'Department Staff', N'elynch8d@hhs.gov', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D338', N'9r4ka45', N'Virginia Freeman', N'Department Staff', N'vfreeman8e@prlog.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D339', N'6fG4uUxFb', N'Roy Hall', N'Department Staff', N'rhall8f@netscape.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D340', N'Bcmmc8NNK', N'Philip Webb', N'Department Staff', N'pwebb8g@mapy.cz', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D341', N'mmDDyosYnA', N'Teresa Stevens', N'Department Staff', N'tstevens8h@sogou.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D342', N'w1vGNsZXLF', N'Judith Bryant', N'Department Staff', N'jbryant8i@ucoz.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D343', N'RNBAskRDE', N'Jessica Gonzalez', N'Department Staff', N'jgonzalez8j@theglobeandmail.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D344', N'ANaIvoC', N'Dennis Gibson', N'Department Staff', N'dgibson8k@ucla.edu', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D345', N'e877nw', N'Jose Armstrong', N'Department Staff', N'jarmstrong8l@wsj.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D346', N'ymQhEeMK1E', N'Shawn Gonzales', N'Department Staff', N'sgonzales8m@boston.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D347', N'Zy8Nhvf', N'Kimberly Hernandez', N'Department Staff', N'khernandez8n@hp.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D348', N'U9MTDtu', N'Jeremy Young', N'Department Staff', N'jyoung8o@npr.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D349', N'zPBG8x', N'Adam Day', N'Department Staff', N'aday8p@washingtonpost.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D350', N'Dihj4nRAK1', N'Pamela Payne', N'Department Staff', N'ppayne8q@youku.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D351', N'Onyay3l', N'Chris Hanson', N'Department Staff', N'chanson8r@ebay.co.uk', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D352', N'vAB2tBEHt', N'Janice Hunter', N'Department Staff', N'jhunter8s@barnesandnoble.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D353', N'w4J2NqeyM7', N'Barbara Fisher', N'Department Staff', N'bfisher8t@theatlantic.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D354', N'8trSWo', N'Sara Hayes', N'Department Staff', N'shayes8u@issuu.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D355', N'vzbRjGx', N'Anna Miller', N'Department Staff', N'amiller8v@technorati.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D356', N'dH8ACuw2', N'Ronald Snyder', N'Department Staff', N'rsnyder8w@shareasale.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D357', N'HoHpxH', N'Tammy Phillips', N'Department Staff', N'tphillips8x@businesswire.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D358', N'bI179Hn8NyJ', N'Irene Adams', N'Department Staff', N'iadams8y@creativecommons.org', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D359', N'jlNaTg5xcs19', N'Beverly Austin', N'Department Staff', N'baustin8z@narod.ru', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D360', N'NN89G641', N'Heather Carroll', N'Department Staff', N'hcarroll90@chronoengine.com', NULL, N'BIOL', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D361', N'ejhuLyDozo7n', N'Matthew Bryant', N'Department Staff', N'mbryant91@sun.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D362', N'0vz6YvHYcL14', N'Julie Larson', N'Department Staff', N'jlarson92@prweb.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D363', N'tp2nS2JH', N'Jacqueline Little', N'Department Staff', N'jlittle93@weather.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D364', N'BjyBoxVmi5', N'Donald Patterson', N'Department Staff', N'dpatterson94@a8.net', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D365', N'ltHw4H', N'Antonio Stone', N'Department Staff', N'astone95@examiner.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D366', N'StmGnnVj6a3', N'Lillian Kelley', N'Department Staff', N'lkelley96@unblog.fr', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D367', N'8BEsjWJ', N'Sandra Jordan', N'Department Staff', N'sjordan97@devhub.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D368', N'2g1S5Vgbm', N'Scott Turner', N'Department Staff', N'sturner98@cdc.gov', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D369', N'fbimBU6', N'Michael Fields', N'Department Staff', N'mfields99@naver.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D370', N'SDbvRm1HZi1', N'Tina Williamson', N'Department Staff', N'twilliamson9a@e-recht24.de', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D371', N'ombuR9y', N'Paula Coleman', N'Department Staff', N'pcoleman9b@fotki.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D372', N'zKeZ1Lg', N'Beverly Rose', N'Department Staff', N'brose9c@si.edu', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D373', N'YWQasmY05', N'Katherine Hill', N'Department Staff', N'khill9d@webnode.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D374', N'I6p1OM80ai', N'Maria Alvarez', N'Department Staff', N'malvarez9e@tumblr.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D375', N'yxbg6p2M', N'Sarah Thompson', N'Department Staff', N'sthompson9f@cargocollective.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D376', N'yionVHUu', N'Lillian Nichols', N'Department Staff', N'lnichols9g@bigcartel.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D377', N'ZaWj14gT', N'Bonnie Ruiz', N'Department Staff', N'bruiz9h@themeforest.net', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D378', N'x9WMvGJCQWw', N'Lawrence Peters', N'Department Staff', N'lpeters9i@state.tx.us', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D379', N'SAuArv6c4', N'Janet Wilson', N'Department Staff', N'jwilson9j@discuz.net', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D380', N'jqfvYgK', N'Wanda Turner', N'Department Staff', N'wturner9k@mozilla.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D381', N'5hKinh', N'Andrea Moreno', N'Department Staff', N'amoreno9l@vk.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D382', N'8mqDykilH', N'Justin Ramirez', N'Department Staff', N'jramirez9m@arstechnica.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D383', N'zD5h0cZ', N'Helen Fox', N'Department Staff', N'hfox9n@pen.io', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D384', N'pVsn4M', N'Jose Stephens', N'Department Staff', N'jstephens9o@scribd.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D385', N'RywgqpRPWI', N'Teresa Moreno', N'Department Staff', N'tmoreno9p@fastcompany.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D386', N'O9v0gc', N'Irene Gray', N'Department Staff', N'igray9q@cpanel.net', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D387', N'VYzm1cKf4J', N'Todd Lopez', N'Department Staff', N'tlopez9r@baidu.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D388', N'IZ0v43', N'Benjamin Lee', N'Department Staff', N'blee9s@blogs.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D389', N'6SLfkcsm1', N'Amanda Simmons', N'Department Staff', N'asimmons9t@nba.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D390', N'Fo1azj06', N'Jean Brooks', N'Department Staff', N'jbrooks9u@bing.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D391', N'IhKJBcMucB', N'Emily Knight', N'Department Staff', N'eknight9v@mlb.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D392', N'6crFt1', N'Julie Dean', N'Department Staff', N'jdean9w@ucoz.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D393', N'8Xd12X5RuMq', N'Helen Wells', N'Department Staff', N'hwells9x@myspace.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D394', N'g1iEmgU', N'Martha Davis', N'Department Staff', N'mdavis9y@exblog.jp', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D395', N'uVjgOiTWdLj', N'Evelyn Fox', N'Department Staff', N'efox9z@themeforest.net', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D396', N'0atmulSLqqw4', N'Raymond Green', N'Department Staff', N'rgreena0@independent.co.uk', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D397', N'HQntIJHW89', N'Andrew Turner', N'Department Staff', N'aturnera1@mediafire.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D398', N'gS76M6Zm8Dj', N'Brandon Sullivan', N'Department Staff', N'bsullivana2@google.it', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D399', N'fdTTHk', N'Louis Fuller', N'Department Staff', N'lfullera3@google.nl', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D400', N'pwZAOWWa4U', N'Thomas Snyder', N'Department Staff', N'tsnydera4@ifeng.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D401', N'R8uwq5w4', N'Julie Miller', N'Department Staff', N'jmillera5@t.co', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D402', N'0wu8Cq2a', N'Jerry Price', N'Department Staff', N'jpricea6@webs.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D403', N'7Zkqd0bA150J', N'Judy Dunn', N'Department Staff', N'jdunna7@mapy.cz', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D404', N'32IdejL', N'Antonio Griffin', N'Department Staff', N'agriffina8@behance.net', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D405', N'wi3sQcbbtmk', N'Matthew Kelly', N'Department Staff', N'mkellya9@blog.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D406', N'oB2uKxN', N'Randy Berry', N'Department Staff', N'rberryaa@dailymail.co.uk', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D407', N'OuOccihhJ', N'Howard Coleman', N'Department Staff', N'hcolemanab@blogger.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D408', N'TXWcJFfjbX', N'Betty Garrett', N'Department Staff', N'bgarrettac@networkadvertising.org', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D409', N'yNmClFQ2Xf', N'Brandon Morrison', N'Department Staff', N'bmorrisonad@tuttocitta.it', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D410', N'wJgjL0LM', N'Walter Stephens', N'Department Staff', N'wstephensae@gmpg.org', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D411', N'Qb1RrfLC', N'Amanda Dean', N'Department Staff', N'adeanaf@wix.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D412', N'MJzbqw5i60K', N'Scott Burns', N'Department Staff', N'sburnsag@soundcloud.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D413', N'P725Zj9p', N'Ronald Bradley', N'Department Staff', N'rbradleyah@e-recht24.de', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D414', N'wPgcHLpFxtja', N'Billy Knight', N'Department Staff', N'bknightai@studiopress.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D415', N'FUJ6If01CwC7', N'Beverly Woods', N'Department Staff', N'bwoodsaj@mit.edu', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D416', N'7ZhE1KDkY', N'Bobby Sanders', N'Department Staff', N'bsandersak@gizmodo.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D417', N'u5V0y8I', N'Jane Myers', N'Department Staff', N'jmyersal@vistaprint.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D418', N'hMeH8gWYKnd', N'Louise Fields', N'Department Staff', N'lfieldsam@techcrunch.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D419', N'GbM3nAu8f', N'Jennifer Baker', N'Department Staff', N'jbakeran@trellian.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D420', N'fCoqV0Wckzk', N'Douglas Schmidt', N'Department Staff', N'dschmidtao@senate.gov', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D421', N'Q91oTTp2eR6S', N'Victor Chavez', N'Department Staff', N'vchavezap@zimbio.com', NULL, N'COMM', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D422', N'kVtnNNUs', N'Donald Riley', N'Department Staff', N'drileyaq@so-net.ne.jp', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D423', N'XZ0qkXWBLE5j', N'Scott Wood', N'Department Staff', N'swoodar@yellowbook.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D424', N'sZNy14XzAuA', N'Wayne Hamilton', N'Department Staff', N'whamiltonas@umich.edu', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D425', N'JMGbIqq8', N'Patrick Morrison', N'Department Staff', N'pmorrisonat@yandex.ru', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D426', N't6056uKqt', N'Robin Matthews', N'Department Staff', N'rmatthewsau@naver.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D427', N'vjCVI1Lwpdm', N'Ruth Hamilton', N'Department Staff', N'rhamiltonav@hubpages.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D428', N'05nLJH', N'Raymond Perkins', N'Department Staff', N'rperkinsaw@bravesites.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D429', N'V5sBVTFETmFq', N'Brenda Bailey', N'Department Staff', N'bbaileyax@nature.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D430', N'5v1nje1HgKX4', N'Joan Barnes', N'Department Staff', N'jbarnesay@amazon.de', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D431', N'KFR7Dz', N'Angela Schmidt', N'Department Staff', N'aschmidtaz@cbc.ca', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D432', N'm6UpfYaQ3k', N'Angela Jacobs', N'Department Staff', N'ajacobsb0@sfgate.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D433', N'6BQzfMyV', N'Philip Miller', N'Department Staff', N'pmillerb1@myspace.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D434', N'IsBbzN4', N'George Phillips', N'Department Staff', N'gphillipsb2@wikimedia.org', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D435', N'352zbbfX895E', N'Karen Morrison', N'Department Staff', N'kmorrisonb3@moonfruit.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D436', N'1w2sRKZn', N'Clarence Edwards', N'Department Staff', N'cedwardsb4@addtoany.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D437', N'LNk5cAuEaCK', N'Charles Ford', N'Department Staff', N'cfordb5@about.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D438', N'AS735x14bYge', N'Johnny Gonzales', N'Department Staff', N'jgonzalesb6@stanford.edu', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D439', N'XKHti9GML0YN', N'Kathy Reid', N'Department Staff', N'kreidb7@arstechnica.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D440', N'FRV4gk1KM', N'Emily Graham', N'Department Staff', N'egrahamb8@ezinearticles.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D441', N'923aBfcMyJ', N'Joyce Garcia', N'Department Staff', N'jgarciab9@nymag.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D442', N'V23wY0U', N'Jerry Hayes', N'Department Staff', N'jhayesba@bigcartel.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D443', N'vX81niNuiy4J', N'Aaron Price', N'Department Staff', N'apricebb@google.com.hk', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D444', N'RZzyJN1nYzkH', N'Carl Fields', N'Department Staff', N'cfieldsbc@adobe.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D445', N'pHugP7wvp', N'Theresa Murphy', N'Department Staff', N'tmurphybd@shop-pro.jp', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D446', N'qfEBtWsd2', N'Nicole Sanchez', N'Department Staff', N'nsanchezbe@ucoz.ru', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D447', N'0JF9joe', N'Jose Fisher', N'Department Staff', N'jfisherbf@aol.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D448', N'WxUGg3U9x', N'Bonnie Brown', N'Department Staff', N'bbrownbg@seattletimes.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D449', N'kFtBaJ6jIyQ', N'Anna Mendoza', N'Department Staff', N'amendozabh@cisco.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D450', N'v9xbxzoqf2b7', N'Charles Kennedy', N'Department Staff', N'ckennedybi@so-net.ne.jp', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D451', N'nhCliS8Y', N'Martha Hart', N'Department Staff', N'mhartbj@ft.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D452', N'B0aoNch', N'Nicole Henderson', N'Department Staff', N'nhendersonbk@wufoo.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D453', N'0XLx0BSdTX', N'David Davis', N'Department Staff', N'ddavisbl@wunderground.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D454', N'AtJU0bX3Y', N'Aaron Andrews', N'Department Staff', N'aandrewsbm@uiuc.edu', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D455', N'IWyt3Syj', N'Ruby Dunn', N'Department Staff', N'rdunnbn@cisco.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D456', N'gVwaBV', N'Willie Ward', N'Department Staff', N'wwardbo@nba.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D457', N'0eur7DR', N'Deborah Stewart', N'Department Staff', N'dstewartbp@gizmodo.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D458', N'GYpEyA', N'Ronald Mitchell', N'Department Staff', N'rmitchellbq@bloglines.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D459', N'vVVZuQeIK', N'Clarence Gutierrez', N'Department Staff', N'cgutierrezbr@barnesandnoble.com', NULL, N'REGR', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D460', N'ODQSAbyJM', N'Donna Hall', N'Department Staff', N'dhallbs@newyorker.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D461', N'eACuSboiQcWX', N'Jerry Jackson', N'Department Staff', N'jjacksonbt@bing.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D462', N'BcFWtsY', N'Doris Howard', N'Department Staff', N'dhowardbu@squarespace.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D463', N'JqmvdqjJ1', N'Susan Schmidt', N'Department Staff', N'sschmidtbv@soup.io', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D464', N'0MW1s8', N'Sandra Dixon', N'Department Staff', N'sdixonbw@slate.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D465', N'PF15X6px', N'Louis Mason', N'Department Staff', N'lmasonbx@wikia.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D466', N'tBAX2pKpM', N'Norma Jones', N'Department Staff', N'njonesby@gov.uk', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D467', N'PUDLhRbtf', N'Roger Watkins', N'Department Staff', N'rwatkinsbz@yandex.ru', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D468', N'pfkDBch8', N'William Banks', N'Department Staff', N'wbanksc0@eepurl.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D469', N'NdJAMvrBiHSl', N'Billy James', N'Department Staff', N'bjamesc1@senate.gov', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D470', N'mNWdJvsYc1', N'Juan Palmer', N'Department Staff', N'jpalmerc2@guardian.co.uk', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D471', N'czNKwfk', N'Harry Sanders', N'Department Staff', N'hsandersc3@twitpic.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D472', N'QbeOtzXJQ', N'Gerald White', N'Department Staff', N'gwhitec4@addthis.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D473', N'kDHb4Q', N'Melissa Baker', N'Department Staff', N'mbakerc5@linkedin.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D474', N'rHRuAfDZR', N'Amy Carroll', N'Department Staff', N'acarrollc6@sogou.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D475', N'cmgGhEO', N'Peter Reid', N'Department Staff', N'preidc7@chron.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D476', N'pb0gnAPbQ', N'Gerald Thompson', N'Department Staff', N'gthompsonc8@smugmug.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D477', N'hRFudfPT', N'Clarence Lawson', N'Department Staff', N'clawsonc9@google.it', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D478', N'NWuQXdLFtqz', N'Raymond Grant', N'Department Staff', N'rgrantca@indiegogo.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D479', N'93KNkYNB7o6', N'Kelly Campbell', N'Department Staff', N'kcampbellcb@multiply.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D480', N'zEijIiS5', N'Frances Wilson', N'Department Staff', N'fwilsoncc@spiegel.de', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D481', N'cUCJEb', N'Sharon Stanley', N'Department Staff', N'sstanleycd@usnews.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D482', N'aHdWDb', N'Melissa Larson', N'Department Staff', N'mlarsonce@histats.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D483', N'iOkvBNMu8X', N'Denise West', N'Department Staff', N'dwestcf@reverbnation.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D484', N'ntlxVWSZE', N'Kelly Gray', N'Department Staff', N'kgraycg@google.ru', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D485', N'RfxjaJ', N'Jerry Garrett', N'Department Staff', N'jgarrettch@wired.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D486', N'TxXVLYaIkyo', N'Tammy Gardner', N'Department Staff', N'tgardnerci@de.vu', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D487', N'kGKPKrATjIEf', N'Daniel Long', N'Department Staff', N'dlongcj@google.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D488', N'aX4f0Lmq', N'Betty Bryant', N'Department Staff', N'bbryantck@europa.eu', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D489', N'Wx26dgDs0hh', N'Ruby Stone', N'Department Staff', N'rstonecl@epa.gov', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D490', N'XUjxxe', N'Joe King', N'Department Staff', N'jkingcm@washington.edu', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D491', N'GNno9e9DMnUI', N'Amy Hanson', N'Department Staff', N'ahansoncn@nsw.gov.au', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D492', N'7UeUxcDP', N'Jeffrey Lewis', N'Department Staff', N'jlewisco@friendfeed.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D493', N'scId5VLSnSx', N'Gerald Greene', N'Department Staff', N'ggreenecp@youtube.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D494', N'iJylcHCSc', N'Jesse Morales', N'Department Staff', N'jmoralescq@cam.ac.uk', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'D495', N'r9qcGi', N'Alan Adams', N'Department Staff', N'aadamscr@sfgate.com', NULL, N'CPSC', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'S001', N'121212', N'Ms Esther Tan', N'Store Clerk', N'isstane@nus.edu.sg', 86506316, N'STORE', 99099123, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'S002', N'131313', N'Mr Khiong Jian', N'Store Supervisor', N'kiongjian@gmail.com', 89900911, N'STORE', 89900911, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'S003', N'141414', N'Ms Elizabeth Cheng', N'Store Manager', N'elizabeth@gmail.com', 90890123, N'STORE', 90890123, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'S004', N'111222', N'Williams Tan', N'Store Clerk', N'williams@gmail.com', 90349034, N'STORE', 90349034, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'S005', N'111111', N'Cynthia Franklin', N'Store Clerk', N'cynthia@gmail.com', 99099022, N'STORE', 99099022, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [Password], [Name], [RoleName], [Email], [Phone], [DepartmentID], [Whatsapp], [Photo], [StartDate], [EndDate]) VALUES (N'S006', N'000011', N'Frank Baker', N'Store Clerk', N'frank@gmail.com', 95095012, N'STORE', 95095012, NULL, NULL, NULL)
ALTER TABLE [dbo].[CollectionPoint]  WITH CHECK ADD  CONSTRAINT [FK_CollectionPoint_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[CollectionPoint] CHECK CONSTRAINT [FK_CollectionPoint_User]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_CollectionPoint] FOREIGN KEY([CollectionPointName])
REFERENCES [dbo].[CollectionPoint] ([CollectionPointName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_CollectionPoint]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_CategoryName] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_CategoryName]
GO
ALTER TABLE [dbo].[ItemAdjustment]  WITH CHECK ADD  CONSTRAINT [FK_ItemAdjustment_Adjustment] FOREIGN KEY([VoucherNo])
REFERENCES [dbo].[Adjustment] ([VoucherNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ItemAdjustment] CHECK CONSTRAINT [FK_ItemAdjustment_Adjustment]
GO
ALTER TABLE [dbo].[ItemAdjustment]  WITH CHECK ADD  CONSTRAINT [FK_ItemAdjustment_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[ItemAdjustment] CHECK CONSTRAINT [FK_ItemAdjustment_Item]
GO
ALTER TABLE [dbo].[PurchaseItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseItem] CHECK CONSTRAINT [FK_PurchaseItem_Item]
GO
ALTER TABLE [dbo].[PurchaseItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseItem_PurchaseOrder] FOREIGN KEY([PONo])
REFERENCES [dbo].[PurchaseOrder] ([PONo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseItem] CHECK CONSTRAINT [FK_PurchaseItem_PurchaseOrder]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_User]
GO
ALTER TABLE [dbo].[RequisitionItem]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequisitionItem] CHECK CONSTRAINT [FK_RequisitionItem_Item]
GO
ALTER TABLE [dbo].[RequisitionItem]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionItem_Requisition] FOREIGN KEY([RequisitionID])
REFERENCES [dbo].[Requisition] ([RequisitionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequisitionItem] CHECK CONSTRAINT [FK_RequisitionItem_Requisition]
GO
ALTER TABLE [dbo].[SupplierItem]  WITH CHECK ADD  CONSTRAINT [FK_SupplierItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[SupplierItem] CHECK CONSTRAINT [FK_SupplierItem_Item]
GO
ALTER TABLE [dbo].[SupplierItem]  WITH CHECK ADD  CONSTRAINT [FK_SupplierItem_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierItem] CHECK CONSTRAINT [FK_SupplierItem_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleName])
REFERENCES [dbo].[Role] ([RoleName])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [LogicUniversity] SET  READ_WRITE 
GO
