using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        if (MPGlobalSessiones.Current.UsuarioLogueado.Usuario == null)
        {
            Response.Redirect("../Account/login.aspx");
        }
        var x = MPGlobalSessiones.Current.UsuarioLogueado.Usuario;

        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();
        Session["NombreUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.NombreFull.ToString();
        cAltaMultas obj = new cAltaMultas();
        if (Session["idUsuario"].ToString() == "")
        {
            Response.Redirect("login.aspx", false);
        }


        txtusuario.Text = Session["NombreUsuario"].ToString();




        if (!this.IsPostBack)
        {
            DataTable dtcatEdo;
            dtcatEdo = obj.catEstados();

            cboEdo.DataSource = dtcatEdo;
            cboEdo.DataTextField = "Nombre";
            cboEdo.DataValueField = "id";
            cboEdo.DataBind();

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


    protected void cboTipoMulta_SelectedIndexChanged(object sender, EventArgs e)
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

    protected void btnAgregar_Click(object sender, EventArgs e)
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

            string idEstado = cboEdo.SelectedValue;
            string idMunicipio = cboMunicipio.SelectedValue;
            string idboleta = txtboleta.Text;
            string idplaca = txtPlaca.Text;
            string FolioMulta = "";// txtfolio.Text;

            string dia = txtdatepicker.Text.Substring(3, 2);
            string mes = txtdatepicker.Text.Substring(0, 2);
            string anio = txtdatepicker.Text.Substring(6, 4);
            string fecha = anio + "" + mes + "" + dia;


            //If Int32.Parse(mes) > 12 Then
            //    Dim fecha As String = anio + "-" + mes + "-" + dia
            //End If




            //DateTime fechaMulta = DateTime.Parse()
            string fechaMulta = fecha + " " + cboHora.SelectedItem.Text + ":" + cboMinuto.SelectedItem.Text;
            string Calle1Multa = txtCalle1.Text;
            string Calle2Multa = txtCalle2.Text;
            string descripcion = txtdescripcion.Text;
            string idAgente = cboAgente.SelectedValue;
            string Nolicencia = txtlicencia.Text;
            //Dim EstatusMulta As String
            string Capturista = "1";
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

            string resul = obj.GuardaMulta(dtpub, idEstado, idMunicipio, Capturista, idplaca.Replace("-", "").Replace(" ", ""), FolioMulta, Calle1Multa.ToUpper(), Calle2Multa.ToUpper(), txtCrucero.Text.ToUpper(), idboleta.ToUpper(),
            fechaMulta, idAgente.ToUpper(), descripcion.ToUpper(), Nolicencia.ToUpper(), decimal.Parse(monto));


           // ShowAlertMessage(resul);

            Response.Redirect("pagarmulta.aspx", false);

            //valida campos

        }
        catch (Exception ex)
        {
            ShowAlertMessage(ex.ToString());
        }

    }
}