using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class Multas_Pago : System.Web.UI.Page
{
    public static void EjecuarJQ()
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            // msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "window.print();", true);
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

        EjecuarJQ();

        if (Request.QueryString["Pl"] != null)
        {

        }
    }
}