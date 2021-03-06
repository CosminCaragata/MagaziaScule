USE [master]
GO
/****** Object:  Database [MagaziaScule]    Script Date: 12/06/2013 12:49:46 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'MagaziaScule')
BEGIN
CREATE DATABASE [MagaziaScule] ON  PRIMARY 
( NAME = N'WorkTools', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WorkTools.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorkTools_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WorkTools_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO
ALTER DATABASE [MagaziaScule] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MagaziaScule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MagaziaScule] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MagaziaScule] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MagaziaScule] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MagaziaScule] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MagaziaScule] SET ARITHABORT OFF
GO
ALTER DATABASE [MagaziaScule] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MagaziaScule] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MagaziaScule] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MagaziaScule] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MagaziaScule] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MagaziaScule] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MagaziaScule] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MagaziaScule] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MagaziaScule] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MagaziaScule] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MagaziaScule] SET  DISABLE_BROKER
GO
ALTER DATABASE [MagaziaScule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MagaziaScule] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MagaziaScule] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MagaziaScule] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MagaziaScule] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MagaziaScule] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MagaziaScule] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MagaziaScule] SET  READ_WRITE
GO
ALTER DATABASE [MagaziaScule] SET RECOVERY FULL
GO
ALTER DATABASE [MagaziaScule] SET  MULTI_USER
GO
ALTER DATABASE [MagaziaScule] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MagaziaScule] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'MagaziaScule', N'ON'
GO
USE [MagaziaScule]
GO
/****** Object:  ForeignKey [FK_CustomerAdress_Customer]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAdress_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAdress]'))
ALTER TABLE [dbo].[CustomerAdress] DROP CONSTRAINT [FK_CustomerAdress_Customer]
GO
/****** Object:  ForeignKey [FK_Machine_CustomerAdress]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Machine_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[Machine]'))
ALTER TABLE [dbo].[Machine] DROP CONSTRAINT [FK_Machine_CustomerAdress]
GO
/****** Object:  ForeignKey [FK_WorkOrder_Agent]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_Agent]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_Agent]
GO
/****** Object:  ForeignKey [FK_WorkOrder_CustomerAdress]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_CustomerAdress]
GO
/****** Object:  ForeignKey [FK_ServiceFile_Machine]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_Machine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile] DROP CONSTRAINT [FK_ServiceFile_Machine]
GO
/****** Object:  ForeignKey [FK_ServiceFile_WorkOrder]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_WorkOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile] DROP CONSTRAINT [FK_ServiceFile_WorkOrder]
GO
/****** Object:  ForeignKey [FK_UsedSpare_ServiceFile]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare] DROP CONSTRAINT [FK_UsedSpare_ServiceFile]
GO
/****** Object:  ForeignKey [FK_UsedSpare_SparePart]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_SparePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare] DROP CONSTRAINT [FK_UsedSpare_SparePart]
GO
/****** Object:  ForeignKey [FK_ServiceOperation_Operation]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation] DROP CONSTRAINT [FK_ServiceOperation_Operation]
GO
/****** Object:  ForeignKey [FK_ServiceOperation_ServiceFile]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation] DROP CONSTRAINT [FK_ServiceOperation_ServiceFile]
GO
/****** Object:  Table [dbo].[ServiceOperation]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation] DROP CONSTRAINT [FK_ServiceOperation_Operation]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation] DROP CONSTRAINT [FK_ServiceOperation_ServiceFile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceOperation]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceOperation]
GO
/****** Object:  Table [dbo].[UsedSpare]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare] DROP CONSTRAINT [FK_UsedSpare_ServiceFile]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_SparePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare] DROP CONSTRAINT [FK_UsedSpare_SparePart]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsedSpare]') AND type in (N'U'))
DROP TABLE [dbo].[UsedSpare]
GO
/****** Object:  Table [dbo].[ServiceFile]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_Machine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile] DROP CONSTRAINT [FK_ServiceFile_Machine]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_WorkOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile] DROP CONSTRAINT [FK_ServiceFile_WorkOrder]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceFile]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceFile]
GO
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 12/06/2013 12:49:48 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_Agent]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_Agent]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_CustomerAdress]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder]') AND type in (N'U'))
DROP TABLE [dbo].[WorkOrder]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Machine_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[Machine]'))
ALTER TABLE [dbo].[Machine] DROP CONSTRAINT [FK_Machine_CustomerAdress]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Machine]') AND type in (N'U'))
DROP TABLE [dbo].[Machine]
GO
/****** Object:  Table [dbo].[CustomerAdress]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAdress_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAdress]'))
ALTER TABLE [dbo].[CustomerAdress] DROP CONSTRAINT [FK_CustomerAdress_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAdress]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerAdress]
GO
/****** Object:  Table [dbo].[SparePart]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SparePart]') AND type in (N'U'))
DROP TABLE [dbo].[SparePart]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operation]') AND type in (N'U'))
DROP TABLE [dbo].[Operation]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent]') AND type in (N'U'))
DROP TABLE [dbo].[Agent]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/06/2013 12:49:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/06/2013 12:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[idCustomer] [int] IDENTITY(1,1) NOT NULL,
	[Name] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([idCustomer], [Name]) VALUES (1, N'Cust1')
INSERT [dbo].[Customer] ([idCustomer], [Name]) VALUES (2, N'Cust2')
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[Agent]    Script Date: 12/06/2013 12:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Agent](
	[idAgent] [int] IDENTITY(1,1) NOT NULL,
	[Name] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Surname] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyName] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyAdress] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[idAgent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Agent] ON
INSERT [dbo].[Agent] ([idAgent], [Name], [Surname], [CompanyName], [CompanyAdress], [Phone]) VALUES (3, N'Agentu1', N'Ag1Surname', N'Ag1CompanyName', N'ag1compadress', N'ag1phone')
INSERT [dbo].[Agent] ([idAgent], [Name], [Surname], [CompanyName], [CompanyAdress], [Phone]) VALUES (4, N'Agentu1', N'Ag1Surname', N'Ag1CompanyName', N'ag1compadress', NULL)
SET IDENTITY_INSERT [dbo].[Agent] OFF
/****** Object:  Table [dbo].[Operation]    Script Date: 12/06/2013 12:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Operation](
	[idOperation] [int] NOT NULL,
	[Name] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Operation] PRIMARY KEY CLUSTERED 
(
	[idOperation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[Operation] ([idOperation], [Name]) VALUES (1, N'Op1')
INSERT [dbo].[Operation] ([idOperation], [Name]) VALUES (2, N'Op2')
INSERT [dbo].[Operation] ([idOperation], [Name]) VALUES (3, N'Op3')
/****** Object:  Table [dbo].[SparePart]    Script Date: 12/06/2013 12:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SparePart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SparePart](
	[idSparePart] [int] IDENTITY(1,1) NOT NULL,
	[Name] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_SparePart] PRIMARY KEY CLUSTERED 
(
	[idSparePart] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SparePart] ON
INSERT [dbo].[SparePart] ([idSparePart], [Name]) VALUES (1, N'aaa')
INSERT [dbo].[SparePart] ([idSparePart], [Name]) VALUES (2, N'bbbb')
INSERT [dbo].[SparePart] ([idSparePart], [Name]) VALUES (3, N'cccc')
SET IDENTITY_INSERT [dbo].[SparePart] OFF
/****** Object:  Table [dbo].[CustomerAdress]    Script Date: 12/06/2013 12:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAdress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAdress](
	[idCustomerAdress] [int] IDENTITY(1,1) NOT NULL,
	[City] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AdressLine1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Representant] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[idCustomer] [int] NOT NULL,
 CONSTRAINT [PK_CustomerAdress] PRIMARY KEY CLUSTERED 
(
	[idCustomerAdress] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[CustomerAdress] ON
INSERT [dbo].[CustomerAdress] ([idCustomerAdress], [City], [AdressLine1], [Representant], [Email], [Phone], [idCustomer]) VALUES (2, N'cust1city', N'cust1addresline', N'dsaads', N'asdads', N'asdas', 1)
INSERT [dbo].[CustomerAdress] ([idCustomerAdress], [City], [AdressLine1], [Representant], [Email], [Phone], [idCustomer]) VALUES (3, N'city2', N'cust1addressline2', N'eee', N'aa@aad.com', N'212332', 1)
INSERT [dbo].[CustomerAdress] ([idCustomerAdress], [City], [AdressLine1], [Representant], [Email], [Phone], [idCustomer]) VALUES (5, N'cust2city1', N'asdasd', N'adsad', N'adsad', N'asda', 2)
SET IDENTITY_INSERT [dbo].[CustomerAdress] OFF
/****** Object:  Table [dbo].[Machine]    Script Date: 12/06/2013 12:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Machine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Machine](
	[idMachine] [int] IDENTITY(1,1) NOT NULL,
	[idCustomerAdress] [int] NOT NULL,
	[Name] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SerialNumber] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Machine] PRIMARY KEY CLUSTERED 
(
	[idMachine] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Machine] ON
INSERT [dbo].[Machine] ([idMachine], [idCustomerAdress], [Name], [Type], [SerialNumber]) VALUES (1, 3, N'MAsina1', N'tipul 1', N'22222')
INSERT [dbo].[Machine] ([idMachine], [idCustomerAdress], [Name], [Type], [SerialNumber]) VALUES (3, 5, N'masina3', N'tipul 6', N'45444')
SET IDENTITY_INSERT [dbo].[Machine] OFF
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 12/06/2013 12:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkOrder](
	[idWorkOrder] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CustomTime] [int] NULL,
	[Approved] [bit] NOT NULL,
	[Sent] [bit] NOT NULL,
	[Rating] [int] NULL,
	[Closed] [bit] NOT NULL,
	[idCustomerAdress] [int] NULL,
	[idAgent] [int] NULL,
	[idServiceFile] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_WorkOrder] PRIMARY KEY CLUSTERED 
(
	[idWorkOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[WorkOrder] ON
INSERT [dbo].[WorkOrder] ([idWorkOrder], [StartTime], [EndTime], [CustomTime], [Approved], [Sent], [Rating], [Closed], [idCustomerAdress], [idAgent], [idServiceFile]) VALUES (8, CAST(0x0000A27300000000 AS DateTime), CAST(0x0000A27300000000 AS DateTime), 1, 0, 0, 2, 0, 2, 3, NULL)
SET IDENTITY_INSERT [dbo].[WorkOrder] OFF
/****** Object:  Table [dbo].[ServiceFile]    Script Date: 12/06/2013 12:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceFile](
	[idServiceFile] [int] IDENTITY(1,1) NOT NULL,
	[idWorkOrder] [int] NOT NULL,
	[idMachine] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Comment] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ServiceFile] PRIMARY KEY CLUSTERED 
(
	[idServiceFile] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ServiceFile] ON
INSERT [dbo].[ServiceFile] ([idServiceFile], [idWorkOrder], [idMachine], [StartTime], [EndTime], [Comment]) VALUES (3, 8, 3, CAST(0x0000A28900E3664F AS DateTime), CAST(0x0000A28900E36650 AS DateTime), N'aaaa')
INSERT [dbo].[ServiceFile] ([idServiceFile], [idWorkOrder], [idMachine], [StartTime], [EndTime], [Comment]) VALUES (4, 8, 3, CAST(0x0000A28900E4E45A AS DateTime), CAST(0x0000A28900E4E45A AS DateTime), N'aaaa')
INSERT [dbo].[ServiceFile] ([idServiceFile], [idWorkOrder], [idMachine], [StartTime], [EndTime], [Comment]) VALUES (5, 8, 3, CAST(0x0000A28901092EB8 AS DateTime), CAST(0x0000A28901092EB8 AS DateTime), N'aaaa')
INSERT [dbo].[ServiceFile] ([idServiceFile], [idWorkOrder], [idMachine], [StartTime], [EndTime], [Comment]) VALUES (6, 8, 3, CAST(0x0000A2890109424F AS DateTime), CAST(0x0000A2890109424F AS DateTime), N'aaaa')
SET IDENTITY_INSERT [dbo].[ServiceFile] OFF
/****** Object:  Table [dbo].[UsedSpare]    Script Date: 12/06/2013 12:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsedSpare]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsedSpare](
	[idUsedSpare] [int] IDENTITY(1,1) NOT NULL,
	[idServiceFile] [int] NOT NULL,
	[idSparePart] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_UsedSpare] PRIMARY KEY CLUSTERED 
(
	[idUsedSpare] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UsedSpare] ON
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (3, 3, 2, 30)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (4, 3, 3, 60)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (5, 4, 2, 30)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (6, 4, 3, 60)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (7, 5, 2, 30)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (8, 5, 3, 60)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (9, 6, 2, 30)
INSERT [dbo].[UsedSpare] ([idUsedSpare], [idServiceFile], [idSparePart], [Quantity]) VALUES (10, 6, 3, 60)
SET IDENTITY_INSERT [dbo].[UsedSpare] OFF
/****** Object:  Table [dbo].[ServiceOperation]    Script Date: 12/06/2013 12:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceOperation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceOperation](
	[idServiceOperation] [int] IDENTITY(1,1) NOT NULL,
	[idOperation] [int] NOT NULL,
	[idServiceFile] [int] NOT NULL,
 CONSTRAINT [PK_ServiceOperation] PRIMARY KEY CLUSTERED 
(
	[idServiceOperation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ServiceOperation] ON
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (7, 1, 3)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (8, 2, 3)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (9, 3, 3)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (10, 1, 4)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (11, 2, 4)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (12, 3, 4)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (13, 1, 5)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (14, 2, 5)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (15, 3, 5)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (16, 1, 6)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (17, 2, 6)
INSERT [dbo].[ServiceOperation] ([idServiceOperation], [idOperation], [idServiceFile]) VALUES (18, 3, 6)
SET IDENTITY_INSERT [dbo].[ServiceOperation] OFF
/****** Object:  ForeignKey [FK_CustomerAdress_Customer]    Script Date: 12/06/2013 12:49:47 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAdress_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAdress]'))
ALTER TABLE [dbo].[CustomerAdress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAdress_Customer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAdress_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAdress]'))
ALTER TABLE [dbo].[CustomerAdress] CHECK CONSTRAINT [FK_CustomerAdress_Customer]
GO
/****** Object:  ForeignKey [FK_Machine_CustomerAdress]    Script Date: 12/06/2013 12:49:47 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Machine_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[Machine]'))
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_CustomerAdress] FOREIGN KEY([idCustomerAdress])
REFERENCES [dbo].[CustomerAdress] ([idCustomerAdress])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Machine_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[Machine]'))
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_Machine_CustomerAdress]
GO
/****** Object:  ForeignKey [FK_WorkOrder_Agent]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_Agent]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Agent] FOREIGN KEY([idAgent])
REFERENCES [dbo].[Agent] ([idAgent])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_Agent]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Agent]
GO
/****** Object:  ForeignKey [FK_WorkOrder_CustomerAdress]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_CustomerAdress] FOREIGN KEY([idCustomerAdress])
REFERENCES [dbo].[CustomerAdress] ([idCustomerAdress])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_CustomerAdress]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder]'))
ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_CustomerAdress]
GO
/****** Object:  ForeignKey [FK_ServiceFile_Machine]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_Machine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile]  WITH CHECK ADD  CONSTRAINT [FK_ServiceFile_Machine] FOREIGN KEY([idMachine])
REFERENCES [dbo].[Machine] ([idMachine])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_Machine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile] CHECK CONSTRAINT [FK_ServiceFile_Machine]
GO
/****** Object:  ForeignKey [FK_ServiceFile_WorkOrder]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_WorkOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile]  WITH CHECK ADD  CONSTRAINT [FK_ServiceFile_WorkOrder] FOREIGN KEY([idWorkOrder])
REFERENCES [dbo].[WorkOrder] ([idWorkOrder])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceFile_WorkOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceFile]'))
ALTER TABLE [dbo].[ServiceFile] CHECK CONSTRAINT [FK_ServiceFile_WorkOrder]
GO
/****** Object:  ForeignKey [FK_UsedSpare_ServiceFile]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare]  WITH CHECK ADD  CONSTRAINT [FK_UsedSpare_ServiceFile] FOREIGN KEY([idServiceFile])
REFERENCES [dbo].[ServiceFile] ([idServiceFile])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare] CHECK CONSTRAINT [FK_UsedSpare_ServiceFile]
GO
/****** Object:  ForeignKey [FK_UsedSpare_SparePart]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_SparePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare]  WITH CHECK ADD  CONSTRAINT [FK_UsedSpare_SparePart] FOREIGN KEY([idSparePart])
REFERENCES [dbo].[SparePart] ([idSparePart])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsedSpare_SparePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsedSpare]'))
ALTER TABLE [dbo].[UsedSpare] CHECK CONSTRAINT [FK_UsedSpare_SparePart]
GO
/****** Object:  ForeignKey [FK_ServiceOperation_Operation]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOperation_Operation] FOREIGN KEY([idOperation])
REFERENCES [dbo].[Operation] ([idOperation])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation] CHECK CONSTRAINT [FK_ServiceOperation_Operation]
GO
/****** Object:  ForeignKey [FK_ServiceOperation_ServiceFile]    Script Date: 12/06/2013 12:49:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOperation_ServiceFile] FOREIGN KEY([idServiceFile])
REFERENCES [dbo].[ServiceFile] ([idServiceFile])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceOperation_ServiceFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceOperation]'))
ALTER TABLE [dbo].[ServiceOperation] CHECK CONSTRAINT [FK_ServiceOperation_ServiceFile]
GO
