USE [master]
GO
/****** Object:  Database [Sales_DWH]    Script Date: 6/6/2023 9:45:03 PM ******/
CREATE DATABASE [Sales_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sales_DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sales_DWH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sales_DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sales_DWH_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sales_DWH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales_DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales_DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales_DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales_DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales_DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales_DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sales_DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales_DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales_DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales_DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales_DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sales_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales_DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales_DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales_DWH] SET RECOVERY FULL 
GO
ALTER DATABASE [Sales_DWH] SET  MULTI_USER 
GO
ALTER DATABASE [Sales_DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales_DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sales_DWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sales_DWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sales_DWH', N'ON'
GO
ALTER DATABASE [Sales_DWH] SET QUERY_STORE = OFF
GO
USE [Sales_DWH]
GO
/****** Object:  Table [dbo].[Customer_Dimension]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Dimension](
	[Customer_key] [int] IDENTITY(1,10) NOT NULL,
	[Client_Name] [nvarchar](50) NULL,
	[Client_Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer_Dimension] PRIMARY KEY CLUSTERED 
(
	[Customer_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date_Dimension]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date_Dimension](
	[Date_Key] [int] IDENTITY(1,1) NOT NULL,
	[Full_Date] [date] NULL,
	[Day_Of_Month] [int] NULL,
	[Month] [varchar](4) NULL,
	[Quarter] [varchar](20) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_Date_Dimension] PRIMARY KEY CLUSTERED 
(
	[Date_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distributor_Dimension]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distributor_Dimension](
	[Distributor_Key] [int] IDENTITY(1,1) NOT NULL,
	[Distributor_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Distributor_Dimension] PRIMARY KEY CLUSTERED 
(
	[Distributor_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Table]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Table](
	[Date_Key] [int] NULL,
	[Product_Key] [int] NULL,
	[Customer_Key] [int] NULL,
	[Product_Line_Key] [int] NULL,
	[Region_key] [int] NULL,
	[Distributor_Key] [int] NULL,
	[Quantity] [decimal](18, 0) NULL,
	[Sales] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Dimension]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Dimension](
	[Product_Key] [int] IDENTITY(1,1) NOT NULL,
	[Item_Name] [varchar](50) NULL,
	[Item_Code] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Product_Dimension] PRIMARY KEY CLUSTERED 
(
	[Product_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Line_Dimension]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Line_Dimension](
	[Product_Line_Key] [int] IDENTITY(1,1) NOT NULL,
	[Product_Line] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Line_Dimension] PRIMARY KEY CLUSTERED 
(
	[Product_Line_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region_Dimension]    Script Date: 6/6/2023 9:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region_Dimension](
	[Region_Key] [int] IDENTITY(1,1) NOT NULL,
	[Region] [varchar](50) NULL,
 CONSTRAINT [PK_Region_Dimension] PRIMARY KEY CLUSTERED 
(
	[Region_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Table_Customer_Dimension] FOREIGN KEY([Customer_Key])
REFERENCES [dbo].[Customer_Dimension] ([Customer_key])
GO
ALTER TABLE [dbo].[Fact_Table] CHECK CONSTRAINT [FK_Fact_Table_Customer_Dimension]
GO
ALTER TABLE [dbo].[Fact_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Table_Date_Dimension] FOREIGN KEY([Date_Key])
REFERENCES [dbo].[Date_Dimension] ([Date_Key])
GO
ALTER TABLE [dbo].[Fact_Table] CHECK CONSTRAINT [FK_Fact_Table_Date_Dimension]
GO
ALTER TABLE [dbo].[Fact_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Table_Distributor_Dimension] FOREIGN KEY([Distributor_Key])
REFERENCES [dbo].[Distributor_Dimension] ([Distributor_Key])
GO
ALTER TABLE [dbo].[Fact_Table] CHECK CONSTRAINT [FK_Fact_Table_Distributor_Dimension]
GO
ALTER TABLE [dbo].[Fact_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Table_Product_Dimension] FOREIGN KEY([Product_Key])
REFERENCES [dbo].[Product_Dimension] ([Product_Key])
GO
ALTER TABLE [dbo].[Fact_Table] CHECK CONSTRAINT [FK_Fact_Table_Product_Dimension]
GO
ALTER TABLE [dbo].[Fact_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Table_Product_Line_Dimension] FOREIGN KEY([Product_Line_Key])
REFERENCES [dbo].[Product_Line_Dimension] ([Product_Line_Key])
GO
ALTER TABLE [dbo].[Fact_Table] CHECK CONSTRAINT [FK_Fact_Table_Product_Line_Dimension]
GO
ALTER TABLE [dbo].[Fact_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Table_Region_Dimension] FOREIGN KEY([Region_key])
REFERENCES [dbo].[Region_Dimension] ([Region_Key])
GO
ALTER TABLE [dbo].[Fact_Table] CHECK CONSTRAINT [FK_Fact_Table_Region_Dimension]
GO
USE [master]
GO
ALTER DATABASE [Sales_DWH] SET  READ_WRITE 
GO
