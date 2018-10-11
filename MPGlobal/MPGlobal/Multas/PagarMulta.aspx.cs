using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;

public partial class PagarMulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (MPGlobalSessiones.Current.UsuarioLogueado.Usuario == null)
        {
            Response.Redirect("../Account/login.aspx");
        }
        var x = MPGlobalSessiones.Current.UsuarioLogueado.Usuario;

        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();
        Session["NombreUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.NombreFull.ToString();



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

                lblhoy.Text = Ds.Tables[0].Rows[0][2].ToString();
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

    protected void btnPagar_Click(object sender, EventArgs e)
    {


        if (txtnombre.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtnombre.Focus();
            return;
        }

        if (txtapellidop.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtapellidop.Focus();
            return;
        }

        if (txtapellidom.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtapellidom.Focus();
            return;
        }

        if (txtcalle.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtcalle.Focus();
            return;
        }

        if (txtcolonia.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtcolonia.Focus();
            return;
        }


        if (txtcelular.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtcelular.Focus();
            return;
        }

        if (txtemail.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtemail.Focus();
            return;
        }


        if (txtRFC.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtRFC.Focus();
            return;
        }


        decimal montoreal = decimal.Parse(lblMonto.Text.Replace(",", ""));

        decimal montopago = 0;// decimal.Parse(txtImporte.Text.Replace(" ", "").Replace(",", ""));
        if (txtImporte.Text != "")
        {
            montopago = decimal.Parse(txtImporte.Text.Replace(" ", "").Replace(",", ""));

        }
        else
        {
            ShowAlertMessage("El importe a pagar no puede estar vacio.");
            txtImporte.Focus();
            return;

        }


        decimal feria;
        if (txtImporte.Text != "")
        {
            //Si es diferente sacar diferencia
            //   if (montoreal != montopago)
            // {

            //feria =  (montoreal - montopago);

            //}

            if (montoreal > montopago)
            {
                ShowAlertMessage("El monto pagado es menor al de las Infracciones.");
                return;
            }

            if (montoreal < montopago)
            {
                ShowAlertMessage("El monto pagado es mayor al de las Infracciones.");
                return;
            }

            if (montoreal == montopago)
            {
                //Procede a grabar

                ShowAlertMessage("Grabado.");

            }



            //if (txtnombre.Text == "")
            //{
            //    ShowAlertMessage("Seleccione un Agente.");
            //    txtnombre.Focus();
            //    return;
            //}

        }
    }
}