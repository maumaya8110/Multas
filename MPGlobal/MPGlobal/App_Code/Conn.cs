using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient ;

 
    public class cStore{
        private string csint = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        private string csintl = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        private string csprod = "data source = 10.10.2.4; initial catalog = CapitalPlus1; user id = sa; password = ;connection timeout=60";
        private string csintraprod = "data source = 10.10.2.3; initial catalog = Intranet; user id = sa; password = ";
        private SqlCommand _scomm;
        private string _cs;
        HttpCookie cook = new HttpCookie("uid");

        public cStore(string nombrestore)
        {
            _scomm = new SqlCommand(nombrestore);
            _scomm.CommandType = CommandType.StoredProcedure;
            //int uid = fgral.Vint(HttpContext.Current.Session["uid"].ToString());
            int uid = cGlb.iduser;
            _scomm.CommandTimeout = 0;
            this.AddParameter("@pusuario", uid);
            _cs = csint; 
        }


        public cStore(string nombrestore, int dbase) {
            _scomm = new SqlCommand(nombrestore);
            _scomm.CommandType = CommandType.StoredProcedure;
            //int uid=fgral.Vint ( HttpContext.Current.Session["uid"].ToString());
            int uid = cGlb.iduser;
            this.AddParameter("@pusuario", uid);
            if (dbase == 1) { _cs = csint; }
            if (dbase == 2) { _cs = csprod; }
            if (dbase == 3) { _cs = csintraprod; }
            if (dbase == 4) { _cs = csintl;
            _scomm.CommandTimeout = 3000;
            }
            
        }

        public cStore(string nombrestore, string accion)
        {
            _scomm = new SqlCommand(nombrestore);
            _scomm.CommandType = CommandType.StoredProcedure;
            //int uid = fgral.Vint(HttpContext.Current.Session["uid"].ToString());
            int uid = cGlb.iduser;
            this.AddParameter("@pusuario", uid);
            this.AddParameter("@paccion", accion);
             _cs = csint;
        }

        public cStore(string nombrestore,string accion, int dbase)
        {
            _scomm = new SqlCommand(nombrestore);
            _scomm.CommandType = CommandType.StoredProcedure;
            this.AddParameter("@paccion", accion);
            //int uid = fgral.Vint(HttpContext.Current.Session["uid"].ToString());
            int uid = cGlb.iduser;
            this.AddParameter("@pusuario", uid);
            if (dbase == 1) { _cs = csint; }
            if (dbase == 2) { _cs = csprod; }
            if (dbase == 3) { _cs = csintraprod; }

        }

        private SqlConnection  connecta() { 
          SqlConnection  conn = new SqlConnection(_cs);
          if (conn.State == ConnectionState.Closed) {
              conn.Open();
          }
          return conn;
        }

        public DataSet ObtenDatos() {
            DataSet ds=new DataSet ();
            try
            {
                _scomm.Connection = connecta();
                SqlDataAdapter sa = new SqlDataAdapter(_scomm);
                sa.Fill(ds);
                if (_scomm.Connection.State == ConnectionState.Open)
                {
                    _scomm.Connection.Close();
                }

                return ds;
            }
            catch (Exception ex) 
            {
                throw ex;
            }
        }

        public String Ejecuta()
        {
            try
            {
                DataSet ds = new DataSet();
                _scomm.Connection = connecta();
                _scomm.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sa = new SqlDataAdapter(_scomm);
                sa.Fill(ds);
                _scomm.Dispose();
                sa.Dispose();
                if (ds.Tables[0] == null) { return ""; }
                if ((int)ds.Tables[0].Rows[0]["result"] == 0)
                {
                    return "";
                }
                else { return (string)ds.Tables[0].Rows[0]["mensaje"]; }
            }
            catch (Exception ex) { return ex.Message; }
        }

        public String Ejecuta(ref string id)
        {
            try
            {
                DataSet ds = new DataSet();
                _scomm.Connection = connecta();
                _scomm.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sa = new SqlDataAdapter(_scomm);
                sa.Fill(ds);
                _scomm.Dispose();
                sa.Dispose();
                if (ds.Tables[0] == null) { return ""; }
                if ((int)ds.Tables[0].Rows[0]["id"] == 0)
                {
                    id = (string)ds.Tables[0].Rows[0]["id"];
                    return "";
                }
                else { id = ""; return (string)ds.Tables[0].Rows[0]["mensaje"]; }
            }
            catch (Exception ex) { return ex.Message; }
        }

        public String Ejecuta(ref int id)
        {
            try
            {
                DataSet ds = new DataSet();
                _scomm.Connection = connecta();
                _scomm.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sa = new SqlDataAdapter(_scomm);
                sa.Fill(ds);
                _scomm.Dispose();
                sa.Dispose();
                if (ds.Tables[0] == null) { return ""; }
                if (fgral.Vint( ds.Tables[0].Rows[0]["id"].ToString() )!= 0)
                {
                    id = fgral.Vint(ds.Tables[0].Rows[0]["id"].ToString());
                    return "";
                }
                else { id = 0; return (string)ds.Tables[0].Rows[0]["mensaje"]; }
            }
            catch (Exception ex) { return ex.Message; }
        }

        public void AddParameter(string nombre, string valor) {
            if (nombre.StartsWith("@") == false) { nombre = "@" + nombre; }
            SqlParameter par = new SqlParameter(nombre, valor);
            _scomm.Parameters.Add(par);    
        }

        public void AddParameter(string nombre, Guid  valor)
        {
            if (nombre.StartsWith("@") == false) { nombre = "@" + nombre; }
            SqlParameter par = new SqlParameter(nombre, valor);
            _scomm.Parameters.Add(par);
        }

        public void AddParameter(string nombre, int valor)
        {
            if (nombre.StartsWith("@") == false) { nombre = "@" + nombre; }
            SqlParameter par = new SqlParameter(nombre, valor);
            _scomm.Parameters.Add(par);    
        }

        public void AddParameter(string nombre, Single valor)
        {
            if (nombre.StartsWith("@") == false) { nombre = "@" + nombre; }
            SqlParameter par = new SqlParameter(nombre, valor);
            _scomm.Parameters.Add(par);
        }

        public void AddParameter(string nombre, DateTime valor)
        {
            if (nombre.StartsWith("@") == false) { nombre = "@" + nombre; }
            SqlParameter par = new SqlParameter(nombre, valor);
            _scomm.Parameters.Add(par);
        }

    }
    
 