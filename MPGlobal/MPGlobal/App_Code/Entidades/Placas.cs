using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Municipio
/// </summary>
public class Placas
{
    public int idEstado { get; set; }
    public string nomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string nomMunicipio { get; set; }
    public int Idplaca { get; set; }
    public string Placa { get; set; }
    public string Marca { get; set; }
    public string Tipo { get; set; }
    public string Modelo { get; set; }
    public string Serie { get; set; }
    public bool Estatus { get; set; }
}