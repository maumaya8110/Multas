using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        cDash obj = new cDash();

        if (System.Web.HttpContext.Current.Session["loginId"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        DataSet ds = obj.Dash();


       // DataRow dr = ds.Tables[0].Rows[0];
        string datos1 = "";
        string datos2 = "";
        datos1 = "";
        datos2 = "";

        hdngraf1ley.Value = fgral.JsonDatosBarrasmulti(ds.Tables[0], ref datos1, ref datos2);
        hdngraf1a.Value = datos1;
        hdngraf1b.Value = datos2;

        string datos1M = "";
        string datos2M = "";
        string datos3M = "";
        string datos4M = "";
        string datos5M = "";
        string datos6M = "";
        string datos7M = "";
        datos1 = "";
        datos2 = "";
        datos3M = "";
        datos4M = "";
        datos5M = "";
        datos6M = "";
        datos7M = "";

        hdngrafPie.Value = fgral.JsonDatosPie(ds.Tables[1]);
        EjecuarJQ();
    }


    public static void EjecuarJQ()
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            // msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "graficar();", true);
        }
    }
}