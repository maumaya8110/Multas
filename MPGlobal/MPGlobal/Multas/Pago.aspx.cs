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

public partial class Multas_Pago : System.Web.UI.Page
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





        string placa = "ska222"; //Request.QueryString["Pl"].ToString();
        //string tipo = "2";// Request.QueryString["t"].ToString();

        cMultas obj = new cMultas();
        System.Data.DataSet ds = obj.reciboPagoMulta(placa, "2");


        lblUsuario.Text = ds.Tables[0].Rows[0]["USUARIO"].ToString();
        lblPlaca.Text = ds.Tables[0].Rows[0]["PLACA"].ToString();
        lblFolio.Text = ds.Tables[0].Rows[0]["FOLIO"].ToString();

        lblFecha.Text= ds.Tables[0].Rows[0]["HOY"].ToString();


         

        lblNombre.Text = ds.Tables[3].Rows[0]["NOMBRE"].ToString(); ;
        lbldomicilio.Text = ds.Tables[3].Rows[0]["DOMICILIO"].ToString();
        lbltelefono.Text = ds.Tables[3].Rows[0]["TELEFONO"].ToString();
        lblcorreo.Text = ds.Tables[3].Rows[0]["CORREO"].ToString();

        lblCajero.Text = "";
        lblCaja.Text = "";




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
            html.Append("<td  style=\"background-color:transparent\">" + row[6].ToString() + "</td> ");
            html.Append("<td  style=\"background-color:transparent\">" + row[7].ToString() + "</td> ");
            html.Append("<td  style=\"background-color:transparent\">" + row[8].ToString() + "</td> ");
            html.Append("</tr>");
        }

        tbDetalle.InnerHtml = html.ToString();



        DataTable av2 = ds.Tables[2];
        StringBuilder html2 = new StringBuilder();


        foreach (DataRow row2 in av2.Rows)
        {
            html2.Append(" <tr style=\"background - color:transparent\">");
            html2.Append("<td colspan=\"6\" style=\"border - color:transparent\">  </td>");
            html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">DESCUENTO:</td> ");
            html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">" + row2[0].ToString() + "</td> ");


            html2.Append("</tr>");

            html2.Append(" <tr style=\"background - color:transparent\">");
            html2.Append("<td colspan=\"6\" style=\"border - color:transparent\">  </td>");
            html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">SUBTOTAL:</td> ");
            html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">" + row2[1].ToString() + "</td> ");


            html2.Append("</tr>");


            html2.Append(" <tr style=\"background - color:transparent\">");
            html2.Append("<td colspan=\"6\" style=\"border - color:transparent\">  </td>");
            html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">TOTAL:</td> ");
            html2.Append("<td  style=\"border - color:transparent; font - size:14px; font - weight:bold\">" + row2[2].ToString() + "</td> ");


            html2.Append("</tr>");

        }

        tdetSubtotal.InnerHtml = html2.ToString();






        // EjecuarJQ();

        //if (Request.QueryString["Pl"] != null)
        //{

        //}
    }
}