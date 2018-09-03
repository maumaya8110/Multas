CREATE TABLE [dbo].[Tbl_Errores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exeption] [varchar](max) NULL,
	[userId] [varchar](200) NULL,
	[message] [varchar](max) NULL,
	[dateExc] [datetime] NULL,
	[IP] [varchar](100) NULL,
	[maquina] [varchar](50) NULL,
	[url] [varchar](200) NULL
)