using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;


public partial class ReporteProcesados : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


    }

    public void LlenaGrid()
    {
        try
        {
            using (DataBase db = new DataBase())
            {

                DateTime FechaIni = DateTime.Parse(txtFechaIni.Text);
                DateTime FechaFin = DateTime.Parse(txtFechaFin.Text);


                MPGlobalSessiones.Current.ReporteMultasProcesadas = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteProcesadas, null).Tables[0].DataTableToList<ReporteMultasProcesadas>();



                IEnumerable<ReporteMultasProcesadas> query = MPGlobalSessiones.Current.ReporteMultasProcesadas;

                query = query.Where(x => x.FechaProcesado >= FechaIni && x.FechaProcesado <= FechaFin);

                GridView1.DataSource = query.ToList();
                GridView1.DataBind();

                if (query.ToList().Count > 0)
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

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




    protected void lnkGuardar_Click(object sender, EventArgs e)
    {
        try
        {

            int id = Helper.GetIdUsuario(Helper.GetUserID());

            //string Descripcion = txtDescripcion.Text;
            int idUsuario = id;
            using (DataBase db = new DataBase())
            {
                string xml = "";

                int IdProceso = int.Parse(hdnIdP.Value);
                string FechaPagoM1 =txtFechaPagoM1.Text;
                string FechaPagoM2 = txtFechaPagoM2.Text;
                string FechaPagoM3 = txtFechaPagoM3.Text;
                
                xml += String.Format("<Proceso><IdProceso>{0}</IdProceso>" +
                    "                           <FechaMonto1>{1}</FechaMonto1>" +
                    "                           <FechaMonto2>{2}</FechaMonto2>" +
                    "                           <FechaMonto3>{3}</FechaMonto3>" +
                    "                           <UsuarioProceso>{4}</UsuarioProceso>" +
                    "               </Proceso>", IdProceso, FechaPagoM1, FechaPagoM2, FechaPagoM3, idUsuario);


                xml = "<Actualiza>" + xml + "</Actualiza>";
                XElement xel = XElement.Parse(xml);

                List<SqlParameter> param = new List<SqlParameter>();
                param.Add(new SqlParameter("@TipoMovimiento", 4));               

                SqlParameter p = new SqlParameter("@Proceso", SqlDbType.Xml);
                p.Value = xml;
                param.Add(p);


                db.EjecutaProcedure("Sp_Reporte_Procesadas", param.ToArray());
            }



            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "Success();", true);


        }
        catch (Exception x)
        {
            throw x;
        }
    }
}
