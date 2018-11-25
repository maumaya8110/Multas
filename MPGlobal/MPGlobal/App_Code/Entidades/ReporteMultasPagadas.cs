using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class ReporteMultasPagadas
{
    public int IdEstado { get; set; }
    public string NomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public string IdBoleta { get; set; }
    public int IdMulta { get; set; }
    public string Descripcion { get; set; }
    public string Cantidad { get; set; }
    public string DPPMulta { get; set; }
    public string AplicaDesc { get; set; }
    public string FechaPago { get; set; }
    public string Total { get; set; }
    public string ReciboPago { get; set; }
    public string IdPlaca { get; set; }


    public string FolioMulta { get; set; }
}
