using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

/// <summary>
/// MPGlobalService
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

    /// <summary>
    /// Obtiene las Multas en una fecha proporcionada
    /// </summary>
    /// <param name="idLicenciaEst"></param>
    /// <param name="idLicenciaMun"></param>
    /// <param name="idEstado"></param>
    /// <param name="idMunicipio"></param>
    /// <param name="fechaIni"></param>
    /// <param name="fechaFin"></param>
    /// <returns>JSON</returns>
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
    
    
    /// <summary>
    /// Marca la multa propoorcionada como pagada
    /// </summary>
    /// <param name="idLicenciaEst"></param>
    /// <param name="idLicenciaMun"></param>
    /// <param name="idEstado"></param>
    /// <param name="idMunicipio"></param>
    /// <param name="idBoleta"></param>
    /// <param name="recibo"></param>
    /// <param name="fechaPago"></param>
    /// <returns>JSON</returns>
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string DescartaMulta(int idLicenciaEst, int idLicenciaMun, int idEstado, int idMunicipio, int idBoleta, string recibo, DateTime fechaPago)
    {
        using (DataBase db = new DataBase())
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", idEstado));
            parametros.Add(new SqlParameter("@idMunicipio", idMunicipio));
            parametros.Add(new SqlParameter("@idLicenciaE", idLicenciaEst));
            parametros.Add(new SqlParameter("@idLicenciaM", idLicenciaMun));
            parametros.Add(new SqlParameter("@idBoleta", idBoleta));
            parametros.Add(new SqlParameter("@recibo", recibo));
            parametros.Add(new SqlParameter("@fechaPago", fechaPago));

            DataSet ds = db.ObtieneDatos("Sp_DescargaMultaService", parametros.ToArray());
            JSONDescarteMulta json = new JSONDescarteMulta();
            json.Resultado = ds.Tables[0].DataTableToList<Resultado>().FirstOrDefault();
            if (ds.Tables[0].Rows[0]["estatus"].ToString() == "1")
                json.Mensaje = ds.Tables[1].Rows[0]["resultadoText"].ToString();

            return new JavaScriptSerializer().Serialize(json);
        }
    }

}
