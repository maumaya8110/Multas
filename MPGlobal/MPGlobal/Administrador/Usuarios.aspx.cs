using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Administrador_Usuarios : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        ucAltaUsuario.OnUsuarioAgregado += UsuarioAgregado;
    }

    private void UsuarioAgregado(string id)
    {
        cargaUsuarios();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using(DataBase db = new DataBase())
            {
                //cargar catalogo estados
                Helper.cargaCatalogoGenericReporte(ddlEstado, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado");

                //carga municipios
                Helper.cargaCatalogoGenericReporte(ddlMunicipio, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, null).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio");

                MPGlobalSessiones.Current.UsuariosAdministrador = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null).Tables[0].DataTableToList<Usuario>();

                //carga usuarios
                cargaUsuarios();
            }
        }
    }

    private void cargaUsuarios()
    {
        try
        {
            using (DataBase db = new DataBase())
            {
                int idEstado = int.Parse(ddlEstado.SelectedValue);
                int idMunicipio = int.Parse(ddlMunicipio.SelectedValue);
                //
                //MPGlobalSessiones.Current.UsuariosAdministrador = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null).Tables[0].DataTableToList<Usuario>();//.Where(x => x.idEstado == idEstado && x.idMunicipio == idMunicipio);
                IEnumerable<Usuario> query = MPGlobalSessiones.Current.UsuariosAdministrador;
                if (idEstado > 0)
                    query = query.Where(x => x.idEstado == idEstado);

                if (idMunicipio > 0)
                    query = query.Where(x => x.idMunicipio == idMunicipio);

                grdUsuarios.DataSource = query.ToList();
                grdUsuarios.DataBind();
            }
        }
        catch { }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            cargaUsuarios();   
        }
        catch { }
    }

    protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        cargaMunicipios();
    }

    private void cargaMunicipios()
    {
        using(DataBase db = new DataBase())
        {
            //carga catalogo de municipios
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", ddlEstado.SelectedValue));
            Helper.cargaCatalogoGenericReporte(ddlMunicipio, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, parametros.ToArray()).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio");
        }
    }

    protected void lnkEditar_Command(object sender, CommandEventArgs e)
    {
        ucAltaUsuario.cargaInfoUsuario(int.Parse(e.CommandArgument.ToString()));
    }

    protected void lnkAddUsuario_Click(object sender, EventArgs e)
    {
        ucAltaUsuario.nuevoUsuario();
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            using(DataBase db = new DataBase())
            {
                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("@userId", hdnEliminar.Value));
                db.EjecutaSPCatalogos(DataBase.TipoAccion.Eliminar, DataBase.TipoCatalogo.Usuarios, parametros.ToArray(), true);
            }

            cargaUsuarios();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mensaje_correcto", "mensajeUsuarioEliminado();", true);
        }
        catch(Exception x)
        {

        }
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        string search = txtSearch.Text.ToLower();
        if(search.Length > 0)
        {
            grdUsuarios.DataSource = MPGlobalSessiones.Current.UsuariosAdministrador.Where(x => x.nombreFull.ToLower().Contains(search) || x.nomEstado.ToLower().Contains(search) || x.NomMunicipio.ToLower().Contains(search) || x.Referencia.ToLower().Contains(search) || x.Area.ToLower().Contains(search) || x.Departamento.ToLower().Contains(search) || x.Telefono.ToLower().Contains(search) ).ToList();
            grdUsuarios.DataBind();
        }
        else
        {
            grdUsuarios.DataSource = MPGlobalSessiones.Current.UsuariosAdministrador;
            grdUsuarios.DataBind();
        }
        txtSearch.Focus();
        ScriptManager.RegisterStartupScript(updUsuarios, updUsuarios.GetType(), "regresaFocus", "regresaFocusSearch();", true);
    }
}