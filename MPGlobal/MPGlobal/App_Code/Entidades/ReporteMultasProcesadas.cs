using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class ReporteMultasProcesadas
{
    public int IdEstado { get; set; }
    public string NomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public string IdProcesado { get; set; }
    public string Descripcion { get; set; }
    public DateTime FechaProcesado { get; set; }
    public string UsuarioProcesado { get; set; }
    public string MontoPagoMpoGenera { get; set; }
    public DateTime FechaPagoMpoGenera { get; set; }
    public string UsuarioPagoMpoGenera { get; set; }
    public string MontoPagoMpoCobra { get; set; }
    public DateTime FechaPagoMpoCobra { get; set; }
    public string UsuarioPagoMpoCobra { get; set; }
    public string MontoPagoEmpresa { get; set; }
    public DateTime FechaPagoEmpresa { get; set; }
    public string UsuarioPagoEmpresa { get; set; }
}
