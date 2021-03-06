USE [DBancoNac]
GO
/****** Object:  Table [dbo].[Agentes]    Script Date: 16/09/2018 10:40:47 a. m. ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/09/2018 10:40:50 a. m. ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/09/2018 10:40:50 a. m. ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/09/2018 10:40:50 a. m. ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/09/2018 10:40:51 a. m. ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/09/2018 10:40:51 a. m. ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 16/09/2018 10:40:51 a. m. ******/
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
/****** Object:  Table [dbo].[BitacoraCatalogos]    Script Date: 16/09/2018 10:40:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraCatalogos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMovimiento] [int] NULL,
	[idCatalogo] [int] NULL,
	[idUsuario] [int] NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cajeros]    Script Date: 16/09/2018 10:40:51 a. m. ******/
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
/****** Object:  Table [dbo].[Estados]    Script Date: 16/09/2018 10:40:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Funciones]    Script Date: 16/09/2018 10:40:51 a. m. ******/
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
/****** Object:  Table [dbo].[Multas]    Script Date: 16/09/2018 10:40:52 a. m. ******/
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
/****** Object:  Table [dbo].[MultasDetalle]    Script Date: 16/09/2018 10:40:52 a. m. ******/
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
/****** Object:  Table [dbo].[MultasTipo]    Script Date: 16/09/2018 10:40:52 a. m. ******/
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
/****** Object:  Table [dbo].[Municipios]    Script Date: 16/09/2018 10:40:52 a. m. ******/
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
/****** Object:  Table [dbo].[Oficinas]    Script Date: 16/09/2018 10:40:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oficinas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idOficina] [int] IDENTITY(1,1) NOT NULL,
	[DescOficina] [varchar](50) NULL,
	[DireccOficina] [varchar](100) NULL,
	[TelefOficina] [varchar](50) NULL,
	[EstatusOficina] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 16/09/2018 10:40:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apaterno] [varchar](50) NULL,
	[Amaterno] [varchar](50) NULL,
	[Licencia] [varchar](25) NULL,
	[INE] [varchar](25) NULL,
	[Estatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Placas]    Script Date: 16/09/2018 10:40:52 a. m. ******/
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
/****** Object:  Table [dbo].[Procesos]    Script Date: 16/09/2018 10:40:53 a. m. ******/
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
/****** Object:  Table [dbo].[Seguridad]    Script Date: 16/09/2018 10:40:53 a. m. ******/
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
/****** Object:  Table [dbo].[Sistemas]    Script Date: 16/09/2018 10:40:53 a. m. ******/
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
/****** Object:  Table [dbo].[Tbl_Errores]    Script Date: 16/09/2018 10:40:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Errores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exeption] [varchar](max) NULL,
	[userId] [varchar](200) NULL,
	[message] [varchar](max) NULL,
	[dateExc] [datetime] NULL,
	[IP] [varchar](100) NULL,
	[maquina] [varchar](50) NULL,
	[url] [varchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/09/2018 10:40:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[Referencia] [nchar](10) NULL,
	[Nombre] [varchar](20) NULL,
	[Apaterno] [varchar](50) NULL,
	[Amaterno] [varchar](50) NULL,
	[iPassword] [nchar](50) NULL,
	[Departamento] [int] NULL,
	[Area] [nchar](50) NULL,
	[Email] [nchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[estatus] [int] NULL,
	[userId] [varchar](128) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosVentana]    Script Date: 16/09/2018 10:40:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosVentana](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idVentana] [int] NULL,
	[estatus] [bit] NULL,
	[usrCrtd] [varchar](200) NULL,
	[dateCrtd] [datetime] NULL,
	[usrMod] [varchar](200) NULL,
	[dateMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventanas]    Script Date: 16/09/2018 10:40:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventanas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[idVentana] [int] IDENTITY(1,1) NOT NULL,
	[NomVentana] [varchar](25) NULL,
	[URL] [varchar](500) NULL,
	[estatus] [bit] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fc030497-c781-4b31-8ad2-ad8d59a22fad', N'Desarrollador')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16c3859c-b83a-493c-b891-8e074cb1dde0', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'611493d3-04d4-412a-9b33-dc7791888111', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a828a0d8-793b-4379-a0a8-4170ea5023e2', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ad9132d2-7d62-49ff-99eb-2fd3072c377e', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba3f83bf-f36f-463e-9661-c4ac53ff11de', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f85f8536-4286-46c0-b6b9-e8aaa74c1f1e', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', N'tabata.cavazos@gmail.com', 0, N'AMqYtOKenIc3wm0aEN691M/6J9rKdIV0MLR8lXltTwcB3L0weOocAgBzRThzdg2JUg==', N'1b634f83-f86e-422f-8b88-55d0c452a213', NULL, 0, 0, NULL, 1, 0, N'Tabata')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a828a0d8-793b-4379-a0a8-4170ea5023e2', N'ricardo2.eslava89@gmail.com', 0, N'AG/AJtNyEV8bWEigrq4AxsBUhKmaFnk3saDbNYIBkDfHgb6Y50bIM6+zDq3q/2tQSA==', N'76da7e04-69ee-4db2-b026-cd713ffe49ed', NULL, 0, 0, NULL, 1, 0, N'ricardin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ba3f83bf-f36f-463e-9661-c4ac53ff11de', N'fulanito@usuario.com', 0, N'AKW/xsIdIQ/vUU8br4Nj/Lkoq70G17aY9IPv3YS2owwg9dMEyvWgJvV8OpUwljEh7g==', N'c3bd1e7f-1a67-4c5e-82b2-9694a8ae9d1d', NULL, 0, 0, NULL, 1, 0, N'fulanito')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', N'ricardo.eslava89@gmail.com', 1, N'AL+HxFJAraaM05YzBidN7b9+zC8Xwt/83b6yUyxB77WmQUwNcL+wlsa4wfcZESiEcg==', N'2c1b060b-3c80-4335-8b13-fa08cb11fae0', NULL, 0, 0, NULL, 1, 0, N'ricardo.eslava89@gmail.com')
SET IDENTITY_INSERT [dbo].[BitacoraCatalogos] ON 

INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (1, 2, 2, 1, CAST(N'2018-09-15T06:21:49.227' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (2, 2, 2, 1, CAST(N'2018-09-15T06:42:58.233' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (3, 2, 2, 1, CAST(N'2018-09-15T06:45:24.940' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (4, 2, 2, 1, CAST(N'2018-09-15T06:47:22.163' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (5, 2, 2, 1, CAST(N'2018-09-15T06:47:39.040' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (6, 4, 2, 1, CAST(N'2018-09-15T07:23:12.000' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (7, 3, 2, 1, CAST(N'2018-09-15T07:24:32.393' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (8, 2, 2, 1, CAST(N'2018-09-15T08:31:29.567' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (9, 2, 2, 1, CAST(N'2018-09-15T08:33:42.070' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (10, 2, 2, 1, CAST(N'2018-09-15T08:35:47.810' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (11, 4, 2, 1, CAST(N'2018-09-15T08:36:12.310' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (12, 2, 1, 1, CAST(N'2018-09-15T09:25:19.380' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (13, 4, 1, 1, CAST(N'2018-09-15T09:25:51.317' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (14, 4, 1, 1, CAST(N'2018-09-15T09:26:22.223' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (15, 2, 2, 1, CAST(N'2018-09-15T09:31:57.753' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (16, 4, 2, 1, CAST(N'2018-09-15T09:32:18.207' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (17, 4, 2, 1, CAST(N'2018-09-15T09:33:28.727' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (18, 4, 2, 1, CAST(N'2018-09-15T09:35:18.917' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (19, 4, 2, 1, CAST(N'2018-09-15T09:35:42.760' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (20, 2, 5, 1, CAST(N'2018-09-15T21:55:24.820' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (21, 2, 1, 1, CAST(N'2018-09-15T22:08:50.583' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (22, 4, 1, 1, CAST(N'2018-09-15T22:09:08.867' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (23, 3, 1, 1, CAST(N'2018-09-15T22:09:16.710' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (24, 2, 1, 1, CAST(N'2018-09-15T22:12:48.237' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (25, 2, 2, 1, CAST(N'2018-09-15T22:15:48.777' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (26, 4, 2, 1, CAST(N'2018-09-15T22:16:25.090' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (27, 2, 2, 1, CAST(N'2018-09-15T22:50:07.773' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (28, 2, 5, 1, CAST(N'2018-09-15T22:51:54.123' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (29, 4, 5, 1, CAST(N'2018-09-15T23:26:31.300' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (30, 4, 5, 1, CAST(N'2018-09-15T23:56:35.407' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (31, 3, 5, 1, CAST(N'2018-09-16T00:00:41.460' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (32, 2, 5, 1, CAST(N'2018-09-16T00:01:13.400' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (33, 2, 6, 1, CAST(N'2018-09-16T01:28:59.250' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (34, 4, 6, 1, CAST(N'2018-09-16T01:30:13.627' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (35, 3, 6, 1, CAST(N'2018-09-16T01:30:30.283' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (36, 2, 6, 1, CAST(N'2018-09-16T01:45:12.070' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (37, 4, 6, 1, CAST(N'2018-09-16T01:45:24.350' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (38, 4, 3, 1, CAST(N'2018-09-16T02:04:31.130' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (39, 4, 6, 1, CAST(N'2018-09-16T02:10:02.253' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (40, 2, 7, 1, CAST(N'2018-09-16T02:26:30.183' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (41, 2, 7, 1, CAST(N'2018-09-16T02:27:11.233' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (42, 3, 7, 1, CAST(N'2018-09-16T02:27:19.750' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (43, 4, 7, 1, CAST(N'2018-09-16T02:28:46.703' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (44, 4, 7, 1, CAST(N'2018-09-16T02:29:02.860' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (45, 2, 6, 1, CAST(N'2018-09-16T02:39:58.823' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (46, 4, 6, 1, CAST(N'2018-09-16T02:40:18.480' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (47, 4, 1, 1, CAST(N'2018-09-16T02:40:35.670' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (48, 4, 1, 1, CAST(N'2018-09-16T02:41:08.233' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (49, 4, 1, 1, CAST(N'2018-09-16T02:41:18.013' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (50, 2, 3, 1, CAST(N'2018-09-16T05:18:38.453' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (51, 4, 3, 1, CAST(N'2018-09-16T05:19:15.860' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (52, 4, 2, 1, CAST(N'2018-09-16T05:29:00.200' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (53, 4, 1, 1, CAST(N'2018-09-16T05:42:35.153' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (54, 4, 2, 1, CAST(N'2018-09-16T05:56:07.093' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (55, 4, 2, 1, CAST(N'2018-09-16T05:56:52.470' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (56, 4, 2, 1, CAST(N'2018-09-16T05:57:01.610' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (57, 4, 2, 1, CAST(N'2018-09-16T05:57:08.237' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (58, 4, 2, 1, CAST(N'2018-09-16T05:57:11.767' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (59, 4, 2, 1, CAST(N'2018-09-16T05:57:14.533' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (60, 4, 1, 1, CAST(N'2018-09-16T06:04:37.910' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (61, 4, 2, 1, CAST(N'2018-09-16T06:04:53.880' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (62, 2, 7, 1, CAST(N'2018-09-16T06:06:16.413' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (63, 4, 5, 1, CAST(N'2018-09-16T06:08:37.043' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (64, 4, 7, 1, CAST(N'2018-09-16T06:21:41.510' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (65, 3, 7, 1, CAST(N'2018-09-16T06:21:58.980' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (66, 2, 7, 1, CAST(N'2018-09-16T06:22:21.620' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (67, 2, 5, 1, CAST(N'2018-09-16T06:23:06.170' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (68, 4, 5, 1, CAST(N'2018-09-16T06:29:28.313' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (69, 3, 5, 1, CAST(N'2018-09-16T06:29:42.797' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (70, 4, 6, 1, CAST(N'2018-09-16T06:34:13.263' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (71, 2, 3, 1, CAST(N'2018-09-16T06:41:19.810' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (72, 2, 2, 1, CAST(N'2018-09-16T07:05:59.883' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (73, 2, 3, 1, CAST(N'2018-09-16T07:07:01.433' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (74, 4, 2, 1, CAST(N'2018-09-16T07:11:53.897' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (75, 4, 3, 1, CAST(N'2018-09-16T07:30:49.380' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (76, 4, 3, 1, CAST(N'2018-09-16T07:32:42.057' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (77, 4, 3, 1, CAST(N'2018-09-16T07:43:34.127' AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (78, 4, 3, 1, CAST(N'2018-09-16T07:50:17.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[BitacoraCatalogos] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (1, N'AGUASCALIENTES', N'AGS2', N'Gloria Fdz', N'8113856776', N'5462', N'4562', 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (3, N'NUEVO LEON', N'NL', N'TAB', N'324', N'ERWE', N'23', 1)
SET IDENTITY_INSERT [dbo].[Estados] OFF
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio]) VALUES (3, 1, N'Escobedo2', N'Gral2', N'tab2', N'811386776', N'tab3242', N'3242', 1)
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio]) VALUES (3, 2, N'Mi municipio', N'mp', N'Yo mero', N'3232323', N'aguascalientes@com', N'23121', 1)
SET IDENTITY_INSERT [dbo].[Municipios] OFF
SET IDENTITY_INSERT [dbo].[Oficinas] ON 

INSERT [dbo].[Oficinas] ([idEstado], [idMunicipio], [idOficina], [DescOficina], [DireccOficina], [TelefOficina], [EstatusOficina]) VALUES (-1, -1, 2, N'Oficina Central', N'Malvasia 124', N'2343', 1)
SET IDENTITY_INSERT [dbo].[Oficinas] OFF
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([idEstado], [idMunicipio], [idpersona], [Nombre], [Apaterno], [Amaterno], [Licencia], [INE], [Estatus]) VALUES (-1, -1, 1, N'Arturo2', N'Cavazos2', N'Arredondo2', N'234kjb452', N'2', 1)
INSERT [dbo].[Personas] ([idEstado], [idMunicipio], [idpersona], [Nombre], [Apaterno], [Amaterno], [Licencia], [INE], [Estatus]) VALUES (3, 1, 4, N'Sofia', N'Cavazos', N'Fernandez', N'23435fevgb', N'edv434', 1)
SET IDENTITY_INSERT [dbo].[Personas] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (3, 1, 1, N'          ', N'Nuevo', N'Nuevo2', N'Nuevo', N'                                                  ', 1, N'                                                  ', N'11                                                ', N'111', 1, N'c7eee1b2-76c0-42e4-9926-ed4c840374bb')
INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (3, 1, 6, N'          ', N'RICARDO ULISES', N'VENTURA', N'ESLAVA', NULL, 1, N'                                                  ', N'ricardo2.eslava89@gmail.com                       ', N'121212', 1, N'a828a0d8-793b-4379-a0a8-4170ea5023e2')
INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (3, 1, 7, N'          ', N'Tabata', N'Cavazos', N'Fernandez', NULL, 1, N'                                                  ', N'tabata.cavazos@gmail.com                          ', N'8113856776', 1, N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd')
INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (1, 2, 8, N'          ', N'Fulanito', N'Contento', N'Abril', NULL, 1, N'                                                  ', N'fulanito@usuario.com                              ', N'12345', 1, N'ba3f83bf-f36f-463e-9661-c4ac53ff11de')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[Ventanas] ON 

INSERT [dbo].[Ventanas] ([idEstado], [idMunicipio], [idsistema], [idVentana], [NomVentana], [URL], [estatus]) VALUES (3, 1, 0, 2, N'ABC2', N'Administrador/Catalogos.aspx', 1)
INSERT [dbo].[Ventanas] ([idEstado], [idMunicipio], [idsistema], [idVentana], [NomVentana], [URL], [estatus]) VALUES (3, 1, 0, 3, N'USUARIOS', N'Administrador/Usuarios.aspx', 1)
SET IDENTITY_INSERT [dbo].[Ventanas] OFF
/****** Object:  StoredProcedure [dbo].[ObtieneVentanasPorUsuario]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtieneVentanasPorUsuario]
	@idUsuario	INT
AS

	SELECT		uv.idUsuario,
				v.idVentana,
				v.NomVentana,
				ISNULL(uv.estatus,0) activo
	FROM		Ventanas V (nolock)
	LEFT JOIN	UsuariosVentana uv (NOLOCK) ON uv.idusuario = uv.idUsuario
	WHERE		uv.estatus = 1
	AND			v.estatus = 1
	AND			uv.idusuario = @idUsuario
GO
/****** Object:  StoredProcedure [dbo].[Sp_CargaRoles]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CargaRoles]
AS
	
	SELECT	id,
			[Name] nombre
	FROM	AspNetRoles
	ORDER BY 2 asc
GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_BitacoraCatalogos]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Cat_BitacoraCatalogos]
	@TipoMovimiento INT = 0,
	@idMovimiento	INT = 0,
	@idCatalogo		INT = 0,
	@usuario		VARCHAR(200) = ''
AS

	IF @TipoMovimiento = 1
	BEGIN
		
		SELECT		id,
					idTipoMovimiento,
					CASE idTipoMovimiento
						WHEN 1 THEN 'Consultar'
						WHEN 2 THEN 'Agregar'
						WHEN 3 THEN 'Eliminar'
						WHEN 4 THEN 'Modificar'
					END tipoMovimiento,
					idCatalogo,
					CASE idCatalogo
						WHEN 1 THEN 'Estados'
						WHEN 2 THEN 'Municipios'
						WHEN 3 THEN 'Usuarios'
					END catalogo,
					'El usuario ' + rtrim(u.Nombre) + ' ' + rtrim(u.Apaterno) + ' ' +
					CASE idTipoMovimiento
						WHEN 2 THEN 'ha agregado un registro en el catálogo de '
						WHEN 3 THEN 'ha eliminado un registro en el catálogo de '
						WHEN 4 THEN 'ha modificado un registro en el catálogo de '
					END  +
					CASE idCatalogo
						WHEN 1 THEN 'Estados.'
						WHEN 2 THEN 'Municipios.'
						WHEN 3 THEN 'Usuarios.'
					END movimiento,
					bc.idUsuario,
					rtrim(u.Nombre) + ' ' + rtrim(u.Apaterno)  nombreUsuario
		FROM		BitacoraCatalogos bc (NOLOCK)
		INNER JOIN	Usuarios u (NOLOCK) ON bc.idUsuario = u.idusuario

	END
	ELSE IF	@TipoMovimiento = 2
	BEGIN
		
		DECLARE @idUsuario INT
		SELECT	@idUsuario = idUsuario
		FROM	Usuarios 
		WHERE	userId = @usuario

		INSERT INTO BitacoraCatalogos(idTipoMovimiento, idCatalogo, idUsuario, fecha)
		VALUES(@idMovimiento, @idCatalogo, @idUsuario, GETDATE())

	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Estados]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_Estados]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

               @TipoMovimiento  As Int,
               @IdEstado	    As Varchar(25) = '',
			   @NomEstado	    As Varchar(50) = '',
			   @SiglasEstado	As Varchar(5) = '',
			   @Contacto		As Varchar(50) = '',
			   @Telefono		As Varchar(50) = '',
			   @Correo			As Varchar(50) = '',
			   @IdLicencia      As Int = 0,
			   @estatusEstado	As bit=1
			  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		SELECT [idEstado],[nomEstado],[siglasEstado],[Contacto],[Telefono],[Correo],[idLicencia],[estatusEstado]
		FROM [DBancoNac].[dbo].[Estados] order by nomEstado
	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Estados]
	   ([nomEstado],[siglasEstado],[Contacto],[Telefono],[Correo],[idLicencia],[estatusEstado])
		VALUES 
	   ( @NomEstado, @SiglasEstado,@Contacto,@Telefono,@Correo,@IdLicencia,@estatusEstado)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Estados] where idEstado=@IdEstado
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Estados] set [nomEstado]=@NomEstado,[siglasEstado]=@SiglasEstado,[Contacto]=@Contacto,
		[Telefono]=@Telefono,[Correo]=@Correo,[idLicencia]=@IdLicencia,[estatusEstado]=@estatusEstado
		where idEstado=@IdEstado
		
	end

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Municipios]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--execute Sp_Cat_Municipios '1'
CREATE PROCEDURE [dbo].[Sp_Cat_Municipios]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@NomMunicipio As Varchar(50) = '',
		@SiglasMunicipio As Varchar(50) = '',
		@Contacto As Varchar(50) = '',
		@Telefono As Varchar(50) = '',
		@Correo As Varchar(50) = '',
		@idLicencia As Varchar(50) = '',
		@EstatusMunicipio As Int = 0            
              			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		--SELECT  [idEstado],[idMunicipio],[NomMunicipio],[SiglasMunicipio],[Contacto],[Telefono],[Correo],[idLicencia],[EstatusMunicipio]
		--FROM [DBancoNac].[dbo].[Municipios]
		--WHERE (@idEstado = -1) or (@idEstado > -1 and idEstado =@idEstado)
		
		SELECT b.IdEstado, b.[nomEstado],a.[idMunicipio],a.[NomMunicipio],a.[SiglasMunicipio],a.[Contacto],a.[Telefono],a.[Correo],a.[idLicencia],a.[EstatusMunicipio]
		FROM [DBancoNac].[dbo].[Municipios] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		--WHERE (@idEstado = -1) or (@idEstado > -1 and a.idEstado =@idEstado)

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Municipios]
	   ([idEstado],[NomMunicipio],[SiglasMunicipio],[Contacto],[Telefono],[Correo],[idLicencia],[EstatusMunicipio])
		VALUES 
	   ( @idEstado,@NomMunicipio,@SiglasMunicipio,@Contacto,@Telefono,@Correo,@idLicencia,@EstatusMunicipio)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Municipios] where idMunicipio=@idMunicipio
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Municipios] set idEstado=@idEstado,NomMunicipio=@NomMunicipio,SiglasMunicipio=@SiglasMunicipio,
		Contacto=@Contacto,Telefono=@Telefono,Correo=@Correo,idLicencia=@idLicencia,EstatusMunicipio=@EstatusMunicipio
		where idMunicipio=@idMunicipio
		
	end

END






GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Oficina]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Sp_Cat_Oficina]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

               @TipoMovimiento  As Int,
               @IdEstado	    As Int = 0,
			   @idMunicipio	    As Varchar(50) = '',
			   @idOficina		As Int = 0,
			   @DescOficina		As Varchar(50) = '',
			   @DireccOficina	As Varchar(50) = '',
			   @TelefOficina	As Varchar(50) = '',
			   @EstatusOficina  As Int = 0
	  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		--SELECT [idEstado],[idMunicipio],[DescOficina],[DireccOficina],[TelefOficina],[EstatusOficina]
		--FROM  [DBancoNac].[dbo].[Oficinas]
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.IdOficina,[DescOficina],[DireccOficina],[TelefOficina],[EstatusOficina]
		FROM  [DBancoNac].[dbo].[Oficinas] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
	end

	if @TipoMovimiento=2
	begin
		
		INSERT INTO [DBancoNac].[dbo].[Oficinas]
	   ( [idEstado],[idMunicipio],[DescOficina],[DireccOficina],[TelefOficina],[EstatusOficina])
		VALUES 
	   ( @idEstado,@idMunicipio,@DescOficina,@DireccOficina,@TelefOficina,@EstatusOficina)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Oficinas] where idOficina=@idOficina
	end

	if @TipoMovimiento=4
	begin
		update  [DBancoNac].[dbo].[Oficinas] set idEstado=@idEstado,idMunicipio=@idMunicipio,DescOficina=@DescOficina
		,DireccOficina=@DireccOficina,TelefOficina=@TelefOficina,EstatusOficina=@EstatusOficina
		where idOficina=@idOficina
		
	end

END


GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Personas]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_Personas]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

				@TipoMovimiento  As Int,
				@idEstado As Int = 0,
				@idMunicipio As Int = 0,
				@idPersona As Int = 0,
				
				@Nombre As Varchar(50) = '',
				@Apaterno As Varchar(100) = '',
				@Amaterno As Varchar(100) = '',
				@Licencia As Varchar(25) = '',
				@INE As Varchar(25) = '',
				@estatus As Int = 0

				  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		
		  SELECT b.idEstado,b.nomEstado,c.IdMunicipio,c.nomMunicipio,idpersona,Nombre,Apaterno,Amaterno,Licencia,INE,estatus
		  FROM [dbo].[Personas] a
		  inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		
		INSERT INTO [DBancoNac].[dbo].[Personas]
	   ( idEstado,c.IdMunicipio,Nombre,Apaterno,Amaterno,Licencia,INE,estatus)
		VALUES 
	   ( @idEstado,@idMunicipio,@Nombre,@Apaterno,@Amaterno,@Licencia,@INE,@estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Personas] where idPersona=@idPersona
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Personas]  set idEstado=@idEstado,idMunicipio=@idMunicipio,Nombre=@Nombre,Apaterno=@Apaterno,Amaterno=@Amaterno,Licencia=@Licencia,INE=@INE,estatus=@estatus
		where idPersona=@idPersona
		
	end

END


GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Usuarios]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Cat_Usuarios]
	@TipoMovimiento  As Int= 0,
	@idEstado		int= 0,
	@idMunicipio	int= 0,
	@idRol			varchar(200) = '',
	@nombre			varchar(200) = '',
	@aPaterno		varchar(200) = '',
	@aMaterno		varchar(200) = '',
	@usuario		varchar(200) = '',	
	@email			varchar(200) = '',
	@telefono		varchar(200) = '',
	@userId			varchar(200) = '',
	@referencia		varchar(500) = '',
	@departament	INT = 1,
	@area			VARCHAR(100) = ''
AS
		
	if @TipoMovimiento = 1
	begin
		
		SELECT		u.idusuario,
					u.idEstado,
					RTRIM(e.nomEstado) nomEstado,
					u.idMunicipio,
					RTRIM(m.NomMunicipio) NomMunicipio,
					RTRIM(u.Referencia) Referencia,
					RTRIM(u.Nombre) Nombre,
					RTRIM(u.Apaterno) Apaterno,
					RTRIM(u.Amaterno) Amaterno,
					RTRIM(u.Nombre + ' ' + u.Apaterno + ' ' +u.Amaterno) nombreFull,
					u.Departamento,
					RTRIM(u.Area) Area,
					RTRIM(u.Email) Email,
					RTRIM(u.Telefono) Telefono,
					u.estatus,
					ur.RoleId,
					RTRIM(r.Name) Rol ,
					u.userId
		FROM		Usuarios u (NOLOCK)
		INNER JOIN	Estados e (NOLOCK) ON u.idEstado = e.idEstado
		INNER JOIN	Municipios m (NOLOCK) ON e.idEstado = m.idEstado and m.idMunicipio = u.idMunicipio
		INNER JOIN	AspNetUserRoles ur (NOLOCK) ON u.userId = ur.UserId
		INNER JOIN	AspNetRoles r (NOLOCK) ON ur.RoleId = r.Id
		WHERE		u.estatus = 1
		--AND			((@idEstado = -1) or (@idEstado > -1 and u.idEstado = @idEstado))
		--AND			((@idMunicipio = -1) or (@idMunicipio > -1 and u.idMunicipio = @idMunicipio))
		
		
		
	end
	else if @TipoMovimiento=2
	begin
		
		--Inserta Informacion del Profile
		INSERT INTO Usuarios (idEstado, idMunicipio, Referencia, Nombre, Apaterno, Amaterno, Departamento, Area, Email, Telefono, estatus, userId)
		VALUES(@idEstado, @idMunicipio, @referencia, @nombre, @aPaterno, @aMaterno, @departament, @area, @email, @telefono, 1, @userId)

		INSERT INTO AspNetUserRoles
		values (@userId, @idRol)

		SELECT 1 resulado

	end
	ELSE IF @TipoMovimiento = 3
	BEGIN
		
		UPDATE	Usuarios
		SET		estatus =0
		where	userId = @userId

		select 1 resultado

	END
	ELSE IF @TipoMovimiento = 4
	BEGIN
		
		UPDATE	Usuarios
		SET		idEstado = @idEstado,
				idMunicipio = @idMunicipio,
				Referencia = @referencia,
				Nombre = @nombre,
				Apaterno = @aPaterno,
				Amaterno = @aMaterno,
				Departamento = @departament,
				Area = @area,
				Email = @email,
				Telefono = @telefono,
				estatus = 1
		WHERE	userId = @userId

		--ACTUALIZA ROL
		UPDATE	AspNetUserRoles
		SET		RoleId = @idRol
		WHERE	UserId = @userId

		SELECT 1 resulado

	END
	

GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Ventanas]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Sp_Cat_Ventanas]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

				@TipoMovimiento  As Int,
				@idEstado As Int = 0,
				@idMunicipio As Int = 0,
				@idSistema As Int = 0,
				@idVentana As Int = 0,
				@NomVentana As Varchar(50) = '',
				@URL As Varchar(500) = '',
				@estatus As Int = 0
	  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		
		  SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],[idsistema],[idVentana],[NomVentana],url,[estatus]
		  FROM [dbo].[Ventanas] a
		  inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		
		INSERT INTO [DBancoNac].[dbo].[Ventanas]
	   ( [idEstado],[idMunicipio],[idSistema],[NomVentana],url,[estatus])
		VALUES 
	   ( @idEstado,@idMunicipio,@idsistema,@NomVentana,@url,@estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Ventanas] where idVentana=@idVentana
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Ventanas]  set idEstado=@idEstado,idMunicipio=@idMunicipio,idSistema=@idsistema,NomVentana=@NomVentana,url=@url,estatus=@estatus
		where idVentana=@idVentana
		
	end

END


GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneNombre]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_ObtieneNombre] 
	@id varchar(200)
AS
	--declare @id varchar(200) = 'c7eee1b2-76c0-42e4-9926-ed4c840374bb'
	SELECT		RTRIM(Nombre) + ' ' + RTRIM(Apaterno) nombre,
				r.[Name] rol,
				u.idusuario
	FROM		Usuarios u (nolock)
	INNER JOIN	AspNetUserRoles ur (nolock) on u.userId = ur.UserId
	INNER JOIN	AspNetRoles r (nolock) on ur.RoleId = r.Id
	WHERE		u.userId = @id
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneNombreByEmail]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneNombreByEmail] 
	@email varchar(200)
AS
	SELECT	Nombre + ' ' + Apaterno nombre
	FROM	Usuarios (nolock)
	WHERE	Email = @email
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneUsuarioByEmail]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneUsuarioByEmail]
	@email varchar(200)
AS
	
	SELECT	username
	FROM	AspNetUsers
	WHERE	Email = @email
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneUsuarioByUserName]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneUsuarioByUserName]
	@username varchar(200)
AS
	
	SELECT	username
	FROM	AspNetUsers
	WHERE	UserName = @username
GO
/****** Object:  StoredProcedure [dbo].[Sp_Usuario]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Usuario] 
  
						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
			
               @TipoMovimiento  As Int = 0,
               @IdEstado	    As Int = 0,
			   @IdMunicipio	    As Int = 0,
			   @IdUsuario		As Int = 0,
			   @Referencia		As Varchar(50) = '',
			   @Nombre			As Varchar(50) = '',
			   @Apaterno		As Varchar(50) = '',
			   @Amaterno	    As Varchar(50) = '',
			   @iPassword		As Varchar(50) = '',
			   @Departamento    As Varchar(50) = '',
			   @Area            As Varchar(50) = '',
			   @Email		    As Varchar(50) = '',
			   @Telefono		As Int = 0,
			   @Estatus			As Int = 0
			  
AS

BEGIN	

	if @TipoMovimiento=1
	begin
	SELECT [idEstado]
      ,[idMunicipio]
      ,[idusuario]
      ,[Referencia]			--No se tomara en cuenta para alta
      ,[Nombre]
      ,[Apaterno]
      ,[Amaterno]
      ,[iPassword]			--No se tomara en cuenta para alta(se guardar en tabla )
      ,[Departamento]		--No se tomara en cuenta para alta
      ,[Area]				--No se tomara en cuenta para alta
	  ,Email
	  ,Telefono
      ,[estatus]
  FROM [DBancoNac].[dbo].[Usuarios]
	end


	--if @TipoMovimiento=2
	--begin
	--declare @Folio as Int 

	--INSERT INTO [DBancoNac].[dbo].[Usuarios]
 --  (idEstado,idMunicipio,Nombre,Apaterno,Amaterno,iPassword,Departamento,Area,Email,Telefono,estatus)
 --   VALUES 
 --  (@IdEstado, @IdMunicipio,@Nombre,@Apaterno,@Amaterno,@iPassword,@Departamento,@Area,@Email,@Telefono,@Estatus)
	--end

	if @TipoMovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Usuarios]
		where idusuario=@idusuario
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Usuarios] set
	   idEstado=@IdEstado,idMunicipio=@IdMunicipio,Nombre=@Nombre,Apaterno=@Apaterno,Amaterno=@Amaterno,iPassword=@iPassword,
	   Departamento=@Departamento,Area=@Area,Email=@Email,Telefono=@Telefono,estatus=@Estatus
		where idusuario=@idusuario
	end


	

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ValidaUsuarioEliminado]    Script Date: 16/09/2018 10:40:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_ValidaUsuarioEliminado]
	@userName	VARCHAR(200),
	@email		VARCHAR(200)
AS

	SELECT		au.Id,
				au.UserName,
				au.Email 
	FROM		Usuarios u (NOLOCK)
	INNER JOIN	AspNetUsers au (NOLOCK) ON u.userId = au.Id
	WHERE		u.estatus = 0
	AND			(au.UserName = @userName 
				OR			au.Email = @email)
GO
