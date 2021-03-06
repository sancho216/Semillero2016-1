USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 28/03/2016 0:16:08 ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECommerce.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECommerce_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](30) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityCode] [int] NOT NULL,
	[Name] [nchar](30) NULL,
	[StateCode] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contribution]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contribution](
	[IdContribution] [int] IDENTITY(1,1) NOT NULL,
	[ContributionPercent] [real] NULL,
	[Detail] [nchar](20) NULL,
 CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED 
(
	[IdContribution] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [int] NOT NULL,
	[Name] [nchar](30) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CountryContribution]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryContribution](
	[CountryCode] [int] NULL,
	[IdContribution] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[CreditCardId] [bigint] NOT NULL,
	[ExpirationDate] [date] NULL,
	[CheckBank] [bit] NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_CreditCard_1] PRIMARY KEY CLUSTERED 
(
	[CreditCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[IdEvent] [int] IDENTITY(1,1) NOT NULL,
	[Detail] [nchar](100) NULL,
	[Timer] [datetime] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[IdEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Offer]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[IdOffer] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[Detail] [nchar](150) NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
	[PercentageOffer] [real] NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[IdOffer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[IdStatus] [tinyint] NULL,
	[IdPayment] [tinyint] NULL,
	[Total] [real] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NULL,
	[IdProduct] [int] NULL,
	[IdContribution] [int] NULL,
	[Quantity] [int] NULL,
	[SubTotal] [float] NULL,
	[Observation] [nchar](100) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[IdPayment] [tinyint] NOT NULL,
	[Detail] [nchar](20) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[IdPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paypal]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paypal](
	[IdPaypal] [nchar](50) NOT NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Paypal] PRIMARY KEY CLUSTERED 
(
	[IdPaypal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](30) NULL,
	[Detail] [nchar](200) NULL,
	[IdCategory] [int] NULL,
	[CodeSupplier] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[IdOffer] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductEvaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NULL,
	[IdUser] [int] NULL,
	[IdProduct] [int] NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUser](
	[IdProduct] [int] NULL,
	[IdUser] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [tinyint] IDENTITY(1,1) NOT NULL,
	[Detail] [nchar](20) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[IdShipment] [int] NOT NULL,
	[IdOrder] [int] NULL,
	[IdUser] [int] NULL,
	[CodeSupplier] [int] NULL,
	[IdStatus] [tinyint] NULL,
	[ShipmentDate] [date] NULL,
	[ArrivingDate] [date] NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[IdShipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateCode] [int] NOT NULL,
	[Name] [nchar](30) NULL,
	[CountryCode] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[IdStatus] [tinyint] NOT NULL,
	[Detail] [nchar](20) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[CodeSupplier] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[CompanyName] [nchar](30) NULL,
	[Note] [nchar](100) NULL,
	[Discount] [real] NULL,
	[CurrentOrder] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[CodeSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierEvaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodeSupplier] [int] NULL,
	[IdUser] [int] NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_SupplierEvaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeId]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeId](
	[IdTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DocumentType] [nchar](20) NULL,
 CONSTRAINT [PK_TypeId] PRIMARY KEY CLUSTERED 
(
	[IdTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] NOT NULL,
	[IdTypeId] [tinyint] NOT NULL,
	[UserName] [nchar](40) NULL,
	[KeyWord] [nchar](40) NULL,
	[Email] [nchar](50) NULL,
	[PhoneNumber] [nchar](30) NULL,
	[IdRole] [tinyint] NULL,
	[CountryCode] [int] NULL,
	[IdStatus] [tinyint] NULL,
	[PostalCode] [tinyint] NULL,
	[Adress] [nchar](70) NULL,
	[FirstName] [nchar](60) NOT NULL,
	[LastName] [nchar](60) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateCode])
REFERENCES [dbo].[State] ([StateCode])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[CountryContribution]  WITH CHECK ADD  CONSTRAINT [FK_CountryContribution_Contribution] FOREIGN KEY([IdContribution])
REFERENCES [dbo].[Contribution] ([IdContribution])
GO
ALTER TABLE [dbo].[CountryContribution] CHECK CONSTRAINT [FK_CountryContribution_Contribution]
GO
ALTER TABLE [dbo].[CountryContribution]  WITH CHECK ADD  CONSTRAINT [FK_CountryContribution_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[CountryContribution] CHECK CONSTRAINT [FK_CountryContribution_Country]
GO
ALTER TABLE [dbo].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentType] FOREIGN KEY([IdPayment])
REFERENCES [dbo].[PaymentType] ([IdPayment])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status1] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Contribution] FOREIGN KEY([IdContribution])
REFERENCES [dbo].[Contribution] ([IdContribution])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Contribution]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Paypal]  WITH CHECK ADD  CONSTRAINT [FK_Paypal_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Paypal] CHECK CONSTRAINT [FK_Paypal_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Offer1] FOREIGN KEY([IdOffer])
REFERENCES [dbo].[Offer] ([IdOffer])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Offer1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([CodeSupplier])
REFERENCES [dbo].[Supplier] ([CodeSupplier])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[ProductEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_ProductEvaluation_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[ProductEvaluation] CHECK CONSTRAINT [FK_ProductEvaluation_Product]
GO
ALTER TABLE [dbo].[ProductEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_ProductEvaluation_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[ProductEvaluation] CHECK CONSTRAINT [FK_ProductEvaluation_User]
GO
ALTER TABLE [dbo].[ProductUser]  WITH CHECK ADD  CONSTRAINT [FK_ProductUser_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[ProductUser] CHECK CONSTRAINT [FK_ProductUser_Product]
GO
ALTER TABLE [dbo].[ProductUser]  WITH CHECK ADD  CONSTRAINT [FK_ProductUser_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[ProductUser] CHECK CONSTRAINT [FK_ProductUser_User]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Order]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_User]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order] FOREIGN KEY([CurrentOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Order]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_User]
GO
ALTER TABLE [dbo].[SupplierEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_SupplierEvaluation_Supplier] FOREIGN KEY([CodeSupplier])
REFERENCES [dbo].[Supplier] ([CodeSupplier])
GO
ALTER TABLE [dbo].[SupplierEvaluation] CHECK CONSTRAINT [FK_SupplierEvaluation_Supplier]
GO
ALTER TABLE [dbo].[SupplierEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_SupplierEvaluation_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[SupplierEvaluation] CHECK CONSTRAINT [FK_SupplierEvaluation_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Country]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Status] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Status]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TypeId] FOREIGN KEY([IdTypeId])
REFERENCES [dbo].[TypeId] ([IdTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TypeId]
GO
/****** Object:  StoredProcedure [dbo].[CreateCategory]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCategory]
--Parameters
@name nchar(30)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Category] (Name) VALUES (@name);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateCity]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateCity]
	-- parameters
	@cityCode int,
	@name nchar(30),
	@stateCode int
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	INSERT INTO [dbo].[City] (CityCode,Name,StateCode) VALUES (@cityCode,@name,@stateCode);
END

GO
/****** Object:  StoredProcedure [dbo].[CreateContribution]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateContribution]
--Parameters
@detail nchar(20),
@contributionPercent real
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Contribution] (Detail,ContributionPercent) VALUES (@detail,@contributionPercent); 
END




GO
/****** Object:  StoredProcedure [dbo].[CreateCountry]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateCountry]
	-- parameters
	@countryCode int,
	@name nchar(30)
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	INSERT INTO [dbo].[Country] (CountryCode,Name) VALUES (@countryCode,@name);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateCreditCard]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateCreditCard]
	-- parameters
	@creditCardId bigint,
	@expirationDate date,
	@idUser int,
	@checkBank bit
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	INSERT INTO [dbo].[CreditCard] (CreditCardId,ExpirationDate,CheckBank,IdUser) VALUES (@creditCardId,@expirationDate,@checkBank,@idUser);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateEvent]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateEvent]
	-- parameters
	@detail nchar(100),
	@timer datetime,
	@idUser int
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	INSERT INTO [dbo].[Event] (Detail,Timer,IdUser) VALUES (@detail,@timer,@idUser);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateOffer]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOffer]
--Parameters
@name nchar(50),
@detail nchar(150),
@dateStart datetime,
@dateEnd datetime,
@percentageOffer real
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Offer] (Name,Detail,DateStart,DateEnd,PercentageOffer ) VALUES (@name,@detail,@dateStart,@dateEnd,@percentageOffer); 
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrder]
--Parameters
@dateOrder date,
@total real,
@idStatus  tinyint,
@idPayment tinyint
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Order] (DateOrder,IdStatus, IdPayment,Total) VALUES (@dateOrder,@idStatus,@idPayment,@total); 
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[CreateOrderDetail]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrderDetail]
--Parameters
@quantity int,
@subTotal float,
@observation nchar(100),
@discount float
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[OrderDetail] (Quantity,SubTotal,Observation,Discount ) VALUES (@quantity,@subTotal,@observation,@discount); 
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[CreatePaymentType]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePaymentType]
--Parameters
@idPayment tinyint,
@detail nchar(20)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[PaymentType] (IdPayment,Detail) VALUES (@idPayment,@detail);
END


SET ANSI_NULLS ON

GO
/****** Object:  StoredProcedure [dbo].[CreatePayPal]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePayPal]
--Parameters
@idUser int,
@idPaypal nchar(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Paypal] (IdPaypal,IdUser) VALUES (@idPaypal,@idUser);
END


SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateProduct]
--Parameters
@name nchar(30),
@detail nchar(200),
@idCategory int,
@codeSupplier int,
@quantity int,
@unitPrice float
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Product] (Name,Detail,IdCategory,CodeSupplier,Quantity,UnitPrice) VALUES (@name,@detail,@idCategory,@codeSupplier,@quantity,@unitPrice); 
END


SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[CreateProductEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateProductEvaluation]
	-- parameters
	@idUser int,
	@idProduct int,
	@score nchar(10)
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	INSERT INTO [dbo].[ProductEvaluation] (Score,IdUser,IdProduct) VALUES (@score,@idUser,@idProduct);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateProductUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateProductUser]
--Parameters
@idproduct int,
@iduser int

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[ProductUser] (IdProduct,Iduser) VALUES (@idproduct,@iduser);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRole]
--Parameters

@detail nchar(20)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Role] (Detail) VALUES (@detail);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateShipment]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateShipment]
--Parameters
@idOrder int,
@idUser int,
@CodeSupplier int,
@idStatus tinyint,
@shipmentDate date,
@arrivingDate date


AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Shipment] (IdOrder,IdUser,CodeSupplier,IdStatus,ShipmentDate,ArrivingDate ) VALUES (@idOrder,@idUser,@CodeSupplier,@idStatus,@shipmentDate,@arrivingDate); 
END



GO
/****** Object:  StoredProcedure [dbo].[CreateState]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateState]
--Parameters
@name nchar(30),
@countryCode int,
@stateCode int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[State] (StateCode,Name,CountryCode ) VALUES (@stateCode,@name,@countryCode); 
END



GO
/****** Object:  StoredProcedure [dbo].[CreateStatus]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateStatus]
--Parameters
@detail nchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[Status] (Detail) VALUES (@detail); 
END



GO
/****** Object:  StoredProcedure [dbo].[CreateSupplier]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateSupplier]
	-- parameters
	@codeSupplier int,
	@idUser int,
	@companyName nchar(30),
	@note nchar(100),
	@discount real,
	@currentOrder int
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	INSERT INTO [dbo].[Supplier] (CodeSupplier,IdUser,CompanyName,Note,Discount,CurrentOrder) 
	VALUES (@codeSupplier,@idUser,@companyName,@note,@discount,@currentOrder);
END



GO
/****** Object:  StoredProcedure [dbo].[CreateSupplierEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateSupplierEvaluation]
--Parameters
@codeSupplier int,
@idUser int,
@score int

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[SupplierEvaluation] (CodeSupplier,IdUser,Score) VALUES (@codeSupplier,@idUser,@score); 
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[CreateTypeId]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTypeId]
--Parameters
@documentType nchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[TypeId] (DocumentType) VALUES (@documentType); 
END



GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]
--Parameters
@idTypeId tinyint,
@userName nchar(40),
@keyWord nchar(40),
@email nchar(50),
@phoneNumber nchar(30),
@idRole tinyint,
@countryCode int,
@idStatus tinyint,
@postalCode tinyint,
@adress nchar (70),
@firstName nchar(60),
@lastName nchar(60)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	INSERT INTO [dbo].[User] (IdTypeid,UserName,KeyWord,Email,PhoneNumber,IdRole,CountryCode,IdStatus,PostalCode,Adress,FirstName,LastName) VALUES (@idTypeId,@userName,@keyWord,@email,@phoneNumber,
@idRole,@countryCode,@idStatus,@postalCode,@adress,@firstName,@lastName); 
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCategory]
--Parameters
@id int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Category] WHERE Id=@id;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteCity]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCity]
--Parameters
@cityCode int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Procedure
	DELETE [dbo].[City] WHERE CityCode=@cityCode;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteContribution]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteContribution]
--Parameters
@idContribution int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Tax] WHERE IdContribution=@idContribution;
END




GO
/****** Object:  StoredProcedure [dbo].[DeleteCountry]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCountry]
--Parameters
@countryCode int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Procedure
	DELETE [dbo].[Country] WHERE CountryCode=@countryCode;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteCreditCard]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCreditCard]
--Parameters
@creditCardId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Procedure
	DELETE [dbo].[CreditCard] WHERE CreditCardId=@creditCardId;
END



GO
/****** Object:  StoredProcedure [dbo].[DeletePaymentType]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePaymentType]
--Parameters
@idPayment tinyint
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[PaymentType] WHERE IdPayment=@idPayment;
END






SET ANSI_NULLS ON




GO
/****** Object:  StoredProcedure [dbo].[DeletePayPal]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePayPal]
--Parameters
@idPaypal int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Paypal] WHERE IdPaypal=@idPaypal;
END






SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
--Parameters
@idProduct int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Product] WHERE IdProduct=@idProduct;
END







SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[DeleteProductEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProductEvaluation]
--Parameters
@id int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[ProductEvaluation] WHERE Id=@id;
END

-------------------------------------------------------





GO
/****** Object:  StoredProcedure [dbo].[DeleteProductUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProductUser]
--Parameters
@idProduct int,
@idUser int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[ProductUser] WHERE IdProduct=@idproduct and IdUser=@idUser;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRole]
--Parameters
@idRole tinyint
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Role] WHERE IdRole=@idRole;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteState]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteState]
--Parameters
@stateCode int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[State] WHERE StateCode=@stateCode;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteStatus]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStatus]
--Parameters
@idStatus int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Status] WHERE IdStatus=@idStatus;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteSupplier]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSupplier]
--Parameters
@codeSupplier int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[Supplier] WHERE CodeSupplier=@codeSupplier;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteSupplierEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSupplierEvaluation]
--Parameters
@codeSupplier int,
@idUser int,
@score int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[SupplierEvaluation] WHERE CodeSupplier=@codeSupplier and IdUser=@idUser;
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteTypeId]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTypeId]
--Parameters
@idTypeId int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[TypeId] WHERE IdTypeId=@idTypeId;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
--Parameters
@idUser int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	DELETE [dbo].[User] WHERE IdUser=@idUser;
END




GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategory]
--Parameters
@id int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Name FROM [dbo].[Category] WHERE Id=@id;
END



GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCity]
	-- parameters
	@cityCode int
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	SELECT Name,StateCode FROM [dbo].[City] WHERE CityCode=@cityCode;
END



GO
/****** Object:  StoredProcedure [dbo].[GetContribution]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContribution]
--Parameters
@idContribution int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Detail,ContributionPercent FROM [dbo].[Tax] WHERE IdContribution=@idContribution;
END



GO
/****** Object:  StoredProcedure [dbo].[GetCountry]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCountry]
	-- parameters
	@countryCode int
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	SELECT Name FROM [dbo].[Country] WHERE CountryCode=@countryCode;
END



GO
/****** Object:  StoredProcedure [dbo].[GetCreditCard]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCreditCard]
	-- parameters
	@creditCardId bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	SELECT ExpirationDate,IdUser,CheckBank FROM [dbo].[CreditCard] WHERE CreditCardId=@creditCardId;
END



GO
/****** Object:  StoredProcedure [dbo].[GetEvent]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEvent]
--Parameters
@idUser int,
@timer1 datetime,
@timer2 datetime

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Detail,Timer FROM [dbo].[Event] WHERE IdUser=@idUser AND Timer>@timer1 AND Timer<@timer2;
END




GO
/****** Object:  StoredProcedure [dbo].[GetOffer]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOffer]
--Parameters
@idOffer int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Name,Detail,DateStart,DateEnd,PercentageOffer FROM [dbo].[Offer] WHERE IdOffer=@idOffer;
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetOrder]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrder]
--Parameters
@idOrder int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT IdStatus,IdPayment,DateOrder,Total FROM [dbo].[Order] WHERE IdOrder=@idOrder;
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetPaymentType]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentType]
--Parameters
@idPayment tinyint
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Detail FROM [dbo].[PaymentType] WHERE IdPayment=@idPayment
END


SET ANSI_NULLS ON

GO
/****** Object:  StoredProcedure [dbo].[GetPayPal]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPayPal]
--Parameters
@idUser nchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT IdPaypal FROM [dbo].[PayPal] WHERE IdUser=@idUser
END


SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProduct]
--Parameters
@idProduct int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Name,Detail,IdCategory,CodeSupplier,Quantity,UnitPrice FROM [dbo].[Product] WHERE IdProduct=@idProduct;
END


SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetProductEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductEvaluation]
--Parameters
@idProduct int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT AVG(Score) Score FROM [dbo].[ProductEvaluation] WHERE IdProduct=@idProduct;
END



SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetProductUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductUser]
--Parameters
@idUser int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT IdProduct FROM [dbo].[ProductUser] WHERE IdUser=@idUser;
END



GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRole]
--Parameters
@idRole tinyint
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Detail FROM [dbo].[Role] WHERE IdRole=@idRole;
END



GO
/****** Object:  StoredProcedure [dbo].[GetShipment]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetShipment]
--Parameters
@idShipment int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT IdOrder,IdUser,CodeSupplier,IdStatus,ShipmentDate,ArrivingDate FROM [dbo].[Shipment] WHERE IdShipment=@idShipment;
END



GO
/****** Object:  StoredProcedure [dbo].[GetState]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetState]
--Parameters
@stateCode int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Name,CountryCode FROM [dbo].[State] WHERE StateCode=@stateCode;
END



GO
/****** Object:  StoredProcedure [dbo].[GetStatus]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStatus]
--Parameters
@idStatus int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT Detail FROM [dbo].[Status] WHERE IdStatus=@idStatus;
END



GO
/****** Object:  StoredProcedure [dbo].[GetSupplier]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSupplier]
--Parameters
@codeSupplier int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT IdUser,CompanyName,Note,Discount,CurrentOrder FROM [dbo].[Supplier] WHERE CodeSupplier=@codeSupplier;

END



SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetSupplierEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSupplierEvaluation]
--Parameters
@codeSupplier int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT AVG(Score) Score FROM [dbo].[SupplierEvaluation] WHERE CodeSupplier=@codeSupplier;
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[GetTypeId]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTypeId]
--Parameters
@idTypeId int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT DocumentType FROM [dbo].[TypeId] WHERE IdTypeId=@idTypeId;
END




GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUser]
--Parameters
@idUser int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	SELECT IdTypeid,UserName,KeyWord,Email,PhoneNumber,IdRole,CountryCode,IdStatus,PostalCode,Adress,FirstName,LastName FROM [dbo].[User] WHERE IdUser=@idUser;
END





GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategory]
--Parameters
@id int,
@name nchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Category] SET Name=@name WHERE Id=@id;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateCity]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateCity]
	-- parameters
	@cityCode int,
	@name nchar(30),
	@stateCode int
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	UPDATE [dbo].[City] SET Name=@name,StateCode=@stateCode WHERE CityCode=@cityCode;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateContribution]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateContribution]
--Parameters
@idContribution int,
@detail nchar(20),
@contributionPercent real
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Contribution] SET Detail=@detail,ContributionPercent=@contributionPercent WHERE IdContribution=@idContribution;
END




GO
/****** Object:  StoredProcedure [dbo].[UpdateCountry]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateCountry]
	-- parameters
	@countryCode int,
	@name nchar(30)
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	UPDATE [dbo].[Country] SET Name=@name WHERE CountryCode=@countryCode;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateCreditCard]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateCreditCard]
	-- parameters
	@creditCardId bigint,
	@expirationDate date,
	@idUser int,
	@checkBank bit
AS
BEGIN
	SET NOCOUNT ON;

    -- procedure
	UPDATE [dbo].[CreditCard] SET ExpirationDate=@expirationDate,CheckBank=@checkBank WHERE CreditCardId=@creditCardId;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrder]
--Parameters
@idOrder int,
@idStatus tinyint,
@idPayment int,
@dateOrder date,
@total float

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Order] SET DateOrder=@dateOrder,Total=@total,IdPayment=@idPayment,IdStatus=@idStatus WHERE IdOrder=@idOrder;
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[UpdatePaymentType]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePaymentType]
--Parameters
@idPayment tinyint,
@detail nchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[PaymentType] SET Detail=@detail WHERE IdPayment=@idPayment;
END

SET ANSI_NULLS ON

GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
--Parameters
@idProduct int,
@name nchar(30),
@detail nchar(200),
@idCategory int,
@codeSupplier int,
@quantity int,
@unitPrice float,
@idOffer int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Product] SET Name=@name,Detail=@detail,IdCategory=@idCategory,CodeSupplier=@codeSupplier,Quantity=@quantity, UnitPrice=@unitPrice, IdOffer=@idOffer WHERE IdProduct=@idProduct;
END

SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[UpdateProductEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductEvaluation]
--Parameters
@score nchar(10),
@idProduct int,
@idUser int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[ProductEvaluation] SET Score=@score WHERE IdProduct=@idProduct AND IdUser=@idUser;
END


SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[UpdateRole]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRole]
--Parameters
@idRole tinyint,
@detail nchar(20)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Role] SET Detail=@detail WHERE IdRole=@idRole;
END




GO
/****** Object:  StoredProcedure [dbo].[UpdateShipment]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateShipment]
--Parameters
@idShipment int,
@idOrder int,
@idUser int,
@codeSupplier int,
@idStatus tinyint,
@shipmentDate date,
@arrivingDate date
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Shipment] SET IdOrder=@idOrder,IdUser=@idUser,CodeSupplier=@codeSupplier,IdStatus=@idStatus,ShipmentDate=@shipmentDate,ArrivingDate=@arrivingDate WHERE IdShipment=@idShipment;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateState]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateState]
--Parameters
@stateCode int,
@name nchar(30),
@countryCode int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[State] SET Name=@name,CountryCode=@countryCode WHERE StateCode=@stateCode;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatus]
--Parameters
@idStatus int,
@detail nchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Status] SET Detail=@detail WHERE IdStatus=@idStatus;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplier]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplier]
--Parameters
@codeSupplier int,
@companyName nchar(50),
@idUser int,
@note tinyint,
@discount real,
@currentOrder int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[Supplier] SET CompanyName=@companyName,IdUser=@idUser, Note=@note,Discount=@discount,CurrentOrder=@currentOrder WHERE CodeSupplier=@codeSupplier;
END


SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplierEvaluation]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplierEvaluation]
--Parameters
@codeSupplier int,
@idUser int,
@score int
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[SupplierEvaluation] SET Score=@score WHERE CodeSupplier=@codeSupplier AND IdUser=@idUser;
END
SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[UpdateTypeId]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTypeId]
--Parameters
@idTypeId int,
@documentType nchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[TypeId] SET DocumentType=@documentType WHERE IdTypeId=@idTypeId;
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 28/03/2016 0:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
--Parameters
@idUser int,
@idTypeId tinyint,
@userName nchar(40),
@keyWord nchar(40),
@email nchar(50),
@phoneNumber nchar(30),
@idRole tinyint,
@countryCode int,
@idStatus tinyint,
@postalCode tinyint,
@adress nchar (70),
@firstName nchar(60),
@lastName nchar(60)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Procedure
	UPDATE [dbo].[User] SET IdTypeid=@idTypeId, UserName=@userName, KeyWord=@keyWord, Email=@email, PhoneNumber=@phoneNumber, IdRole=@idRole, CountryCode=@countryCode,
	 IdStatus=@idStatus, PostalCode=@postalCode, Adress=@adress, FirstName=@firstName, LastName=@lastName WHERE IdUser=@idUser;
END


GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
