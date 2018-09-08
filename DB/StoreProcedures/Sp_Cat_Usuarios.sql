CREATE PROCEDURE Sp_Cat_Usuarios
	@TipoMovimiento  As Int,
	@idEstado		int,
	@idMunicipio	int,
	@idRol			varchar(200),
	@nombre			varchar(200),
	@aPaterno		varchar(200),
	@aMaterno		varchar(200),
	@usuario		varchar(200),
	@email			varchar(200),
	@telefono		varchar(200),
	@userId			varchar(200)
AS

	if @TipoMovimiento=2
	begin
		
		--Inserta Informacion del Profile
		INSERT INTO Usuarios (idEstado, idMunicipio, Referencia, Nombre, Apaterno, Amaterno, Departamento, Area, Email, Telefono, estatus, userId)
		VALUES(@idEstado, @idMunicipio, '', @nombre, @aPaterno, @aMaterno, 1, '', @email, @telefono, 1, @userId)

		INSERT INTO AspNetUserRoles
		values (@userId, @idRol)

		SELECT 1 resulado

	end

	
