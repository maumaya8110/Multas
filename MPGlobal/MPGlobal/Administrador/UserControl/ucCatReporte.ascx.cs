using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Administrador_UserControl_ucCatReporte : System.Web.UI.UserControl
{


    protected void Page_Load(object sender, EventArgs e)
    {


    }

 

    public void GridDatabind()
    {
        GridView1.DataBind();

    }

    public void LlenaGrid()
    {
       
        using (DataBase db = new DataBase())
        {

            GridView1.DataSource = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasPagadas, null);
            GridView1.DataBind();
        }


    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LlenaGrid();
    }


   


    protected void LinkBtnConsulta_Click(object sender, EventArgs e)
    {
        try
        {
            using (DataBase db = new DataBase())
            {
                //string FechaIni = txtFechaIni.Text;
                //string FechaFin = txtFechaFin.Text;

                DateTime FechaIni = DateTime.Parse(txtFechaIni.Text);
                DateTime FechaFin = DateTime.Parse(txtFechaFin.Text);

                //
                MPGlobalSessiones.Current.ReporteMultasPago = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasPagadas, null).Tables[0].DataTableToList<ReporteMultasPagadas>();//.Where(x => x.idEstado == idEstado && x.idMunicipio == idMunicipio);

                //MPGlobalSessiones.Current.Agentes = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Agentes, null).Tables[0].DataTableToList<Agentes>(); ;



                IEnumerable<ReporteMultasPagadas> query = MPGlobalSessiones.Current.ReporteMultasPago;

                query = query.Where(x => x.FechaPago >= FechaIni && x.FechaPago <= FechaFin);

                GridView1.DataSource = MPGlobalSessiones.Current.ReporteMultasPago;
                GridView1.DataBind();


                //GridView1.DataSource = query.ToList();
                //GridView1.DataBind();
            }
        }
        catch (Exception x)
        {
            throw x;
        }

    }

    protected void LinkBtnProcesar_Click(object sender, EventArgs e)
    {

        
        try
        {
            using (DataBase db = new DataBase())
            {

                //

                foreach (GridViewRow row in GridView1.Rows)
                {
                    string Estado = ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdEstado"))).Value;
                    string Municipio = ((HiddenField)(row.Cells[2].Controls[1].FindControl("HiddenIdMunicipio"))).Value;
                    string IdBoleta = ((HiddenField)(row.Cells[3].Controls[1].FindControl("HiddenIdBoleta"))).Value;
                    string IdMulta = ((HiddenField)(row.Cells[4].Controls[1].FindControl("HiddenIdMulta"))).Value;


                    //string valorcol2 = row.Cells[1].Text;
                    //DropDownList DropEstado = ((DropDownList)GridView1.Rows.Cells[3].FindControl("DropEstado"));
                    //DropDownList DropMunicipio = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("DropMpo"));


                    // ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[4].Controls[1].FindControl("HiddenIdMunicipio"))).Value;


                }









            }
        }
        catch (Exception x)
        {
            throw x;
        }

    }
}