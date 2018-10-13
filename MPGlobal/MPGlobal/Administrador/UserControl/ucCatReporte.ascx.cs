using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;


public partial class Administrador_UserControl_ucCatReporte : System.Web.UI.UserControl
{


    protected void Page_Load(object sender, EventArgs e)
    {


    }

    public void habilitaReadOnly(bool readOnly)
    {
        GridView1.Columns[0].Visible = !readOnly;
    }

    public void LlenaGrid()
    {
        try
        {

            if (txtFechaIni.Text == "" || txtFechaFin.Text == "") { ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "FechaValida();", true); }
            else
            {
                using (DataBase db = new DataBase())
                {


                    DateTime FechaIni = DateTime.Parse(txtFechaIni.Text);
                    DateTime FechaFin = DateTime.Parse(txtFechaFin.Text);

                    //
                    MPGlobalSessiones.Current.ReporteMultasPago = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasPagadas, null).Tables[0].DataTableToList<ReporteMultasPagadas>();//.Where(x => x.idEstado == idEstado && x.idMunicipio == idMunicipio);

                    //MPGlobalSessiones.Current.Agentes = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Agentes, null).Tables[0].DataTableToList<Agentes>(); ;



                    IEnumerable<ReporteMultasPagadas> query = MPGlobalSessiones.Current.ReporteMultasPago;

                    query = query.Where(x => x.FechaPago >= FechaIni && x.FechaPago <= FechaFin);

                    //GridView1.DataSource = MPGlobalSessiones.Current.ReporteMultasPago;
                    //GridView1.DataBind();

                    GridView1.DataSource = query.ToList();
                    GridView1.DataBind();

                    if (query.ToList().Count > 0)
                        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

                }

            }
        }
        catch (Exception x)
        {
            throw x;
        }


    }


    protected void LinkBtnConsulta_Click(object sender, EventArgs e)
    {
        LlenaGrid();

    }


    protected void lnkContinuar_Click(object sender, EventArgs e)
    {
        try
        {
            int CountRow = GridView1.Rows.Count;

            if (CountRow == 0) { ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "SinMultasParaProcesar();", true); }
            else
            {


                int id = Helper.GetIdUsuario(Helper.GetUserID());

                string Descripcion = txtDescripcion.Text;
                int idUsuario = id;
                using (DataBase db = new DataBase())
                {

                    string xml = "";
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        CheckBox chk = row.FindControl("CheckBoxMulta") as CheckBox;
                        if (chk.Checked == true)
                        {
                            string IdEstado = ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdEstado"))).Value;
                            string IdMunicipio = ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdMunicipio"))).Value;
                            string IdBoleta = ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdBoleta"))).Value;
                            string IdMulta = ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdMulta"))).Value;


                            HiddenField hdn = row.FindControl("hdnIdVentana") as HiddenField;
                            xml += String.Format("<Proceso><IdEstado>{0}</IdEstado>" +
                                "                           <IdMunicipio>{1}</IdMunicipio>" +
                                "                           <IdBoleta>{2}</IdBoleta>" +
                                "                           <IdMulta>{3}</IdMulta>" +
                                "                           <UsuarioProceso>{4}</UsuarioProceso>" +
                                "               </Proceso>", IdEstado, IdMunicipio, IdBoleta, IdMulta, idUsuario);
                        }
                    }
                    xml = "<Actualiza>" + xml + "</Actualiza>";
                    XElement xel = XElement.Parse(xml);

                    List<SqlParameter> param = new List<SqlParameter>();
                    param.Add(new SqlParameter("@idUsuario", idUsuario));
                    param.Add(new SqlParameter("@Descripcion", Descripcion));
                    SqlParameter p = new SqlParameter("@Proceso", SqlDbType.Xml);
                    p.Value = xml;
                    param.Add(p);
                    //param.Add(new SqlParameter("@usuario", id));

                    db.EjecutaProcedure("sp_InsertaProcesoMulta", param.ToArray());
                }

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "Success();", true);


                LlenaGrid();
            }


        }
        catch (Exception x)
        {
            throw x;
        }

    }
}