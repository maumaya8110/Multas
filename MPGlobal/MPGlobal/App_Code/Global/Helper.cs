using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Helper
/// </summary>
public class Helper
{
    public Helper()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    ///// <summary>
    ///// Guarda el log de errores en archivo txt y Base de Datos
    ///// </summary>
    ///// <param name="exception"></param>
    //public static void saveErrors(String exception)
    //{
        
    //    try
    //    {
    //        ctx.InsertaBugTracker(exception, HttpContext.Current.User.Identity.Name, exception, HttpContext.Current.Request.UserHostAddress, System.Net.Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables["REMOTE_HOST"]).HostName, HttpContext.Current.Request.Url.AbsoluteUri, true);
    //    }
    //    catch { }


    //    String filename = HttpContext.Current.Server.MapPath("~/_Logs/errors.txt");
    //    StreamWriter sw = File.AppendText(filename);
    //    sw.WriteLine("****** " + DateTime.Now.ToString() + " " + exception.ToString());
    //    sw.Close();

    //}
}