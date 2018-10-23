using System;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

public partial class PagarMulta : System.Web.UI.Page
{

    protected void BtnAbrirCaja_Click(object sender, EventArgs e)
    {

        cValidaSesionCaja obx = new cValidaSesionCaja();
        string usuario = Session["idUsuario"].ToString();
        DataTable dtx = obx.CierraSesionCaja(int.Parse(usuario));
        int estatuscaja = int.Parse(dtx.Rows[0]["estatus_caja"].ToString());

        if (estatuscaja == 0)
        {
            lblCaja.Text = "";
            lblOficina.Text = "";
            lblSesion.Text = ""; dtx.Rows[0]["ultimoacceso"].ToString();
            BtnAbrirCaja.Text = "Abrir Caja";

            btnConsultar.Enabled = false;
            txtPlaca.Enabled = false;
            txtImporte.Enabled = false;
            btnPagar.Enabled = false;


        }
        else
        {
            lblCaja.Text = dtx.Rows[0]["idoficina"].ToString();
            lblOficina.Text = dtx.Rows[0]["idcaja"].ToString();

            lblSesion.Text = dtx.Rows[0]["ultimoacceso"].ToString();
            BtnAbrirCaja.Text = "Cerrar Caja";

        }

        //cPagarMultas obj = new cPagarMultas();

        //DataTable dt = obj.ValidaSesionCaja(int.Parse(Session["idUsuario"].ToString()));





    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (System.Web.HttpContext.Current.Session["loginId"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }




        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();
        Session["NombreUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.NombreFull.ToString();


        string usuario = Session["idUsuario"].ToString();


        cValidaSesionCaja objses = new cValidaSesionCaja();

        DataTable dtsesion = objses.ValidaSesionCaja(int.Parse(usuario));



        int estatuscaja =int.Parse( dtsesion.Rows[0]["estatus_caja"].ToString());

      

        string fechaSesion = "";

        if (estatuscaja == 0)
        {

            btnConsultar.Enabled = false;
            txtPlaca.Enabled = false;
            txtImporte.Enabled = false;
            btnPagar.Enabled = false;

            lblCaja.Text = "";
            lblOficina.Text = "";
            lblSesion.Text = ""; dtsesion.Rows[0]["ultimoacceso"].ToString();
            BtnAbrirCaja.Text = "Abrir Caja";
        }
        else
        {
            lblCaja.Text = dtsesion.Rows[0]["idoficina"].ToString();
            lblOficina.Text = dtsesion.Rows[0]["idcaja"].ToString();

            lblSesion.Text = dtsesion.Rows[0]["ultimoacceso"].ToString(); 
            BtnAbrirCaja.Text = "Cerrar Caja";

        }

         

        //if (MPGlobalSessiones.Current.UsuarioLogueado.Usuario == null)
        //{
        //    Response.Redirect("../Account/login.aspx");
        //}
        //var x = MPGlobalSessiones.Current.UsuarioLogueado.Usuario;




        //txtusercaja.Text = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.UserName.ToString();

        //DvCobro.Attributes.Remove("Disabled");
        //Deshabilitar



        //btnConsultar.Enabled = false;
        //txtPlaca.Enabled = false;
        //txtImporte.Enabled = false;
        //btnPagar.Enabled = false;
        //


    
        //Session["idUsuario"] = "1";


        //Valida Usuario y sesion abierta.
        Session["Sesiones"] = "Abierto";

        //if (Session["Sesiones"] == "Abierto")
        //{
        //    BtnAbrirCaja.Enabled = false;
        //    BtnAbrirCaja.Text = "Sesion iniciada";
        //}



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



    public static void ReciboPago(string placa)
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            string funcion= "window.open('Pago.aspx?Pl='" + placa +"', '_blank');";
          //  msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", funcion, true);
        }
    }



    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        LlenaDatosMulta(txtPlaca.Text);
    }

    protected void btnConsultar_Click(object sender, EventArgs e)
    {





        if (Session["Sesiones"] == "Abierto")
        {
            //ShowAlertMessage("El usuario ya inicio una sesion.");
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
        else
        {
            ShowAlertMessage("El usuario debe iniciar caja.");
            return;
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


    private Boolean validacorreo(String email)
    {
        String expresion;
        expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        if (Regex.IsMatch(email, expresion))
        {
            if (Regex.Replace(email, expresion, String.Empty).Length == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
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

        if (validacorreo(txtemail.Text)==false)
        { 
            ShowAlertMessage("Formato de correo invalido.");
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



            string folios = "";
            string folio = "";

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
                        folio = row[0].ToString();
                        if (folios == "")
                        {
                            folios = folio;

                        }
                        else
                        {
                            folios = folios + "," + folio;

                        }



                    }

                }
            }





            if (montoreal == montopago)
            {
                //Procede a grabar
                cPagarMultas pagar = new cPagarMultas();


                string montosolicitado = montoreal.ToString();//lblMonto.Text.Replace(",", "").Replace("$", "");
                string montopagado = montopago.ToString();

                string idusuario = Session["idUsuario"].ToString();

                string placa = lblPlaca.Text;

                string foliox = folios;

                string nombre = txtnombre.Text.ToUpper();
                string appaterno = txtapellidop.Text.ToUpper();
                string apmaterno = txtapellidom.Text.ToUpper();
                string calle = txtcalle.Text.ToUpper();
                string colonia = txtcolonia.Text.ToUpper();
                string rfc = txtRFC.Text.ToUpper();
                string celular = txtcelular.Text.ToUpper();
                string correo = txtemail.Text.ToUpper();
                string idedo = cboEdo.SelectedValue;
                string idmpo = cboMunicipio.SelectedValue;

                DataSet dsx = pagar.PagoMultas(montosolicitado, montopagado, idusuario, placa, folios, nombre, appaterno, apmaterno, calle, colonia, rfc, celular, correo, idedo, idmpo);

                //ShowAlertMessage(folios);


                ReciboPago(placa);

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