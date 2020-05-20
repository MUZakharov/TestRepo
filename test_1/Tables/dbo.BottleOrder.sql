SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BottleOrder](
	[BottleOrder] [int] NULL,
	[ClientID] [int] NULL,
	[ContactName] [varchar](100) NULL,
	[ProjectID] [int] NULL,
	[ShipDate] [datetime2](7) NULL
) ON [PRIMARY]

GO
