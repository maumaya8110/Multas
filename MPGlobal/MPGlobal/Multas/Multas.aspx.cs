using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Text;

public partial class Multas_Multas : System.Web.UI.Page
{

    public static void EjecuarJQ()
    {
        //Display javascript-alert
        Page page = HttpContext.Current.Handler as Page;

        if (page != null)
        {
            // msg = msg.Replace("'", "\\");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "window.print();", true);
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {




        if (Request.QueryString["Pl"] != null)
        {

            string placa = Request.QueryString["Pl"].ToString();
            string tipo = Request.QueryString["t"].ToString();

            cMultas obj = new cMultas();
            System.Data.DataSet ds = obj.reciboEdoCuentaMulta(placa, tipo);



            if (ds.Tables.Count >= 1)
            {
                if (ds.Tables[0].Rows.Count >= 0)
                {

                    lblNombreUsuario.Text = ds.Tables[0].Rows[0]["USUARIO"].ToString();
                    lblFechaImp.Text = ds.Tables[0].Rows[0]["FECHA"].ToString();
                    lblPlaca.Text = ds.Tables[0].Rows[0]["PLACA"].ToString();

                    lblMonto.Text = ds.Tables[0].Rows[0]["MONTO"].ToString();



                    DataTable av = ds.Tables[1];
                    StringBuilder html = new StringBuilder();


                    foreach (DataRow row in av.Rows)
                    {
                        html.Append(" <tr style=\"background-color:transparent\">");
                        html.Append("<td  style=\"background-color:transparent\"> " + row[0].ToString() + " </td>");
                        html.Append("<td  style=\"background-color:transparent\">" + row[1].ToString() + "</td> ");
                        html.Append("<td  style=\"background-color:transparent\">" + row[2].ToString() + "</td> ");
                        html.Append("<td  style=\"background-color:transparent\"> " + row[3].ToString() + " </td>");
                        html.Append("<td  style=\"background-color:transparent\">" + row[4].ToString() + "</td> ");
                        html.Append("<td  style=\"background-color:transparent\">" + row[5].ToString() + "</td> ");
                        html.Append("<td  style=\"background-color:transparent\">" + row[6].ToString() + "</td> ");
                        html.Append("</tr>");
                    }

                    tbDetalle.InnerHtml = html.ToString();



                    DataTable av2 = ds.Tables[2];
                    StringBuilder html2 = new StringBuilder();


                    foreach (DataRow row2 in av2.Rows)
                    {
                        html2.Append(" <tr style=\"background - color:transparent\">");
                        html2.Append("<td colspan=\"5\" style=\"border - color:transparent\">  </td>");
                        html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">SUBTOTAL:</td> ");
                        html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">" + row2[0].ToString() + "</td> ");


                        html2.Append("</tr>");
                    }

                    tdetSubtotal.InnerHtml = html2.ToString();

                }


            }








            //EjecuarJQ();

            //EjecuarJQ();

        }


    }
}