--DROP TABLE BitacoraCatalogos
CREATE TABLE BitacoraCatalogos
(
	id					INT IDENTITY PRIMARY KEY,
	idTipoMovimiento	INT,
	movimiento			VARCHAR(max),
	idUsuario			INT,
	fecha				DATETIME
)
