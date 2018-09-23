using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Administrador_UserControl_ucCatFunciones : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack) { LlenaDrop(); }

    }

    public delegate void Habilita();
    public event Habilita BtnHabilita;

    public void GridDatabind()
    {
        GridView1.DataBind();

    }

    public void LlenaGrid()
    {
       
        using (DataBase db = new DataBase())
        {

            MPGlobalSessiones.Current.Funcion = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Funcion, null).Tables[0].DataTableToList<Funcion>(); ;
         
            GridView1.DataSource = MPGlobalSessiones.Current.Funcion;
            GridView1.DataBind();

        }
    }

    public void LlenaDrop()
    {


        using (DataBase db = new DataBase())
        {
            Helper.cargaCatalogoGenericCombo(DropEstados, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado");
            Helper.cargaCatalogoGenericCombo(DropMpos, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, null).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio");

            Helper.cargaCatalogoGenericCombo(DropSistema, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Sistemas, null).Tables[0].DataTableToList<Sistemas>(), "IdSistema", "NomSistema");
            Helper.cargaCatalogoGenericCombo(DropVentana, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Ventana, null).Tables[0].DataTableToList<Ventana>(), "IdVentana", "NomVentana");
            
        }

    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LlenaGrid();


    }


    public void UpdtVisible() { UpdtAgregarMpo.Visible = true; }
    public void UpdtInVisible() { UpdtAgregarMpo.Visible = false; }




    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        LlenaGrid();

        DropDownList DropEstado = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[2].FindControl("DropEstado"));
        DropDownList DropMunicipio = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[3].FindControl("DropMpo"));
        DropDownList DropSistema = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("DropSistema"));
        DropDownList DropVentana = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[5].FindControl("DropVentana"));



        using (DataBase db = new DataBase())
        {
            Helper.cargaCatalogoGenericCombo(DropEstado, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado");
            Helper.cargaCatalogoGenericCombo(DropMunicipio, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, null).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio");

            Helper.cargaCatalogoGenericCombo(DropSistema, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Sistemas, null).Tables[0].DataTableToList<Oficinas>(), "IdSistema", "NomSistema");
            Helper.cargaCatalogoGenericCombo(DropVentana, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Ventana, null).Tables[0].DataTableToList<Usuario>(), "IdVentana", "NomVentana");

            DropEstado.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[3].Controls[1].FindControl("HiddenIdEstado"))).Value;
            DropMunicipio.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[4].Controls[1].FindControl("HiddenIdMunicipio"))).Value;

            DropSistema.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[3].Controls[1].FindControl("HiddenIdSistema"))).Value;
            DropVentana.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[4].Controls[1].FindControl("HiddenIdVentana"))).Value;

        }

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;


        LlenaGrid();

    }
    protected void GridView1_Rowupdating(object sender, GridViewUpdateEventArgs e)
    {



        GridViewRow row = GridView1.Rows[e.RowIndex];

        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
                    
            parametros.Add(new SqlParameter("@IdFuncion", ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdFuncion"))).Value));
                       parametros.Add(new SqlParameter("@NomFuncion", ((TextBox)(row.Cells[1].Controls[1])).Text));


        
            parametros.Add(new SqlParameter("@idEstado", ((DropDownList)(row.Cells[2].Controls[1])).SelectedValue));
            parametros.Add(new SqlParameter("@idMunicipio", ((DropDownList)(row.Cells[3].Controls[1])).SelectedValue));
            parametros.Add(new SqlParameter("@IdSistema", ((TextBox)(row.Cells[4].Controls[1])).Text));
            parametros.Add(new SqlParameter("@IdVentana", ((TextBox)(row.Cells[5].Controls[1])).Text));

            parametros.Add(new SqlParameter("@estatus", ((CheckBox)(row.Cells[6].Controls[1])).Checked));

            db.EjecutaSPCatalogos(DataBase.TipoAccion.Modificar, DataBase.TipoCatalogo.Funcion, parametros.ToArray());


        }
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "EditSuccess();", true);

        //Despues de updetear se quitan los textbox y se refresca el grid
        GridView1.EditIndex = -1;
        LlenaGrid();
        //-----
    }



    protected void BtnElimina_Click(object sender, EventArgs e)
    {

        string IdFuncion = HiddenField1AutEli.Value;

        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();

            parametros.Add(new SqlParameter("@IdFuncion", HiddenField1AutEli.Value));


            db.EjecutaSPCatalogos(DataBase.TipoAccion.Eliminar, DataBase.TipoCatalogo.Funcion, parametros.ToArray());


        }



        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "DeleteSuccess();", true);

        //Despues de Eliminar se refresca el grid

        LlenaGrid();
        //-----



    }



    public void LimpiaCampos()
    {
        //Limpia textbox
        txtNomFuncion.Text = "";
       
    }

    protected void LinkBtnAlta_Click(object sender, EventArgs e)
    {

        using (DataBase db = new DataBase())
        {
            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdFuncion", ""));
           
            parametros.Add(new SqlParameter("@NomFuncion", txtNomFuncion.Text));
            parametros.Add(new SqlParameter("@IdVentana", DropVentana.SelectedValue));
            parametros.Add(new SqlParameter("@IdSistema", DropSistema.SelectedValue));
            //parametros.Add(new SqlParameter("@UltimoAcceso", DropEstados.SelectedValue));

            parametros.Add(new SqlParameter("@idEstado", DropEstados.SelectedValue));
            parametros.Add(new SqlParameter("@idMunicipio", DropMpos.SelectedValue));
            parametros.Add(new SqlParameter("@Estatus", 1));
            db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, DataBase.TipoCatalogo.Funcion, parametros.ToArray());


            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "AltaSuccess();", true);

            UpdtAgregarMpo.Visible = false;
            BtnHabilita?.Invoke();
            LimpiaCampos();
            LlenaGrid();
        }

    }


    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        string search = txtSearch.Text.ToLower();
        if (search.Length > 0)
        {
            GridView1.DataSource = MPGlobalSessiones.Current.Funcion.Where(x => x.NomFuncion.ToLower().Contains(search) || x.nomMunicipio.ToLower().Contains(search) || x.nomEstado.ToLower().Contains(search) || x.NomSistema.ToLower().Contains(search) || x.NomVentana.ToLower().Contains(search)).ToList();
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = MPGlobalSessiones.Current.Funcion;
            GridView1.DataBind();
        }
        txtSearch.Focus();
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "regresaFocus", "regresaFocusSearch();", true);
    }

}