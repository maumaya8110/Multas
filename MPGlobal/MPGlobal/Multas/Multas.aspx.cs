using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Multas_Multas : System.Web.UI.Page
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



        if (Request.QueryString["Pl"] != null)
        {
            string placa = Request.QueryString["Pl"].ToString();
            string tipo = Request.QueryString["t"].ToString();

            cMultas obj = new cMultas();
            System.Data.DataSet ds = obj.reciboEdoCuentaMulta(placa, tipo);


            lblTitulo.Text=  ds.Tables[0].Rows[0]["Titulo"].ToString();
            lblPlaca.Text = ds.Tables[0].Rows[0]["idplaca"].ToString();
            lblFecha.Text = ds.Tables[0].Rows[0]["Hoy"].ToString();
            lblMonto.Text = ds.Tables[0].Rows[0]["Monto"].ToString();




            gvMultas.DataSource = ds.Tables[1];
            gvMultas.DataBind();


            EjecuarJQ();

        }

    
    }
}