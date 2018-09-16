using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Administrador_UserControl_ucCatEstado : System.Web.UI.UserControl
{

    //public string TipoCatalogo = "";
    //public string TipoMovimiento = "";

    protected void Page_Load(object sender, EventArgs e)
    {


    }

    public delegate void Habilita();
    public event Habilita BtnHabilita;



    //protected void DropCatalogos_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (DropCatalogos.SelectedValue == "Selecciona el catalogo")
    //    {
    //        btnNew.Visible = false;
    //        GridView1.DataBind();
    //        UpdtAgregarEdo.Visible = false;
    //    }
    //    else
    //    {

    //        btnNew.Visible = true;
    //        TipoMovimiento = "CONSULTAR";
    //        LlenaGrid();

    //    }
    //}


    public void GridDatabind()
    {
        GridView1.DataBind();
        //btnNew.Visible = false;

    }

    public void LlenaGrid()
    {
        //DropCatalogos.SelectedItem.ToString()

        //TipoCatalogo = "Sp_Cat_Estados";

        //DataSet SqlDS13;
        using (DataBase db = new DataBase())
        {

            GridView1.DataSource = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null);
            GridView1.DataBind();
        }


    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LlenaGrid();
    }


    public void UpdtVisible() { UpdtAgregarEdo.Visible = true;}
    public void UpdtInVisible() { UpdtAgregarEdo.Visible = false; }




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

        //TipoMovimiento = "Modificar";

        //TipoCatalogo = "Sp_Cat_Estados";

        GridViewRow row = GridView1.Rows[e.RowIndex];

        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
            //parametros.Add(new SqlParameter("@idEstado", ((Label)(row.Cells[1].Controls[1])).Text));
            parametros.Add(new SqlParameter("@idEstado", ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdEstado"))).Value));

            parametros.Add(new SqlParameter("@nomEstado", ((TextBox)(row.Cells[1].Controls[1])).Text));
            parametros.Add(new SqlParameter("@siglasEstado", ((TextBox)(row.Cells[2].Controls[1])).Text));
            parametros.Add(new SqlParameter("@Contacto", ((TextBox)(row.Cells[3].Controls[1])).Text));
            parametros.Add(new SqlParameter("@Telefono", ((TextBox)(row.Cells[4].Controls[1])).Text));
            parametros.Add(new SqlParameter("@Correo", ((TextBox)(row.Cells[5].Controls[1])).Text));
            parametros.Add(new SqlParameter("@idLicencia", ((TextBox)(row.Cells[6].Controls[1])).Text));
            parametros.Add(new SqlParameter("@estatusEstado", ((CheckBox)(row.Cells[7].Controls[1])).Checked));

            db.EjecutaSPCatalogos(DataBase.TipoAccion.Modificar, DataBase.TipoCatalogo.Estados, parametros.ToArray());


        }
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "EditSuccess();", true);

        //Despues de updetear se quitan los textbox y se refresca el grid
        GridView1.EditIndex = -1;
        LlenaGrid();
        //-----
    }



    protected void BtnElimina_Click(object sender, EventArgs e)
    {

        string IdEstado = HiddenField1AutEli.Value;


        //TipoMovimiento = "Modificar";

        //TipoCatalogo = "Sp_Cat_Estados";



        //GridViewRow row = GridView1.Rows[e.RowIndex];



        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();

            parametros.Add(new SqlParameter("@idEstado", HiddenField1AutEli.Value));


            db.EjecutaSPCatalogos(DataBase.TipoAccion.Eliminar, DataBase.TipoCatalogo.Estados, parametros.ToArray());


        }



        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "DeleteSuccess();", true);

        //Despues de Eliminar se refresca el grid

        LlenaGrid();
        //-----



    }


    //protected void btnNew_Click(object sender, EventArgs e)
    //{
    //    UpdtAgregarEdo.Visible = true;
    //    btnCancelarN.Visible = true;
    //    btnNew.Visible = false;
    //}

    //protected void btnCancelarN_Click(object sender, EventArgs e)
    //{
    //    UpdtAgregarEdo.Visible = false;
    //    btnCancelarN.Visible = false;
    //    btnNew.Visible = true;

    //    LimpiaCampos();
    //}

    public void LimpiaCampos()
    {
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
        //TipoCatalogo = "Sp_Cat_Estados";

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
            db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, DataBase.TipoCatalogo.Estados, parametros.ToArray());


            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "AltaSuccess();", true);

            UpdtAgregarEdo.Visible = false;
            BtnHabilita?.Invoke();
            LimpiaCampos();
            LlenaGrid();
        }

    }
}