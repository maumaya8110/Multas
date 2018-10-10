using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Personas
/// </summary>
public class Personas
{
    public int IdEstado { get; set; }
    public string NomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public int IdPersona { get; set; }
    public string Nombre { get; set; }
    public string APaterno { get; set; }
    public string AMaterno { get; set; }
    public string Licencia { get; set; }
    public string INE { get; set; }
    public bool Estatus { get; set; }
}