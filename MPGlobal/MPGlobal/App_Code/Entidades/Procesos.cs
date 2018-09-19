using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class Procesos
{
    public int idEstado { get; set; }
    public string nomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string nomMunicipio { get; set; }
    public int idproceso { get; set; }
    public string NomProceso { get; set; }
    public string Sistema { get; set; }
    public string Ventana { get; set; }
    public string Boton { get; set; }
    public bool Estatus { get; set; }
}