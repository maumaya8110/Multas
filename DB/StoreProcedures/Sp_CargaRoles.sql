ALTER PROCEDURE Sp_CargaRoles
AS
	
	SELECT	id,
			[Name] nombre
	FROM	AspNetRoles
	ORDER BY 2 asc
