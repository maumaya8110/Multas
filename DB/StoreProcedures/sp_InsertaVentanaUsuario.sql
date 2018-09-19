ALTER PROCEDURE sp_InsertaVentanaUsuario
	@idUsuario	int,
	@ventanas	XML,
	@usuario	varchar(200)
AS

	--declare @idUsuario int = 1,
	--		@ventanas xml = '<permiso><ventana><id>2</id><estatus>0</estatus></ventana><ventana><id>3</id><estatus>1</estatus></ventana></permiso>',
	--		@usuario varchar(200)  =''
	

	DECLARE @tblVentanas AS TABLE(id INT,permiso BIT)
	INSERT INTO @tblVentanas
	SELECT	Tbl.Col.value('id[1]', 'INT') AS id,
			Tbl.Col.value('estatus[1]', 'BIT') AS permiso
	FROM	@ventanas.nodes('permiso/ventana') AS Tbl(Col)
	

	select * from @tblventanas


	DELETE FROM UsuariosVentana where idusuario = @idUsuario
			
	INSERT INTO UsuariosVentana(idUsuario, idVentana, estatus, usrCrtd, dateCrtd, usrMod, dateMod)
	SELECT		@idUsuario,
				id,
				permiso,
				@usuario,
				getdate(),
				@usuario,
				getdate()
	FROM		@tblVentanas

	select 1 id

	