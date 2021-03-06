USE [DBancoNac]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Municipios]    Script Date: 09/09/2018 04:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_Cat_Municipios]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@NomMunicipio As Varchar(50) = '',
		@SiglasMunicipio As Varchar(50) = '',
		@Contacto As Varchar(50) = '',
		@Telefono As Int = 0,
		@Correo As Varchar(50) = '',
		@idLicencia As Varchar(50) = '',
		@EstatusMunicipio As Int = 0            
              			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		SELECT  [idEstado],[idMunicipio],[NomMunicipio],[SiglasMunicipio],[Contacto],[Telefono],[Correo],[idLicencia],[EstatusMunicipio]
		FROM [DBancoNac].[dbo].[Municipios]
		WHERE (@idEstado = -1) or (@idEstado > -1 and idEstado =@idEstado)
	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Municipios]
	   ([idEstado],[NomMunicipio],[SiglasMunicipio],[Contacto],[Telefono],[Correo],[idLicencia],[EstatusMunicipio])
		VALUES 
	   ( @idEstado,@NomMunicipio,@SiglasMunicipio,@Contacto,@Telefono,@Correo,@idLicencia,@EstatusMunicipio)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Municipios] where idMunicipio=@idMunicipio
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Municipios] set idEstado=@idEstado,NomMunicipio=@NomMunicipio,SiglasMunicipio=@SiglasMunicipio,
		Contacto=@Contacto,Telefono=@Telefono,Correo=@Correo,idLicencia=@idLicencia,EstatusMunicipio=@EstatusMunicipio
		where idMunicipio=@idMunicipio
		
	end

END

