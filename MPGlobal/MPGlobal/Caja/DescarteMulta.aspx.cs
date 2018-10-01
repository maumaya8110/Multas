using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Caja_DescarteMulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            recargaInformacion();
        }
    }

    protected void btnBuscarMulta_Click(object sender, EventArgs e)
    {
        try
        {
            IEnumerable<ReporteMultasSinPagar> query = MPGlobalSessiones.Current.ReporteMultasSinPagar.Where(x => x.IdPlaca == txtPlaca.Text);
            grdDetalleMultas.DataSource = query.ToList();
            grdDetalleMultas.DataBind();

            lnkModalInfoDescartar.Visible = query.ToList().Count > 0;

            if (query.ToList().Count > 0)
                grdDetalleMultas.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch { }
    }

    protected void lnkDescartar_Click(object sender, EventArgs e)
    {
        using (DataBase db = new DataBase())
        {
            foreach(GridViewRow row in grdDetalleMultas.Rows)
            {
                CheckBox chk = row.FindControl("CheckBoxMulta") as CheckBox;
                if (chk.Checked)
                {
                    int idEstado = int.Parse((row.FindControl("HiddenIdEstado") as HiddenField).Value);
                    int idMunicipio = int.Parse((row.FindControl("HiddenIdMunicipio") as HiddenField).Value);
                    int idBoleta = int.Parse((row.FindControl("HiddenIdBoleta") as HiddenField).Value);

                    List<SqlParameter> parametros = new List<SqlParameter>();
                    parametros.Add(new SqlParameter("@idEstado", idEstado));
                    parametros.Add(new SqlParameter("@idMunicipio", idMunicipio));
                    parametros.Add(new SqlParameter("@idBoleta", idBoleta));
                    parametros.Add(new SqlParameter("@recibo", txtRecibo.Text));
                    parametros.Add(new SqlParameter("@fechaPago", DateTime.Parse(txtFechaPago.Text)));

                    db.EjecutaProcedure("Sp_DescartaMutlas", parametros.ToArray());
                }
            }

            //recarga
            recargaInformacion();
            btnBuscarMulta_Click(null, null);

            ScriptManager.RegisterStartupScript(updDescargaMulta, updDescargaMulta.GetType(), "terminaDescarte_function", "terminaDescarte();", true);
        }
    }

    private void recargaInformacion()
    {
        try
        {
            using (DataBase db = new DataBase())
            {
                MPGlobalSessiones.Current.ReporteMultasSinPagar = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasSinPagar, null).Tables[0].DataTableToList<ReporteMultasSinPagar>();
            }
        }
        catch { }
    }
}