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
                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("@idEstado", ddlEstado.SelectedValue));
                parametros.Add(new SqlParameter("@idMunicipio", ddlMunicipio.SelectedValue));

                grdUsuarios.DataSource = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, parametros.ToArray());
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
}