using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ReporteMultasSinPagar
/// </summary>
public class ReporteMultasSinPagar
{
   public int IdEstado { get; set; }
    public string NomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public int IdBoleta { get; set; }
    public int IdMulta { get; set; }
    public string Descripcion { get; set; }
    public int DPPMulta { get; set; }
    public int AplicaDesc { get; set; }
    public DateTime FechaPago { get; set; }
    public string IdPlaca { get; set; }
    public string ReciboPago { get; set; }
    public string TotalPago { get; set; }

    public string FechaMulta { get; set; }
}