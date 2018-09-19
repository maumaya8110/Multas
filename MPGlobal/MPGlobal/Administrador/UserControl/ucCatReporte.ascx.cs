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
                DateTime FechaIni = DateTime.Parse(txtFechaIni.Text);
                DateTime FechaFin = DateTime.Parse(txtFechaFin.Text);
                //
                //MPGlobalSessiones.Current.UsuariosAdministrador = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null).Tables[0].DataTableToList<Usuario>();//.Where(x => x.idEstado == idEstado && x.idMunicipio == idMunicipio);
                IEnumerable<ReporteMultasPagadas> query = MPGlobalSessiones.Current.ReporteMultasPago;
                
                    query = query.Where(x => x.FechaPago >= FechaIni && x.FechaPago <= FechaFin);

                
                GridView1.DataSource = query.ToList();
                GridView1.DataBind();
            }
        }
        catch { }

    }
}