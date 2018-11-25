using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;

public partial class CapturaMultas : System.Web.UI.Page
{


    DataTable dtpub;
    private void crearTabla()
    {
        dtpub.Columns.Add("REN");
        dtpub.Columns.Add("DESCRIPCION");
        dtpub.Columns.Add("MONTO");

    }


    private void AddDatosTabla()
    {



        if (cboTipoMulta.Items.Count > 0)
        {
        }
        int ren = int.Parse(cboTipoMulta.SelectedItem.Value);
        // (dtpub.Rows.Count) + 1
        string Desc = cboTipoMulta.SelectedItem.Text;
        string Monto = lblMonto.Text;

        DataRow dr;
        dr = dtpub.NewRow();
        dr["REN"] = ren;
        dr["DESCRIPCION"] = Desc;
        dr["MONTO"] = Monto;




        dtpub.Rows.Add(dr);



        ViewState["DataTable"] = dtpub;

        BindGrid();


    }
    private void BindGrid()
    {
        DataTable av = dtpub;
        StringBuilder html = new StringBuilder();


        foreach (DataRow row in av.Rows)
        {
            html.Append(" <tr>");
            html.Append("<td> " + row[0].ToString() + " </td>");
            html.Append("<td>" + row[1].ToString() + "</td> ");
            html.Append("<td>" + row[2].ToString() + "</td> ");


            html.Append("<td> <a href =\"#\"  data-idsol=\" " + row[0].ToString() + "\" type =\"button\"  onclick=\"eliminar(" + row[0].ToString() + ")\" class=\"btn btn-danger\">Eliminar  <span class=\"glyphicon glyphicon-eject\"></span></a> </td>");
            //<button type="submit" class="btn btn-danger">ELIMINAR <span class="glyphicon glyphicon-eject"></span></button>


            html.Append("</tr>");
        }
        tbcapcitaciones.InnerHtml = html.ToString();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // var x = MPGlobalSessiones.Current.UsuarioLogueado.Usuario;

        if (System.Web.HttpContext.Current.Session["loginId"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        //if (Session["idUsuario"].ToString() == "")
        //{
        //    // Response.Redirect("login.aspx", false);
        //    Response.Redirect("~/Account/Login.aspx");
        //}




        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();
        Session["NombreUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.NombreFull.ToString();

        Session["IdEdo"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdEstado.ToString();
        Session["IdMpo"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdMunicipio.ToString();

        //Session["idUsuario"] = "1";
        //Session["NombreUsuario"] = "Admin";

        cAltaMultas obj = new cAltaMultas();


        txtusuario.Text = Session["NombreUsuario"].ToString();




        if (!this.IsPostBack)
        {
            DataTable dtcatEdo;
            dtcatEdo = obj.catEstados();

            cboEdo.DataSource = dtcatEdo;
            cboEdo.DataTextField = "Nombre";
            cboEdo.DataValueField = "id";
            cboEdo.DataBind();



            cboEdoPlaca.DataSource = dtcatEdo;
            cboEdoPlaca.DataTextField = "Nombre";
            cboEdoPlaca.DataValueField = "id";
            cboEdoPlaca.DataBind();


            cboEdo.SelectedValue = Session["IdEdo"].ToString();
            ConsultaMunicipios();

            //cboEdo.Items.IndexOf(cboEdo.Items.FindByValue(Session["IdEdo"].ToString()));

            dtpub = new DataTable();

            crearTabla();

        }
        else
        {
            dtpub = (DataTable)ViewState["DataTable"];
            return;

        }





        ViewState["DataTable"] = dtpub;


    }


    private void ConsultaMunicipios()
    {
        cAltaMultas obj = new cAltaMultas();
        DataTable dtcatMpo;
        int cveEdo = int.Parse(Session["IdEdo"].ToString());//cboEdo.SelectedValue);
        dtcatMpo = obj.catMunicipiosXEdo(cveEdo);

        cboMunicipio.DataSource = dtcatMpo;
        cboMunicipio.DataValueField = "id";
        cboMunicipio.DataTextField = "Nombre";
        cboMunicipio.DataBind();


        cboMunicipio.SelectedValue = Session["IdMpo"].ToString();


        cboEdo.Attributes["disabled"] = "disabled";
        cboMunicipio.Attributes["disabled"] = "disabled";
        //cboEdo.Enabled = false;
        //cboMunicipio.Enabled = false;





        DataTable dtcatAgente;
        DataTable dtcatTipoMulta;



        //  int cveEdo = int.Parse(cboEdo.SelectedValue);
        int cveMpo = int.Parse(Session["IdMpo"].ToString());
        dtcatAgente = obj.catAgentes(cveEdo, cveMpo);

        dtcatTipoMulta = obj.catTipoMulta(cveEdo, cveMpo);


        cboAgente.DataSource = dtcatAgente;
        cboAgente.DataTextField = "Nombre";
        cboAgente.DataValueField = "id";
        cboAgente.DataBind();


        cboTipoMulta.DataSource = dtcatTipoMulta;
        cboTipoMulta.DataTextField = "Nombre";
        cboTipoMulta.DataValueField = "id";
        cboTipoMulta.DataBind();




    }

    protected void cboEdo_SelectedIndexChanged1(object sender, EventArgs e)
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
        try

        {

            cAltaMultas obj = new cAltaMultas();
            DataTable dtcatAgente;
            DataTable dtcatTipoMulta;



            int cveEdo = int.Parse(cboEdo.SelectedValue);
            int cveMpo = int.Parse(cboMunicipio.SelectedValue);
            dtcatAgente = obj.catAgentes(cveEdo, cveMpo);

            dtcatTipoMulta = obj.catTipoMulta(cveEdo, cveMpo);


            cboAgente.DataSource = dtcatAgente;
            cboAgente.DataTextField = "Nombre";
            cboAgente.DataValueField = "id";
            cboAgente.DataBind();


            cboTipoMulta.DataSource = dtcatTipoMulta;
            cboTipoMulta.DataTextField = "Nombre";
            cboTipoMulta.DataValueField = "id";
            cboTipoMulta.DataBind();


            //   txtfolio.Text = obj.GeneraFolio(cveEdo, cveMpo);

            //       ShowAlertMessage(txtfolio.Text);

        }
        catch (Exception ex)
        {
            ShowAlertMessage(ex.ToString());

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



    private void DescTipoMultaMontoID()
    {
        cAltaMultas obj = new cAltaMultas();
        DataTable dtMontoMulta;
        int cveEdo = int.Parse(cboEdo.SelectedValue);
        int cveMpo = int.Parse(cboMunicipio.SelectedValue);
        int cveMulta = int.Parse(cboTipoMulta.SelectedValue);
        dtMontoMulta = obj.catTipoMultaMonto(cveEdo, cveMpo, cveMulta);


        lblMonto.Text = "";
        if (dtMontoMulta.Rows.Count > 0)
        {
            lblMonto.Text = dtMontoMulta.Rows[0][0].ToString();

            AgregaMulta();
            //btnAgregar.Visible = true;

            txtIdMulta.Text = "";
            txtIdMulta.Focus();

        }
        else
        {
            //btnAgregar.Visible = false;
            txtIdMulta.Text = "";
            txtIdMulta.Focus();
        }
    }

    private void DescTipoMultaMonto()
    {
        cAltaMultas obj = new cAltaMultas();
        DataTable dtMontoMulta;
        int cveEdo = int.Parse(cboEdo.SelectedValue);
        int cveMpo = int.Parse(cboMunicipio.SelectedValue);
        int cveMulta = int.Parse(cboTipoMulta.SelectedValue);
        dtMontoMulta = obj.catTipoMultaMonto(cveEdo, cveMpo, cveMulta);


        lblMonto.Text = "";
        if (dtMontoMulta.Rows.Count > 0)
        {
            lblMonto.Text = dtMontoMulta.Rows[0][0].ToString();
            btnAgregar.Visible = true;
        }
        else
        {
            btnAgregar.Visible = false;
        }
    }

    protected void cboTipoMulta_SelectedIndexChanged(object sender, EventArgs e)
    {
        DescTipoMultaMonto();
    }


    private void AgregaMulta()
    {

        int idporagregar = int.Parse(cboTipoMulta.SelectedValue);

        for (int x = 0; x <= dtpub.Rows.Count - 1; x++)
        {
            if (idporagregar.ToString() == dtpub.Rows[x][0].ToString())
            {
                ShowAlertMessage("Ese concepto de multa ya fue agregado.");
                return;
            }
        }



        AddDatosTabla();
        BindGrid();

    }


    protected void btnAgregar_Click(object sender, EventArgs e)
    {

        AgregaMulta();
        //int idporagregar = int.Parse(cboTipoMulta.SelectedValue);

        //for (int x = 0; x <= dtpub.Rows.Count - 1; x++)
        //{
        //    if (idporagregar.ToString() == dtpub.Rows[x][0].ToString())
        //    {
        //        ShowAlertMessage("Ese concepto de multa ya fue agregado.");
        //        return;
        //    }
        //}



        //AddDatosTabla();
        //BindGrid();
    }

    protected void cmdEliminar_Click(object sender, EventArgs e)
    {
        string id = hndEliminar.Value;


        DataRow[] rows;
        rows = dtpub.Select("REN = " + hndEliminar.Value + "");
        //'UserName' is ColumnName
        foreach (DataRow row in rows)
        {
            dtpub.Rows.Remove(row);
        }



        ViewState["DataTable"] = dtpub;

        BindGrid();
    }

    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        try
        {


            //---valida
            if (cboAgente.SelectedIndex == 0)
            {
                ShowAlertMessage("Seleccione un Agente.");
                cboAgente.Focus();
                return;
            }

            if (cboEdo.SelectedIndex == 0)
            {
                ShowAlertMessage("Seleccione un Estado.");
                cboEdo.Focus();
                return;
            }


            if (cboEdoPlaca.SelectedIndex == 0)
            {
                ShowAlertMessage("Seleccione un Estado de Origen Placa.");
                cboEdoPlaca.Focus();
                return;
            }


            if (cboMunicipio.SelectedIndex == 0)
            {
                ShowAlertMessage("Seleccione un Municipio.");
                cboMunicipio.Focus();
                return;
            }


            if (txtPlaca.Text == "")
            {
                ShowAlertMessage("Capture una Placa.");
                txtPlaca.Focus();
                return;
            }

            if (txtCalle1.Text == "")
            {
                ShowAlertMessage("Capture Calle 1.");
                txtCalle1.Focus();
                return;
            }

            if (txtCalle2.Text == "")
            {
                ShowAlertMessage("Capture Calle 2.");
                txtCalle2.Focus();
                return;
            }


            if (txtCrucero.Text == "")
            {
                ShowAlertMessage("Capture Crucero.");
                txtCrucero.Focus();
                return;
            }

            if (txtboleta.Text == "")
            {
                ShowAlertMessage("Capture Boleta.");
                txtboleta.Focus();
                return;
            }


            if (txtdatepicker.Text == "")
            {
                ShowAlertMessage("Seleccione una Fecha.");
                txtdatepicker.Focus();
                return;
            }



            if (txtCrucero.Text == "")
            {
                ShowAlertMessage("Capture Crucero.");
                txtCrucero.Focus();
                return;
            }

            if (txtdescripcion.Text == "")
            {
                ShowAlertMessage("Capture descripcion.");
                txtdescripcion.Focus();
                return;
            }





            if (dtpub.Rows.Count == 0)
            {
                ShowAlertMessage("Agregue una multa.");
                cboTipoMulta.Focus();
                return;
            }

            //---Encabezado

            string edoPlaca = cboEdoPlaca.SelectedValue;

            string idEstado = cboEdo.SelectedValue;
            string idMunicipio = cboMunicipio.SelectedValue;
            string idboleta = txtboleta.Text;
            string idplaca = txtPlaca.Text;
            string FolioMulta = "";// txtfolio.Text;

            string mes = txtdatepicker.Text.Substring(3, 2);
            string dia = txtdatepicker.Text.Substring(0, 2);
            string anio = txtdatepicker.Text.Substring(6, 4);
            string fecha = anio + "" + mes + "" + dia;


            //If Int32.Parse(mes) > 12 Then
            //    Dim fecha As String = anio + "-" + mes + "-" + dia
            //End If




            //DateTime fechaMulta = DateTime.Parse()
            string fechaMulta = fecha + " " + cboHora.SelectedItem.Text + ":" + cboMinuto.SelectedItem.Text;
            string Calle1Multa = txtCalle1.Text;
            string Calle2Multa = txtCalle2.Text;
            string crucero = txtCrucero.Text;
            string descripcion = txtdescripcion.Text;
            string idAgente = cboAgente.SelectedValue;
            string Nolicencia = txtlicencia.Text;
            //Dim EstatusMulta As String
            string Capturista = Session["idUsuario"].ToString();
            // txtusuario.Text
            //Dim TarjetaCirculacion As String
            //Dim Procesado As String
            //Dim ReferenciaProceso As String
            string monto;
            //Dim FechaProceso As String

            //---Detalle
            int idmulta;
            decimal importemulta;

            decimal montox = 0;

            // If dtpub.Rows.Count > 0 Then


            for (int x = 0; x <= dtpub.Rows.Count - 1; x++)
            {
                montox = montox + decimal.Parse(dtpub.Rows[x][2].ToString());

            }

            monto = montox.ToString();


            cAltaMultas obj = new cAltaMultas();

            string resul = obj.GuardaMulta(
                dtpub, idEstado, idMunicipio, Capturista, idplaca.Replace("-", "").Replace(" ", "").ToUpper().TrimEnd(), FolioMulta.ToUpper(), Calle1Multa.ToUpper().TrimEnd(),
                Calle2Multa.ToUpper().TrimEnd(), crucero.ToUpper().TrimEnd(), idboleta.ToUpper().TrimEnd(),
            fechaMulta, idAgente.ToUpper().TrimEnd(), descripcion.ToUpper().TrimEnd(), Nolicencia.ToUpper().TrimEnd(), decimal.Parse(monto), edoPlaca);


            ShowAlertMessage(resul);

            //   Response.Redirect("pagarmulta.aspx", false);
            ///  Response.Redirect("CapturaMultas.aspx", false);


            //valida campos


            txtboleta.Text = "";
            txtCalle1.Text = "";
            txtCalle2.Text = "";
            txtPlaca.Text = "";
            txtCrucero.Text = "";
            txtdatepicker.Text = "";
            txtdescripcion.Text = "";
            txtlicencia.Text = "";
            txtPlaca.Focus();

            dtpub.Rows.Clear();


            StringBuilder html = new StringBuilder();


            html.Append(" <tr>");
            html.Append("<td></td>");
            html.Append("<td></td> ");
            html.Append("<td></td> ");
            html.Append("<td></td>");
            html.Append("</tr>");

            tbcapcitaciones.InnerHtml = html.ToString();





        }
        catch (Exception ex)
        {
            ShowAlertMessage(ex.ToString());
        }

    }

    //protected void txtdescripcion_TextChanged(object sender, EventArgs e)
    //{
    //    cboTipoMulta.SelectedValue = txtIdMulta.Text;

    //    //cboMunicipio.SelectedValue = Session["IdMpo"].ToString();
    //}

    protected void txtIdMulta_TextChanged(object sender, EventArgs e)
    {
        IdMulta();
    }

    private void IdMulta()
    {

        try
        {
            cboTipoMulta.SelectedValue = txtIdMulta.Text;


            DescTipoMultaMontoID();
        }
        catch (Exception ex)
        {

            ShowAlertMessage("El Id de Multa No Existe.");
            btnAgregar.Visible = false;
            txtIdMulta.Focus();
            return;


        }


    }


    protected void txtAgenteID_TextChanged(object sender, EventArgs e)
    {
        cAltaMultas obj = new cAltaMultas();
        try
        {
            DataTable dt = obj.DameIdAgente(txtAgenteID.Text, int.Parse(cboEdo.SelectedValue), int.Parse(cboMunicipio.SelectedValue));

            string idAgente = "0";
            if (dt.Rows.Count > 0)
            {
                idAgente = dt.Rows[0][0].ToString();
            }

            if (idAgente == "0")
            {
                ShowAlertMessage("El Id de Agente No Existe.");
            }
             
            cboAgente.SelectedValue = idAgente;

        }
        catch (Exception ex)
        {
            ShowAlertMessage("El Id de Agente No Existe.");
            txtAgenteID.Focus();

            return;
        }


    }
}