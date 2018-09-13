USE [DBancoNac]
GO

/****** Object:  Table [dbo].[Municipios]    Script Date: 12/09/2018 10:39:37 p. m. ******/
DROP TABLE [dbo].[Municipios]
GO

/****** Object:  Table [dbo].[Municipios]    Script Date: 12/09/2018 10:39:37 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Municipios](
	[idEstado] [int] NULL,
	[idMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[NomMunicipio] [varchar](50) NULL,
	[SiglasMunicipio] [varchar](5) NULL,
	[Contacto] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[idLicencia] [varchar](50) NULL,
	[EstatusMunicipio] [bit] NULL
) ON [PRIMARY]

GO


