USE [master]
GO
/****** Object:  Database [carinsurancecompany]    Script Date: 10/4/2016 12:15:51 PM ******/
CREATE DATABASE [carinsurancecompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'carinsurancecompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2016\MSSQL\DATA\carinsurancecompany.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'carinsurancecompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2016\MSSQL\DATA\carinsurancecompany_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [carinsurancecompany] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [carinsurancecompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [carinsurancecompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [carinsurancecompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [carinsurancecompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [carinsurancecompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [carinsurancecompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [carinsurancecompany] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [carinsurancecompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [carinsurancecompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [carinsurancecompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [carinsurancecompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [carinsurancecompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [carinsurancecompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [carinsurancecompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [carinsurancecompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [carinsurancecompany] SET  ENABLE_BROKER 
GO
ALTER DATABASE [carinsurancecompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [carinsurancecompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [carinsurancecompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [carinsurancecompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [carinsurancecompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [carinsurancecompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [carinsurancecompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [carinsurancecompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [carinsurancecompany] SET  MULTI_USER 
GO
ALTER DATABASE [carinsurancecompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [carinsurancecompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [carinsurancecompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [carinsurancecompany] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [carinsurancecompany] SET DELAYED_DURABILITY = DISABLED 
GO
USE [carinsurancecompany]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_ID] [int] NOT NULL,
	[Duedate] [datetime] NOT NULL,
	[minimumpayment] [float] NOT NULL,
	[createddate] [datetime] NOT NULL,
	[balance] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoverageTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoverageTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CoverageName] [varchar](max) NOT NULL,
	[CoverageGroup] [varchar](50) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[IsPolicyCoverage] [bit] NOT NULL,
	[IsVehicleCoverage] [bit] NOT NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Driver_TrafficViolation_Record]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver_TrafficViolation_Record](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Driver_ID] [int] NULL,
	[TrafficViolationCodeID] [int] NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DriverAddressTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverAddressTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Driver_ID] [int] NULL,
	[Address] [varchar](100) NOT NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zipcode] [varchar](20) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[ISItGarageAddress] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DriverLicense]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverLicense](
	[DriverLicenseID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
	[LicenseIssuedState] [varchar](20) NOT NULL,
	[LicenseIssuedDate] [date] NOT NULL,
	[LiceneNumber] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LicenseExpirationDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverLicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DriverTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_ID] [int] NULL,
	[Title] [varchar](10) NULL,
	[Firstname] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[MiddleInitial] [char](1) NULL,
	[DOB] [datetime] NOT NULL,
	[EmailAddress] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[CellNumber] [varchar](20) NULL,
	[SSN] [varchar](12) NOT NULL,
	[ISprimaryPolicyHolder] [bit] NOT NULL,
	[RelationWithPrimaryPlolicy] [varchar](50) NOT NULL,
	[Gender] [varchar](10) NULL,
	[MaritalStatus] [varchar](20) NULL,
	[createddate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paymenttable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paymenttable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Bill_ID] [int] NOT NULL,
	[PaidDate] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[PaymentMethod] [varchar](100) NULL,
	[PayerFirstName] [varchar](50) NULL,
	[PayerLastName] [varchar](50) NULL,
	[CardNumber] [varchar](50) NULL,
	[ZipCode] [varchar](10) NULL,
	[CardexpireDate] [varchar](10) NULL,
	[Cardtype] [varchar](20) NULL,
	[DebitOrCredit] [varchar](50) NULL,
	[BankName] [varchar](100) NULL,
	[AccountNumber] [varchar](20) NULL,
	[RoutingNumber] [varchar](20) NULL,
	[CheckNumber] [varchar](20) NULL,
	[CheckImage] [image] NULL,
	[AdditionalInfo] [text] NULL,
	[createdetdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Policy_Coverage]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy_Coverage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_Id] [int] NOT NULL,
	[Coverage_Id] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[createdDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PolicyEditLogTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PolicyEditLogTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_ID] [int] NOT NULL,
	[EditedTableName] [varchar](50) NOT NULL,
	[EditedDate] [datetime] NOT NULL,
	[Editedby] [varchar](50) NOT NULL,
	[AdditionalInfo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[policytable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[policytable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[POLICYNUMBER] [nvarchar](20) NULL,
	[POLICYEFFECTIVEDATE] [datetime] NOT NULL,
	[POLICYEXPIREDATE] [datetime] NULL,
	[PAYMENTOPTION] [varchar](100) NOT NULL,
	[TOTALAMOUNT] [float] NOT NULL,
	[ACTIVE] [bit] NULL,
	[ADDITIONALINFO] [text] NULL,
	[CREATEDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[salary]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[salary](
	[id] [int] NULL,
	[name] [varchar](20) NULL,
	[salary] [money] NULL,
	[pension] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sales]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salesagent] [varchar](20) NULL,
	[gender] [varchar](20) NULL,
	[state] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[salesamount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[salry2]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[salry2](
	[id] [int] NULL,
	[name] [varchar](20) NULL,
	[salery] [money] NOT NULL,
	[pension] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrafficViolationCodeTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrafficViolationCodeTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrafficViolationQuestion] [varchar](max) NULL,
	[TrafficViolationCode] [varchar](10) NOT NULL,
	[TrafficViolationPoint] [float] NOT NULL,
	[Codedescription] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicle_Coverage]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Coverage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle_Id] [int] NOT NULL,
	[Coverage_Id] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_DriverTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_DriverTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle_ID] [int] NOT NULL,
	[Driver_ID] [int] NOT NULL,
	[DriverForBusinessPurpose] [bit] NOT NULL,
	[IsPrimaryDriver] [bit] NOT NULL,
	[EverydayMileage] [int] NOT NULL,
	[Createddate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicletable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicletable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Policy_ID] [int] NOT NULL,
	[year] [char](4) NOT NULL,
	[Make] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Color] [varchar](50) NULL,
	[Trim] [varchar](50) NULL,
	[Mileage] [int] NOT NULL,
	[VINnumber] [varchar](50) NOT NULL,
	[VehicleNumberPlate] [varchar](20) NOT NULL,
	[Vehicleregisteredstate] [varchar](20) NOT NULL,
	[createddate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vpolicyholderwithvehicledetails]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vpolicyholderwithvehicledetails]
as
select Firstname,LastName,POLICYNUMBER,Make,model,[year],Mileage,VINnumber,VehicleNumberPlate,Vehicleregisteredstate
from DriverTable
join policytable
on DriverTable.Policy_ID=policytable.ID
join Vehicletable on Vehicletable.Policy_ID=policytable.ID
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([Policy_ID])
REFERENCES [dbo].[policytable] ([ID])
GO
ALTER TABLE [dbo].[Driver_TrafficViolation_Record]  WITH CHECK ADD FOREIGN KEY([Driver_ID])
REFERENCES [dbo].[DriverTable] ([ID])
GO
ALTER TABLE [dbo].[Driver_TrafficViolation_Record]  WITH CHECK ADD FOREIGN KEY([TrafficViolationCodeID])
REFERENCES [dbo].[TrafficViolationCodeTable] ([ID])
GO
ALTER TABLE [dbo].[DriverAddressTable]  WITH CHECK ADD FOREIGN KEY([Driver_ID])
REFERENCES [dbo].[DriverTable] ([ID])
GO
ALTER TABLE [dbo].[DriverLicense]  WITH CHECK ADD FOREIGN KEY([DriverID])
REFERENCES [dbo].[DriverTable] ([ID])
GO
ALTER TABLE [dbo].[DriverTable]  WITH CHECK ADD FOREIGN KEY([Policy_ID])
REFERENCES [dbo].[policytable] ([ID])
GO
ALTER TABLE [dbo].[paymenttable]  WITH CHECK ADD FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([ID])
GO
ALTER TABLE [dbo].[Policy_Coverage]  WITH CHECK ADD FOREIGN KEY([Coverage_Id])
REFERENCES [dbo].[CoverageTable] ([ID])
GO
ALTER TABLE [dbo].[Policy_Coverage]  WITH CHECK ADD FOREIGN KEY([Policy_Id])
REFERENCES [dbo].[policytable] ([ID])
GO
ALTER TABLE [dbo].[PolicyEditLogTable]  WITH CHECK ADD FOREIGN KEY([Policy_ID])
REFERENCES [dbo].[policytable] ([ID])
GO
ALTER TABLE [dbo].[Vehicle_Coverage]  WITH CHECK ADD FOREIGN KEY([Coverage_Id])
REFERENCES [dbo].[CoverageTable] ([ID])
GO
ALTER TABLE [dbo].[Vehicle_Coverage]  WITH CHECK ADD FOREIGN KEY([Vehicle_Id])
REFERENCES [dbo].[Vehicletable] ([ID])
GO
ALTER TABLE [dbo].[Vehicle_DriverTable]  WITH CHECK ADD FOREIGN KEY([Driver_ID])
REFERENCES [dbo].[DriverTable] ([ID])
GO
ALTER TABLE [dbo].[Vehicle_DriverTable]  WITH CHECK ADD FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Vehicletable] ([ID])
GO
ALTER TABLE [dbo].[Vehicletable]  WITH CHECK ADD FOREIGN KEY([Policy_ID])
REFERENCES [dbo].[policytable] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[insertinto_policytable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertinto_policytable]

@policynumber nvarchar(20),
@policyeffectivedate datetime,
@policyexpiredate datetime,
@paymentoption varchar (100),
@totalamount float,
@active bit,
@additionalinfo text,
@createddate datetime
as
begin
  
  insert into policytable 
  values(@policynumber,@policyeffectivedate,@policyexpiredate,@paymentoption,@totalamount,@active,@additionalinfo,@createddate)

end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_BillTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_insertinto_BillTable]
@polic_ID int,
@duedate datetime,
@minimumpayment float,
@createddate datetime,
@balance int,
@status nvarchar 
as
begin
   insert into Bill values(@polic_ID,@duedate,@minimumpayment,@createddate,@balance,@status)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertInto_CoverageTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertInto_CoverageTable]
@CoverageName varchar(max) ,
@CoverageGroup varchar(50) ,
@Code varchar(20) ,
@IsPolicyCoverage bit ,
@IsVehicleCoverage bit ,
@Description varchar(max)
as 
begin
  insert into coveragetable values(@CoverageName,
@CoverageGroup  ,
@Code  ,
@IsPolicyCoverage,
@IsVehicleCoverage  ,
@Description )
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_Driver_TrafficViolation_Record]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertinto_Driver_TrafficViolation_Record]
@driverid int ,
@TrafficViolationCodeID int,
@Active bit
as 
begin
   insert into Driver_TrafficViolation_Record values(@driverid,@TrafficViolationCodeID,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_DriverAddresstable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertinto_DriverAddresstable]
@Driver_ID int ,
@Address varchar(100) ,
@Address2 varchar(100),
@City Varchar(100),
@State varchar(50),
@Zipcode varchar(20),
@Country varchar(100),
@ISItGarageAddress bit 
as 
begin
insert into DriverAddressTable values(@driver_ID,@Address,@Address2,@City,@State,@Zipcode,@Country,@ISItGarageAddress)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_DriverTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertinto_DriverTable]

@Policy_ID int,
@Title varchar (10),
@Firstname varchar(50) ,
@LastName varchar(50) ,
@MiddleInitial char(1),
@DOB datetime ,
@EmailAddress varchar(100),
@PhoneNumber varchar(20) ,
@CellNumber varchar(20),
@SSN varchar(12) ,
@LicenseIssueddate date ,
@LicenseIssuedstate varchar(50) ,
@LicenseNumber varchar(20) ,
@ISprimaryPolicyHolder bit ,
@RelationWithPrimaryPlolicy varchar(50),
@Gender varchar(10),
@MaritalStatus varchar(20),
@createddate datetime ,
@Active bit 
as 
begin
   insert into DriverTable values(
@Policy_ID ,
@Title ,
@Firstname  ,
@LastName  ,
@MiddleInitial ,
@DOB ,
@EmailAddress,
@PhoneNumber  ,
@CellNumber ,
@SSN  ,
@LicenseIssueddate  ,
@LicenseIssuedstate  ,
@LicenseNumber  ,
@ISprimaryPolicyHolder  ,
@RelationWithPrimaryPlolicy,
@Gender ,
@MaritalStatus ,
@createddate  ,
@Active )
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertInto_paymentyable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertInto_paymentyable]
@bill_ID int,
@paiddate datetime,
@amount float,
@paymentmethod varchar(100),
@payerfirstname varchar(50),
@payerLastName varchar(50),
@Cardnumber varchar(50),
@Zipcode varchar(10),
@CardexpireDate varchar(10),
@Cardtype varchar(20),
@DebitOrCredit varchar(50),
@BankName varchar(100),
@AccountNumber varchar(20),
@RoutingNumber varchar(20),
@CheckNumber varchar(20),
@CheckImage image,
@AdditionalInfo text,
@createdetdate datetime 
as 
begin
   insert into paymenttable values(@bill_ID ,
@paiddate ,
@amount ,
@paymentmethod ,
@payerfirstname ,
@payerLastName ,
@Cardnumber ,
@Zipcode ,
@CardexpireDate ,
@Cardtype ,
@DebitOrCredit ,
@BankName ,
@AccountNumber ,
@RoutingNumber ,
@CheckNumber ,
@CheckImage ,
@AdditionalInfo,
@createdetdate  )
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_policyeditlogtable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertinto_policyeditlogtable]
@policy_ID int,
@editedtablename varchar (50),
@editedDate datetime,
@editedby varchar(50),
@Additionalinfo text
as 
begin 
    insert into PolicyEditLogTable values(@policy_ID,@editedtablename,@editedDate,@editedby,@Additionalinfo)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_Trafficviolationcodetable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertinto_Trafficviolationcodetable]
@TrafficViolationQuestion varchar(max),
@TrafficViolationCode varchar(10),
@TrafficViolationPoint float ,
@Codedescription varchar(max)
as 
begin 
 insert into TrafficViolationCodeTable values(@TrafficViolationQuestion,@TrafficViolationCode,@TrafficViolationPoint,@Codedescription)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_Vehicle_DriverTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_insertinto_Vehicle_DriverTable]
@Vehicle_ID int ,
@Driver_ID int ,
@DriverForBusinessPurpose bit,
@IsPrimaryDriver bit,
@EverydayMileage int,
@Createddate datetime,
@Active bit
as 
begin
  insert into Vehicle_DriverTable values(@Vehicle_ID  ,
@Driver_ID  ,
@DriverForBusinessPurpose ,
@IsPrimaryDriver ,
@EverydayMileage,
@Createddate ,
@Active )
end
GO
/****** Object:  StoredProcedure [dbo].[usp_insertinto_Vehicletable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_insertinto_Vehicletable]
@Policy_ID int ,
@year char(4) ,
@Make varchar(50),
@Model varchar(50) ,
@Color varchar(50),
@Trim varchar(50),
@Mileage int ,
@VINnumber varchar(50),
@VehicleNumberPlate varchar(20) ,
@Vehicleregisteredstate varchar(20) ,
@createddate datetime ,
@Active bit 
as
begin
  insert into Vehicletable values(@Policy_ID ,
@year ,
@Make ,
@Model ,
@Color ,
@Trim ,
@Mileage ,
@VINnumber ,
@VehicleNumberPlate ,
@Vehicleregisteredstate ,
@createddate ,
@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[USp_UpdateDriverTable]    Script Date: 10/4/2016 12:15:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USp_UpdateDriverTable] --'feleke','kefyalew',5
@firstName varchar(20),
@lastName varchar(20),
@id int
as 
begin
begin tran
 begin tran
  select @@trancount as commitedtransactions
  begin try
  update drivertable set firstname=@firstName, LastName=@lastName
  where id=@id
 select 1/0
 commit tran
 commit tran
 end try
 begin catch
    select ERROR_LINE() as errorline,
	       ERROR_NUMBER() as errorNumber,
		   ERROR_PROCEDURE() as errorprocedure,
		   ERROR_MESSAGE() as erromessage,
		   ERROR_SEVERITY() as errorseverity,
		   ERROR_STATE() as errorstate

    rollback tran
 end catch
 end
GO
USE [master]
GO
ALTER DATABASE [carinsurancecompany] SET  READ_WRITE 
GO
