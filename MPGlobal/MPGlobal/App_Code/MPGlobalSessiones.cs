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

    private MPGlobalSessiones()
    {

        UsuariosAdministrador = new List<Usuario>();
        CatMunicipios = new List<Municipio>();
        ReporteMultasPago = new List<ReporteMultasPagadas>();
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