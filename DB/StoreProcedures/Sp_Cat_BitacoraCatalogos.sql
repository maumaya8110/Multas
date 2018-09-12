ALTER PROCEDURE Sp_Cat_BitacoraCatalogos
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