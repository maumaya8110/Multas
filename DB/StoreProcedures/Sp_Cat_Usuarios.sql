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
		VALUES(@idEstado, @idMunicipio, @referencia, @nombre, @aPaterno, @aMaterno, @departament, @area, @email, @telefono, 1, @userId)

		INSERT INTO AspNetUserRoles
		values (@userId, @idRol)

		SELECT 1 resulado

	end
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

		SELECT 1 resulado

	END
	

