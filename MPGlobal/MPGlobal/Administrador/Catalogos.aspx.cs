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

        TipoMovimiento = "Modificar";

        TipoCatalogo = "Sp_Cat_Estados";

        GridViewRow row = GridView1.Rows[e.RowIndex];

        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", ((TextBox)(row.Cells[1].Controls[1])).Text));
            parametros.Add(new SqlParameter("@nomEstado", ((TextBox)(row.Cells[2].Controls[1])).Text));
            parametros.Add(new SqlParameter("@siglasEstado", ((TextBox)(row.Cells[3].Controls[1])).Text));
            parametros.Add(new SqlParameter("@Contacto", ((TextBox)(row.Cells[4].Controls[1])).Text));
            parametros.Add(new SqlParameter("@Telefono", ((TextBox)(row.Cells[5].Controls[1])).Text));
            parametros.Add(new SqlParameter("@Correo", ((TextBox)(row.Cells[6].Controls[1])).Text));
            parametros.Add(new SqlParameter("@idLicencia", ((TextBox)(row.Cells[7].Controls[1])).Text));
            parametros.Add(new SqlParameter("@estatusEstado", ((TextBox)(row.Cells[8].Controls[1])).Text));

            db.EjecutaSPCatalogos(DataBase.TipoAccion.Modificar, TipoCatalogo, parametros.ToArray());


        }
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "EditSuccess();", true);

        //string NomEstado = ((TextBox)(row.Cells[2].Controls[1])).Text;
        //string SiglasEstado = ((TextBox)(row.Cells[2].Controls[1])).Text;
        //string IdLicencia = ((TextBox)(row.Cells[2].Controls[1])).Text;



    }



    protected void BtnElimina_Click(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        string IdEstado = ((TextBox)(row.Cells[2].Controls[1])).Text;


    }

    protected void BtnEdita_Click(object sender, EventArgs e)
    {
        //TipoMovimiento = "Modificar";

        //TipoCatalogo = "Sp_Cat_Estados";

        //GridViewRow row = GridView1.SelectedRow;
        ////string IdEstado = ((TextBox)(row.Cells[2].Controls[1])).Text;


        ////DropCatalogos.SelectedItem.ToString()
        //using (DataBase db = new DataBase())
        //{

        //    //Para cuando agregas muchos parametros
        //    List<SqlParameter> parametros = new List<SqlParameter>();
        //    parametros.Add(new SqlParameter("@idEstado", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@nomEstado", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@siglasEstado", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@Contacto", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@Telefono", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@Correo", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@idLicencia", ((TextBox)(row.Cells[2].Controls[1])).Text));
        //    parametros.Add(new SqlParameter("@estatusEstado", ((TextBox)(row.Cells[2].Controls[1])).Text));

        //    db.EjecutaSPCatalogos(DataBase.TipoAccion.Modificar, TipoCatalogo, parametros.ToArray());


        //}

    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        UpdtAgregarEdo.Visible = true;
        btnCancelarN.Visible = true;
        btnNew.Visible = false;
    }

    protected void btnCancelarN_Click(object sender, EventArgs e)
    {
        UpdtAgregarEdo.Visible = false;
        btnCancelarN.Visible = false;
        btnNew.Visible = true;

        //Limpia textbox
        txtEstado.Text = "";
        txtAbreviatura.Text = "";
        txtContacto.Text = "";
        txtTelefono.Text = "";
        txtCorreo.Text = "";
        txtLicencia.Text = "";
    }

    protected void LinkBtnAlta_Click(object sender, EventArgs e)
    {
        TipoCatalogo = "Sp_Cat_Estados";

        //DropCatalogos.SelectedItem.ToString()
        using (DataBase db = new DataBase())
        {
            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", ""));
            parametros.Add(new SqlParameter("@nomEstado", txtEstado.Text));
            parametros.Add(new SqlParameter("@siglasEstado", txtAbreviatura.Text));
            parametros.Add(new SqlParameter("@Contacto", txtContacto.Text));
            parametros.Add(new SqlParameter("@Telefono", txtTelefono.Text));
            parametros.Add(new SqlParameter("@Correo", txtCorreo.Text));
            parametros.Add(new SqlParameter("@idLicencia", txtLicencia.Text));
            parametros.Add(new SqlParameter("@estatusEstado", 1));
            db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, TipoCatalogo, parametros.ToArray());


            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "AltaSuccess();", true);


        }

    }
}