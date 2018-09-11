using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class Municipio
{
    public int idEstado { get; set; }
    public int idMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public string SiglasMunicipio { get; set; }
    public string Contacto { get; set; }
    public string Telefono { get; set; }
    public string Correo { get; set; }
    public int idLicencia { get; set; }
    public bool EstatusMunicipio { get; set; }
}