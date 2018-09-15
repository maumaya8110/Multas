CREATE PROCEDURE Sp_ObtieneUsuarioByEmail
	@email varchar(200)
AS
	
	SELECT	username
	FROM	AspNetUsers
	WHERE	Email = @email