ALTER PROCEDURE [dbo].[Sp_ObtieneNombre] 
	@id varchar(200)
AS
	SELECT	Nombre + ' ' + Apaterno nombre
	FROM	Usuarios (nolock)
	WHERE	userId = @id