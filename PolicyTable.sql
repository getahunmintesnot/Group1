CREATE TABLE [dbo].[policytable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[POLICYNUMBER] [nvarchar](20) NULL,
	[POLICYEFFECTIVEDATE] [datetime] NOT NULL,
	[POLICYEXPIREDATE] [datetime] NULL,
	[PAYMENTOPTION] [varchar](100) NOT NULL,
	[TOTALAMOUNT] [float] NOT NULL,
	[ACTIVE] [bit] NULL,
	[ADDITIONALINFO] [text] NULL,
	[CREATEDDATE] [datetime] NOT NULL
	)