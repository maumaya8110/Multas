ALTER PROCEDURE ObtieneVentanasPorUsuario
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