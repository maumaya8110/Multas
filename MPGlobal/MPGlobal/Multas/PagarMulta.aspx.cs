using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagarMulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        cAltaMultas obj = new cAltaMultas();
        if (!this.IsPostBack)
        {
            DataTable dtcatEdo;
            dtcatEdo = obj.catEstados();

            cboEdo.DataSource = dtcatEdo;
            cboEdo.DataTextField = "Nombre";
            cboEdo.DataValueField = "id";
            cboEdo.DataBind();

            //dtpub = new DataTable();

            //crearTabla();

        }
        else
        {
            //dtpub = (DataTable)ViewState["DataTable"];
            return;

        }


    }


    private void LlenaDatosMulta(string Placa)
    {
        cPagarMultas obj = new cPagarMultas();

        DataSet Ds = obj.ConsultaPlaca(Placa);

        string Monto;

        if (Ds.Tables.Count > 0)
        {

            if (Ds.Tables[0].Rows.Count > 0)
            {
                DataTable av = Ds.Tables[1];
                StringBuilder html = new StringBuilder();


                foreach (DataRow row in av.Rows)
                {
                    html.Append(" <tr>");
                    html.Append("<td> " + row[0].ToString() + " </td>");
                    html.Append("<td>" + row[1].ToString() + "</td> ");
                    html.Append("<td>" + row[2].ToString() + "</td> ");

                    html.Append("</tr>");
                }
                tbcapcitaciones.InnerHtml = html.ToString();

               // txtEdo.Text = html.ToString();
                // Response.Write(html.ToString());

            }
            else
            {
                ShowAlertMessage("No hay datos para mostrar.");
            }
        }
        else
        {
            ShowAlertMessage("No hay datos para mostrar.");
        }


    }

    public static void ShowAlertMessage(string msg)
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + msg + "');", true);
        }
    }


    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        LlenaDatosMulta(txtPlaca.Text);
    }

    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        cPagarMultas obj = new cPagarMultas();

        DataSet Ds = obj.ConsultaPlaca(txtPlaca.Text);

        string Monto;

        if (Ds.Tables.Count > 0)
        {

            if (Ds.Tables[0].Rows.Count > 0)
            {
                DataTable av = Ds.Tables[1];
                StringBuilder html = new StringBuilder();


                foreach (DataRow row in av.Rows)
                {
                    html.Append(" <tr>");
                    html.Append("<td> " + row[0].ToString() + " </td>");
                    html.Append("<td>" + row[1].ToString() + "</td> ");
                    html.Append("<td>" + row[2].ToString() + "</td> ");

                    html.Append("</tr>");
                }
                tbcapcitaciones.InnerHtml = html.ToString();





                lblMonto.Text = Ds.Tables[0].Rows[0][1].ToString();
                lblPlaca.Text = Ds.Tables[0].Rows[0][0].ToString().ToUpper();

                lblhoy.Text= Ds.Tables[0].Rows[0][2].ToString();
                //txtEdo.Text = html.ToString();
                // Response.Write(html.ToString());

            }
            else
            {
                ShowAlertMessage("No hay datos para mostrar.");
            }
        }
        else
        {
            ShowAlertMessage("No hay datos para mostrar.");
        }
    }

    protected void cboEdo_SelectedIndexChanged(object sender, EventArgs e)
    {
        cAltaMultas obj = new cAltaMultas();
        DataTable dtcatMpo;
        int cveEdo = int.Parse(cboEdo.SelectedValue);
        dtcatMpo = obj.catMunicipiosXEdo(cveEdo);

        cboMunicipio.DataSource = dtcatMpo;
        cboMunicipio.DataValueField = "id";
        cboMunicipio.DataTextField = "Nombre";
        cboMunicipio.DataBind();

    }

    protected void cboMunicipio_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}