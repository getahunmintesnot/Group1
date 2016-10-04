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
	[Active] [bit] NOT NULL
	)