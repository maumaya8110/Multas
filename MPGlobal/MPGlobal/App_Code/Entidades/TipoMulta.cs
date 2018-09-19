using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class TipoMulta
{
    public int idEstado { get; set; }
    public string nomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string nomMunicipio { get; set; }
    public int idmulta { get; set; }
    public string Descripcion { get; set; }
    public string cantidad { get; set; }
    public string DPPMulta { get; set; }
    public string AplicaDesc { get; set; }
    public bool Estatus { get; set; }
}