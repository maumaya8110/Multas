--DROP TABLE BitacoraCatalogos
CREATE TABLE BitacoraCatalogos
(
	id					INT IDENTITY PRIMARY KEY,
	idTipoMovimiento	INT,
	idCatalogo			INT,
	idUsuario			INT,
	fecha				DATETIME
)


SELECT * FROM BitacoraCatalogos