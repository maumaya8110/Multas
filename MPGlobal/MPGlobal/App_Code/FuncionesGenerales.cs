using System;
using System.IO;
using System.IO.Compression;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

 
    public static class fgral
    {


        public static void LlenaCombo(ref DropDownList cb, string accion, int bitindex, string store, string stparametro, int intparametro)
        {

            cStore sp = new cStore(store, 1);
            sp.AddParameter("@pAccion", accion);
            sp.AddParameter("@pst_parametro", stparametro);
            sp.AddParameter("@pint_parametro", intparametro);
            cb.DataSource = sp.ObtenDatos().Tables[0];
            cb.DataTextField = "st_valor";
            cb.DataValueField = "id_id";
            cb.DataBind();
            if (bitindex == 1)
            {
                cb.SelectedIndex = 0;
            }
        }

        public static string DameParametro(int idparametro, int idempresa) {
            cStore sp = new cStore("spDameParametro", 1);
            sp.AddParameter("@pid_parametro", idparametro);
            sp.AddParameter("@pid_empresa", idempresa);
            return sp.ObtenDatos().Tables[0].Rows[0]["st_parametro"].ToString();
        }

        public static DataTable ChecaTabla(DataTable dt1)
        {
            if (dt1.Rows.Count == 0)
            {
                cStore sp = new cStore("spNodata", 1);
                return sp.ObtenDatos().Tables[0];
            }
            return dt1;

        }

        public static void LlenaCombo(ref DropDownList cb, string accion, int bitindex)
        {

            cStore sp = new cStore("spLlenaCombos", 1);
            sp.AddParameter("@pAccion",accion);
            cb.DataSource = sp.ObtenDatos().Tables[0];
            cb.DataTextField = "st_valor";
            cb.DataValueField = "id_id";
            cb.DataBind();
            if (bitindex == 1)
            {
                cb.SelectedIndex = 0;
            }

        }

        public static void LlenaCombo(ref DropDownList cb, string accion, int bitindex, string parametro)
        {

            cStore sp = new cStore("spLlenaCombos", 1);
            sp.AddParameter("@pAccion", accion);
            sp.AddParameter("@pst_parametro", parametro);
            cb.DataSource = sp.ObtenDatos().Tables[0];
            cb.DataTextField = "st_valor";
            cb.DataValueField = "id_id";
            cb.DataBind();
            if (bitindex == 1)
            {
                cb.SelectedIndex = 0;
            }

        }

        public static void LlenaCombo(ref DropDownList cb, string accion, int bitindex, int parametro)
        {

            cStore sp = new cStore("spLlenaCombos", 1);
            sp.AddParameter("@pAccion", accion);
            sp.AddParameter("@pint_parametro" , parametro );
            cb.DataSource = sp.ObtenDatos().Tables[0];
            cb.DataTextField = "st_valor";
            cb.DataValueField = "id_id";
            cb.DataBind();
            if (bitindex == 1)
            {
                cb.SelectedIndex = 0;
            }

        }

        public static void LlenaLista(ref ListBox    cb, string accion, int bitindex, int parametro)
        {

            cStore sp = new cStore("spLlenaCombos", 1);
            sp.AddParameter("@pAccion", accion);
            sp.AddParameter("@pint_parametro", parametro);
            cb.DataSource = sp.ObtenDatos().Tables[0];
            cb.DataTextField = "st_valor";
            cb.DataValueField = "id_id";
            cb.DataBind();
            if (bitindex == 1)
            {
                cb.SelectedIndex = 0;
            }

        }

        public static string ObtenRango(string cadena)
        {
            StringBuilder resp = new StringBuilder();

            string[] elem;

            elem = cadena.Split(Convert.ToChar(","));

            for (int y = 0; y < elem.Length; y++)
            {
                string parte = elem[y];
                if (parte.Contains("-"))
                {
                    string[] subparte = parte.Split(Convert.ToChar("-"));
                    int val1 = Vint(subparte[0]);
                    int val2 = Vint(subparte[1]);
                    if (val1 <= val2)
                    {
                        for (int x = val1; x <= val2; x++)
                        {
                            resp.Append("_" + x.ToString() + "|");
                        }
                    }
                }
                else
                {
                    resp.Append("_" + elem[y] + "|");
                }

            }



            return resp.ToString();
        }

        public static int DameidMes(int mes, int anio)
        {
            return mes * (anio - 2010 + 1);
        }

        public static int DameMesdeId(int id)
        {
            int mes = id % 12;
            if (mes == 0) { mes=12; }
            return mes;

        }

        public static int DameAniodeId(int id)
        {
            return (id - 1) / 12 + 2010;
        }

        public static string LlenaCharIzq(string str, string car, int longitud)
        {
            string resp = "";

            int cant = longitud - str.Length;
            for (int i = 1; i <= cant; i++)
            {
                resp += car;
            }
            resp = resp + str;
            return resp;
        }

        public static string LlenaCharDer(string str, string car, int longitud)
        {
            string resp = "";

            int cant = longitud - str.Length;

            if (str.Length >= longitud)
            {
                resp = str.Substring(0, longitud);
            }
            else
            {
                resp = str;
                string strtmp = "";
                for (int x = 1; x <= cant; x++)
                {
                    strtmp += " ";
                }
                resp += strtmp;
                resp = resp.Substring(0, longitud);
            }

            return resp;
        }

        public static string[] ConvierteAArr(string datos)
        {
            string caracter = "_";
            string[] d;

            datos = datos.Replace("|", "");
            if (datos == null) { datos = ""; }
            d = datos.Split(Convert.ToChar(caracter));

            return d;
        }

        public static string ConvierteAXml(string datos)
        {

            string caracter = "_";
            string[] d;

            datos = datos.Replace("|", "");
            if (datos == null) { datos = ""; }
            d = datos.Split(Convert.ToChar(caracter));

            string sxml = "<ROOT>";
            for (int x = 0; x < d.Length; x++)
            {
                if (d[x].Trim().Length > 0)
                {
                    sxml += "<Datos ";
                    sxml += " id=\"" + d[x] + "\" ";
                    sxml += " />";
                }
            }

            sxml += "</ROOT>";



            return sxml;
        }

        public static int Vint(string str)
        {
            return Convert.ToInt32(str);
        }

        public static long Vlong(string str)
        {
            return Convert.ToInt64 (str);
        }

        public static int Dameusercookie()
        {
            HttpCookie cook = new HttpCookie("uid");
            cook=HttpContext.Current.Request .Cookies ["uid"];
            // Read the cookie information and display it.
            if (cook != null)
                return fgral.Vint(cook.Value);
            else
                return 0;        
        }

        public static string FmtSng2Mon(string dato)
        {
            return string.Format("{0:C}", Convert.ToSingle(dato));
        }

        public static string FmtSng2Mon(Single dato)
        {
            return string.Format("{0:C}", dato);
        }

        public static Single Val(string dato)
        
        {
            dato.Replace(",","");
            return Convert.ToSingle(dato);


        }

        public static float Valfloat(string dato)
        {
            dato.Replace(",", "");
            return (float) Convert.ToSingle (dato);
        }

        public static DateTime Vfec(string dato)
        {
            return Convert.ToDateTime(dato);
        }

        public static string FmtSng(string dato)
        {
            return string.Format("{0:N}", Convert.ToSingle(dato));
        }

        public static string Capitalize(string str)
        {
            if (str == "") { return ""; }
            if (str.Length == 1) { return str.ToUpper(); }
            return str.Substring(0, 1).ToUpper() + str.Substring(1).ToLower();
        }

        public static string FmtSng(Single dato)
        {
            return string.Format("{0:N}", dato);
        }

        public static string FmtDate(string dato)
        {
            return string.Format("{0:d}", dato);
        }

        public static string FmtDate(DateTime dato)
        {
            return string.Format("{0:d}", dato);
        }

        public static string FmtDateSort(DateTime dato)
        {
            return string.Format("{0:s}", dato).Substring(0,10);
        }

        public static string FmtSmallDate(DateTime dato)
        {
            return string.Format("{0:s}", dato);
        }

        public static DataTable DameCombo(string clave)
        {
            cStore sp = new cStore("spLlenaCombos", clave, 1);
            return sp.ObtenDatos().Tables[0];
        }

        public static void Compress(FileInfo fi)
        {
            // Get the stream of the source file.
            using (FileStream inFile = fi.OpenRead())
            {
                // Prevent compressing hidden and already compressed files.
                if ((File.GetAttributes(fi.FullName) & FileAttributes.Hidden)
                        != FileAttributes.Hidden & fi.Extension != ".zip")
                {
                    // Create the compressed file.
                    using (FileStream outFile = File.Create(fi.FullName + ".zip"))
                    {
                        using (GZipStream Compress = new GZipStream(outFile,
                                CompressionMode.Compress))
                        {
                            // Copy the source file into the compression stream.
                            byte[] buffer = new byte[4096];
                            int numRead;
                            while ((numRead = inFile.Read(buffer, 0, buffer.Length)) != 0)
                            {
                                Compress.Write(buffer, 0, numRead);
                            }
                        }
                    }
                }
            }
        }

        public static void Decompress(FileInfo fi)
        {
            // Get the stream of the source file.
            using (FileStream inFile = fi.OpenRead())
            {
                // Get original file extension, for example "doc" from report.doc.gz.
                string curFile = fi.FullName;
                string origName = curFile.Remove(curFile.Length - fi.Extension.Length);

                //Create the decompressed file.
                using (FileStream outFile = File.Create(origName))
                {
                    using (GZipStream Decompress = new GZipStream(inFile,
                            CompressionMode.Decompress))
                    {
                        //Copy the decompression stream into the output file.
                        byte[] buffer = new byte[4096];
                        int numRead;
                        while ((numRead = Decompress.Read(buffer, 0, buffer.Length)) != 0)
                        {
                            outFile.Write(buffer, 0, numRead);
                        }
                        Console.WriteLine("Decompressed: {0}", fi.Name);

                    }
                }
            }
        }

        public static void ExporttoExcell(DataTable dt, string nombre)
        {


            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.Charset = " ";
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nombre + ".xls;");
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            using (sw)
            {
                using (htw)
                {
                    GridView dg = new GridView();
                    dg.HeaderStyle.CssClass = "";
                    dg.DataSource = dt;
                    dg.DataBind();
                    dg.RenderControl(htw);
                    response.Write(sw.ToString());
                    response.End();
                }

            }
            htw.Dispose();
            sw.Dispose();
            htw = null;
            sw = null;
        }

        public static void ExporttoExcell(DataGrid gv, string nombre)
        {


            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.Charset = " ";
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nombre + ".xls;");
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            using (sw)
            {
                using (htw)
                {

                    gv.RenderControl(htw);
                    response.Write(sw.ToString());
                    response.End();
                }

            }
            htw.Dispose();
            sw.Dispose();
            htw = null;
            sw = null;
        }

      

        public static string DameParteNombre(string nombre, int tipo)
        {
            string amaterno = "";
            string aparterno = "";
            string strnombre = "";
            string tmpresp = "";
            nombre = nombre.Trim();
            string[] nombres = nombre.Split(Convert.ToChar(" "));

            int partes = nombres.Length;

            if (partes >= 3)
            {
                amaterno = nombres[partes];
                aparterno = nombres[partes - 1];
                strnombre = "";
                for (int x = 0; x < partes - 2; x++)
                {
                    strnombre = strnombre + nombres[x] + " ";
                }
                strnombre = strnombre.Trim();
            }

            else
            {
                amaterno = "";
                aparterno = nombres[partes];
                strnombre = nombres[partes - 1];

            }

            switch (tipo)
            {
                case 1: tmpresp = strnombre;
                    break;
                case 2: tmpresp = aparterno;
                    break;
                case 3: tmpresp = amaterno;
                    break;
            }

            return tmpresp;
        }

        public static String dttojson(DataTable dataTable)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer =
                   new System.Web.Script.Serialization.JavaScriptSerializer();

            List<Dictionary<String, Object>> tableRows = new List<Dictionary<String, Object>>();

            Dictionary<String, Object> row;

            foreach (DataRow dr in dataTable.Rows)
            {
                row = new Dictionary<String, Object>();
                foreach (DataColumn col in dataTable.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                tableRows.Add(row);
            }
            return serializer.Serialize(tableRows);
        }


        public static string[] JsonDatosSinConInciso(DataTable dt)
        {
            string[] barras = new string[4];
            string categoria = "[";
            string ConSin = "[";
            string SinSin = "[";
            string Porc = "[";

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                categoria = categoria + "\"" + dt.Rows[x][0].ToString() + "\" ,";
                ConSin = ConSin + dt.Rows[x][1].ToString() + " ,";
                SinSin = SinSin + dt.Rows[x][2].ToString() + " ,";
                Porc = Porc + dt.Rows[x][3].ToString() + " ,";
            }

            if (dt.Rows.Count > 0)
            { categoria = categoria.Substring(0, categoria.Length - 1); }
            categoria = categoria + " ]";

            if (dt.Rows.Count > 0)
            { ConSin = ConSin.Substring(0, ConSin.Length - 1); }
            ConSin = ConSin + " ]";

            if (dt.Rows.Count > 0)
            { SinSin = SinSin.Substring(0, SinSin.Length - 1); }
            SinSin = SinSin + " ]";

            if (dt.Rows.Count > 0)
            { Porc = Porc.Substring(0, Porc.Length - 1); }
            Porc = Porc + " ]";


            barras[0] = categoria;
            barras[1] = ConSin;
            barras[2] = SinSin;
            barras[3] = Porc;

            return barras;

        }





        public static string[] JsonDatosRepAntReserva(DataTable dt, DataTable dt2)
        {
            string[] barras = new string[7];
            string meses = "[";
            string emp = "[";
            string of = "[";
            string con = "[";

            string poremp = "";
            string porof = "";
            string porcon = "";


            for (int x = 0; x < dt.Rows.Count; x++)
            {
                meses = meses + "\"" + dt.Rows[x][0].ToString() + "\" ,";

                emp = emp + dt.Rows[x][1].ToString() + " ,";
                of = of + dt.Rows[x][2].ToString() + " ,";
                con = con + dt.Rows[x][3].ToString() + " ,";

            }
            for (int x = 0; x < dt2.Rows.Count; x++)
            {
                poremp = poremp + dt2.Rows[x][0].ToString();
                porof = porof + dt2.Rows[x][1].ToString();
                porcon = porcon + dt2.Rows[x][2].ToString();
            }

            if (dt.Rows.Count > 0)
            { meses = meses.Substring(0, meses.Length - 1); }
            meses = meses + " ]";

            if (dt.Rows.Count > 0)
            { emp = emp.Substring(0, emp.Length - 1); }
            emp = emp + " ]";

            if (dt.Rows.Count > 0)
            { of = of.Substring(0, of.Length - 1); }
            of = of + " ]";

            if (dt.Rows.Count > 0)
            { con = con.Substring(0, con.Length - 1); }
            con = con + " ]";

            if (dt2.Rows.Count > 0)
            { poremp = poremp.Substring(0, poremp.Length - 1); }
            poremp = poremp + "";

            if (dt2.Rows.Count > 0)
            { porof = porof.Substring(0, porof.Length - 1); }
            porof = porof + "";

            if (dt2.Rows.Count > 0)
            { porcon = porcon.Substring(0, porcon.Length - 1); }
            porcon = porcon + "";




            barras[0] = meses;
            barras[1] = emp;
            barras[2] = of;
            barras[3] = con;

            barras[4] = poremp;
            barras[5] = porof;
            barras[6] = porcon;

            return barras;

        }





        public static string[] JsonDatosRepPeriodo(DataTable dt)
        {
            string[] barras = new string[3];
            string meses = "[";
            string cant = "[";
            string sin = "[";

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                meses = meses + "\"" + dt.Rows[x][0].ToString() + "\" ,";
                cant = cant + dt.Rows[x][1].ToString() + " ,";
                sin = sin + dt.Rows[x][2].ToString() + " ,";

            }

            if (dt.Rows.Count > 0)
            { meses = meses.Substring(0, meses.Length - 1); }
            meses = meses + " ]";

            if (dt.Rows.Count > 0)
            { cant = cant.Substring(0, cant.Length - 1); }
            cant = cant + " ]";

            if (dt.Rows.Count > 0)
            { sin = sin.Substring(0, sin.Length - 1); }
            sin = sin + " ]";


            barras[0] = meses;
            barras[1] = cant;
            barras[2] = sin;

            return barras;

        }



        public static string[] JsonDatosRepGeneral(DataTable dt)
        {

            string[] barras = new string[4];
            string categorias = "[";
            string datos = "[";
            string Dev = "[";
            string Porc = "[";

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                categorias = categorias + "\"" + dt.Rows[x][0].ToString() + "\" ,";
                datos = datos + dt.Rows[x][1].ToString() + " ,";
                Dev = Dev + dt.Rows[x][2].ToString() + " ,";
                Porc = Porc + dt.Rows[x][3].ToString() + " ,";
            }

            if (dt.Rows.Count > 0)
            { datos = datos.Substring(0, datos.Length - 1); }
            datos = datos + " ]";
            if (dt.Rows.Count > 0)
            { categorias = categorias.Substring(0, categorias.Length - 1); }
            categorias = categorias + " ]";
            if (dt.Rows.Count > 0)
            { Dev = Dev.Substring(0, Dev.Length - 1); }
            Dev = Dev + " ]";
            if (dt.Rows.Count > 0)
            { Porc = Porc.Substring(0, Porc.Length - 1); }
            Porc = Porc + " ]";

            barras[0] = categorias;
            barras[1] = datos;
            barras[2] = Dev;
            barras[3] = Porc;
            return barras;

        }



        public static string JsonDatosPie(DataTable dt)
        {

            string datos = "[ ";

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                datos = datos + "[\"" + dt.Rows[x][0].ToString() + "\", " + fgral.FmtSng(dt.Rows[x][1].ToString()).Replace(",", "") + "],";
            }

            datos = datos.Substring(0, datos.Length - 1);
            datos = datos + " ]";

            return datos;

        }

        public static string[] JsonDatosBarra(DataTable dt)
        {

            string[] barras = new string[2];
            string categorias = "[";
            string datos = "[";

            for (int x = 0; x < dt.Rows.Count; x++)
            {                
                categorias = categorias + "\"" + dt.Rows[x][0].ToString() + "\" ,";
                datos = datos + dt.Rows[x][1].ToString() + " ,";
            }

            if (dt.Rows.Count > 0)
            { datos = datos.Substring(0, datos.Length - 1); }
            datos = datos + " ]";
            if (dt.Rows.Count > 0)
            { categorias = categorias.Substring(0, categorias.Length - 1); }
            categorias = categorias + " ]";
            barras[0] = categorias;
            barras[1] = datos;
            return barras;

        }

        public static string JsonDatosBarrasmulti(DataTable dt, ref string datos1, ref string datos2)
        {

            string s1 = "[ ";
            string s2 = "[ ";
            string ley = "[ ";

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                ley = ley + "\"" + dt.Rows[x][0].ToString() + "\",";
                s1 = s1 + dt.Rows[x][1].ToString().Replace("$", "").Replace(",", "") + ",";
                s2 = s2 + dt.Rows[x][2].ToString().Replace("$", "").Replace(",", "") + ",";
            }

            ley = ley.Substring(0, ley.Length - 1);
            ley = ley + " ]";
            s1 = s1.Substring(0, s1.Length - 1);
            s1 = s1 + " ]";
            s2 = s2.Substring(0, s2.Length - 1);
            s2 = s2 + " ]";
            datos1 = s1;
            datos2 = s2;
            return ley;


        }

        public static string JsonDatosBarrasmulti2(DataTable dt, ref string datos1, ref string datos2, ref string datos3, ref string datos4, ref string datos5, ref string datos6)
        {

            string s1 = "[ ";
            string s2 = "[ ";
            string s3 = "[ ";
            string s4 = "[ ";
            string s5 = "[ ";
            string s6 = "[ ";
            string ley = "[ ";

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                ley = ley + "\"" + dt.Rows[x][0].ToString() + "\",";
                s1 = s1 + dt.Rows[x][1].ToString().Replace("$", "").Replace(",", "") + ",";
                s2 = s2 + dt.Rows[x][2].ToString().Replace("$", "").Replace(",", "") + ",";
                s3 = s3 + dt.Rows[x][3].ToString().Replace("$", "").Replace(",", "") + ",";
                s4 = s4 + dt.Rows[x][4].ToString().Replace("$", "").Replace(",", "") + ",";
                s5 = s5 + dt.Rows[x][5].ToString().Replace("$", "").Replace(",", "") + ",";
                s6 = s6 + dt.Rows[x][6].ToString().Replace("$", "").Replace(",", "") + ",";
            }

            ley = ley.Substring(0, ley.Length - 1);
            ley = ley + " ]";
            s1 = s1.Substring(0, s1.Length - 1);
            s1 = s1 + " ]";
            s2 = s2.Substring(0, s2.Length - 1);
            s2 = s2 + " ]";
            s3 = s3.Substring(0, s3.Length - 1);
            s3 = s3 + " ]";
            s4 = s4.Substring(0, s4.Length - 1);
            s4 = s4 + " ]";
            s5 = s5.Substring(0, s5.Length - 1);
            s5 = s5 + " ]";
            s6 = s6.Substring(0, s6.Length - 1);
            s6 = s6 + " ]";
            datos1 = s1;
            datos2 = s2;
            datos3 = s3;
            datos4 = s4;
            datos5 = s5;
            datos6 = s6;
            return ley;


        }



    }
 