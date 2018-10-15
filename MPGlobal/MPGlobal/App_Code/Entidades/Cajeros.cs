using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class Cajeros
{
    public int idEstado { get; set; }
    public string nomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string nomMunicipio { get; set; }
    public int idOficina { get; set; }
    public string DescOficina { get; set; }
    public int idCaja { get; set; }
    public int idUsuario { get; set; }
    public string Nombre { get; set; }
    public string iPassword { get; set; }
    public string FolioActual { get; set; }
    public string FolioInicial { get; set; }
    public string FolioFinal { get; set; }
    public string UltimoAcceso { get; set; }

    public bool Estatuscaja { get; set; }
}