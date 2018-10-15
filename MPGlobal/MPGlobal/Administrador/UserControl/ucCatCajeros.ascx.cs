using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Administrador_UserControl_ucCatCajeros : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack) { LlenaDrop(); }

    }

    public void habilitaReadOnly(bool readOnly)
    {
        GridView1.Columns[0].Visible = !readOnly;
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

           MPGlobalSessiones.Current.Cajeros = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Cajeros, null).Tables[0].DataTableToList<Cajeros>();
            IEnumerable<Cajeros> query = MPGlobalSessiones.Current.Cajeros;

            GridView1.DataSource = query.ToList();
            GridView1.DataBind();

            if (query.ToList().Count > 0)
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;


        }
    }

    public void LlenaDrop()
    {


        using (DataBase db = new DataBase())
        {

            Helper.cargaCatalogoGenericCombo(DropEstados, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado", "- SELECCIONE UN ESTADO - ");
            Helper.cargaCatalogoGenericCombo(DropMpos, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, null).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio", "- SELECCIONE UN MUNICIPIO - ");

            Helper.cargaCatalogoGenericCombo(DropOficinas, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Oficinas, null).Tables[0].DataTableToList<Oficinas>(), "IdOficina", "DescOficina","- SELECCIONE UNA OFICINA-");
            Helper.cargaCatalogoGenericCombo( DropUsuarios, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null).Tables[0].DataTableToList<Usuario>(), "IdUsuario", "Nombre","- SELECCIONE UN USUARIO -");
            
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

        DropDownList DropEstado = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("DropEstado"));
        DropDownList DropMunicipio = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[5].FindControl("DropMpo"));
        DropDownList DropOficinas = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[6].FindControl("DropOficinas"));
        DropDownList DropUsuarios = ((DropDownList)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("DropUsuarios"));



        using (DataBase db = new DataBase())
        {
            Helper.cargaCatalogoGenericCombo(DropEstado, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado");
            Helper.cargaCatalogoGenericCombo(DropMunicipio, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, null).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio");

            Helper.cargaCatalogoGenericCombo(DropOficinas, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Oficinas, null).Tables[0].DataTableToList<Oficinas>(), "IdOficina", "DescOficina");
            Helper.cargaCatalogoGenericCombo(DropUsuarios, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null).Tables[0].DataTableToList<Usuario>(), "IdUsuario", "Nombre");

            DropEstado.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[4].Controls[1].FindControl("HiddenIdEstado"))).Value;
            DropMunicipio.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[5].Controls[1].FindControl("HiddenIdMunicipio"))).Value;

            DropOficinas.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[6].Controls[1].FindControl("HiddenIdOficina"))).Value;
            DropUsuarios.SelectedValue = ((HiddenField)(GridView1.Rows[e.NewEditIndex].Cells[7].Controls[1].FindControl("HiddenIdUsuario"))).Value;

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
                    
            parametros.Add(new SqlParameter("@IdCaja", ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdCaja"))).Value));
            parametros.Add(new SqlParameter("@FolioActual", ((TextBox)(row.Cells[1].Controls[1])).Text));

            parametros.Add(new SqlParameter("@FolioInicial", ((TextBox)(row.Cells[2].Controls[1])).Text));
            parametros.Add(new SqlParameter("@FolioFinal", ((TextBox)(row.Cells[3].Controls[1])).Text));
            parametros.Add(new SqlParameter("@idEstado", ((DropDownList)(row.Cells[4].Controls[1])).SelectedValue));
            parametros.Add(new SqlParameter("@idMunicipio", ((DropDownList)(row.Cells[5].Controls[1])).SelectedValue));
            parametros.Add(new SqlParameter("@idOficina", ((DropDownList)(row.Cells[6].Controls[1])).SelectedValue));
            parametros.Add(new SqlParameter("@IdUsuario", ((DropDownList)(row.Cells[7].Controls[1])).SelectedValue));
            parametros.Add(new SqlParameter("@Estatuscaja", ((CheckBox)(row.Cells[8].Controls[1])).Checked));

            db.EjecutaSPCatalogos(DataBase.TipoAccion.Modificar, DataBase.TipoCatalogo.Cajeros, parametros.ToArray());


        }
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "EditSuccess();", true);

        //Despues de updetear se quitan los textbox y se refresca el grid
        GridView1.EditIndex = -1;
        LlenaGrid();
        //-----
    }



    protected void BtnElimina_Click(object sender, EventArgs e)
    {

        string IdCajero = HiddenField1AutEli.Value;

        using (DataBase db = new DataBase())
        {

            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();

            parametros.Add(new SqlParameter("@IdCaja", HiddenField1AutEli.Value));


            db.EjecutaSPCatalogos(DataBase.TipoAccion.Eliminar, DataBase.TipoCatalogo.Cajeros, parametros.ToArray());


        }



        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "DeleteSuccess();", true);

        //Despues de Eliminar se refresca el grid

        LlenaGrid();
        //-----



    }



    public void LimpiaCampos()
    {
        //Limpia textbox
        txtFolioActual.Text = "";
        txtFolioFinal.Text = "";
        txtFolioInicial.Text = "";
       
    }

    protected void LinkBtnAlta_Click(object sender, EventArgs e)
    {

        using (DataBase db = new DataBase())
        {
            //Para cuando agregas muchos parametros
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCaja", ""));
           
            parametros.Add(new SqlParameter("@idOficina", DropOficinas.SelectedValue));
            parametros.Add(new SqlParameter("@IdUsuario", DropUsuarios.SelectedValue));
            parametros.Add(new SqlParameter("@FolioActual", txtFolioActual.Text));
            parametros.Add(new SqlParameter("@FolioInicial", txtFolioInicial.Text));
            parametros.Add(new SqlParameter("@FolioFinal", txtFolioFinal.Text));
            //parametros.Add(new SqlParameter("@UltimoAcceso", DropEstados.SelectedValue));

            parametros.Add(new SqlParameter("@idEstado", DropEstados.SelectedValue));
            parametros.Add(new SqlParameter("@idMunicipio", DropMpos.SelectedValue));
            parametros.Add(new SqlParameter("@EstatusCaja", 1));
            db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, DataBase.TipoCatalogo.Cajeros, parametros.ToArray());


            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "AltaSuccess();", true);

            UpdtAgregarMpo.Visible = false;
            BtnHabilita?.Invoke();
            LimpiaCampos();
            LlenaGrid();
        }

    }


    protected void DropEstados_SelectedIndexChanged(object sender, EventArgs e)
    {
        cAltaMultas obj = new cAltaMultas();
        DataTable dtcatMpo;
        int cveEdo = int.Parse(DropEstados.SelectedValue);
        dtcatMpo = obj.catMunicipiosXEdo(cveEdo);

        DropMpos.DataSource = dtcatMpo;
        DropMpos.DataValueField = "id";
        DropMpos.DataTextField = "Nombre";
        DropMpos.DataBind();

    }

}