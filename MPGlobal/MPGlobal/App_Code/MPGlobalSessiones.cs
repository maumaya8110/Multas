using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MPGlobalSessiones
/// </summary>
public class MPGlobalSessiones
{
    private MPGlobalSessiones()
    {
        UsuariosAdministrador = new List<Usuario>();
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

    public List<Usuario> UsuariosAdministrador;
}