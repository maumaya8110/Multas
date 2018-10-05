USE [master]
GO
/****** Object:  Database [DBancoNac]    Script Date: 05/10/2018 01:22:54 a. m. ******/
CREATE DATABASE [DBancoNac]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBancoNac].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBancoNac] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBancoNac] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBancoNac] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBancoNac] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBancoNac] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBancoNac] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBancoNac] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBancoNac] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBancoNac] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBancoNac] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBancoNac] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBancoNac] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBancoNac] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBancoNac] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBancoNac] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBancoNac] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBancoNac] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBancoNac] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBancoNac] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBancoNac] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [DBancoNac] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBancoNac] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBancoNac] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBancoNac] SET RECOVERY FULL 
GO
ALTER DATABASE [DBancoNac] SET  MULTI_USER 
GO
ALTER DATABASE [DBancoNac] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBancoNac] SET DB_CHAINING OFF 
GO
USE [DBancoNac]
GO
/****** Object:  StoredProcedure [dbo].[ObtieneVentanasPorUsuario]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtieneVentanasPorUsuario]
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
GO
/****** Object:  StoredProcedure [dbo].[Sp_CargaRoles]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CargaRoles]
AS
	
	SELECT	id,
			[Name] nombre
	FROM	AspNetRoles
	ORDER BY 2 asc

GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Agentes]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_Agentes]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@idAgente As Int = 0,
		@Referencia As Varchar(50) = '',
		@Nombre As Varchar(50) = '',
		@Apaterno As Varchar(50) = '',
		@Amaterno As Varchar(50) = '',
		@Estatus As Int = 0            
              			  
AS

BEGIN
	--select * from [DBancoNac].[dbo].[Agentes]
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.idagente,a.Referencia,a.Nombre,a.Apaterno,a.Amaterno,a.Estatus
		FROM  [DBancoNac].[dbo].[Agentes] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Agentes]
	   ([idEstado],[idMunicipio],a.Referencia,a.Nombre,a.Apaterno,a.Amaterno,a.Estatus)
		VALUES 
	   (@idEstado,@idMunicipio,@Referencia,@Nombre,@Apaterno, @Amaterno,@Estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Agentes] where idagente=@idagente
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Agentes] set idEstado=@idEstado,idMunicipio=@idMunicipio,Referencia=@Referencia,Nombre=@Nombre,Apaterno=@Apaterno,Amaterno= @Amaterno,Estatus=@Estatus
		where idagente=@idagente
		
	end

END








GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_BitacoraCatalogos]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Cat_BitacoraCatalogos]
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
GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Cajeros]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_Cat_Cajeros]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@idOficina As Int = 0,
		@idCaja As Int = 0,
		@IdUsuario As Int = 0,
		@Password As Varchar(10) = '',
		@FolioActual  As int = 0,
		@FolioInicial As int = 0,
		@FolioFinal  As int = 0,
		@UltimoAcceso  As datetime = null,
		@Estatuscaja As Int = 0            
              			  
AS

BEGIN
	--select * from [dbo].[Cajeros]  
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.idOficina,d.DescOficina,a.idCaja,a.idUsuario,e.Nombre,a.ipassword,
		a.FolioActual,a.FolioInicial,a.FolioFinal,a.UltimoAcceso,a.Estatuscaja
		FROM    [DBancoNac].[dbo].[Cajeros]   a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
		inner join [DBancoNac].[dbo].[Oficinas] d on a.IdOficina=d.IdOficina
		inner join [DBancoNac].[dbo].[Usuarios] e on a.idUsuario=e.IdUsuario

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO  [dbo].[Cajeros]  
	   ([idEstado],[idMunicipio],idOficina,IdUsuario,[iPassword],FolioActual,FolioInicial,FolioFinal,UltimoAcceso,Estatuscaja)
		VALUES 
	   (@idEstado,@idMunicipio,@idOficina,@IdUsuario,@Password,@FolioActual,@FolioInicial,@FolioFinal,getdate(),@Estatuscaja)
	end
		
	if @Tipomovimiento=3
	begin
		delete from  [dbo].[Cajeros]   where idCaja=@idCaja
	end

	if @TipoMovimiento=4
	begin
		update  [dbo].[Cajeros]   set idEstado=@idEstado,idMunicipio=@idMunicipio,idOficina=@idOficina,IdUsuario=@IdUsuario,iPassword=@Password,FolioActual=@FolioActual,FolioInicial=@FolioInicial,FolioFinal=@FolioFinal,UltimoAcceso=@UltimoAcceso,Estatuscaja=@Estatuscaja
		where    idCaja=@idCaja
		
	end

END









GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Estados]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_Estados]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

               @TipoMovimiento  As Int,
               @IdEstado	    As Varchar(25) = '',
			   @NomEstado	    As Varchar(50) = '',
			   @SiglasEstado	As Varchar(5) = '',
			   @Contacto		As Varchar(50) = '',
			   @Telefono		As Varchar(50) = '',
			   @Correo			As Varchar(50) = '',
			   @IdLicencia      As Int = 0,
			   @estatusEstado	As bit=1
			  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		SELECT [idEstado],[nomEstado],[siglasEstado],[Contacto],[Telefono],[Correo],[idLicencia],[estatusEstado]
		FROM [DBancoNac].[dbo].[Estados] order by nomEstado
	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Estados]
	   ([nomEstado],[siglasEstado],[Contacto],[Telefono],[Correo],[idLicencia],[estatusEstado])
		VALUES 
	   ( @NomEstado, @SiglasEstado,@Contacto,@Telefono,@Correo,@IdLicencia,@estatusEstado)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Estados] where idEstado=@IdEstado
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Estados] set [nomEstado]=@NomEstado,[siglasEstado]=@SiglasEstado,[Contacto]=@Contacto,
		[Telefono]=@Telefono,[Correo]=@Correo,[idLicencia]=@IdLicencia,[estatusEstado]=@estatusEstado
		where idEstado=@IdEstado
		
	end

END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Funciones]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_Funciones]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@IdSistema As Int = 0,
		@IdVentana As Int = 0,
		@Idfuncion As Int = 0,
		@NomFuncion As Varchar(25) = '',
		@Estatus As Int = 0            
              			  
AS

BEGIN
	--select * from [dbo].[Funciones]  
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.IdSistema,d.NomSistema,a.IdVentana,e.NomVentana,a.Idfuncion,f.NomFuncion,a.Estatus
		FROM    [dbo].[Funciones]   a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
		inner join [DBancoNac].[dbo].[Sistemas] d on a.IdSistema=d.IdSistema
		inner join [DBancoNac].[dbo].[Ventanas] e on a.idVentana=e.IdVentana
		inner join [DBancoNac].[dbo].[Funciones] f on a.Idfuncion=f.Idfuncion

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO  [dbo].[Funciones]  
	   ([idEstado],[idMunicipio],a.IdSistema,a.IdVentana,a.NomFuncion,a.Estatus)
		VALUES 
	   (@idEstado,@idMunicipio,@IdSistema,@IdVentana,@NomFuncion,@Estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from  [dbo].[Funciones]   where Idfuncion=@Idfuncion
	end

	if @TipoMovimiento=4
	begin
		update  [dbo].[Funciones]   set idEstado=@idEstado,idMunicipio=@idMunicipio,IdSistema=@IdSistema,IdVentana=@IdVentana,NomFuncion=@NomFuncion,Estatus=@Estatus
		where   Idfuncion=@Idfuncion
		
	end

END








GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Municipios]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--execute Sp_Cat_Municipios '1'
CREATE PROCEDURE [dbo].[Sp_Cat_Municipios]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@NomMunicipio As Varchar(50) = '',
		@SiglasMunicipio As Varchar(50) = '',
		@Contacto As Varchar(50) = '',
		@Telefono As Varchar(50) = '',
		@Correo As Varchar(50) = '',
		@idLicencia As Varchar(50) = '',
		@EstatusMunicipio As Int = 0            
              			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		--SELECT  [idEstado],[idMunicipio],[NomMunicipio],[SiglasMunicipio],[Contacto],[Telefono],[Correo],[idLicencia],[EstatusMunicipio]
		--FROM [DBancoNac].[dbo].[Municipios]
		--WHERE (@idEstado = -1) or (@idEstado > -1 and idEstado =@idEstado)
		
		SELECT b.IdEstado, b.[nomEstado],a.[idMunicipio],a.[NomMunicipio],a.[SiglasMunicipio],a.[Contacto],a.[Telefono],a.[Correo],a.[idLicencia],a.[EstatusMunicipio]
		FROM [DBancoNac].[dbo].[Municipios] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		--WHERE (@idEstado = -1) or (@idEstado > -1 and a.idEstado =@idEstado)

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







GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Oficina]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Sp_Cat_Oficina]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

               @TipoMovimiento  As Int,
               @IdEstado	    As Int = 0,
			   @idMunicipio	    As Varchar(50) = '',
			   @idOficina		As Int = 0,
			   @DescOficina		As Varchar(50) = '',
			   @DireccOficina	As Varchar(50) = '',
			   @TelefOficina	As Varchar(50) = '',
			   @EstatusOficina  As Int = 0
	  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		--SELECT [idEstado],[idMunicipio],[DescOficina],[DireccOficina],[TelefOficina],[EstatusOficina]
		--FROM  [DBancoNac].[dbo].[Oficinas]
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.IdOficina,[DescOficina],[DireccOficina],[TelefOficina],[EstatusOficina]
		FROM  [DBancoNac].[dbo].[Oficinas] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
	end

	if @TipoMovimiento=2
	begin
		
		INSERT INTO [DBancoNac].[dbo].[Oficinas]
	   ( [idEstado],[idMunicipio],[DescOficina],[DireccOficina],[TelefOficina],[EstatusOficina])
		VALUES 
	   ( @idEstado,@idMunicipio,@DescOficina,@DireccOficina,@TelefOficina,@EstatusOficina)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Oficinas] where idOficina=@idOficina
	end

	if @TipoMovimiento=4
	begin
		update  [DBancoNac].[dbo].[Oficinas] set idEstado=@idEstado,idMunicipio=@idMunicipio,DescOficina=@DescOficina
		,DireccOficina=@DireccOficina,TelefOficina=@TelefOficina,EstatusOficina=@EstatusOficina
		where idOficina=@idOficina
		
	end

END



GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Personas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_Personas]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

				@TipoMovimiento  As Int,
				@idEstado As Int = 0,
				@idMunicipio As Int = 0,
				@idPersona As Int = 0,
				
				@Nombre As Varchar(50) = '',
				@Apaterno As Varchar(100) = '',
				@Amaterno As Varchar(100) = '',
				@Licencia As Varchar(25) = '',
				@INE As Varchar(25) = '',
				@estatus As Int = 0

				  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		
		  SELECT b.idEstado,b.nomEstado,c.IdMunicipio,c.nomMunicipio,idpersona,Nombre,Apaterno,Amaterno,Licencia,INE,estatus
		  FROM [dbo].[Personas] a
		  inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		
		INSERT INTO [DBancoNac].[dbo].[Personas]
	   ( idEstado,c.IdMunicipio,Nombre,Apaterno,Amaterno,Licencia,INE,estatus)
		VALUES 
	   ( @idEstado,@idMunicipio,@Nombre,@Apaterno,@Amaterno,@Licencia,@INE,@estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Personas] where idPersona=@idPersona
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Personas]  set idEstado=@idEstado,idMunicipio=@idMunicipio,Nombre=@Nombre,Apaterno=@Apaterno,Amaterno=@Amaterno,Licencia=@Licencia,INE=@INE,estatus=@estatus
		where idPersona=@idPersona
		
	end

END



GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Placas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_Cat_Placas]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@idPlaca As Int = 0,
		@Placa As Varchar(50) = '',
		@Marca As Varchar(50) = '',
		@Tipo As Varchar(50) = '',
		@Modelo As Varchar(50) = '',
		@Serie As Varchar(50) = '',		
		@Estatus As Int = 0            
              			  
AS

BEGIN
	--select * from [DBancoNac].[dbo].[Placas]
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.idplaca,a.Placa,a.Marca,a.Tipo,a.Modelo,a.serie,a.Estatus
		FROM  [DBancoNac].[dbo].[Placas] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Placas]
	   ([idEstado],[idMunicipio],a.Placa,a.Marca,a.Tipo,a.Modelo,a.serie,a.Estatus)
		VALUES 
	   (@idEstado,@idMunicipio,@Placa,@Marca,@Tipo,@Modelo,@serie,@Estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Placas] where idplaca=@idplaca
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Placas] set idEstado=@idEstado,idMunicipio=@idMunicipio,Placa=@Placa,Marca=@Marca,Tipo=@Tipo,Modelo= @Modelo,serie=@serie,Estatus=@Estatus
		where idplaca=@idplaca
		
	end

END








GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Procesos]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Sp_Cat_Procesos]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@idProceso As Int = 0,
		@NomProceso As Varchar(25) = '',
		@Sistema As Varchar(25) = '',
		@Ventana As Varchar(25) = '',
		@Boton As Varchar(25) = '',	
		@Estatus As Int = 0            
              			  
AS

BEGIN
	--select * from [DBancoNac].[dbo].[Procesos]
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.idproceso,a.NomProceso,a.Sistema,d.NomSistema,a.Ventana,e.NomVentana,a.Boton,a.Estatus
		FROM   [DBancoNac].[dbo].[Procesos] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
		inner join [DBancoNac].[dbo].[Sistemas] d on a.Sistema=d.IdSistema
		inner join [DBancoNac].[dbo].[Ventanas] e on a.Ventana=e.IdVentana
	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[Procesos]
	   ([idEstado],[idMunicipio],a.NomProceso,a.Sistema,a.Ventana,a.Boton,a.Estatus)
		VALUES 
	   (@idEstado,@idMunicipio,@NomProceso,@Sistema,@Ventana,@Boton,@Estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Procesos] where idproceso=@idproceso
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Procesos] set idEstado=@idEstado,idMunicipio=@idMunicipio,NomProceso=@NomProceso,Sistema=@Sistema,Ventana=@Ventana,Boton= @Boton,Estatus=@Estatus
		where  idproceso=@idproceso
		
	end

END








GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Sistema]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_Cat_Sistema]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@IdSistema As Int = 0,
		@NomSistema As Varchar(25) = '',
		@Estatus As Int = 0            
              			  
AS

BEGIN
	--select * from [DBancoNac].[dbo].[sistemas]
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.IdSistema,a.NomSistema,a.Estatus
		FROM    [DBancoNac].[dbo].[sistemas] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO  [DBancoNac].[dbo].[sistemas]
	   ([idEstado],[idMunicipio],a.NomSistema,a.Estatus)
		VALUES 
	   (@idEstado,@idMunicipio,@NomSistema,@Estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from  [DBancoNac].[dbo].[sistemas] where IdSistema=@IdSistema
	end

	if @TipoMovimiento=4
	begin
		update  [DBancoNac].[dbo].[sistemas] set idEstado=@idEstado,idMunicipio=@idMunicipio,NomSistema=@NomSistema,Estatus=@Estatus
		where   IdSistema=@IdSistema
		
	end

END








GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_TiposMultas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Cat_TiposMultas]  

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@idEstado As Int = 0,
		@idMunicipio As Int = 0,
		@idmulta As Varchar(50) = '',
		@Descripcion As Varchar(50) = '',
		@Cantidad As Varchar(50) = '',
		@DPPMulta As Varchar(50) = '',
		@AplicaDesc As Varchar(50) = '',
		@Estatus As Int = 0            
              			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],a.[idmulta],a.[Descripcion],a.[Cantidad],a.[DPPMulta],a.[AplicaDesc],a.[Estatus]
		FROM  [DBancoNac].[dbo].[MultasTipo] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		INSERT INTO [DBancoNac].[dbo].[MultasTipo]
	   ([idEstado],[idMunicipio],[Descripcion],[Cantidad],[DPPMulta],[AplicaDesc],[Estatus])
		VALUES 
	   (@idEstado,@idMunicipio,@Descripcion,@Cantidad,@DPPMulta,@AplicaDesc,@Estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[MultasTipo] where idmulta=@idmulta
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[MultasTipo] set idEstado=@idEstado,idMunicipio=@idMunicipio,Descripcion=@Descripcion,Cantidad=@Cantidad,DPPMulta=@DPPMulta,AplicaDesc=@AplicaDesc,Estatus=@Estatus
		where  idmulta=@idmulta
		
	end

END








GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Usuarios]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Cat_Usuarios]
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
		
		SELECT		u.IdUsuario,
					u.IdEstado,
					RTRIM(e.nomEstado) NomEstado,
					u.IdMunicipio,
					RTRIM(m.NomMunicipio) NomMunicipio,
					RTRIM(u.Referencia) Referencia,
					RTRIM(u.Nombre) Nombre,
					RTRIM(u.Apaterno) Apaterno,
					RTRIM(u.Amaterno) Amaterno,
					RTRIM(u.Nombre + ' ' + u.Apaterno + ' ' +u.Amaterno) NombreFull,
					u.Departamento,
					RTRIM(u.Area) Area,
					RTRIM(u.Email) Email,
					RTRIM(u.Telefono) Telefono,
					u.Estatus,
					ur.RoleId,
					RTRIM(r.Name) Rol ,
					u.UserId,
					us.UserName
		FROM		Usuarios u (NOLOCK)
		INNER JOIN	Estados e (NOLOCK) ON u.idEstado = e.idEstado
		INNER JOIN	Municipios m (NOLOCK) ON e.idEstado = m.idEstado and m.idMunicipio = u.idMunicipio
		INNER JOIN	AspNetUserRoles ur (NOLOCK) ON u.userId = ur.UserId
		INNER JOIN	AspNetRoles r (NOLOCK) ON ur.RoleId = r.Id
		INNER JOIN	AspNetUsers us (nolock) on u.userId = us.Id
		WHERE		u.estatus = 1
		
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
	ELSE IF @TipoMovimiento = 3
	BEGIN
		
		UPDATE	Usuarios
		SET		estatus =0
		where	userId = @userId

		select 1 resultado

	END
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

		--ACTUALIZA ROL
		UPDATE	AspNetUserRoles
		SET		RoleId = @idRol
		WHERE	UserId = @userId

		SELECT 1 resulado

	END
	


GO
/****** Object:  StoredProcedure [dbo].[Sp_Cat_Ventanas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Sp_Cat_Ventanas]   

						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar

				@TipoMovimiento  As Int,
				@idEstado As Int = 0,
				@idMunicipio As Int = 0,
				@idSistema As Int = 0,
				@idVentana As Int = 0,
				@NomVentana As Varchar(50) = '',
				@URL As Varchar(500) = '',
				@estatus As Int = 0
	  
			  
AS

BEGIN
	
	if @TipoMovimiento=1
	begin
		
		  SELECT b.idEstado,b.[nomEstado],c.IdMunicipio,c.[nomMunicipio],[idsistema],[idVentana],[NomVentana],url,[estatus]
		  FROM [dbo].[Ventanas] a
		  inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio

	end

	if @TipoMovimiento=2
	begin
		
		INSERT INTO [DBancoNac].[dbo].[Ventanas]
	   ( [idEstado],[idMunicipio],[idSistema],[NomVentana],url,[estatus])
		VALUES 
	   ( @idEstado,@idMunicipio,@idsistema,@NomVentana,@url,@estatus)
	end
		
	if @Tipomovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Ventanas] where idVentana=@idVentana
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Ventanas]  set idEstado=@idEstado,idMunicipio=@idMunicipio,idSistema=@idsistema,NomVentana=@NomVentana,url=@url,estatus=@estatus
		where idVentana=@idVentana
		
	end

END



GO
/****** Object:  StoredProcedure [dbo].[Sp_DescargaMultaService]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_DescargaMultaService]
	@idEstado		INT,
	@idMunicipio	INT,
	@idLicenciaE	INT,
	@idLicenciaM	INT,
	@idBoleta		INT,
	@recibo			VARCHAR(200),
	@fechaPago		DATETIME
AS
	
	IF NOT EXISTS(	SELECT	1
					FROM		Estados e (NOLOCK)
					INNER JOIN	Municipios m (NOLOCK) ON e.idEstado = m.idEstado
					WHERE		e.estatusEstado = 1
					AND			m.EstatusMunicipio = 1
					AND			E.idLicencia = @idLicenciaE
					AND			E.idEstado = @idEstado
					AND			m.idLicencia = @idLicenciaM
					AND			M.idMunicipio = @idMunicipio)
	BEGIN
		
		SELECT	2 estatus,
				'Licencia inválida para el Estado y Muncipio, favor de validar.'  mensaje

	END
	ELSE
	BEGIN	

		SELECT	1 estatus,
				'Licencia válida.'  mensaje

		--ACTUALIZA LA TABLA DE MULTAS
		UPDATE	Multas
		SET		FechaPago	= @fechaPago,
				ReciboPago	= @recibo,
				TotalPago	= Monto
		WHERE	idEstado	= @idEstado
		AND		idMunicipio = @idMunicipio
		AND		idboleta	= @idBoleta

		--ACTUALIZA LA TABLA DE DETALLE MULTAS
		UPDATE	MultasDetalle
		SET		fechapago	= @fechaPago,
				recibopago	= @recibo
		WHERE	idEstado	= @idEstado
		AND		idMunicipio = @idMunicipio
		AND		idboleta	= @idBoleta

		SELECT	1									resultado,
				'El descarte se hizo correctamente'	resultadoText

	END
	


GO
/****** Object:  StoredProcedure [dbo].[Sp_DescartaMutlas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_DescartaMutlas]
	@idEstado		INT,
	@idMunicipio	INT,
	@idBoleta		INT,
	@recibo			VARCHAR(500),
	@fechaPago		DATETIME
AS
	
	--ACTUALIZA LA TABLA DE MULTAS
	UPDATE	Multas
	SET		FechaPago	= @fechaPago,
			ReciboPago	= @recibo,
			TotalPago	= Monto
	WHERE	idEstado	= @idEstado
	AND		idMunicipio = @idMunicipio
	AND		idboleta	= @idBoleta

	--ACTUALIZA LA TABLA DE DETALLE MULTAS
	UPDATE	MultasDetalle
	SET		fechapago	= @fechaPago,
			recibopago	= @recibo
	WHERE	idEstado	= @idEstado
	AND		idMunicipio = @idMunicipio
	AND		idboleta	= @idBoleta

	SELECT	1 resultado
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaProcesoMulta]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--execute sp_InsertaProcesoMulta '7','Tab','<Actualiza><Proceso><IdEstado>19</IdEstado>                           <IdMunicipio>14</IdMunicipio>                           <IdBoleta>564518</IdBoleta>                           <IdMulta>2</IdMulta>                           <UsuarioProceso>7</UsuarioProceso>               </Proceso><Proceso><IdEstado>19</IdEstado>                           <IdMunicipio>39</IdMunicipio>                           <IdBoleta>564516</IdBoleta>                           <IdMulta>2</IdMulta>                           <UsuarioProceso>7</UsuarioProceso>               </Proceso></Actualiza>'
CREATE PROCEDURE [dbo].[sp_InsertaProcesoMulta]
	@idUsuario	int,
	@Descripcion	varchar(200),
	@Proceso	XML
	
AS
	DECLARE @tblProcesado AS TABLE(IdEstado INT,IdMunicipio int, IdBoleta varchar(200), IdMulta varchar(200),UsuarioProceso int)
	INSERT INTO @tblProcesado
	SELECT	Tbl.Col.value('IdEstado[1]', 'INT') AS IdEstado,
			Tbl.Col.value('IdMunicipio[1]', 'INT') AS IdMunicipio,
			Tbl.Col.value('IdBoleta[1]', 'Varchar(200)') AS IdBoleta,
			Tbl.Col.value('IdMulta[1]', 'Varchar(200)') AS IdMulta,
			Tbl.Col.value('UsuarioProceso[1]', 'INT') AS UsuarioProceso
	FROM	@proceso.nodes('Actualiza/Proceso') AS Tbl(Col)



	--inserta el registro en procesado
INSERT INTO Procesado (Descripcion, UsuarioProcesado, FechaProcesado,IdEstado,IdMunicipio)
SELECT		@descripcion,
			@idUsuario,
			GETDATE(),
			m.IdEstado,
			m.IdMunicipio
FROM		@tblProcesado a 
INNER JOIN	Multas M ON A.IdEstado = M.idEstado AND A.idMunicipio = M.idMunicipio AND A.idboleta = M.idboleta
GROUP BY	M.idEstado, M.idMunicipio

--actualiza el idprocesado en multas
UPDATE		M
SET			M.Procesado = P.idprocesado
FROM		@tblProcesado a 
INNER JOIN	Multas M ON A.IdEstado = M.idEstado AND A.idMunicipio = M.idMunicipio AND A.idboleta = M.idboleta
INNER JOIN	Procesado P ON M.idEstado = P.IDESTADO AND M.idMunicipio = P.IDMUNICIPIO




		update		P
		set			p.MontoPagoMpoCobra =  M.TotalPago * MM.PorcentajeCobroM,-------Generar Porcentaje para el Municipio que Cobra @MontoPagoMpoCobro
					p.MontoPagompoGenera = m.TotalPago * mm.PorcentajeGenera,---Generar Porcentaje de Municipio en donde se genero la multa  @MontoPagoMpoGenera
					p.MontoPagoEmpresa = m.totalPago * .15 ---Generar Porcentaje de Empresa @MontoPagoEmpresa
		FROM		(SELECT a.idEstado, a.idMunicipio, sum(totalpago) totalpago, Procesado 
					from Multas a
					inner join @tblProcesado b on a.IdEstado = b.idEstado AND a.idMunicipio = b.idMunicipio and a.idBoleta=b.IdBoleta  group by a.idEstado, a.idMunicipio, Procesado) M 
		INNER JOIN	Municipios MM (NOLOCK) ON M.idMunicipio = MM.idMunicipio AND M.idEstado = MM.idEstado
		INNER JOIN	Procesado p (nolock) on m.Procesado = p.idprocesado  








GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaVentanaUsuario]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertaVentanaUsuario]
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

	
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneMultasSinPagar]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneMultasSinPagar]
	@TipoMovimiento INT
AS
	
	SELECT		b.IdEstado,
				b.[NomEstado],
				c.IdMunicipio,
				c.[NomMunicipio],
				a.IdBoleta,
				a.[IdMulta],
				d.[Descripcion],
				d.[DPPMulta],
				d.[AplicaDesc],
				a.FechaPago,
				a.IdPlaca,
				a.ReciboPago,
				E.TotalPago
	FROM		[DBancoNac].[dbo].[MultasDetalle] a
	inner join	[DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
	inner join	[DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
	inner join	[DBancoNac].[dbo].[MultasTipo] d on a.idmulta=d.idmulta
	inner join	[DBancoNac].[dbo].[Multas] e on a.idEstado=e.IdEstado and a.IdMunicipio=e.IdMunicipio and a.idboleta=e.Idboleta
	where		Procesado=0 
	and			a.fechapago is null

GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneNombre]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_ObtieneNombre] 
	@id varchar(200)
AS
	--declare @id varchar(200) = 'c7eee1b2-76c0-42e4-9926-ed4c840374bb'
	SELECT		RTRIM(Nombre) + ' ' + RTRIM(Apaterno) nombre,
				r.[Name] rol,
				u.idusuario
	FROM		Usuarios u (nolock)
	INNER JOIN	AspNetUserRoles ur (nolock) on u.userId = ur.UserId
	INNER JOIN	AspNetRoles r (nolock) on ur.RoleId = r.Id
	WHERE		u.userId = @id
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneNombreByEmail]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneNombreByEmail] 
	@email varchar(200)
AS
	SELECT	Nombre + ' ' + Apaterno nombre
	FROM	Usuarios (nolock)
	WHERE	Email = @email
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneReporteMultas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneReporteMultas]
	@idEstado		INT,
	@idMunicipio	INT,
	@idLicenciaE	INT,
	@idLicenciaM	INT,
	@fechaIni		DATETIME,
	@fechaFin		DATETIME
AS
	
	IF NOT EXISTS(	SELECT	1
					FROM		Estados e (NOLOCK)
					INNER JOIN	Municipios m (NOLOCK) ON e.idEstado = m.idEstado
					WHERE		e.estatusEstado = 1
					AND			m.EstatusMunicipio = 1
					AND			E.idLicencia = @idLicenciaE
					AND			E.idEstado = @idEstado
					AND			m.idLicencia = @idLicenciaM
					AND			M.idMunicipio = @idMunicipio)
	BEGIN
		
		SELECT	2 estatus,
				'Licencia inválida para el Estado y Muncipio, favor de validar.'  mensaje

	END
	ELSE
	BEGIN	

		SELECT	1 estatus,
				'Licencia válida.'  mensaje

		SELECT		m.IdEstado,
					e.NomEstado,
					m.IdMunicipio,
					mo.NomMunicipio,
					m.IdBoleta,
					m.IdPlaca,
					m.FolioMulta,
					m.FechaMulta,
					m.Calle1Multa,
					m.Calle2Multa,
					m.LongitudMulta,
					m.LatitudMulta,
					m.Descripcion,
					m.IdAgente,
					m.NoLicencia,
					m.FechaPago,
					m.ReciboPago,
					m.TotalPago,
					m.DescuentoPago,
					m.EstatusMulta,
					m.Capturista,
					m.FechaCancel,
					m.CanceloUsuario,
					m.TarjetaCirculacion,
					m.Procesado,
					m.ReferenciaProceso,
					m.Monto,
					m.FechaProceso,
					m.UsuarioProceso
		FROM		Multas m (NOLOCK)
		INNER JOIN	MultasDetalle md (NOLOCK) ON m.idEstado = md.idEstado and m.idMunicipio = md.idMunicipio and m.idboleta = md.idboleta and m.idplaca = md.idplaca
		INNER JOIN	Estados e (NOLOCK) ON m.idEstado = e.idEstado 
		INNER JOIN	Municipios mo (NOLOCK) ON e.idEstado = mo.idEstado and m.idMunicipio = mo.idMunicipio
		WHERE		m.idEstado = @idEstado
		AND			m.idMunicipio = @idMunicipio
		AND			m.fechaMulta BETWEEN @fechaIni AND @fechaFin

	END
	
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneUsuarioByEmail]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneUsuarioByEmail]
	@email varchar(200)
AS
	
	SELECT	username
	FROM	AspNetUsers
	WHERE	Email = @email
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneUsuarioByUserName]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ObtieneUsuarioByUserName]
	@username varchar(200)
AS
	
	SELECT	username
	FROM	AspNetUsers
	WHERE	UserName = @username
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtieneVentanasUsuario]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtieneVentanasUsuario]
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
	

GO
/****** Object:  StoredProcedure [dbo].[Sp_Reporte_Multas_Procesadas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[Sp_Reporte_Multas_Procesadas]  
						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
			@TipoMovimiento  As Int,
		@FechaIni  As varchar(15)='',
		@FechaFin As varchar(15)=''
		       
              			  
AS

BEGIN
	
		if @TipoMovimiento=1
	begin
	
	SELECT b.IdEstado,b.[NomEstado],c.IdMunicipio,c.[NomMunicipio],a.IdProcesado,a.Descripcion,a.FechaProcesado,(d.Nombre+''+d.apaterno+''+d.amaterno) as UsuarioProcesado,
	a.MontoPagoMpoGenera,a.fechaPagoMpoGenera,UsuarioPagoMpoGenera,a.MontoPagoMpoCobra,a.FEchaPagoMpoCobra,a.UsuarioPagoMpoCobra,a.MontoPagoEmpresa,a.FechaPagoEmpresa,a.UsuarioPagoEmpresa
		FROM  [DBancoNac].[dbo].[Procesado] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
		inner join  [DBancoNac].[dbo].[Usuarios] d on a.UsuarioProcesado=d.IdUsuario
		
		end
	

	--select *from [DBancoNac].[dbo].[Procesado]
	--select *from [DBancoNac].[dbo].[Usuarios]
END














GO
/****** Object:  StoredProcedure [dbo].[Sp_Reporte_MultasPagadas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[Sp_Reporte_MultasPagadas]  
						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
			@TipoMovimiento  As Int,
		@FechaIni  As varchar(15)='',
		@FechaFin As varchar(15)=''
		       
              			  
AS

BEGIN
	
		if @TipoMovimiento=1
	begin
	
	SELECT b.IdEstado,b.[NomEstado],c.IdMunicipio,c.[NomMunicipio],a.IdBoleta,a.[IdMulta],d.[Descripcion],e.[TotalPago] as Cantidad,d.[DPPMulta],e.descuentoPago as AplicaDesc,a.FechaPago,a.IdPlaca,a.ReciboPago,(e.TotalPago - e.descuentoPago)  as Total
		FROM  [DBancoNac].[dbo].[MultasDetalle] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
		inner join [DBancoNac].[dbo].[MultasTipo] d on a.idmulta=d.idmulta
		inner join [DBancoNac].[dbo].[Multas] e on a.idEstado=e.IdEstado and a.IdMunicipio=e.IdMunicipio and a.idboleta=e.Idboleta
		where Procesado=0 and a.fechapago is not null
		end
	

END













GO
/****** Object:  StoredProcedure [dbo].[Sp_Reporte_Procesadas]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Reporte_Procesadas]  
				--TipoMovimiento
--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
		@TipoMovimiento  As Int,
		@FechaIni  As varchar(15)='',
		@FechaFin As varchar(15)='',
		@Proceso	XML

AS

DECLARE @tblProcesado AS TABLE(IdProceso varchar(200), FechaMonto1 datetime,FechaMonto2 datetime,FechaMonto3 datetime,UsuarioProceso int)
	INSERT INTO @tblProcesado
	SELECT	Tbl.Col.value('IdProceso[1]', 'Varchar(200)') AS IdProceso,
			Tbl.Col.value('FechaMonto1[1]', 'Datetime') AS FechaMonto1,
			Tbl.Col.value('FechaMonto2[1]', 'Datetime') AS FechaMonto2,
			Tbl.Col.value('FechaMonto3[1]', 'Datetime') AS FechaMonto3,
			Tbl.Col.value('UsuarioProceso[1]', 'Int') AS UsuarioProceso
	FROM	@proceso.nodes('Actualiza/Proceso') AS Tbl(Col)


BEGIN
	
	if @TipoMovimiento=1
	begin
	
		SELECT b.IdEstado,b.[NomEstado],c.IdMunicipio,c.[NomMunicipio],a.IdProcesado,a.Descripcion,a.FechaProcesado,(d.Nombre+' '+d.apaterno) as UsuarioProcesado,
		a.MontoPagoMpoGenera,a.FechaPagoMpoGenera,UsuarioPagoMpoGenera,a.MontoPagoMpoCobra,a.FechaPagoMpoCobra,a.UsuarioPagoMpoCobra,a.MontoPagoEmpresa,a.FechaPagoEmpresa,a.UsuarioPagoEmpresa
		FROM  [DBancoNac].[dbo].[Procesado] a
		inner join [DBancoNac].[dbo].[Estados] b on a.idEstado=b.idEstado
		inner join [DBancoNac].[dbo].[Municipios] c on a.idMunicipio=c.idMunicipio
		inner join  [DBancoNac].[dbo].[Usuarios] d on a.UsuarioProcesado=d.IdUsuario
		
	end

	if @TipoMovimiento=4
	begin
	
		update a  set  FechaPagoMpoGenera=b.FechaMonto1,FechaPagoMpoCobra=b.FechaMonto2,FechaPagoEmpresa=b.FechaMonto3
		from [DBancoNac].[dbo].[Procesado] a
		inner join @tblProcesado b on  a.IdProcesado=b.IdProceso
		


		--select * from [DBancoNac].[dbo].[Procesado] a
		--inner join @tblProcesado b on a.IdProcesado on a.IdProcesado=b.IdProceso

		
	end
	
	

	--select *from [DBancoNac].[dbo].[Procesado]
	--select *from [DBancoNac].[dbo].[Usuarios]
END


GO
/****** Object:  StoredProcedure [dbo].[Sp_Usuario]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Usuario] 
  
						--TipoMovimiento
			--1.-Consulta, 2.-Insertar,3.-Eliminar,4.-Modificar
			
               @TipoMovimiento  As Int = 0,
               @IdEstado	    As Int = 0,
			   @IdMunicipio	    As Int = 0,
			   @IdUsuario		As Int = 0,
			   @Referencia		As Varchar(50) = '',
			   @Nombre			As Varchar(50) = '',
			   @Apaterno		As Varchar(50) = '',
			   @Amaterno	    As Varchar(50) = '',
			   @iPassword		As Varchar(50) = '',
			   @Departamento    As Varchar(50) = '',
			   @Area            As Varchar(50) = '',
			   @Email		    As Varchar(50) = '',
			   @Telefono		As Int = 0,
			   @Estatus			As Int = 0
			  
AS

BEGIN	

	if @TipoMovimiento=1
	begin
	SELECT [idEstado]
      ,[idMunicipio]
      ,[idusuario]
      ,[Referencia]			--No se tomara en cuenta para alta
      ,[Nombre]
      ,[Apaterno]
      ,[Amaterno]
      ,[iPassword]			--No se tomara en cuenta para alta(se guardar en tabla )
      ,[Departamento]		--No se tomara en cuenta para alta
      ,[Area]				--No se tomara en cuenta para alta
	  ,Email
	  ,Telefono
      ,[estatus]
  FROM [DBancoNac].[dbo].[Usuarios]
	end


	--if @TipoMovimiento=2
	--begin
	--declare @Folio as Int 

	--INSERT INTO [DBancoNac].[dbo].[Usuarios]
 --  (idEstado,idMunicipio,Nombre,Apaterno,Amaterno,iPassword,Departamento,Area,Email,Telefono,estatus)
 --   VALUES 
 --  (@IdEstado, @IdMunicipio,@Nombre,@Apaterno,@Amaterno,@iPassword,@Departamento,@Area,@Email,@Telefono,@Estatus)
	--end

	if @TipoMovimiento=3
	begin
		delete from [DBancoNac].[dbo].[Usuarios]
		where idusuario=@idusuario
	end

	if @TipoMovimiento=4
	begin
		update [DBancoNac].[dbo].[Usuarios] set
	   idEstado=@IdEstado,idMunicipio=@IdMunicipio,Nombre=@Nombre,Apaterno=@Apaterno,Amaterno=@Amaterno,iPassword=@iPassword,
	   Departamento=@Departamento,Area=@Area,Email=@Email,Telefono=@Telefono,estatus=@Estatus
		where idusuario=@idusuario
	end


	

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ValidaUsuarioEliminado]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_ValidaUsuarioEliminado]
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
GO
/****** Object:  Table [dbo].[Agentes]    Script Date: 05/10/2018 01:22:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agentes](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idagente] [int] IDENTITY(1,1) NOT NULL,
	[Referencia] [varchar](25) NULL,
	[Nombre] [varchar](50) NULL,
	[Apaterno] [varchar](50) NULL,
	[Amaterno] [varchar](50) NULL,
	[Estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/10/2018 01:22:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/10/2018 01:22:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/10/2018 01:22:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/10/2018 01:22:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/10/2018 01:22:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 05/10/2018 01:22:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[folio] [int] NULL,
	[FechaMov] [datetime] NULL,
	[idproceso] [int] NULL,
	[idusuario] [int] NULL,
	[DescMov] [nchar](100) NULL,
	[Referencia] [nchar](25) NULL,
	[idplaca] [nchar](10) NULL,
	[idlicencia] [nchar](25) NULL,
	[MontoAnterior] [decimal](12, 2) NULL,
	[MontoNuevo] [decimal](12, 2) NULL,
	[idFolPago] [int] NULL
)

GO
/****** Object:  Table [dbo].[BitacoraCatalogos]    Script Date: 05/10/2018 01:22:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraCatalogos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMovimiento] [int] NULL,
	[idCatalogo] [int] NULL,
	[idUsuario] [int] NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Cajeros]    Script Date: 05/10/2018 01:22:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cajeros](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idOficina] [int] NULL,
	[idcaja] [int] IDENTITY(1,1) NOT NULL,
	[idusuario] [int] NULL,
	[ipassword] [varchar](10) NULL,
	[FolioActual] [int] NULL,
	[FolioInicial] [int] NULL,
	[FolioFinal] [int] NULL,
	[UltimoAcceso] [datetime] NULL,
	[Estatuscaja] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 05/10/2018 01:22:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[nomEstado] [varchar](50) NULL,
	[siglasEstado] [varchar](5) NULL,
	[Contacto] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[idLicencia] [varchar](50) NULL,
	[estatusEstado] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Funciones]    Script Date: 05/10/2018 01:22:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Funciones](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[IdSistema] [int] NULL,
	[IdVentana] [int] NULL,
	[Idfuncion] [int] IDENTITY(1,1) NOT NULL,
	[NomFuncion] [varchar](25) NULL,
	[Estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Multas]    Script Date: 05/10/2018 01:22:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Multas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idboleta] [int] NULL,
	[idplaca] [nchar](10) NULL,
	[FolioMulta] [int] NULL,
	[fechaMulta] [datetime] NULL,
	[Calle1Multa] [nchar](50) NULL,
	[Calle2Multa] [nchar](50) NULL,
	[LongitudMulta] [nchar](20) NULL,
	[LatitudMulta] [nchar](20) NULL,
	[Descripcion] [nchar](100) NULL,
	[idAgente] [int] NULL,
	[Nolicencia] [nchar](20) NULL,
	[FechaPago] [datetime] NULL,
	[ReciboPago] [varchar](200) NULL,
	[TotalPago] [decimal](12, 2) NULL,
	[DescuentoPago] [decimal](12, 2) NULL,
	[EstatusMulta] [int] NULL,
	[Capturista] [int] NULL,
	[FechaCancel] [datetime] NULL,
	[Cancelousuario] [int] NULL,
	[TarjetaCirculacion] [nchar](25) NULL,
	[Procesado] [int] NULL,
	[ReferenciaProceso] [nchar](50) NULL,
	[Monto] [decimal](12, 2) NULL,
	[FechaProceso] [datetime] NULL,
	[UsuarioProceso] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MultasDetalle]    Script Date: 05/10/2018 01:22:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MultasDetalle](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idboleta] [int] NULL,
	[idplaca] [nchar](10) NULL,
	[idmulta] [int] NULL,
	[importemulta] [decimal](12, 2) NULL,
	[estatus] [int] NULL,
	[recibopago] [varchar](200) NULL,
	[fechapago] [datetime] NULL,
	[FolioMulta] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MultasTipo]    Script Date: 05/10/2018 01:22:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MultasTipo](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idmulta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Cantidad] [decimal](18, 2) NULL,
	[DPPMulta] [int] NULL,
	[ApLicaDesc] [int] NULL,
	[Estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 05/10/2018 01:22:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipios](
	[idEstado] [int] NULL,
	[idMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[NomMunicipio] [varchar](50) NULL,
	[SiglasMunicipio] [varchar](5) NULL,
	[Contacto] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[idLicencia] [varchar](50) NULL,
	[EstatusMunicipio] [bit] NULL,
	[PorcentajeCobroM] [decimal](18, 2) NULL,
	[PorcentajeGenera] [decimal](18, 2) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Oficinas]    Script Date: 05/10/2018 01:22:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Oficinas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idOficina] [int] IDENTITY(1,1) NOT NULL,
	[DescOficina] [varchar](50) NULL,
	[DireccOficina] [varchar](200) NULL,
	[TelefOficina] [varchar](50) NULL,
	[EstatusOficina] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 05/10/2018 01:22:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apaterno] [varchar](50) NULL,
	[Amaterno] [varchar](50) NULL,
	[Licencia] [varchar](25) NULL,
	[INE] [varchar](25) NULL,
	[Estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Placas]    Script Date: 05/10/2018 01:22:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Placas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idPlaca] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](10) NULL,
	[Marca] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[Modelo] [varchar](10) NULL,
	[Serie] [varchar](50) NULL,
	[Estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Procesado]    Script Date: 05/10/2018 01:22:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Procesado](
	[idprocesado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[UsuarioProcesado] [varchar](200) NULL,
	[FechaProcesado] [datetime] NULL,
	[IdEstado] [int] NULL,
	[IdMunicipio] [int] NULL,
	[MontoPagoMpoGenera] [varchar](200) NULL,
	[FechaPagoMpoGenera] [datetime] NULL,
	[UsuarioPagoMpoGenera] [varchar](200) NULL,
	[MontoPagoMpoCobra] [varchar](200) NULL,
	[FechaPagoMpoCobra] [datetime] NULL,
	[UsuarioPagoMpoCobra] [varchar](200) NULL,
	[MontoPagoEmpresa] [varchar](200) NULL,
	[FechaPagoEmpresa] [datetime] NULL,
	[UsuarioPagoEmpresa] [varchar](200) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Procesos]    Script Date: 05/10/2018 01:22:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Procesos](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idproceso] [int] IDENTITY(1,1) NOT NULL,
	[NomProceso] [varchar](25) NULL,
	[Sistema] [nchar](25) NULL,
	[Ventana] [nchar](25) NULL,
	[Boton] [nchar](25) NULL,
	[Estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seguridad]    Script Date: 05/10/2018 01:22:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seguridad](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[idVentana] [int] NULL,
	[idFuncion] [int] NULL,
	[idusuario] [int] NULL,
	[estatus] [int] NULL
)

GO
/****** Object:  Table [dbo].[Sistemas]    Script Date: 05/10/2018 01:23:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sistemas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[IdSistema] [int] IDENTITY(1,1) NOT NULL,
	[NomSistema] [nchar](25) NULL,
	[Estatus] [bit] NULL
)

GO
/****** Object:  Table [dbo].[Tbl_Errores]    Script Date: 05/10/2018 01:23:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Errores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exeption] [varchar](max) NULL,
	[userId] [varchar](200) NULL,
	[message] [varchar](max) NULL,
	[dateExc] [datetime] NULL,
	[IP] [varchar](100) NULL,
	[maquina] [varchar](50) NULL,
	[url] [varchar](200) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/10/2018 01:23:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[Referencia] [nchar](10) NULL,
	[Nombre] [varchar](20) NULL,
	[Apaterno] [varchar](50) NULL,
	[Amaterno] [varchar](50) NULL,
	[iPassword] [nchar](50) NULL,
	[Departamento] [int] NULL,
	[Area] [nchar](50) NULL,
	[Email] [nchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[estatus] [int] NULL,
	[userId] [varchar](128) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuariosVentana]    Script Date: 05/10/2018 01:23:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuariosVentana](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idVentana] [int] NULL,
	[estatus] [bit] NULL,
	[usrCrtd] [varchar](200) NULL,
	[dateCrtd] [datetime] NULL,
	[usrMod] [varchar](200) NULL,
	[dateMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventanas]    Script Date: 05/10/2018 01:23:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventanas](
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[idsistema] [int] NULL,
	[idVentana] [int] IDENTITY(1,1) NOT NULL,
	[NomVentana] [varchar](25) NULL,
	[URL] [varchar](500) NULL,
	[estatus] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'387d0ba0-c23d-4fd8-b7cc-a6bf57c2b2f4', N'Administrador')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'47eb563e-1dee-4a53-991b-d7a4be99d95f', N'Capturista')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'900d4360-0620-45d2-a65f-d673c1cef26c', N'Cajero')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fc030497-c781-4b31-8ad2-ad8d59a22fad', N'Desarrollador')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16c3859c-b83a-493c-b891-8e074cb1dde0', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'611493d3-04d4-412a-9b33-dc7791888111', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a828a0d8-793b-4379-a0a8-4170ea5023e2', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ad9132d2-7d62-49ff-99eb-2fd3072c377e', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba3f83bf-f36f-463e-9661-c4ac53ff11de', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', N'387d0ba0-c23d-4fd8-b7cc-a6bf57c2b2f4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f85f8536-4286-46c0-b6b9-e8aaa74c1f1e', N'fc030497-c781-4b31-8ad2-ad8d59a22fad')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'14e131f7-e370-4cae-8f74-3797fbed953e', N'm_jmh@hotmail.com', 0, N'ALc6TMKq3NUTRzCx8ER9kCE+x6YHNDtn8uNAevjEv5YczGNEQQyQnd2szGIbnW+BKA==', N'87a53de6-82a2-4c22-aafa-2ca63d6a8a71', NULL, 0, 0, NULL, 1, 0, N'm_jmh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3e6f28f5-39fa-497c-9671-e7bdef25c0f7', N'mmaya1981@gmail.com', 0, N'AJC+4DUg8KMX232KwP6kmFTD6bgwetE76oPeul8EFWe9BjFuqvBaWfs3bjDPX2T4vQ==', N'7f4cde65-1704-4150-a7cf-b6e066e3a08e', NULL, 0, 0, NULL, 1, 0, N'mmaya')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', N'tabata.cavazos@gmail.com', 0, N'AMqYtOKenIc3wm0aEN691M/6J9rKdIV0MLR8lXltTwcB3L0weOocAgBzRThzdg2JUg==', N'1b634f83-f86e-422f-8b88-55d0c452a213', NULL, 0, 0, NULL, 1, 0, N'Tabata')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a828a0d8-793b-4379-a0a8-4170ea5023e2', N'ricardo2.eslava89@gmail.com', 0, N'AG/AJtNyEV8bWEigrq4AxsBUhKmaFnk3saDbNYIBkDfHgb6Y50bIM6+zDq3q/2tQSA==', N'76da7e04-69ee-4db2-b026-cd713ffe49ed', NULL, 0, 0, NULL, 1, 0, N'ricardin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ba3f83bf-f36f-463e-9661-c4ac53ff11de', N'fulanito@usuario.com', 0, N'AKW/xsIdIQ/vUU8br4Nj/Lkoq70G17aY9IPv3YS2owwg9dMEyvWgJvV8OpUwljEh7g==', N'c3bd1e7f-1a67-4c5e-82b2-9694a8ae9d1d', NULL, 0, 0, NULL, 1, 0, N'fulanito')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', N'ricardo.eslava89@gmail.com', 1, N'AL+HxFJAraaM05YzBidN7b9+zC8Xwt/83b6yUyxB77WmQUwNcL+wlsa4wfcZESiEcg==', N'2c1b060b-3c80-4335-8b13-fa08cb11fae0', NULL, 0, 0, NULL, 1, 0, N'ricardo.eslava89@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ebbeec07-11f4-40f4-a67e-5d797308bb52', N'cajero@cajero.mx', 0, N'AHhTgsCQRUu6NXWtxoOHsq+IZERmHaoGyfv9+6Z+IV9apBa/b6HEnKCOY+63y3NtRg==', N'a4ed3629-dbf4-4334-b2a7-ac1e5f528265', NULL, 0, 0, NULL, 1, 0, N'ricardo.eslava89@gma')
SET IDENTITY_INSERT [dbo].[BitacoraCatalogos] ON 

INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (1, 2, 2, 1, CAST(0x0000A95C0068DEC0 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (2, 2, 2, 1, CAST(0x0000A95C006EADDE AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (3, 2, 2, 1, CAST(0x0000A95C006F59CA AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (4, 2, 2, 1, CAST(0x0000A95C006FE329 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (5, 2, 2, 1, CAST(0x0000A95C006FF6F0 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (6, 4, 2, 1, CAST(0x0000A95C0079BA80 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (7, 3, 2, 1, CAST(0x0000A95C007A18B6 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (8, 2, 2, 1, CAST(0x0000A95C008C7C56 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (9, 2, 2, 1, CAST(0x0000A95C008D179D AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (10, 2, 2, 1, CAST(0x0000A95C008DAAF7 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (11, 4, 2, 1, CAST(0x0000A95C008DC7AD AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (12, 2, 1, 1, CAST(0x0000A95C009B4546 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (13, 4, 1, 1, CAST(0x0000A95C009B6AB3 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (14, 4, 1, 1, CAST(0x0000A95C009B8EEB AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (15, 2, 2, 1, CAST(0x0000A95C009D181E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (16, 4, 2, 1, CAST(0x0000A95C009D3016 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (17, 4, 2, 1, CAST(0x0000A95C009D82BA AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (18, 4, 2, 1, CAST(0x0000A95C009E03DB AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (19, 4, 2, 1, CAST(0x0000A95C009E1FCC AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (20, 2, 5, 1, CAST(0x0000A95C01694A06 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (21, 2, 1, 1, CAST(0x0000A95C016CFA47 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (22, 4, 1, 1, CAST(0x0000A95C016D0FB4 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (23, 3, 1, 1, CAST(0x0000A95C016D18E5 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (24, 2, 1, 1, CAST(0x0000A95C016E10C7 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (25, 2, 2, 1, CAST(0x0000A95C016EE459 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (26, 4, 2, 1, CAST(0x0000A95C016F0EE7 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (27, 2, 2, 1, CAST(0x0000A95C0178513C AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (28, 2, 5, 1, CAST(0x0000A95C0178CDDD AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (29, 4, 5, 1, CAST(0x0000A95C0182500E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (30, 4, 5, 1, CAST(0x0000A95C018A923E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (31, 3, 5, 1, CAST(0x0000A95D00003096 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (32, 2, 5, 1, CAST(0x0000A95D00005604 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (33, 2, 6, 1, CAST(0x0000A95D001870EF AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (34, 4, 6, 1, CAST(0x0000A95D0018C818 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (35, 3, 6, 1, CAST(0x0000A95D0018DB9D AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (36, 2, 6, 1, CAST(0x0000A95D001CE4F5 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (37, 4, 6, 1, CAST(0x0000A95D001CF359 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (38, 4, 3, 1, CAST(0x0000A95D0022333B AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (39, 4, 6, 1, CAST(0x0000A95D0023B744 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (40, 2, 7, 1, CAST(0x0000A95D00283CFF AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (41, 2, 7, 1, CAST(0x0000A95D00286D1A AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (42, 3, 7, 1, CAST(0x0000A95D00287715 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (43, 4, 7, 1, CAST(0x0000A95D0028DCFB AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (44, 4, 7, 1, CAST(0x0000A95D0028EFEA AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (45, 2, 6, 1, CAST(0x0000A95D002BF09F AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (46, 4, 6, 1, CAST(0x0000A95D002C07A8 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (47, 4, 1, 1, CAST(0x0000A95D002C1BCD AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (48, 4, 1, 1, CAST(0x0000A95D002C41F6 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (49, 4, 1, 1, CAST(0x0000A95D002C4D6C AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (50, 2, 3, 1, CAST(0x0000A95D00578470 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (51, 4, 3, 1, CAST(0x0000A95D0057B046 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (52, 4, 2, 1, CAST(0x0000A95D005A5D0C AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (53, 4, 1, 1, CAST(0x0000A95D005E1812 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (54, 4, 2, 1, CAST(0x0000A95D0061CF90 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (55, 4, 2, 1, CAST(0x0000A95D006204BD AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (56, 4, 2, 1, CAST(0x0000A95D00620F73 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (57, 4, 2, 1, CAST(0x0000A95D00621737 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (58, 4, 2, 1, CAST(0x0000A95D00621B5A AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (59, 4, 2, 1, CAST(0x0000A95D00621E98 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (60, 4, 1, 1, CAST(0x0000A95D0064262D AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (61, 4, 2, 1, CAST(0x0000A95D006438E4 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (62, 2, 7, 1, CAST(0x0000A95D0064999C AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (63, 4, 5, 1, CAST(0x0000A95D00653E69 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (64, 4, 7, 1, CAST(0x0000A95D0068D5B5 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (65, 3, 7, 1, CAST(0x0000A95D0068EA2E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (66, 2, 7, 1, CAST(0x0000A95D006904B6 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (67, 2, 5, 1, CAST(0x0000A95D006938EB AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (68, 4, 5, 1, CAST(0x0000A95D006AF8BE AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (69, 3, 5, 1, CAST(0x0000A95D006B09B7 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (70, 4, 6, 1, CAST(0x0000A95D006C46AB AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (71, 2, 3, 1, CAST(0x0000A95D006E3A87 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (72, 2, 2, 1, CAST(0x0000A95D007500FD AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (73, 2, 3, 1, CAST(0x0000A95D0075491E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (74, 4, 2, 1, CAST(0x0000A95D00769FD9 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (75, 4, 3, 1, CAST(0x0000A95D007BD27E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (76, 4, 3, 1, CAST(0x0000A95D007C5689 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (77, 4, 3, 1, CAST(0x0000A95D007F52AE AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (78, 4, 3, 1, CAST(0x0000A95D00812B92 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (79, 2, 5, 7, CAST(0x0000A95F002B50B1 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (80, 4, 3, 1, CAST(0x0000A95F00738957 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (81, 4, 3, 1, CAST(0x0000A95F0073CF4A AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (82, 4, 3, 1, CAST(0x0000A95F00747218 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (83, 4, 3, 1, CAST(0x0000A95F0074AE1A AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (84, 4, 3, 1, CAST(0x0000A95F00752AE0 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (85, 4, 3, 1, CAST(0x0000A95F00759F3A AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (86, 4, 3, 1, CAST(0x0000A960002AB4F3 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (87, 4, 3, 1, CAST(0x0000A960002ADC93 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (88, 4, 3, 1, CAST(0x0000A960002B69D4 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (89, 4, 3, 1, CAST(0x0000A960002C2BF3 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (90, 4, 3, 1, CAST(0x0000A960002CE042 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (91, 4, 3, 1, CAST(0x0000A960002D6489 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (92, 4, 3, 1, CAST(0x0000A960002E4875 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (93, 4, 3, 1, CAST(0x0000A960002E7A27 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (94, 4, 6, 1, CAST(0x0000A960002EB332 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (95, 4, 3, 1, CAST(0x0000A960002F13B6 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (96, 4, 3, 1, CAST(0x0000A960002FE113 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (97, 4, 3, 1, CAST(0x0000A96000311E2C AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (98, 4, 2, 7, CAST(0x0000A96000444193 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (99, 4, 6, 7, CAST(0x0000A9600047DFA5 AS DateTime))
GO
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (100, 4, 6, 7, CAST(0x0000A9600047FBC5 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (101, 4, 6, 7, CAST(0x0000A96000499BEF AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (102, 4, 6, 7, CAST(0x0000A9600049B0CA AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (103, 2, 6, 1, CAST(0x0000A960004DAC61 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (104, 4, 3, 1, CAST(0x0000A960004E96FC AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (105, 4, 6, 1, CAST(0x0000A960004EE6D2 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (106, 4, 3, 1, CAST(0x0000A960004F03EA AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (107, 2, 9, 7, CAST(0x0000A96200504BEC AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (108, 2, 5, 7, CAST(0x0000A96200516F00 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (109, 2, 14, 7, CAST(0x0000A9620055295E AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (110, 2, 14, 7, CAST(0x0000A96200558A6B AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (111, 3, 14, 7, CAST(0x0000A9620055BB9F AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (112, 2, 8, 7, CAST(0x0000A9640032B8A2 AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (113, 2, 8, 7, CAST(0x0000A9640035556F AS DateTime))
INSERT [dbo].[BitacoraCatalogos] ([id], [idTipoMovimiento], [idCatalogo], [idUsuario], [fecha]) VALUES (114, 4, 3, 1, CAST(0x0000A96400488AF4 AS DateTime))
SET IDENTITY_INSERT [dbo].[BitacoraCatalogos] OFF
SET IDENTITY_INSERT [dbo].[Cajeros] ON 

INSERT [dbo].[Cajeros] ([idEstado], [idMunicipio], [idOficina], [idcaja], [idusuario], [ipassword], [FolioActual], [FolioInicial], [FolioFinal], [UltimoAcceso], [Estatuscaja]) VALUES (19, 45, 1, 1, 1, N'', 24235, 345435, 345456, CAST(0x0000A96200552840 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Cajeros] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (1, N'AGUASCALIENTES', N'AGS', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (2, N'BAJA CALIFORNIA', N'BC', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (3, N'BAJA CALIFORNIA SUR', N'BCS', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (4, N'CAMPECHE', N'CAMP', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (5, N'CHIHUAHUA', N'CHIH', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (6, N'CHIAPAS', N'CHIS', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (7, N'COAHUILA', N'COAH', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (8, N'COLIMA', N'COL', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (9, N'DISTRITO FEDERAL', N'DF', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (10, N'DURANGO', N'DGO', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (11, N'GUERRERO', N'GRO', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (12, N'GUANAJUATO', N'GTO', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (13, N'HIDALGO', N'HGO', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (14, N'JALISCO', N'JAL', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (15, N'MEXICO', N'MEX', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (16, N'MICHOACÁN', N'MICH', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (17, N'MORELOS', N'MOR', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (18, N'NAYARIT', N'NAY', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (19, N'NUEVO LEÓN', N'NL', NULL, NULL, NULL, N'1', 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (20, N'OAXACA', N'OAX', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (21, N'PUEBLA', N'PUE', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (22, N'QUERÉTARO', N'QRO', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (23, N'QUINTANA ROO', N'QROO', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (24, N'SINALOA', N'SIN', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (25, N'SAN LUIS POTOSÍ', N'SLP', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (26, N'SONORA', N'SON', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (27, N'TABASCO', N'TAB', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (28, N'TAMAULIPAS', N'TAMPS', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (29, N'TLAXCALA', N'TLAX', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (30, N'VERACRUZ', N'VER', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (31, N'YUCATÁN', N'YUC', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Estados] ([idEstado], [nomEstado], [siglasEstado], [Contacto], [Telefono], [Correo], [idLicencia], [estatusEstado]) VALUES (32, N'ZACATECAS', N'ZAC', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Estados] OFF
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 14, 564516, N'uifryu894 ', 1, CAST(0x0000A94E00000000 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A96400511623 AS DateTime), NULL, CAST(546.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 1, 1, CAST(0x0000000000000000 AS DateTime), 0, N'                         ', 1, N'                                                  ', CAST(547.00 AS Decimal(12, 2)), CAST(0x0000A96B005E30E7 AS DateTime), 7)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 39, 564516, N'uifryu894 ', 1, CAST(0x0000A94E00000000 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A96400511623 AS DateTime), NULL, CAST(552.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 1, 1, CAST(0x0000000000000000 AS DateTime), 0, N'                         ', 2, N'                                                  ', CAST(552.00 AS Decimal(12, 2)), CAST(0x0000A96B005AD54C AS DateTime), 7)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 39, 564517, N'uifryu894 ', 1, CAST(0x0000A94E00000000 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A96400511623 AS DateTime), NULL, CAST(552.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 1, 1, CAST(0x0000000000000000 AS DateTime), 0, N'                         ', 2, N'                                                  ', CAST(552.00 AS Decimal(12, 2)), CAST(0x0000A96B005AD54C AS DateTime), 7)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 14, 564517, N'uifryu894 ', 1, CAST(0x0000A94E00000000 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A96400511623 AS DateTime), NULL, CAST(552.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 1, 1, CAST(0x0000000000000000 AS DateTime), 0, N'                         ', 1, N'                                                  ', CAST(552.00 AS Decimal(12, 2)), CAST(0x0000A96B005E30E7 AS DateTime), 7)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 14, 564518, N'uifryu894 ', 1, CAST(0x0000A94E00000000 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A96400511623 AS DateTime), NULL, CAST(552.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 1, 1, CAST(0x0000000000000000 AS DateTime), 0, N'                         ', 1, N'                                                  ', CAST(552.00 AS Decimal(12, 2)), CAST(0x0000A96B005079CC AS DateTime), 7)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 14, 564519, N'uifryu894 ', 1, CAST(0x0000A96B007CECC6 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A96100000000 AS DateTime), N'MI info             ', CAST(546.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 1, 1, NULL, 0, N'                         ', 0, N'                                                  ', CAST(546.00 AS Decimal(12, 2)), NULL, 0)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 14, 564520, N'STD-1234  ', 1, CAST(0x0000A96C00545E83 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', CAST(0x0000A94E00000000 AS DateTime), N'Número transferencia: 12343', CAST(546.00 AS Decimal(12, 2)), CAST(1.00 AS Decimal(12, 2)), 1, 1, NULL, 0, N'                         ', 0, N'                                                  ', CAST(546.00 AS Decimal(12, 2)), NULL, 0)
INSERT [dbo].[Multas] ([idEstado], [idMunicipio], [idboleta], [idplaca], [FolioMulta], [fechaMulta], [Calle1Multa], [Calle2Multa], [LongitudMulta], [LatitudMulta], [Descripcion], [idAgente], [Nolicencia], [FechaPago], [ReciboPago], [TotalPago], [DescuentoPago], [EstatusMulta], [Capturista], [FechaCancel], [Cancelousuario], [TarjetaCirculacion], [Procesado], [ReferenciaProceso], [Monto], [FechaProceso], [UsuarioProceso]) VALUES (19, 14, 564521, N'STD-1234  ', 1, CAST(0x0000A96C00548C25 AS DateTime), N'calle1                                            ', N'calle2                                            ', N'10.234534           ', N'10.243543           ', N'Descripcion                                                                                         ', 1, N'4354654             ', NULL, NULL, CAST(125.00 AS Decimal(12, 2)), CAST(1.00 AS Decimal(12, 2)), 1, 1, NULL, 0, N'                         ', 0, N'                                                  ', CAST(125.00 AS Decimal(12, 2)), NULL, 0)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 14, 564516, N'uifryu894 ', 2, CAST(552.00 AS Decimal(12, 2)), 1, NULL, CAST(0x0000A96B0006EDA9 AS DateTime), 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 39, 564516, N'uifryu894 ', 2, CAST(552.00 AS Decimal(12, 2)), 1, NULL, CAST(0x0000A96B0006EDA9 AS DateTime), 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 39, 564517, N'uifryu894 ', 2, CAST(552.00 AS Decimal(12, 2)), 1, NULL, CAST(0x0000A96B0006EDA9 AS DateTime), 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 14, 564517, N'uifryu894 ', 2, CAST(552.00 AS Decimal(12, 2)), 1, NULL, CAST(0x0000A96B0006EDA9 AS DateTime), 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 14, 564518, N'uifryu894 ', 2, CAST(552.00 AS Decimal(12, 2)), 1, NULL, CAST(0x0000A96B0006EDA9 AS DateTime), 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 14, 564520, N'STD-1234  ', 1, CAST(546.00 AS Decimal(12, 2)), 1, N'Número transferencia: 12343', CAST(0x0000A94E00000000 AS DateTime), 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 14, 564521, N'STD-1234  ', 1, CAST(125.00 AS Decimal(12, 2)), 1, NULL, NULL, 1)
INSERT [dbo].[MultasDetalle] ([idEstado], [idMunicipio], [idboleta], [idplaca], [idmulta], [importemulta], [estatus], [recibopago], [fechapago], [FolioMulta]) VALUES (19, 14, 564519, N'uifryu894 ', 1, CAST(546.00 AS Decimal(12, 2)), 1, N'MI info             ', CAST(0x0000A96100000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MultasTipo] ON 

INSERT [dbo].[MultasTipo] ([idEstado], [idMunicipio], [idmulta], [Descripcion], [Cantidad], [DPPMulta], [ApLicaDesc], [Estatus]) VALUES (19, 39, 1, N'DescripcionMulta', CAST(23.00 AS Decimal(18, 2)), 111, 1, 1)
INSERT [dbo].[MultasTipo] ([idEstado], [idMunicipio], [idmulta], [Descripcion], [Cantidad], [DPPMulta], [ApLicaDesc], [Estatus]) VALUES (19, 39, 2, N'MultaDEsc2', CAST(451.00 AS Decimal(18, 2)), 11, 1, 1)
SET IDENTITY_INSERT [dbo].[MultasTipo] OFF
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 1, N'Abasolo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 2, N'Agualeguas', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 3, N'Los Aldamas', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 4, N'Ciudad de Allende', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 5, N'Anahuac', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 6, N'Aramberri', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 7, N'Bustamante', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 8, N'Cadereyta Jimenez', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 9, N'Carmen', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 10, N'Cienega de Flores', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 11, N'China', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 12, N'Galeana', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 13, N'Garcia', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 14, N'San Pedro Garza Garcia', NULL, NULL, NULL, NULL, N'1', 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 15, N'Guadalupe', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 16, N'Los Herreras', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 17, N'Higueras', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 18, N'Hualahuises', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 19, N'Iturbide', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 20, N'Ciudad Benito Juarez', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 21, N'Lampazos de Naranjo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 22, N'Linares', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 23, N'Marin', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 24, N'Melchor Ocampo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 25, N'Mier y Noriega', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 26, N'Mina', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 27, N'Montemorelos', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 28, N'Monterrey', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 29, N'Paras', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 30, N'Pesqueria', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 31, N'Los Ramones', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 32, N'Rayones', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 33, N'Salinas Victoria', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 34, N'San Nicolas de Los Garza', NULL, NULL, NULL, NULL, N'1', 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 35, N'Hidalgo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 36, N'Ciudad Santa Catarina', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 37, N'Santiago', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 38, N'Vallecillo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 39, N'Apodaca', NULL, NULL, NULL, NULL, N'1', 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 40, N'Cerralvo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 41, N'Dr. Arroyo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 42, N'Dr. Coss', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 43, N'Dr. Gonzalez', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 44, N'Gral. Bravo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 45, N'Gral. Escobedo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 46, N'Gral. Teran', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 47, N'Gral. Trevino', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 48, N'Gral. Zaragoza', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 49, N'Gral. Zuazua', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 50, N'Sabinas Hidalgo', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[Municipios] ([idEstado], [idMunicipio], [NomMunicipio], [SiglasMunicipio], [Contacto], [Telefono], [Correo], [idLicencia], [EstatusMunicipio], [PorcentajeCobroM], [PorcentajeGenera]) VALUES (19, 51, N'Villaldama', NULL, NULL, NULL, NULL, NULL, 1, CAST(0.15 AS Decimal(18, 2)), CAST(0.70 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Municipios] OFF
SET IDENTITY_INSERT [dbo].[Oficinas] ON 

INSERT [dbo].[Oficinas] ([idEstado], [idMunicipio], [idOficina], [DescOficina], [DireccOficina], [TelefOficina], [EstatusOficina]) VALUES (19, 45, 1, N'CENTRAL ESCOBEDO', N'XIDHF', N'8223765894', 1)
SET IDENTITY_INSERT [dbo].[Oficinas] OFF
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([idEstado], [idMunicipio], [idpersona], [Nombre], [Apaterno], [Amaterno], [Licencia], [INE], [Estatus]) VALUES (-1, -1, 1, N'Arturo2', N'Cavazos2', N'Arredondo2', N'234kjb452', N'2', 1)
INSERT [dbo].[Personas] ([idEstado], [idMunicipio], [idpersona], [Nombre], [Apaterno], [Amaterno], [Licencia], [INE], [Estatus]) VALUES (3, 1, 4, N'Sofia', N'Cavazos', N'Fernandez', N'23435fevgb', N'edv434', 1)
SET IDENTITY_INSERT [dbo].[Personas] OFF
SET IDENTITY_INSERT [dbo].[Procesado] ON 

INSERT [dbo].[Procesado] ([idprocesado], [Descripcion], [UsuarioProcesado], [FechaProcesado], [IdEstado], [IdMunicipio], [MontoPagoMpoGenera], [FechaPagoMpoGenera], [UsuarioPagoMpoGenera], [MontoPagoMpoCobra], [FechaPagoMpoCobra], [UsuarioPagoMpoCobra], [MontoPagoEmpresa], [FechaPagoEmpresa], [UsuarioPagoEmpresa]) VALUES (1, N'546 san pedro , 552 Apodaca', N'7', CAST(0x0000A96B0075B8A7 AS DateTime), 19, 14, N'1155.0000', NULL, NULL, N'247.5000', NULL, NULL, N'247.5000', NULL, NULL)
INSERT [dbo].[Procesado] ([idprocesado], [Descripcion], [UsuarioProcesado], [FechaProcesado], [IdEstado], [IdMunicipio], [MontoPagoMpoGenera], [FechaPagoMpoGenera], [UsuarioPagoMpoGenera], [MontoPagoMpoCobra], [FechaPagoMpoCobra], [UsuarioPagoMpoCobra], [MontoPagoEmpresa], [FechaPagoEmpresa], [UsuarioPagoEmpresa]) VALUES (2, N'546 san pedro , 552 Apodaca', N'7', CAST(0x0000A96B0075B8A7 AS DateTime), 19, 39, N'772.8000', NULL, NULL, N'165.6000', NULL, NULL, N'165.6000', NULL, NULL)
INSERT [dbo].[Procesado] ([idprocesado], [Descripcion], [UsuarioProcesado], [FechaProcesado], [IdEstado], [IdMunicipio], [MontoPagoMpoGenera], [FechaPagoMpoGenera], [UsuarioPagoMpoGenera], [MontoPagoMpoCobra], [FechaPagoMpoCobra], [UsuarioPagoMpoCobra], [MontoPagoEmpresa], [FechaPagoEmpresa], [UsuarioPagoEmpresa]) VALUES (3, N'Prueba De Descripcion Tab', N'7', CAST(0x0000A96C00609E6E AS DateTime), 19, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Procesado] ([idprocesado], [Descripcion], [UsuarioProcesado], [FechaProcesado], [IdEstado], [IdMunicipio], [MontoPagoMpoGenera], [FechaPagoMpoGenera], [UsuarioPagoMpoGenera], [MontoPagoMpoCobra], [FechaPagoMpoCobra], [UsuarioPagoMpoCobra], [MontoPagoEmpresa], [FechaPagoEmpresa], [UsuarioPagoEmpresa]) VALUES (4, N'Prueba De Descripcion Tab', N'7', CAST(0x0000A96C00609E6E AS DateTime), 19, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Procesado] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (19, 34, 1, N'          ', N'Ricardo', N'Eslava', N'Ventura', N'                                                  ', 1, N'                                                  ', N'ricardo.eslava89@gmail.com                        ', N'111111111111', 1, N'c7eee1b2-76c0-42e4-9926-ed4c840374bb')
INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (19, 34, 6, N'          ', N'RICARDO ULISES', N'VENTURA', N'ESLAVA', NULL, 1, N'                                                  ', N'ricardo2.eslava89@gmail.com                       ', N'121212', 1, N'a828a0d8-793b-4379-a0a8-4170ea5023e2')
INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (19, 34, 7, N'          ', N'Tabata', N'Cavazos', N'Fernandez', NULL, 1, N'                                                  ', N'tabata.cavazos@gmail.com                          ', N'8113856776', 1, N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd')
INSERT [dbo].[Usuarios] ([idEstado], [idMunicipio], [idusuario], [Referencia], [Nombre], [Apaterno], [Amaterno], [iPassword], [Departamento], [Area], [Email], [Telefono], [estatus], [userId]) VALUES (19, 34, 8, N'          ', N'Fulanito', N'Contento', N'Abril', NULL, 1, N'                                                  ', N'fulanito@usuario.com                              ', N'12345', 1, N'ba3f83bf-f36f-463e-9661-c4ac53ff11de')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[UsuariosVentana] ON 

INSERT [dbo].[UsuariosVentana] ([id], [idUsuario], [idVentana], [estatus], [usrCrtd], [dateCrtd], [usrMod], [dateMod]) VALUES (14, 7, 2, 1, N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', CAST(0x0000A960004F040B AS DateTime), N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', CAST(0x0000A960004F040B AS DateTime))
INSERT [dbo].[UsuariosVentana] ([id], [idUsuario], [idVentana], [estatus], [usrCrtd], [dateCrtd], [usrMod], [dateMod]) VALUES (15, 7, 3, 1, N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', CAST(0x0000A960004F040B AS DateTime), N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', CAST(0x0000A960004F040B AS DateTime))
INSERT [dbo].[UsuariosVentana] ([id], [idUsuario], [idVentana], [estatus], [usrCrtd], [dateCrtd], [usrMod], [dateMod]) VALUES (16, 7, 4, 1, N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', CAST(0x0000A960004F040B AS DateTime), N'8dfd7f44-fb2d-438b-b397-3bcdde3624dd', CAST(0x0000A960004F040B AS DateTime))
INSERT [dbo].[UsuariosVentana] ([id], [idUsuario], [idVentana], [estatus], [usrCrtd], [dateCrtd], [usrMod], [dateMod]) VALUES (17, 1, 2, 1, N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', CAST(0x0000A96400488B1A AS DateTime), N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', CAST(0x0000A96400488B1A AS DateTime))
INSERT [dbo].[UsuariosVentana] ([id], [idUsuario], [idVentana], [estatus], [usrCrtd], [dateCrtd], [usrMod], [dateMod]) VALUES (18, 1, 3, 1, N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', CAST(0x0000A96400488B1A AS DateTime), N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', CAST(0x0000A96400488B1A AS DateTime))
INSERT [dbo].[UsuariosVentana] ([id], [idUsuario], [idVentana], [estatus], [usrCrtd], [dateCrtd], [usrMod], [dateMod]) VALUES (19, 1, 4, 1, N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', CAST(0x0000A96400488B1A AS DateTime), N'c7eee1b2-76c0-42e4-9926-ed4c840374bb', CAST(0x0000A96400488B1A AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuariosVentana] OFF
SET IDENTITY_INSERT [dbo].[Ventanas] ON 

INSERT [dbo].[Ventanas] ([idEstado], [idMunicipio], [idsistema], [idVentana], [NomVentana], [URL], [estatus]) VALUES (19, 34, 0, 2, N'CATÁLOGOS', N'Administrador/Catalogos.aspx', 1)
INSERT [dbo].[Ventanas] ([idEstado], [idMunicipio], [idsistema], [idVentana], [NomVentana], [URL], [estatus]) VALUES (19, 34, 0, 3, N'USUARIOS', N'Administrador/Usuarios.aspx', 1)
INSERT [dbo].[Ventanas] ([idEstado], [idMunicipio], [idsistema], [idVentana], [NomVentana], [URL], [estatus]) VALUES (19, 34, 0, 4, N'PROCESAR MULTAS', N'Administrador/Reporte.aspx', 1)
SET IDENTITY_INSERT [dbo].[Ventanas] OFF
USE [master]
GO
ALTER DATABASE [DBancoNac] SET  READ_WRITE 
GO
