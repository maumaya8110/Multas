using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de cCancelacion
/// </summary>
public class cCancelacion
{
    public cCancelacion()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }




    


        public DataSet CancelarRecibo(int IdRecibo, string Motivo, int idUsuario)
    {
        DataSet ds;


        cStore sp = new cStore("spCancelaRecibo", 1);
        sp.AddParameter("@idrecibo", IdRecibo);
        sp.AddParameter("@Motivo", Motivo);
        sp.AddParameter("@idusuario", idUsuario);
        
        ds = sp.ObtenDatos();



        return ds;
    }



    public DataSet ConsultaRecibo(int IdRecibo, int Idusuario)
    {
        DataSet ds;


        cStore sp = new cStore("spConsultaRecibo", 1);
        sp.AddParameter("@idrecibo", IdRecibo);
        sp.AddParameter("@idusuario", Idusuario);
        ds = sp.ObtenDatos();



        return ds;
    }

}