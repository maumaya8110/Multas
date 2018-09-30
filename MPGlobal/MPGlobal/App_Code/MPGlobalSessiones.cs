using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MPGlobalSessiones
/// </summary>
public class MPGlobalSessiones
{
    public List<Usuario> UsuariosAdministrador;
    public List<Municipio> CatMunicipios;
    public List<ReporteMultasPagadas> ReporteMultasPago;
    public List<Agentes> Agentes;
    public List<Cajeros> Cajeros;
    public List<Estado> Estado;
    public List<Funcion> Funcion;
    public List<Oficinas> Oficinas;
    public List<Placas> Placas;
    public List<Procesos> Procesos;
    public List<Sistemas> Sistemas;
    public List<TipoMulta> TipoMulta;
    public List<Ventana> Ventana;
    public UsuarioLogueado UsuarioLogueado;
    public List<ReporteMultasSinPagar> ReporteMultasSinPagar;

    private MPGlobalSessiones()
    {

        UsuariosAdministrador = new List<Usuario>();
        CatMunicipios = new List<Municipio>();
        ReporteMultasPago = new List<ReporteMultasPagadas>();
        ReporteMultasSinPagar = new List<ReporteMultasSinPagar>();

        Agentes = new List<Agentes>();
        Cajeros = new List<Cajeros>();
        Estado = new List<Estado>();
        Funcion = new List<Funcion>();
        Oficinas = new List<Oficinas>();
        Placas = new List<Placas>();
        Procesos = new List<Procesos>();
        Sistemas = new List<Sistemas>();
        TipoMulta = new List<TipoMulta>();
        Ventana = new List<Ventana>();
        UsuarioLogueado = new UsuarioLogueado(); 
    }

    public static MPGlobalSessiones Current
    {
        get
        {
            MPGlobalSessiones sessions = (MPGlobalSessiones)HttpContext.Current.Session["__MySession__"];

            if (sessions == null)
            {
                sessions = new MPGlobalSessiones();
                HttpContext.Current.Session["__MySession__"] = sessions;
            }

            return sessions;
        }
    }


}