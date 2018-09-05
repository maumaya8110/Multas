using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Catalogos : System.Web.UI.Page
{

    public string TipoCatalogo = "";
    public string TipoMovimiento = "";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropCatalogos_SelectedIndexChanged(object sender, EventArgs e)
    {

        TipoMovimiento = "CONSULTAR";
        LlenaGrid();

    }

    public void LlenaGrid()
    {
        //DropCatalogos.SelectedItem.ToString()

        TipoCatalogo = "Sp_Cat_Estados";

        //DataSet SqlDS13;
        using (DataBase db = new DataBase())
        {

            GridView1.DataSource = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, TipoCatalogo, null);
            GridView1.DataBind();
        }


    }

    protected void BtnNuevo_Click(object sender, EventArgs e)
    {
        TipoCatalogo = "Sp_Cat_Estados";

        //DropCatalogos.SelectedItem.ToString()
        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", 1));
            parametros.Add(new SqlParameter("@nomEstado", 1));
            parametros.Add(new SqlParameter("@siglasEstado", 1));
            parametros.Add(new SqlParameter("@Contacto", 1));
            parametros.Add(new SqlParameter("@Telefono", 1));
            parametros.Add(new SqlParameter("@Correo", 1));
            parametros.Add(new SqlParameter("@idLicencia", 1));
            parametros.Add(new SqlParameter("@estatusEstado", 1));
            db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, TipoCatalogo, parametros.ToArray());


        }

    }

    

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ////GridView1.DataBind();
        //if (e.CommandName == "Delete")
        //{

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "success();", true);

        //}

    }
}