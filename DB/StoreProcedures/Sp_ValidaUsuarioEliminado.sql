ALTER PROCEDURE Sp_ValidaUsuarioEliminado
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


				