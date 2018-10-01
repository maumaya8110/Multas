﻿using System;
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
                //param.Add(new SqlParameter("@Descripcion", Descripcion));
                SqlParameter p = new SqlParameter("@Proceso", SqlDbType.Xml);
                p.Value = xml;
                param.Add(p);
                //param.Add(new SqlParameter("@usuario", id));

                db.EjecutaProcedure("sp_InsertaProcesoMulta", param.ToArray());
            }

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "Success();", true);


            LlenaGrid();
        }
        catch (Exception x)
        {
            throw x;
        }
    }
}