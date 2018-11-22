using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de cDash
/// </summary>
public class cDash
{
    public cDash()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataSet Dash()
    {
        DataSet ds;


        cStore sp = new cStore("spDash", 1);

        // sp.AddParameter("@usuario", usuario)

        ds = sp.ObtenDatos();



        return ds;
    }


}