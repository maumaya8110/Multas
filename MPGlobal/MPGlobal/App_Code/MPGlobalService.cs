﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

/// <summary>
/// Descripción breve de MPGlobalService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class MPGlobalService : System.Web.Services.WebService
{

    public MPGlobalService()
    {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }   

    [WebMethod]
    [ScriptMethod(ResponseFormat= ResponseFormat.Json)]
    public string ObtieneMultas(int idLicenciaEst, int idLicenciaMun, int idEstado, int idMunicipio, DateTime fechaIni, DateTime fechaFin)
    {
        using (DataBase db = new DataBase())
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", idEstado));
            parametros.Add(new SqlParameter("@idMunicipio", idMunicipio));
            parametros.Add(new SqlParameter("@idLicenciaE", idLicenciaEst));
            parametros.Add(new SqlParameter("@idLicenciaM", idLicenciaMun));
            parametros.Add(new SqlParameter("@fechaIni", fechaIni));
            parametros.Add(new SqlParameter("@fechaFin", fechaFin));

            DataSet ds = db.ObtieneDatos("Sp_ObtieneReporteMultas", parametros.ToArray());
            JSONReporteMultas json = new JSONReporteMultas();
            json.Resultado = ds.Tables[0].DataTableToList<Resultado>().FirstOrDefault();
            if(ds.Tables[0].Rows[0]["estatus"].ToString() == "1")
                json.Multas = ds.Tables[1].DataTableToList<ReporteMultas>();
            
            return new JavaScriptSerializer().Serialize(json);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string DescartaMulta(int idLicenciaEst, int idLicenciaMun, int idEstado, int idMunicipio, int idBoleta, string placa)
    {
        return "";
    }

}
