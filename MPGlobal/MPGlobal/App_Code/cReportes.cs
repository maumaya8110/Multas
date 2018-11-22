using System.Data;

/// <summary>
/// Descripción breve de cReportes
/// </summary>
public class cReportes
{
    public cReportes()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public DataTable catEstados()
    {
        DataTable dt;


        cStore sp = new cStore("catEstado", 1);

        // sp.AddParameter("@usuario", usuario)

        dt = sp.ObtenDatos().Tables[0];



        return dt;
    }


    public DataTable catEstados(int cveEdo)
    {
        DataTable dt;

        cStore sp = new cStore("catMunicipioXEstado", 1);

        sp.AddParameter("@cveEdo", cveEdo);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }
    public DataTable CatEstatus()
    {
        DataTable dt;

        cStore sp = new cStore("spCatEstatus", 1);



        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }

    public DataTable catMunicipiosXEdo(int cveEdo)
    {
        DataTable dt;

        cStore sp = new cStore("catMunicipioXEstadoReportes", 1);

        sp.AddParameter("@cveEdo", cveEdo);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }


    public DataTable catTipoMulta(int cveEdo, int cveMpo)
    {
        DataTable dt;
        cStore sp = new cStore("catTipoMultaReporte", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }

    public DataTable catReportesMultas()
    {
        DataTable dt;
        cStore sp = new cStore("spCatReportes", 1);


        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }


    public DataTable ReportesGeneradas(int cveEdo, int cveMpo, int tipomulta, string fechaini, string fechafin, string placa)
    {
        DataTable dt;
        cStore sp = new cStore("spReportesGeneradas", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
        sp.AddParameter("@TipoM", tipomulta);
        sp.AddParameter("@FechaIni", fechaini);
        sp.AddParameter("@FechaFin", fechafin);
        sp.AddParameter("@Placa", placa);
        
        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }

    public DataTable ReportesPagadas(int cveEdo, int cveMpo, int tipomulta, string fechaini, string fechafin, string placa)
    {
        DataTable dt;
        cStore sp = new cStore("spReportesPagadas", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
        sp.AddParameter("@TipoM", tipomulta);
        sp.AddParameter("@FechaIni", fechaini);
        sp.AddParameter("@FechaFin", fechafin);
        sp.AddParameter("@Placa", placa);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }

    
    public DataTable ReportesProcesadas(int cveEdo, int cveMpo, int tipomulta, string fechaini, string fechafin, string placa)
    {
        DataTable dt;
        cStore sp = new cStore("spReportesPagadas", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
        sp.AddParameter("@TipoM", tipomulta);
        sp.AddParameter("@FechaIni", fechaini);
        sp.AddParameter("@FechaFin", fechafin);
        sp.AddParameter("@Placa", placa);

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }


    public DataTable ReportesSesionCobro(int cveEdo, int cveMpo,  string fechaini, string fechafin)
    {
        DataTable dt;
        cStore sp = new cStore("spReportesSesionCobro", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
   
        sp.AddParameter("@FechaIni", fechaini);
        sp.AddParameter("@FechaFin", fechafin);
    
        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }
 












    public DataTable ReportesMultas(int cveEdo, int cveMpo,int tipomulta,string fechaini,string fechafin,int tiporpt,int nivel)
    {
        DataTable dt;
        cStore sp = new cStore("spReportes", 1);
        sp.AddParameter("@cveEdo", cveEdo);
        sp.AddParameter("@cveMpo", cveMpo);
        sp.AddParameter ("@TipoM", tipomulta);
        sp.AddParameter("@FechaIni", fechaini);
        sp.AddParameter("@FechaFin", fechafin);
        sp.AddParameter("@TipoRpt", tiporpt);
        sp.AddParameter("@Nivel", nivel);

         

        dt = sp.ObtenDatos().Tables[0];

        return dt;
    }


}