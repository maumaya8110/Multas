using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

 
    public class clUsuario
    {
        private int _idusuario=0;
        private string _nombre="";
        private string _username="";
        private string _password="";
        private string _clave="";
        private int _idmenu=1;
        private string _empresa="";
        private int _idempresa=0;

        private int _idperfil = 0;
        private DateTime  _lastlog;
        private clMenu _menu;
        private cEncripta cenc = new cEncripta();

        public int Idusuario { get { return _idusuario; }  }
        public int IDPerfil { get { return _idperfil; } set { _idperfil = value; } }
        public string Nombre { get { return _nombre; } set { _nombre = value; } }
        public string Username { get { return _username ; } set { _username = value; } }
        public string Password { get { return  _password ; } set { _password  = value; } }
        public string Clave{ get { return _clave ; } set { _clave = value; } }

        public DateTime  LastLogin { get { return _lastlog ; } }
        public clMenu Menu { get { return _menu; } }

        # region Constructores

        public clUsuario()
        { 
        
        }

        //public clUsuario(int idusuario)
        //{
        //    _idusuario = idusuario;
        //    ObtenDatosUsuario(idusuario);  
        //}


        #endregion

        public DataTable  DameTodosUsuarios()
        {
            try
            {
                 cStore sp = new cStore("spUsuarios", "S");
                 DataTable dt = sp.ObtenDatos().Tables[0];
                 return dt;
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable Dameperfiles()
        {
            cStore sp = new cStore("spUsuarios", "DP");
            DataTable dt = sp.ObtenDatos().Tables[0];
            return dt;
        }

        public DataTable DameMenus()
        {
            cStore sp = new cStore("spUsuarios", "DM");
            DataTable dt = sp.ObtenDatos().Tables[0];
            return dt;
        }

        //private void ObtenDatosUsuario(int idusuario)
        //{
        //    try
        //    {
        //        cStore sp = new cStore("spUsuarios", "SU");
        //        sp.AddParameter("pidusuario", idusuario);
        //        DataTable  dt = sp.ObtenDatos().Tables[0];
        //        _username = (string)dt.Rows[0]["username"];
        //        _password = (string)dt.Rows[0]["password"];
        //        _nombre = (string)dt.Rows[0]["nombre"];
        //        _clave  = (string)dt.Rows[0]["clave"];
        //        _lastlog = (DateTime)dt.Rows[0]["lastlogin"];
        //        _idmenu = (int)dt.Rows[0]["idmenuuser"];
        //        _idperfil = (int)dt.Rows[0]["idperfil"];
        //        _idempresa = (int)dt.Rows[0]["idempresa"];
        //        _empresa = (string)dt.Rows[0]["empresa"];
        //        _menu = new clMenu((int)dt.Rows[0]["idmenuuser"]);
        //    }
        //    catch (Exception ex) { throw ex; }
        //}

        public string Inserta()
        {
           try
            {
                cEncripta enc = new cEncripta();
                cStore sp = new cStore("spUsuarios", "I");
                sp.AddParameter("pnombre", _nombre  );
                sp.AddParameter("pusername", _username);
                sp.AddParameter("ppassword", enc.encripta (_password));
                sp.AddParameter("pidperfil", _idperfil );
                sp.AddParameter("pidmenu", _idmenu );
                sp.AddParameter("pclave", _clave );
                string st = sp.Ejecuta ();
                return st;
            }
            catch (Exception ex) { throw ex; }
        }

        public string Actualiza()
        {
            if (_idusuario  == 0) { return "Debe inicializar objeto usuario"; }
            try
            {
                cStore sp = new cStore("spUsuarios", "U");
                sp.AddParameter("pidusuario", _idusuario );
                sp.AddParameter("pnombre", _nombre);
                sp.AddParameter("pusername", _username);
                sp.AddParameter("pidperfil", _idperfil);
                sp.AddParameter("pidmenu", _idmenu);
                sp.AddParameter("pclave", _clave);
                string st = sp.Ejecuta();
                return st;
            }
            catch (Exception ex) { throw ex; }
        }

        public string AddFavorito(int idelemento)
        {
            if (_idusuario == 0) { return "Debe inicializar objeto usuario"; }
            try
            {
                cStore sp = new cStore("spAddFavorito",1);
                sp.AddParameter("@pid_elemento", idelemento );
                string st = sp.Ejecuta();
                return st;
            }
            catch (Exception ex) { throw ex; }
        }

        public string Elimina()
        {
            if (_idusuario == 0) { return "Debe inicializar objeto usuario"; }
            try
            {
                cStore sp = new cStore("spUsuarios", "D");
                sp.AddParameter("pidusuario", _idusuario);
                string st = sp.Ejecuta();
                return st;
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameElemetosdeMenu(int rama) 
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios","EM");
                sp.AddParameter("pidmenu", _idmenu);
                sp.AddParameter("pidrama", rama);
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameElemetosFiltrados(string filtro)
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios", "EF");
                sp.AddParameter("pidmenu", _idmenu);
                sp.AddParameter("pstfiltro", filtro );
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameElemetosObligatorios()
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios", "EO");
                sp.AddParameter("pidmenu", _idmenu);
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameElemetosFavoritos()
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios", "FAV");
                sp.AddParameter("pidmenu", _idmenu);
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameRamasdeMenu()
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios","RM");
                sp.AddParameter("pidmenu", _idmenu);
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameRamasdeMenuProd(int idprod)
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios", "RMP");
                sp.AddParameter("pidmenu", _idmenu);
                sp.AddParameter("pidprod", idprod);
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable DameProddeMenu()
        {
            try
            {
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuarios", "PM");
                sp.AddParameter("pidmenu", _idmenu);
                ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public String CambiaPasword(string oldpass,string newpass)
        {
            try
            {
                cEncripta enc = new cEncripta();
                DataSet ds = new DataSet();
                cStore sp = new cStore("spUsuariosCambioPass_U");
                sp.AddParameter("pidusuario", _idusuario);
                sp.AddParameter("ppassword", enc.encripta (oldpass));
                sp.AddParameter("ppasswordnuevo", enc.encripta (newpass));
                string st = sp.Ejecuta();
                return st;
            }
            catch (Exception ex) { throw ex; }
        }







    }
 