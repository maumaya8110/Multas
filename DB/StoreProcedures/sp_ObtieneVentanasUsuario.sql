ALTER PROCEDURE sp_ObtieneVentanasUsuario
	@idUsuario	INT
AS
	
	--declare @idUsuario int = 1

	SELECT		u.idUsuario,
				v.idVentana,
				v.NomVentana,
				v.[URL],
				ISNULL(uv.estatus ,0) estatus
	FROM		Ventanas v
	INNER JOIN	Usuarios u (NOLOCK) ON v.idEstado = u.idEstado and  V.idMunicipio = u.idMunicipio
	LEFT JOIN	UsuariosVentana uv (NOLOCK) ON v.idVentana = uv.idVentana and u.idusuario = uv.idUsuario
	WHERE		u.idUsuario = @idUsuario
	
