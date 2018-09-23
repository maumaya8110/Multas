using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class Oficinas
{
    public int idEstado { get; set; }
    public string nomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string nomMunicipio { get; set; }
    public int IdOficina { get; set; }
    public string DescOficina { get; set; }
    public string DireccOficina { get; set; }
    public string TelefOficina { get; set; }
   
    public bool EstatusOficina { get; set; }
}