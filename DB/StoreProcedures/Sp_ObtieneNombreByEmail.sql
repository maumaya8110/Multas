CREATE PROCEDURE [dbo].[Sp_ObtieneNombreByEmail] 
	@email varchar(200)
AS
	SELECT	Nombre + ' ' + Apaterno nombre
	FROM	Usuarios (nolock)
	WHERE	Email = @email

