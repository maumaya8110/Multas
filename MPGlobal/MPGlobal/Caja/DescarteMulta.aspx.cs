using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Caja_DescarteMulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                using (DataBase db = new DataBase())
                {
                    MPGlobalSessiones.Current.ReporteMultasPago = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasPagadas, null).Tables[0].DataTableToList<ReporteMultasPagadas>();//.Where(x => x.idEstado == idEstado && x.idMunicipio == idMunicipio);
                }
            }
            catch { }
        }
    }

    protected void btnBuscarMulta_Click(object sender, EventArgs e)
    {
        try
        {
            IEnumerable<ReporteMultasPagadas> query = MPGlobalSessiones.Current.ReporteMultasPago.Where(x => x.ReciboPago == "" && x.Fechapago == null && x.IdPlaca == txtPlaca.Text);
            grdDetalleMultas.DataSource = query.ToList();
            grdDetalleMultas.DataBind();
        }
        catch { }
    }

    protected void lnkDescartar_Click(object sender, EventArgs e)
    {
        using (DataBase db = new DataBase())
        {
            foreach(GridView row in grdDetalleMultas.Rows)
            {
                CheckBox chk = row.FindControl("CheckBoxMulta") as CheckBox;
                if (chk.Checked)
                {
                    int idEstado = int.Parse((row.FindControl("HiddenIdEstado") as HiddenField).Value);
                    int idMunicipio = int.Parse((row.FindControl("HiddenIdMunicipio") as HiddenField).Value);
                    int idBoleta = int.Parse((row.FindControl("HiddenIdBoleta") as HiddenField).Value);


                }
            }
        }
    }
}