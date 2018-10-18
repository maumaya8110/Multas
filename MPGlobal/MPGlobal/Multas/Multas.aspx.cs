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


            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=TestPage.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //this.Page.RenderControl(hw);
            //StringReader sr = new StringReader(sw.ToString());
            //Document pdfDoc = new Document(PageSize.A4, 10.0F, 10.0F, 100.0F, 0.0F);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //pdfDoc.Open();
            //htmlparser.Parse(sr);
            //pdfDoc.Close();
            //Response.Write(pdfDoc);
            //Response.End();



            //Document pdfDoc = new Document(PageSize.A4, 10, 10, 15, 10);
            //PdfWriter.GetInstance(pdfDoc, System.Web.HttpContext.Current.Response.OutputStream);

            ////Open PDF Document to write data 
            //pdfDoc.Open();

            //string htmlEdoCta;
            //htmlEdoCta = "";
            //htmlEdoCta += "<style>@charset \"UTF-8\";body {margin: 0;font - family:Helvetica, Arial, sans - serf;}h3 {font - size:25px;margin: 15px 0 0 0;}h4 {font - size:17px;                margin: 8px 0;            }.whitepaper {                background - color:#FFF;	width: 812px;                height: 1123px;                margin: 0 auto;                border:#D8D8D8 1px solid;}.Header {                clear: both;                float:left;                width: 84 %;                margin: 4 % 8 % 4 % 8 %;            }.Logo_empresa img {                width: 220px;                float:left;            }.Logo_paynet {                float:right;                margin - top:3px;            }.Logo_paynet1 div {                font - size:20px;                font - weight:lighter;                display: block;                float:left;                margin: 10px 5px 0 0;            }.Logo_paynet div {                font - size:20px;                font - weight:lighter;                display: block;                float:left;                margin: 10px 12px 0 0;            }.Logo_paynet img {                width: 130px;                float:left;            }.Data {                width: 100 %;                clear: both;                float:left;            }.DT - margin {                margin: 15px 0;                display: block;                float:left;                width: 100 %;                clear: both;            }.Big_Bullet {               width: 40px;                float:left;                margin - right:24px;            }.Big_Bullet span, .col2 {                background - color:#f9b317;}.Big_Bullet span {                width: 100 %;                height: 55px;                display: block;            }.col1 {                width: 350px;                float:left;            }.col1 span {                font - size:14px;                clear: both;                display: block;                margin: 5px 0;            }.col1 small {                font - size:12px;                width: 320px;                display: block;            }.col2 {                width: 358px;                float:right;                color:#FFF;	padding: 40px 0 40px 40px;            }.col2 h1 {                margin: 0;                padding: 0;                font - size:60px;            }.col2 h1 span {                font - size:45px;            }.col2 h1 small {                font - size:20px;            }.col2 h2 {                margin: 0;                font - size:22px;                font - weight:lighter;            }.S - margin {                padding - left:80px;            }.Table - Data {                margin: 20px 0 0 0;                clear: both;                width: 100 %;                display: block;                float:left;            }.table - row {                float:left;                width: 83 %;                padding: 0 8.5 %;            }.table - row div {                float:left;                width: 250px;                padding: 15px 0;            }.table - row span {                float:left;                border - left:3px solid #FFF;	padding: 15px 0 15px 40px;            }.color1 {                background - color:#F3F3F3;}.color2 {                background - color:#EBEBEB;}.col1 ol, .Col2 ol {                font - size:12px;                width: 290px;                padding - left:20px;            }.col1 li, .Col2 li {                padding: 5px 0;                line - height:16px;            }.logos - tiendas {                clear: both;                float:left;                width: 92 %;                padding: 10px 0 10px 8 %;                border - top:1px solid #EDEDED;	border - bottom:1px solid #EDEDED;	margin: 20px 0 0 0;            }.logos - tiendas div {                float:left;                margin - right:50px;            }.logos - tiendas small {                font - size:11px;                margin - left:20px;                float:left;            }.logos - tiendas ul {                margin: 0;                list - style: none;                padding: 0;                width: 480px;                float: left;            }.logos - tiendas li {                float: left;                margin: 10px 10px 0 10px;            }.Powered {                width: 100 %;                float:left;                margin - top:18px;            }.Powered img {                margin - left:65px;                margin - right:290px;            }.Powered a {                border - radius:6px;                background - color:#0075F0;	padding: 7px 13px;                color:#FFF;	font - size:12px;                font - weight:normal;                text - decoration:none;                margin: 10px;            }.Powered a:hover {                background - color:#009BFF;}            table {                width: 750px;                border - collapse: collapse;                margin: 50px auto;            }            /* Zebra striping */            tr: nth - of - type(odd) {                background: #eee;     }            th {                background: #3498db;     color: white;                font - weight: bold;            }            td, th {                padding: 10px;                border: 1px solid #ccc;     text - align: left;                font - size: 12px;            }</ style ></ head >< body >< div class=\"whitepaper\">	<div class=\"Header\">        <div style =\"text-align:center\"> <h1>ESTADO DE CUENTA</h1></div>        	<img src =\"http://www.nl.gob.mx/sites/default/files/l3.png\" width=\"250\" alt=\"Logo\">                                  <div class=\"Logo_paynet1\">    	         <div>Usuario:</div>    	 <div>Administrador</div>    </div>	     <div class=\"Logo_paynet\">    	         <div>Fecha Impresion:</div>    	 <div>2018-10-16</div>    </div>    </div>            <div class=\"Data\">    	<div class=\"Big_Bullet\">        	<span></span>        </div>    	<div class=\"col1\">                	<h3>PLACA</h3>            <h1>SKA3140</h1>                               	                 </div>        <div class=\"col2\">        	<h2>Total a pagar</h2>            <h1>$6,200<span>.00</span><small> MXN</small></h1>                    </div>    </div>    <div class=\"DT-margin\"></div>    <div class=\"Data\">    	<div class=\"Big_Bullet\">        	<span></span>        </div>    	<div class=\"col1\">        	<h3>Detalles de la Infracciones</h3>        </div>	</div>      <table>    <thead>        <tr>            <th>CUOTA</th>            <th>BOLETA</th>            <th>EDO</th>            <th>MUN</th>                                    <th>DESCRIPCION</th>                        <th>CRUCERO</th>                                                                                   <th>TOTAL</th>                                                        </tr>    </thead>    <tbody>        <tr>            <td>1</td>            <td>111213</td>                       <td>NL</td>            <td>SAN PEDRO</td>            <td>EXCESO DE VELOCIDAD EN ZONA ESCOLAR</td>                                    <td>PADRE MIER Y JUAREZ</td>                 <td>351</td>        </tr>        <tr>            <td>13</td>            <td>32151</td>                      <td>NL</td>            <td>SAN PEDRO</td>            <td>EXCESO DE VELOCIDAD EN ZONA ESCOLAR</td>                                         <td>PADRE MIER Y JUAREZ</td>                    <td>351</td>        </tr>        <tr>            <td>24</td>            <td>85441</td>                       <td>NL</td>            <td>SAN PEDRO</td>            <td>EXCESO DE VELOCIDAD EN ZONA ESCOLAR</td>                                        <td>PADRE MIER Y JUAREZ</td>            <td>351</td>        </tr>        <tr>            <td>11</td>            <td>123123</td>                     <td>NL</td>            <td>SAN PEDRO</td>            <td>EXCESO DE VELOCIDAD EN ZONA ESCOLAR</td>                                       <td>PADRE MIER Y JUAREZ</td>            <td>351</td>        </tr>        <tr>            <td>53</td>            <td>412312312</td>            <td>NL</td>            <td>SAN PEDRO</td>            <td>EXCESO DE VELOCIDAD EN ZONA ESCOLAR</td>                                    <td>PADRE MIER Y JUAREZ</td>            <td>351</td>        </tr>            </tbody>          <tbody >        <tr style =\"background-color:transparent\">            <td colspan =\"5\" style=\"border-color:transparent\"></td>                        <td style =\"border-color:transparent;font-size:14px; font-weight:bold\">SUBTOTAL</td>            <td style =\"border-color:transparent;font-size:14px; font-weight:bold\">6200</td>        </tr>                                   </tbody>    </table>";

            ////Assign Html content in a string to write in PDF 
            //string strContent = htmlEdoCta;

            ////Read string contents using stream reader and convert html to parsed conent 
            //var parsedHtmlElements = HTMLWorker.ParseToList(new StringReader(strContent), null);

            ////Get each array values from parsed elements and add to the PDF document 
            //foreach (var htmlElement in parsedHtmlElements)
            //    pdfDoc.Add(htmlElement as IElement);

            ////Close your PDF 
            //pdfDoc.Close();

            //Response.ContentType = "application/pdf";

            ////Set default file Name as current datetime 
            //Response.AddHeader("content-disposition", "attachment; filename=SALIDA_F_" + "xxxx" + ".pdf");
            //System.Web.HttpContext.Current.Response.Write(pdfDoc);

            //Response.Flush();
            //Response.End();






















            //string placa = Request.QueryString["Pl"].ToString();
            //string tipo = Request.QueryString["t"].ToString();

            //cMultas obj = new cMultas();
            //System.Data.DataSet ds = obj.reciboEdoCuentaMulta(placa, tipo);


            //lblTitulo.Text=  ds.Tables[0].Rows[0]["Titulo"].ToString();
            //lblPlaca.Text = ds.Tables[0].Rows[0]["idplaca"].ToString();
            //lblFecha.Text = ds.Tables[0].Rows[0]["Hoy"].ToString();
            //lblMonto.Text = ds.Tables[0].Rows[0]["Monto"].ToString();




            //gvMultas.DataSource = ds.Tables[1];
            //gvMultas.DataBind();


            EjecuarJQ();

        }

    
    }
}