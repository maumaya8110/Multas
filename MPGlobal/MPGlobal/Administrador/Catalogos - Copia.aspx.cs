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

    //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    int index = Convert.ToInt32(e.CommandArgument);
    //    if (e.CommandName.Equals("Edit"))
    //    {

    //        GridViewRow gvrow = GridView1.Rows[index];
    //        //HfUpdateID.Value = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
    //        //txtNameUpdate.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
    //        //txtEmailIDUpdate.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
    //        //txtAddressUpdate.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text);
    //        //txtContactUpdate.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text);
    //        //lblResult.Visible = false;
    //        System.Text.StringBuilder sb = new System.Text.StringBuilder();
    //        sb.Append(@"<script type='text/javascript'>");
    //        sb.Append("$('#editModal').modal('show');");
    //        sb.Append(@"</script>");
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

    //    }
    //}

    //    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    //////GridView1.DataBind();
    //    //if ( == "Delete")
    //    //{

    //    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "Success();", true);

    //    //}

    //}

    //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    //{

    //    GridView1.EditIndex = e.NewEditIndex;

    //}

    //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{

    //    GridView1.EditIndex = -1;

    //}

    //protected void GridView1_Rowupdating(object sender, GridViewUpdateEventArgs e)
    //{

    //    GridViewRow row = GridView1.Rows[e.RowIndex];
    //    string NomEstado = ((TextBox)(row.Cells[2].Controls[0])).Text;
    //    string SiglasEstado = ((TextBox)(row.Cells[2].Controls[0])).Text;
    //    string Contacto = ((TextBox)(row.Cells[2].Controls[0])).Text;
    //    string Telefono = ((TextBox)(row.Cells[2].Controls[0])).Text;
    //    string Correo = ((TextBox)(row.Cells[2].Controls[0])).Text;
    //    string Licencia = ((TextBox)(row.Cells[2].Controls[0])).Text;
    //    string Estatus = ((TextBox)(row.Cells[2].Controls[0])).Text;

    //}

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LlenaGrid();
    }


    protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        //GridView1.DataBind();
        //if (e.CommandName == "Delete")
        //{

        //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "Success();", true);

        //}

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("Edit"))
        {

            GridViewRow gvrow = GridView1.Rows[index];
            string t = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
            string t2 = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
            string t3 = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#editModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

        }

        if (e.CommandName == "Delete")
        {

            //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "Success();", true);

        }


    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

        GridView1.EditIndex = e.NewEditIndex;
        LlenaGrid();



    }
    

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        GridView1.EditIndex = -1;
        LlenaGrid();


    }

    protected void GridView1_Rowupdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow row = GridView1.Rows[e.RowIndex];
        string NomEstado = ((TextBox)(row.Cells[2].Controls[1])).Text;
        string SiglasEstado = ((TextBox)(row.Cells[2].Controls[1])).Text;
        string IdLicencia = ((TextBox)(row.Cells[2].Controls[1])).Text;



    }


}