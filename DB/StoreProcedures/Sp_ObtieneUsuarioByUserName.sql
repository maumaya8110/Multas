CREATE PROCEDURE Sp_ObtieneUsuarioByUserName
	@username varchar(200)
AS
	
	SELECT	username
	FROM	AspNetUsers
	WHERE	UserName = @username