using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RGeneradas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        cReportes obj = new cReportes();

        if (System.Web.HttpContext.Current.Session["loginId"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }



        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();
        Session["NombreUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.NombreFull.ToString();

        Session["IdEdo"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdEstado.ToString();
        Session["IdMpo"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdMunicipio.ToString();



        if (!this.IsPostBack)
        {
            DataTable dtcatEdo;
            dtcatEdo = obj.catEstados();

            cboEdo.DataSource = dtcatEdo;
            cboEdo.DataTextField = "Nombre";
            cboEdo.DataValueField = "id";
            cboEdo.DataBind();


            cboEdo.SelectedValue = Session["IdEdo"].ToString();
            ConsultaMunicipios();




            DataTable dtEstatus;
            dtEstatus = obj.CatEstatus();

            //cboEstatus.DataSource = dtEstatus;
            //cboEstatus.DataTextField = "Desc";
            //cboEstatus.DataValueField = "id";
            //cboEstatus.DataBind();


            DataTable dtReportes;
            dtReportes = obj.catReportesMultas();

            //cbotReporte.DataSource = dtReportes;
            //cbotReporte.DataTextField = "Desc";
            //cbotReporte.DataValueField = "id";
            //cbotReporte.DataBind();

            

            //cboEdo.Items.IndexOf(cboEdo.Items.FindByValue(Session["IdEdo"].ToString()));

            //dtpub = new DataTable();

            //crearTabla();

        }
        else
        {
            //dtpub = (DataTable)ViewState["DataTable"];
            //return;

        }



    }


       private void ConsultaMunicipios()
    {
        cReportes obj = new cReportes();
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





     
        DataTable dtcatTipoMulta;



      //  int cveEdo = int.Parse(cboEdo.SelectedValue);
        int cveMpo = int.Parse(Session["IdMpo"].ToString());
     
        dtcatTipoMulta = obj.catTipoMulta(cveEdo, cveMpo);

 


        cboTipoMulta.DataSource = dtcatTipoMulta;
        cboTipoMulta.DataTextField = "Nombre";
        cboTipoMulta.DataValueField = "id";
        cboTipoMulta.DataBind();




    }

    protected void cboEdo_SelectedIndexChanged1(object sender, EventArgs e)
    {

        cReportes obj = new cReportes();
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

            cReportes obj = new cReportes();
            
            DataTable dtcatTipoMulta;



            int cveEdo = int.Parse(cboEdo.SelectedValue);
            int cveMpo = int.Parse(cboMunicipio.SelectedValue);
           

            dtcatTipoMulta = obj.catTipoMulta(cveEdo, cveMpo);


            cboTipoMulta.DataSource = dtcatTipoMulta;
            cboTipoMulta.DataTextField = "Nombre";
            cboTipoMulta.DataValueField = "id";
            cboTipoMulta.DataBind();
             

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

    protected void btnConsultar_Click(object sender, EventArgs e)
    {
         cReportes obj = new cReportes();
        DataTable dtReporte = obj.ReportesGeneradas(int.Parse(cboEdo.SelectedValue), int.Parse(cboMunicipio.SelectedValue), int.Parse(cboTipoMulta.SelectedValue), txtFechaIni.Text, txtFechaFin.Text,txtPlaca.Text);
        gvReportes.DataSource = dtReporte;
        gvReportes.DataBind();
    }



    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }


    protected void btnExportarExcel_Click(object sender, EventArgs e)
    {
        cReportes obj = new cReportes();
        DataTable dtReporte = obj.ReportesGeneradas(int.Parse(cboEdo.SelectedValue), int.Parse(cboMunicipio.SelectedValue), int.Parse(cboTipoMulta.SelectedValue), txtFechaIni.Text, txtFechaFin.Text, txtPlaca.Text);
        fgral.ExporttoExcell(dtReporte, "Reporte Multas Generadas");

        ExportGrid("GridviewData.xls", "application/vnd.ms-excel");

        
    }


    private void ExportGrid(string fileName, string contentType)
    {
        // throw new NotImplementedException();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;fileName=" + fileName);
        Response.Charset = "";
        Response.ContentType = contentType;

        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        gvReportes.RenderControl(hw);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.Close();
        Response.End();

    }

}