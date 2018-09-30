using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class Usuario
{
    public int IdUsuario { get; set; }
    public int IdEstado { get; set; }
    public string NomEstado { get; set; }
    public int IdMunicipio { get; set; }
    public string NomMunicipio { get; set; }
    public string Referencia { get; set; }
    public string Nombre { get; set; }
    public string Apaterno { get; set; }
    public string Amaterno { get; set; }
    public string NombreFull { get; set; }
    public string Departamento { get; set; }
    public string Area { get; set; }
    public string Email { get; set; }
    public string Telefono { get; set; }
    public string Estatus { get; set; }
    public string RoleId { get; set; }
    public string Rol { get; set; }
    public string UserId { get; set; }
    public string UserName { get; set; }
}