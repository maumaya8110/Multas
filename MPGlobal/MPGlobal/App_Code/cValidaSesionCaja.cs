using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de cValidaSesionCaja
/// </summary>
public class cValidaSesionCaja
{
    public cValidaSesionCaja()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public DataTable ValidaSesionCaja(int idusuario)
    {
        DataTable dt;


        cStore sp = new cStore("spValidaCajaSesion", 1);
        sp.AddParameter("@idusuario", idusuario);
        dt = sp.ObtenDatos().Tables[0];



        return dt;
    }


    public DataTable CierraSesionCaja(int idusuario)
    {
        DataTable dt;


        cStore sp = new cStore("spCierraAbreCaja", 1);
        sp.AddParameter("@idusuario", idusuario);
        dt = sp.ObtenDatos().Tables[0];



        return dt;
    }

}