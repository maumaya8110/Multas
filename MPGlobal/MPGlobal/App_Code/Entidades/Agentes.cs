using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class Agentes
{
    public int idEstado { get; set; }
    public string nomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string nomMunicipio { get; set; }
    public int IdAgente { get; set; }
    public string Referencia { get; set; }
    public string Nombre { get; set; }
    public string Apaterno { get; set; }
    public string Amaterno { get; set; }
    public bool Estatus { get; set; }
}