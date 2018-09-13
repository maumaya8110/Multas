USE [DBancoNac]
GO

/****** Object:  Table [dbo].[Estados]    Script Date: 12/09/2018 10:34:04 p. m. ******/
DROP TABLE [dbo].[Estados]
GO

/****** Object:  Table [dbo].[Estados]    Script Date: 12/09/2018 10:34:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[nomEstado] [varchar](50) NULL,
	[siglasEstado] [varchar](5) NULL,
	[Contacto] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[idLicencia] [varchar](50) NULL,
	[estatusEstado] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


