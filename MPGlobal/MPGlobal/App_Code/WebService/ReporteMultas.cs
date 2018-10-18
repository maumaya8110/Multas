using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ReporteMultas
/// </summary>
public class ReporteMultas
{
    public int IdEstado { get; set; }
    public string NomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public int IdBoleta { get; set; }
	public string IdPlaca { get; set; }
    public int FolioMulta { get; set; }
    public string FechaMulta { get; set; }
	public string Calle1Multa { get; set; }
    public string Calle2Multa { get; set; }
    public string LongitudMulta { get; set; }
    public string LatitudMulta { get; set; }
    public string Descripcion { get; set; }
    public int IdAgente { get; set; }
    public int NoLicencia {   get; set; }
    public string FechaPago { get; set; }
    public string ReciboPago { get; set; }
	public decimal TotalPago { get; set; }
    public decimal DescuentoPago { get; set; }
    public int EstatusMulta { get; set; }
    public int Capturista { get; set; }
	public string FechaCancel { get; set; }
    public int CanceloUsuario { get; set; }
    public int TarjetaCirculacion { get; set; }
    public int Procesado { get; set; }
	public string ReferenciaProceso { get; set; }
    public decimal Monto { get; set; }
    public string FechaProceso { get; set; }
    public int UsuarioProceso { get; set; }
}