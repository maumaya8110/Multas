using System;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

public partial class Cancelacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (System.Web.HttpContext.Current.Session["loginId"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }




        Session["idUsuario"] = MPGlobalSessiones.Current.UsuarioLogueado.Usuario.IdUsuario.ToString();

    }
    public static void ShowAlertMessage(string msg)
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + msg + "');", true);
        }
    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {


        if ( txtRecibo.Text =="")
        {

            txtRecibo.Focus();
            ShowAlertMessage("Capture un Recibo");
            return;
        }



        cCancelacion obj = new cCancelacion();

            DataSet Ds = obj.ConsultaRecibo(int.Parse(txtRecibo.Text),int.Parse(Session["idUsuario"].ToString()));

            string Monto;

            if (Ds.Tables.Count > 0)
            {

                if (Ds.Tables[0].Rows.Count > 0)
                {
                    DataTable av = Ds.Tables[0];
                    StringBuilder html = new StringBuilder();


                    foreach (DataRow row in av.Rows)
                    {
                        html.Append(" <tr>");
                        html.Append("<td> " + row[0].ToString() + " </td>");
                        html.Append("<td>" + row[1].ToString() + "</td> ");
                        html.Append("<td>" + row[2].ToString() + "</td> ");

                        html.Append("</tr>");
                    }
                    tbcapcitaciones.InnerHtml = html.ToString();





                    //lblMonto.Text = Ds.Tables[0].Rows[0][1].ToString();
                    //lblPlaca.Text = Ds.Tables[0].Rows[0][0].ToString().ToUpper();

                    //lblhoy.Text = Ds.Tables[0].Rows[0][2].ToString();
                    //txtEdo.Text = html.ToString();
                    // Response.Write(html.ToString());

                }
                else
                {
                    ShowAlertMessage("No hay datos para mostrar.");
                }
            }
            else
            {
                ShowAlertMessage("No hay datos para mostrar.");
            }


    }

    protected void BtnCancelar_Click(object sender, EventArgs e)
    {
        if (txtMotivoCancelacion.Text == "")
        {
            txtMotivoCancelacion.Focus();

            ShowAlertMessage("Capture el Motivo.");
            return;
        }

        if (txtRecibo.Text == "")
        {
            txtRecibo.Focus();

            ShowAlertMessage("Capture el Recibo de Pago.");
            return;
        }

        cCancelacion obj = new cCancelacion();
        int idusuario = int.Parse(Session["idUsuario"].ToString());
        DataSet ds = obj.CancelarRecibo(int.Parse(txtRecibo.Text), txtMotivoCancelacion.Text.ToUpper(), idusuario);

        if (ds.Tables[0].Rows[0][0].ToString() != "1")
        {
            ShowAlertMessage("Revise el Folio.");


        }

        if (int.Parse(ds.Tables[0].Rows[0][0].ToString()) >= 1)
        {
            Response.Redirect("Cancelacion.aspx", false);


        }
        }
    }