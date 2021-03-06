USE [DBancoNac]
GO
/****** Object:  Table [dbo].[Agentes]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agentes](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idagente] [int] NULL,
	[Referencia] [nchar](25) NULL,
	[Nombre] [nchar](50) NULL,
	[Apaterno] [nchar](50) NULL,
	[Amaterno] [nchar](50) NULL,
	[Estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[folio] [int] NULL,
	[FechaMov] [datetime] NULL,
	[idproceso] [int] NULL,
	[idusuario] [int] NULL,
	[DescMov] [nchar](100) NULL,
	[Referencia] [nchar](25) NULL,
	[idplaca] [nchar](10) NULL,
	[idlicencia] [nchar](25) NULL,
	[MontoAnterior] [decimal](12, 2) NULL,
	[MontoNuevo] [decimal](12, 2) NULL,
	[idFolPago] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cajeros]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajeros](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idOficina] [int] NULL,
	[idcaja] [int] NULL,
	[idusuario] [int] NULL,
	[ipassword] [nchar](10) NULL,
	[FolioActual] [int] NULL,
	[FolioInicial] [int] NULL,
	[FolioFinal] [int] NULL,
	[UltimoAcceso] [datetime] NULL,
	[Estatuscaja] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [int] NULL,
	[nomEstado] [nchar](50) NULL,
	[siglasEstado] [nchar](5) NULL,
	[Contacto] [nchar](100) NULL,
	[Telefono] [nchar](50) NULL,
	[Correo] [nchar](50) NULL,
	[idLicencia] [nchar](50) NULL,
	[estatusEstado] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funciones]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funciones](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[idVentana] [int] NULL,
	[idFuncion] [int] NULL,
	[NomFuncion] [nchar](25) NULL,
	[estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Multas]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idboleta] [int] NULL,
	[idplaca] [nchar](10) NULL,
	[FolioMulta] [int] NULL,
	[fechaMulta] [datetime] NULL,
	[Calle1Multa] [nchar](50) NULL,
	[Calle2Multa] [nchar](50) NULL,
	[LongitudMulta] [nchar](20) NULL,
	[LatitudMulta] [nchar](20) NULL,
	[Descripcion] [nchar](100) NULL,
	[idAgente] [int] NULL,
	[Nolicencia] [nchar](20) NULL,
	[FechaPago] [datetime] NULL,
	[ReciboPago] [nchar](20) NULL,
	[TotalPago] [decimal](12, 2) NULL,
	[DescuentoPago] [decimal](12, 2) NULL,
	[EstatusMulta] [int] NULL,
	[Capturista] [int] NULL,
	[FechaCancel] [datetime] NULL,
	[Cancelousuario] [int] NULL,
	[TarjetaCirculacion] [nchar](25) NULL,
	[Procesado] [int] NULL,
	[ReferenciaProceso] [nchar](50) NULL,
	[Monto] [decimal](12, 2) NULL,
	[FechaProceso] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultasDetalle]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultasDetalle](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idboleta] [int] NULL,
	[idplaca] [nchar](10) NULL,
	[idmulta] [int] NULL,
	[importemulta] [decimal](12, 2) NULL,
	[estatus] [int] NULL,
	[recibopago] [nchar](20) NULL,
	[fechapago] [datetime] NULL,
	[FolioMulta] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultasTipo]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultasTipo](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idmulta] [int] NULL,
	[Descripcion] [nchar](10) NULL,
	[Cantidad] [int] NULL,
	[DPPMulta] [int] NULL,
	[ApicaDesc] [int] NULL,
	[Estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[NomMunicipio] [nchar](50) NULL,
	[SiglasMunicipio] [nchar](5) NULL,
	[Contacto] [nchar](100) NULL,
	[Telefono] [nchar](50) NULL,
	[Correo] [nchar](50) NULL,
	[idLicencia] [nchar](50) NULL,
	[EstatusMunicipio] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oficinas]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oficinas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idOficina] [int] NULL,
	[DescOficina] [nchar](50) NULL,
	[DireccOficina] [nchar](100) NULL,
	[TelefOficina] [nchar](50) NULL,
	[EstatusOficina] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 02/09/2018 01:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idpersona] [int] NULL,
	[Nombre] [nchar](50) NULL,
	[Apaterno] [nchar](50) NULL,
	[Amaterno] [nchar](50) NULL,
	[Licencia] [nchar](25) NULL,
	[INE] [nchar](25) NULL,
	[Estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Placas]    Script Date: 02/09/2018 01:54:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Placas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[Placa] [nchar](10) NULL,
	[Marca] [nchar](50) NULL,
	[Tipo] [nchar](50) NULL,
	[Modelo] [nchar](10) NULL,
	[Serie] [nchar](50) NULL,
	[Estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procesos]    Script Date: 02/09/2018 01:54:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procesos](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idproceso] [int] NULL,
	[NombreProceso] [nchar](50) NULL,
	[Sistema] [nchar](25) NULL,
	[Ventana] [nchar](25) NULL,
	[Boton] [nchar](25) NULL,
	[Estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seguridad]    Script Date: 02/09/2018 01:54:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seguridad](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[idVentana] [int] NULL,
	[idFuncion] [int] NULL,
	[idusuario] [int] NULL,
	[estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sistemas]    Script Date: 02/09/2018 01:54:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sistemas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[NomSistema] [nchar](25) NULL,
	[estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 02/09/2018 01:54:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idusuario] [int] NULL,
	[Referencia] [nchar](10) NULL,
	[Nombre] [nchar](10) NULL,
	[Apaterno] [nchar](50) NULL,
	[Amaterno] [nchar](50) NULL,
	[iPassword] [nchar](50) NULL,
	[Departamento] [int] NULL,
	[Area] [int] NULL,
	[estatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventanas]    Script Date: 02/09/2018 01:54:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventanas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[idVentana] [int] NULL,
	[NomVentana] [nchar](25) NULL,
	[estatus] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fc030497-c781-4b31-8ad2-ad8d59a22fad', N'Desarrollador')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', N'ricardo.eslava89@gmail.com', 1, N'AL+HxFJAraaM05YzBidN7b9+zC8Xwt/83b6yUyxB77WmQUwNcL+wlsa4wfcZESiEcg==', N'2c1b060b-3c80-4335-8b13-fa08cb11fae0', NULL, 0, 0, NULL, 1, 0, N'ricardo.eslava89@gmail.com')
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
