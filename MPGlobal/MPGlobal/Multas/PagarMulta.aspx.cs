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
        lblCaja.Text = "";
        lblOficina.Text = "";
        lblSesion.Text = "";
        //int estatussesion = int.Parse(Session["SesionesID"].ToString());

        cSesiones obs = new cSesiones();
        string usuario = Session["idUsuario"].ToString();
        DataSet ds = obs.AbrirCerrarCaja(int.Parse(usuario));

        string sesion = ds.Tables[0].Rows[0]["id_sesion"].ToString();
        string idcaja = ds.Tables[0].Rows[0]["idcaja"].ToString();
        string idoficina = ds.Tables[0].Rows[0]["idOficina"].ToString();
        string fechasesion = ds.Tables[0].Rows[0]["fechainiciosesion"].ToString();

        Session["SesionesID"] = sesion;


        if (sesion != "0")
        {
            lblCaja.Text = "";
            lblOficina.Text = "";
            lblSesion.Text = "";// dtx.Rows[0]["ultimoacceso"].ToString();
            BtnAbrirCaja.Text = "Abrir Caja";
             

            btnConsultar.Attributes.Add("disabled", "disabled");
            txtPlaca.Attributes.Add("disabled", "disabled");
            txtImporte.Attributes.Add("disabled", "disabled");
            btnPagar.Attributes.Add("disabled", "disabled");
        }
        else {
            lblCaja.Text = idcaja;
            lblOficina.Text = idoficina;

            lblSesion.Text = fechasesion;
            BtnAbrirCaja.Text = "Cerrar Caja";

              
            btnConsultar.Attributes.Remove("disabled");
            txtPlaca.Attributes.Remove("disabled");
            txtImporte.Attributes.Remove("disabled");
            btnPagar.Attributes.Remove("disabled");


        }

        Response.Redirect("pagarmulta.aspx", false);

        //if (estatussesion == 0)
        //{



        //}
        //else
        //{


        //}

         


        // cValidaSesionCaja obx = new cValidaSesionCaja();
        //// string usuario = Session["idUsuario"].ToString();
        // DataTable dtx = obx.CierraSesionCaja(int.Parse(usuario));
        // int estatuscaja = int.Parse(dtx.Rows[0]["estatus_caja"].ToString());


        //lblCaja.Text = "";
        //lblOficina.Text = "";
        //lblSesion.Text = "";

        //if (estatuscaja == 0)
        //{
        //    lblCaja.Text = "";
        //    lblOficina.Text = "";
        //    lblSesion.Text = "";// dtx.Rows[0]["ultimoacceso"].ToString();
        //    BtnAbrirCaja.Text = "Abrir Caja";

        //    Session["Sesiones"] = "Cerrado";
        //    //Response.Redirect("pagarmulta.aspx", false);

        //    btnConsultar.Attributes.Add("disabled", "disabled");
        //    txtPlaca.Attributes.Add("disabled", "disabled");
        //    txtImporte.Attributes.Add("disabled", "disabled");
        //    btnPagar.Attributes.Add("disabled", "disabled");




        //}
        //else
        //{
        //    lblCaja.Text = dtx.Rows[0]["idoficina"].ToString();
        //    lblOficina.Text = dtx.Rows[0]["idcaja"].ToString();

        //    lblSesion.Text = dtx.Rows[0]["ultimoacceso"].ToString();
        //    BtnAbrirCaja.Text = "Cerrar Caja";


        //    Session["Sesiones"] = "Abierto";

        //    //Response.Redirect("pagarmulta.aspx", false);

        //    btnConsultar.Attributes.Remove("disabled");
        //    txtPlaca.Attributes.Remove("disabled");
        //    txtImporte.Attributes.Remove("disabled");
        //    btnPagar.Attributes.Remove("disabled");

        //}
        //Response.Redirect("pagarmulta.aspx", false);
        //cPagarMultas obj = new cPagarMultas();

        //DataTable dt = obj.ValidaSesionCaja(int.Parse(Session["idUsuario"].ToString()));





    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (System.Web.HttpContext.Current.Session["loginId"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }



        //if (MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString() == "")
        //{
        //    Response.Redirect("~/Account/Login.aspx");
        //}

        hdnRecPago.Value = "";

        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();
        Session["NombreUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.NombreFull.ToString();


        string usuario = Session["idUsuario"].ToString();


        cSesiones objses = new cSesiones();
        
        int estatussesion = int.Parse(Session["SesionesID"].ToString());  // int.Parse(dtsesion.Rows[0]["estatus_caja"].ToString());



        string fechaSesion = "";

        if (estatussesion == 0)
        {

            //btnConsultar.Enabled = false;
            //txtPlaca.Enabled = false;
            //txtImporte.Enabled = false;
            //btnPagar.Enabled = false;


            btnConsultar.Attributes.Add("disabled", "disabled");
            txtPlaca.Attributes.Add("disabled", "disabled");
            txtImporte.Attributes.Add("disabled", "disabled");
            btnPagar.Attributes.Add("disabled", "disabled");

            // Session["Sesiones"] = "Cerrado";
            /// Response.Redirect("pagarmulta.aspx", false);
            lblCaja.Text = "";
            lblOficina.Text = "";
            lblSesion.Text = ""; //dtsesion.Rows[0]["ultimoacceso"].ToString();
            BtnAbrirCaja.Text = "Abrir Caja";
        }
        else
        {

            DataSet dtsesion = objses.ConsultaCajero(int.Parse(usuario));

            lblCaja.Text = dtsesion.Tables[0].Rows[0]["idcaja"].ToString();
            lblOficina.Text = dtsesion.Tables[0].Rows[0]["idoficina"].ToString();

            lblSesion.Text = dtsesion.Tables[0].Rows[0]["fechainiciosesion"].ToString();
            BtnAbrirCaja.Text = "Cerrar Caja";

            // Session["Sesiones"] = "Abierto";
            // Response.Redirect("pagarmulta.aspx", false);
            btnConsultar.Attributes.Remove("disabled");
            txtPlaca.Attributes.Remove("disabled");
            txtImporte.Attributes.Remove("disabled");
            btnPagar.Attributes.Remove("disabled");

        }








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
            string path = "Pago.aspx?Pl='" + placa + "'";
            //  msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "window.open('" + path + "', '_blank', 'fullscreen=yes', true);", true);
        }
    }



    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        LlenaDatosMulta(txtPlaca.Text);
    }

    protected void btnConsultar_Click(object sender, EventArgs e)
    {



        int estatussesion = int.Parse(Session["SesionesID"].ToString());

        if (estatussesion != 0)
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
        hdnRecPago.Value = "";


        if (txtPlaca.Text == "")
        {
            ShowAlertMessage("Favor de Completar el Formulario.");
            txtPlaca.Focus();
            return;
        }


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

        if (validacorreo(txtemail.Text) == false)
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
                int sesion = int.Parse(Session["SesionesID"].ToString());


                if (sesion != 0)
                {
                    DataSet dsx = pagar.PagoMultas(montosolicitado, montopagado, idusuario, placa, folios, nombre, appaterno, apmaterno, calle, colonia, rfc, celular, correo, idedo, idmpo, sesion);

                    hdnRecPago.Value = dsx.Tables[0].Rows[0][0].ToString();





                    txtPlaca.Text = "";
                    txtnombre.Text = "";
                    txtapellidom.Text = "";
                    txtapellidop.Text = "";
                    txtcolonia.Text = "";
                    txtcalle.Text = "";
                    txtemail.Text = "";

                    txtRFC.Text = "";
                    txtImporte.Text = "";
                    lblMonto.Text = "";
                    lblPlaca.Text = "";
                    txtcelular.Text = "";



                    StringBuilder html = new StringBuilder();

                    html.Append(" <tr>");
                    html.Append("<td></td>");
                    html.Append("<td></td> ");
                    html.Append("<td></td> ");

                    html.Append("</tr>");

                    tbcapcitaciones.InnerHtml = html.ToString();


                    EjecuarJQ();
                }




            }
            else
            {
                ShowAlertMessage("Verifique su sesion de caja este iniciada para cobrar.");
                return;
            
            }



        }

       




    }

    public static void EjecuarJQ()
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            // msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "myPago();", true);
        }
    }


}