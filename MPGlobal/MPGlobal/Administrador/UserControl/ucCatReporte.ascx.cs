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
        
        using (DataBase db = new DataBase())
        {
            ////Para cuando agregas muchos parametros
            //List<SqlParameter> parametros = new List<SqlParameter>();
            //parametros.Add(new SqlParameter("@nomEstado", txtFechaIni.Text));
            //parametros.Add(new SqlParameter("@siglasEstado", txtFechaFin.Text));

            //db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, DataBase.TipoCatalogo.Estados, parametros.ToArray());


            ////ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "AltaSuccess();", true);


            LlenaGrid();
        }

    }
}