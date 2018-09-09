using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_Usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using(DataBase db = new DataBase())
            {
                Helper.cargaCatalogoGenericReporte(ddlEstado, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, "sp_Cat_Estados", null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado");
                //Helper.cargaCatalogoGenericReporte(ddlMunicipio, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, "", null).Tables[0].DataTableToList<CatalogoGenerico>());
            }
            
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch { }
    }
}