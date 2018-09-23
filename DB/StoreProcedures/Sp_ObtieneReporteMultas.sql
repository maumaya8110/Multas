--CREATE PROCEDURE Sp_ObtieneReporteMultas
--	@idEstado		INT,
--	@idMunicipio	INT,
--	@idLicenciaE	INT,
--	@idLicenciaM	INT,
--	@fechaIni		DATETIME,
--	@fechaFin		DATETIME
--AS
	declare @idEstado		INT = 19,
			@idMunicipio	INT = , 
			@idLicenciaE	INT,
			@idLicenciaM	INT,
			@fechaIni		DATETIME,
			@fechaFin		DATETIME
	
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
	