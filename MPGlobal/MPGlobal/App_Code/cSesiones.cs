using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de cSesiones
/// </summary>
public class cSesiones
{
    public cSesiones()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public DataSet ConsultaIdSesion(int usuarioid)
    {
        DataSet ds;


        cStore sp = new cStore("spConsultaIdSesion", 1);
        sp.AddParameter("@idusuario", usuarioid);
        ds = sp.ObtenDatos();



        return ds;
    }


    public DataSet ConsultaCajero(int usuarioid)
    {
        DataSet ds;


        cStore sp = new cStore("spConsultaCajero", 1);
        sp.AddParameter("@idusuario", usuarioid);
        ds = sp.ObtenDatos();



        return ds;
    }

    public DataSet AbrirCerrarCaja(int usuarioid)
    {
        DataSet ds;


        cStore sp = new cStore("spAbrirCaja", 1);
        sp.AddParameter("@idusuario", usuarioid);
        ds = sp.ObtenDatos();



        return ds;
    }

}