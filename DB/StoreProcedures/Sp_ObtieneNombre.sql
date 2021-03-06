USE [DBancoNac]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ObtieneNombre]    Script Date: 11/09/2018 10:48:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Sp_ObtieneNombre] 
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