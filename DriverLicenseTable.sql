CREATE TABLE [dbo].[DriverLicense](
	[DriverLicenseID] [int] IDENTITY(1,1) primary key NOT NULL,
	[LicenseID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
	[LicenseIssuedState] [varchar](20) NOT NULL,
	[LicenseIssuedDate] [date] NOT NULL,
	[LiceneNumber] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LicenseExpirationDate] [date] NOT NULL
	)