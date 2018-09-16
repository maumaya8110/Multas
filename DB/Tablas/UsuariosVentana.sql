CREATE TABLE UsuariosVentana
(
	id			INT IDENTITY PRIMARY KEY,
	idUsuario	INT,
	idVentana	INT,
	estatus		BIT,
	usrCrtd		VARCHAR(200),
	dateCrtd	DATETIME,
	usrMod		VARCHAR(200),
	dateMod		DATETIME
)