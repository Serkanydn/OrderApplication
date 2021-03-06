USE [master]
GO
/****** Object:  Database [OrderApplication]    Script Date: 11.11.2021 16:07:41 ******/
CREATE DATABASE [OrderApplication]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderApplication', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrderApplication.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderApplication_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrderApplication_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OrderApplication] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderApplication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderApplication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderApplication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderApplication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderApplication] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderApplication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrderApplication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderApplication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderApplication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderApplication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderApplication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderApplication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderApplication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderApplication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderApplication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrderApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderApplication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderApplication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderApplication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderApplication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderApplication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderApplication] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrderApplication] SET  MULTI_USER 
GO
ALTER DATABASE [OrderApplication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderApplication] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderApplication] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderApplication] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrderApplication] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrderApplication] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OrderApplication] SET QUERY_STORE = OFF
GO
USE [OrderApplication]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 11.11.2021 16:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[AddressLine] [nvarchar](200) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[CityCode] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11.11.2021 16:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.11.2021 16:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11.11.2021 16:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [CustomerId], [AddressLine], [City], [Country], [CityCode]) VALUES (1, 3, N'Tatlıkuyu', N'Kocaeli', N'Türkiye', 262)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (3, N'Serkan', N'serkan@serkan', CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (5, N'Aydın', N'serkan@serkan', CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (8, N'Volkan', N'Aydın', CAST(N'2021-11-11T15:32:13.583' AS DateTime), CAST(N'2021-11-11T15:32:13.583' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (9, N'Volkan', N'Aydın', CAST(N'2021-11-11T15:32:48.573' AS DateTime), CAST(N'2021-11-11T15:32:48.573' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (10, N'Volkan', N'Aydın', CAST(N'2021-11-11T15:33:05.663' AS DateTime), CAST(N'2021-11-11T15:33:05.663' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (11, N'Volkan', N'Aydın', CAST(N'2021-11-11T15:37:45.367' AS DateTime), CAST(N'2021-11-11T15:37:45.367' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (12, N'Serkan', N'serkan@serkan', CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (13, N'Serkan', N'serkan@serkan', CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [CreateAt], [UpdateAt]) VALUES (14, N'Volkan', N'Aydın', CAST(N'2021-11-11T15:44:42.260' AS DateTime), CAST(N'2021-11-11T15:44:42.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (13, 3, 10, 20, N'ready', 3, 1, CAST(N'2021-11-11T01:24:28.717' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (15, 3, 10, 20, N'hazır', 3, 1, CAST(N'2021-11-11T01:24:28.717' AS DateTime), CAST(N'2021-11-11T01:24:28.660' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (16, 5, 0, 20, N'hazır', 3, 1, CAST(N'2021-09-11T01:24:28.110' AS DateTime), CAST(N'2021-11-11T01:24:28.717' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (20, 2, 5, 20, N'hazır değil', 2, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (21, 3, 5, 20, N'hazır', 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T02:26:36.503' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (22, 5, 5, 20, N'hazır', 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T02:27:43.670' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (25, 3, 5, 20, N'hazır', 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T01:24:28.717' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (26, 5, 5, 20, N'hazır', 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T01:24:28.717' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (27, 3, 5, 20, N'hazır', 2, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T01:24:28.717' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (30, 2, 5, 20, N'hazır', 2, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T02:27:43.670' AS DateTime))
INSERT [dbo].[Orders] ([Id], [CustomerId], [Quantity], [Price], [Status], [AddressId], [ProductId], [CreateAt], [UpdateAt]) VALUES (31, 2, 5, 20, N'hazır', 2, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), CAST(N'2021-11-11T02:27:43.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ImageUrl], [Name]) VALUES (1, N'imageUrl', N'Laptop')
INSERT [dbo].[Products] ([Id], [ImageUrl], [Name]) VALUES (2, N'imageUrl', N'TV')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
USE [master]
GO
ALTER DATABASE [OrderApplication] SET  READ_WRITE 
GO
