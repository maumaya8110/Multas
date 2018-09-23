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



    public void GridDatabind()
    {
        GridView1.DataBind();

    }

    public void LlenaGrid()
    {

        using (DataBase db = new DataBase())
        {

            GridView1.DataSource = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasPagadas, null);
            GridView1.DataBind();
        }


    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LlenaGrid();
    }





    protected void LinkBtnConsulta_Click(object sender, EventArgs e)
    {
        try
        {
            using (DataBase db = new DataBase())
            {
                //string FechaIni = txtFechaIni.Text;
                //string FechaFin = txtFechaFin.Text;

                DateTime FechaIni = DateTime.Parse(txtFechaIni.Text);
                DateTime FechaFin = DateTime.Parse(txtFechaFin.Text);

                //
                MPGlobalSessiones.Current.ReporteMultasPago = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.ReporteMultasPagadas, null).Tables[0].DataTableToList<ReporteMultasPagadas>();//.Where(x => x.idEstado == idEstado && x.idMunicipio == idMunicipio);

                //MPGlobalSessiones.Current.Agentes = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Agentes, null).Tables[0].DataTableToList<Agentes>(); ;



                IEnumerable<ReporteMultasPagadas> query = MPGlobalSessiones.Current.ReporteMultasPago;

                query = query.Where(x => x.FechaPago >= FechaIni && x.FechaPago <= FechaFin);

                GridView1.DataSource = MPGlobalSessiones.Current.ReporteMultasPago;
                GridView1.DataBind();


                //GridView1.DataSource = query.ToList();
                //GridView1.DataBind();
            }
        }
        catch (Exception x)
        {
            throw x;
        }

    }

    protected void LinkBtnProcesar_Click(object sender, EventArgs e)
    {


        try
        {
            //using (DataBase db = new DataBase())
            //{

            //

            //foreach (GridViewRow row in GridView1.Rows)
            //{


            //////-------------------------------
            //List<SqlParameter> parametros = new List<SqlParameter>();
            //parametros.Add(new SqlParameter("@IdEstado", ((HiddenField)(row.Cells[1].Controls[1].FindControl("HiddenIdEstado"))).Value));

            int id = Helper.GetIdUsuario(Helper.GetUserID());
            //guarda las ventanas
            string Descripcion = "";
            int idUsuario = id;
            using (DataBase db = new DataBase())
            {
                //db.EjecutaSPCatalogos(tipo, DataBase.TipoCatalogo.Usuarios, parametros.ToArray());

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
                            "               </Proceso>", IdEstado, IdMunicipio,IdBoleta,IdMulta, idUsuario);
                    }
                }
                xml = "<Actualiza>" + xml + "</Actualiza>";
                XElement xel = XElement.Parse(xml);

                List<SqlParameter> param = new List<SqlParameter>();
                param.Add(new SqlParameter("@idUsuario", idUsuario));
                param.Add(new SqlParameter("@idDescripcion", Descripcion));
                SqlParameter p = new SqlParameter("@Proceso", SqlDbType.Xml);
                p.Value = xml;
                param.Add(p);
                param.Add(new SqlParameter("@usuario", id));

                db.EjecutaProcedure("sp_InsertaProcesoMulta", param.ToArray());




            }

            //ddlEstado.SelectedIndex = 0;
            //ddlMunicipio.SelectedIndex = 0;
            //ddlRol.SelectedIndex = 0;
            //txtFirstName.Text = "";
            //txtApPaterno.Text = "";
            //txtApMaterno.Text = "";
            //txtUserName.Text = "";
            //txtContrasenia.Text = "";
            //txtConfirmContrasenia.Text = "";
            //txtEmail.Text = "";
            //txtTelefono.Text = "";

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Mostrar Modal", "AltaSuccess();", true);

            //this.OnUsuarioAgregado?.Invoke(id);


        }
        catch (Exception x)
        {
            throw x;
        }

    }
}