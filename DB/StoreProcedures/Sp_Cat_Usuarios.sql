ALTER PROCEDURE Sp_Cat_Usuarios
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
	@userId			varchar(200) = ''
AS
		
	if @TipoMovimiento = 1
	begin
		
		SELECT		u.idusuario,
					u.idEstado,
					e.nomEstado,
					u.idMunicipio,
					m.NomMunicipio,
					u.Referencia,
					u.Nombre,
					u.Apaterno,
					u.Amaterno,
					u.Nombre + ' ' + u.Apaterno + ' ' +u.Amaterno nombreFull,
					u.Departamento,
					u.Area,
					u.Email,
					u.Telefono,
					u.estatus,
					ur.RoleId,
					r.Name 
		FROM		Usuarios u (NOLOCK)
		INNER JOIN	Estados e (NOLOCK) ON u.idEstado = e.idEstado
		INNER JOIN	Municipios m (NOLOCK) ON e.idEstado = m.idEstado and u.idMunicipio = u.idMunicipio
		INNER JOIN	AspNetUserRoles ur (NOLOCK) ON u.userId = ur.UserId
		INNER JOIN	AspNetRoles r (NOLOCK) ON ur.RoleId = r.Id
		WHERE		u.estatus = 1
		AND			((@idEstado = -1) or (@idEstado > -1 and u.idEstado = @idEstado))
		AND			((@idMunicipio = -1) or (@idMunicipio > -1 and u.idMunicipio = @idMunicipio))
		
		
		
	end
	else if @TipoMovimiento=2
	begin
		
		--Inserta Informacion del Profile
		INSERT INTO Usuarios (idEstado, idMunicipio, Referencia, Nombre, Apaterno, Amaterno, Departamento, Area, Email, Telefono, estatus, userId)
		VALUES(@idEstado, @idMunicipio, '', @nombre, @aPaterno, @aMaterno, 1, '', @email, @telefono, 1, @userId)

		INSERT INTO AspNetUserRoles
		values (@userId, @idRol)

		SELECT 1 resulado

	end

	
