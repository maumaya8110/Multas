using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Reflection;
using System.Web;
using System.Web.UI.WebControls;

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



    /// <summary>
    /// Regresa el User ID de Membership Provider del usuario logueado
    /// </summary>
    /// <returns></returns>
    public static string GetUserID()
    {
        try
        {
            return Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(HttpContext.Current.User.Identity);
        }
        catch(Exception x)
        {
            throw x;
        }

    }

    /// <summary>
    /// Regresa el Rol de Membership Provider del usuario logueado
    /// </summary>
    /// <returns></returns>
    public static string GetRolId()
    {
        try
        {
            return HttpContext.Current.Session["IdRolActualCarnicoGenerico"].ToString();
        }
        catch (Exception x)
        {
            throw x;
        }
    }

    /// <summary>
    /// Obtiene el UserName de Membership Provider del usuario logueado
    /// </summary>
    /// <returns></returns>
    public static string GetUserName()
    {
        try
        {
            return HttpContext.Current.User.Identity.Name;
        }
        catch (Exception x)
        {
            throw x;
        }

    }

    /// <summary>
    /// Obtiene el User Email del usuario logueado de membership provider
    /// </summary>
    /// <returns></returns>
    public static string GetUserEmail()
    {
        try
        {
            string username = Microsoft.AspNet.Identity.IdentityExtensions.GetUserName(HttpContext.Current.User.Identity);

            if (IsMail(username)) return username;
            else return "";
        }
        catch (Exception x)
        {
            return "";
        }

    }

    /// <summary>
    /// Obtiene el nombre del usuario en base al User ID del Membership Provider
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static string GetNombreByUserId(string id)
    {
        using(DataBase db = new DataBase())
        {
            return (string)db.EjecutaProcedure("Sp_ObtieneNombre", new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@id", id) });
        }
    }

    public static string GetNombreByEmail(string email)
    {
        using (DataBase db = new DataBase())
        {
            return (string)db.EjecutaProcedure("Sp_ObtieneNombreByEmail", new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@email", email) });
        }
    }


    /// <summary>
    /// Valida si el email tiene formato correcto
    /// </summary>
    /// <param name="p_email"></param>
    /// <returns></returns>
    public static bool IsMail(string p_email)
    {

        System.Text.RegularExpressions.Regex l_reg = new System.Text.RegularExpressions.Regex("^(([^<;>;()[\\]\\\\.,;:\\s@\\\"]+" + "(\\.[^<;>;()[\\]\\\\.,;:\\s@\\\"]+)*)|(\\\".+\\\"))@" + "((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}" + "\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+" + "[a-zA-Z]{2,}))$");
        return (l_reg.IsMatch(p_email));
    }

    public static void EnviaEmail(string destinatario, string asunto, string cuerpo, string attachments)
    {
        string recipient = destinatario.Split(';')[0];
        if (recipient == "") return;
        string port = string.Empty;
        string SMTP_Server = string.Empty;
        string PwordEmail = string.Empty;
        string SendingEmail = string.Empty;
        string NoticeToEmail = string.Empty;
        string Security = string.Empty;

        try
        {
            port = "587";
            SMTP_Server = "mail.uniweb.no";
            PwordEmail = "ricardo1589";
            SendingEmail = "reslava@sonetworks.no";
            Security = "TLS";
        }
        catch { }

        string tomail = string.Empty;
        tomail = recipient;

        MailMessage message = new MailMessage(SendingEmail, tomail, asunto, cuerpo);

        foreach (string cc in destinatario.Split(';'))
        {
            if (cc != recipient)
            {
                if (cc != "") message.CC.Add(cc);
            }
        }

        if (attachments != null)
        {
            var files = attachments.Split('|');

            foreach (string attachmentFilename in files)
            {
                if (attachmentFilename != null)
                {
                    Attachment attachment = new Attachment(attachmentFilename, MediaTypeNames.Application.Octet);
                    ContentDisposition disposition = attachment.ContentDisposition;
                    disposition.CreationDate = File.GetCreationTime(attachmentFilename);
                    disposition.ModificationDate = File.GetLastWriteTime(attachmentFilename);
                    disposition.ReadDate = File.GetLastAccessTime(attachmentFilename);
                    disposition.FileName = Path.GetFileName(attachmentFilename);
                    disposition.Size = new FileInfo(attachmentFilename).Length;
                    disposition.DispositionType = DispositionTypeNames.Attachment;
                    message.Attachments.Add(attachment);
                }
            }
        }

        message.IsBodyHtml = true;
        message.BodyEncoding = System.Text.Encoding.UTF8;
        SmtpClient mail = new SmtpClient();
        if (Security != "None" && Security != "")
        {
            mail.EnableSsl = true;

            if (Security == "TLS") System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;
        }
        else
        {
            mail.EnableSsl = false;
        }

        mail.Host = SMTP_Server;
        mail.Port = Convert.ToInt16(port);

        mail.Credentials = new System.Net.NetworkCredential(SendingEmail, PwordEmail);  //Net.NetworkCredential(UserID, UserPassword);
        mail.Send(message);
    }


    /// <summary>
    /// Carga un drop con la información de  una Lista agregando un primer renglon en blanco 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="ddl"></param>
    /// <param name="lista"></param>
    /// <param name="agregaPrimero"></param>
    public static void cargaCatalogoGenericCombo<T>(DropDownList ddl, List<T> lista, bool agregaPrimero = true)
    {
        ddl.Items.Clear();
        if (agregaPrimero)
            ddl.Items.Add(new ListItem(" ", "-1"));

        foreach (T item in lista)
        {
            Type t = item.GetType();
            PropertyInfo propId = t.GetProperty("id");
            PropertyInfo propNom = t.GetProperty("nombre");
            ddl.Items.Add(new ListItem(propNom.GetValue(item).ToString().Trim(), propId.GetValue(item).ToString().Trim()));
        }
    }

    /// <summary>
    /// Carga un drop con la informacion de una lista para Reportes
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="ddl"></param>
    /// <param name="lista"></param>
    public static void cargaCatalogoGenericReporte<T>(DropDownList ddl, List<T> lista)
    {
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem("Todos", "-1"));
        foreach (T item in lista)
        {
            Type t = item.GetType();
            PropertyInfo propId = t.GetProperty("id");
            PropertyInfo propNom = t.GetProperty("nombre");
            ddl.Items.Add(new ListItem(propNom.GetValue(item).ToString().Trim(), propId.GetValue(item).ToString().Trim()));
        }
    }

    /// <summary>
    /// Carga un drop con la ifnormacion de una Lista 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="ddl"></param>
    /// <param name="lista"></param>
    public static void cargaCatalogoGenericReporteSimple<T>(DropDownList ddl, List<T> lista)
    {
        ddl.Items.Clear();
        foreach (T item in lista)
        {
            Type t = item.GetType();
            PropertyInfo propId = t.GetProperty("id");
            PropertyInfo propNom = t.GetProperty("nombre");
            ddl.Items.Add(new ListItem(propNom.GetValue(item).ToString().Trim(), propId.GetValue(item).ToString().Trim()));
        }
    }

    /// <summary>
    /// Carga un drop con la informacion de una lista indicando los campos de DataFieldValue y DataTextValue
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="ddl"></param>
    /// <param name="lista"></param>
    /// <param name="value"></param>
    /// <param name="text"></param>
    public static void cargaCatalogoGenericCombo<T>(DropDownList ddl, List<T> lista, string value, string text)
    {
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem(" ", "-1"));
        foreach (T item in lista)
        {
            Type t = item.GetType();
            PropertyInfo propId = t.GetProperty(value);
            PropertyInfo propNom = t.GetProperty(text);
            ddl.Items.Add(new ListItem(propNom.GetValue(item).ToString().Trim(), propId.GetValue(item).ToString().Trim()));
        }
    }

    /// <summary>
    /// Carga un drop con la informacion de una lista indicando los campos de DataFieldValue y DataTextValue para un Reporte
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="ddl"></param>
    /// <param name="lista"></param>
    /// <param name="value"></param>
    /// <param name="text"></param>
    public static void cargaCatalogoGenericReporte<T>(DropDownList ddl, List<T> lista, string value, string text)
    {
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem("Todos", "0"));
        foreach (T item in lista)
        {
            Type t = item.GetType();
            PropertyInfo propId = t.GetProperty(value);
            PropertyInfo propNom = t.GetProperty(text);
            ddl.Items.Add(new ListItem(propNom.GetValue(item).ToString().Trim(), propId.GetValue(item).ToString().Trim()));
        }
    }
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
//}