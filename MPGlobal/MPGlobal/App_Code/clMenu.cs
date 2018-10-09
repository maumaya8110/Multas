using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

 
    public class clMenu
    {
        
        private string _nombre;
        private string _descripcion;
        private string _empresa;
        private int _idusuario = -1;
        private DataTable _ramasmenu = new DataTable();
        private int _idmenu=0;
        //private clElementosMenu _elementos;

        public string Nombre{get { return _nombre; }set { _nombre = value; }}
        public string Descripcion {get {return _descripcion;}  set { _descripcion  = value; }}
        public string Empresa { get { return _empresa ; } set { _empresa  = value; } }
        //public clElementosMenu Elementos { get { return _elementos ; }}
        public int IdMenu { get { return _idmenu; } set { _idmenu  = value; } }

        #region Constructores

        //public clMenu()
        //{
               
        //    _nombre = "";
        //    _descripcion = "";
        //    _idusuario = cGlb.Usuario.Idusuario  ;
        //    _elementos = new clElementosMenu();
        //}

        public DataTable ListaElementosMenu()
        {
            cStore sp = new cStore("spCatMenuElemento", 1);
            return sp.ObtenDatos().Tables[0];
        }
        public DataTable DameDatosElemento(int idelemento)
        {
            cStore sp = new cStore("spDameDatosElemento", 1);
            sp.AddParameter("@pid_elemento", idelemento);
            return sp.ObtenDatos().Tables[0];
        }
        public string ModElemento(int idelemento, int idempresa, int idicono
            , string stelemento, string descripcion, string url, string querystring
            , string imagen, string store, int paramint1, int paramint2, string paramst
            , string codigo, int idprod, int idgpo, int bitactivo)
        {
            cStore sp = new cStore("spUpdateElemento", 1);
            sp.AddParameter("@pid_elemento", idelemento);
            sp.AddParameter("@pid_empresa", idempresa);
            sp.AddParameter("@pid_icono", idicono);
            sp.AddParameter("@pst_elemento", stelemento);
            sp.AddParameter("@pst_descripcion", descripcion);
            sp.AddParameter("@pst_url", url);
            sp.AddParameter("@pst_querystring", querystring);
            sp.AddParameter("@pst_imagen", imagen);
            sp.AddParameter("@pst_store", store);
            sp.AddParameter("@pst_paramint1", paramint1);
            sp.AddParameter("@pst_paramint2", paramint2);
            sp.AddParameter("@pst_paramst", paramst);
            sp.AddParameter("@pst_codigo", codigo);
            sp.AddParameter("@pid_prod", idprod);
            sp.AddParameter("@pid_grupo", idgpo);
            sp.AddParameter("@pbit_activo", bitactivo);
            return sp.Ejecuta();
        }

        public string AgregaElemento(int idempresa, int idicono
            , string stelemento, string descripcion, string url, string querystring
            , string imagen, string store, int paramint1, int paramint2, string paramst
            , string codigo, int idprod, int idgpo, int bitactivo)
        {
            cStore sp = new cStore("spInsertaElemento", 1);
            sp.AddParameter("@pid_empresa", idempresa);
            sp.AddParameter("@pid_icono", idicono);
            sp.AddParameter("@pst_elemento", stelemento);
            sp.AddParameter("@pst_descripcion", descripcion);
            sp.AddParameter("@pst_url", url);
            sp.AddParameter("@pst_querystring", querystring);
            sp.AddParameter("@pst_imagen", imagen);
            sp.AddParameter("@pst_store", store);
            sp.AddParameter("@pst_paramint1", paramint1);
            sp.AddParameter("@pst_paramint2", paramint2);
            sp.AddParameter("@pst_paramst", paramst);
            sp.AddParameter("@pst_codigo", codigo);
            sp.AddParameter("@pid_prod", idprod);
            sp.AddParameter("@pid_grupo", idgpo);
            sp.AddParameter("@pbit_activo", bitactivo);
            return sp.Ejecuta();
        }
        public string DesactivaElemento(string elementos)
        {
            cStore sp = new cStore("spDesactivaElemento", 1);
            sp.AddParameter("@pxml_elementos", fgral.ConvierteAXml(elementos));
            return sp.Ejecuta();
        }


        //public clMenu(int idmenu)
        //{
        //    _idmenu = idmenu;
        //    _idusuario = cGlb.iduser  ;
        //    cStore sp = new cStore("spMenu", "SM");
        //    sp.AddParameter("pidmenu", _idmenu );
        //    DataSet ds = sp.ObtenDatos();
        //    if (ds != null)
        //    {
        //        _nombre = (string)ds.Tables[0].Rows[0]["st_nombre"];
        //        _descripcion = (string)ds.Tables[0].Rows[0]["st_descripcion"];
        //        _idmenu = (int)ds.Tables[0].Rows[0]["id_menu"];
        //        _elementos = new clElementosMenu(_idmenu );

        //    }
        //}

        #endregion

        public DataRow ObtenDatosElemento(int idelemento) {
            cStore sp = new cStore("spElemento", "SI");
            sp.AddParameter("@pidelemento", idelemento);
            DataSet ds = sp.ObtenDatos();
            return ds.Tables[0].Rows[0];
        
        }

        public DataTable ObtenTodosMenus()
        {
            try
            {
                cStore sp = new cStore("spMenu", "S");
                DataSet ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }        
        }

        public DataTable ObtenTodosMenus(string filtro)
        {
            try
            {
                cStore sp = new cStore("spMenu", "SF");
                sp.AddParameter("pfiltro", filtro);
                DataSet ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable ObtenPaginadeEmpresa(int idempresa)
        {
            try
            {
                cStore sp = new cStore("spElemento", "S");
                sp.AddParameter("pidempresa", idempresa);
                DataSet ds = sp.ObtenDatos();
                return ds.Tables[0];
            }
            catch (Exception ex) { throw ex; }
        }

        //public string Inserta()
        //{
        //    if (_idusuario == 0) { return "Error: No esta instanciado el objeto"; }
 
        //    try
        //    {
        //        cStore sp = new cStore("spMenu", "I");
        //        sp.AddParameter("pnombre", _nombre);
        //        sp.AddParameter("pdescripcion", _descripcion);
        //        int idm=0;
        //        string respuesta =  sp.Ejecuta(ref idm);
        //        _idmenu = IdMenu;
        //        _elementos = new clElementosMenu(_idmenu);
        //        return respuesta;
        //    }
        //    catch (Exception ex) {throw ex;}
        //}

        public string Actualiza()
        {
            if (_idusuario == 0) { return "Error: No esta instanciado el objeto"; }
            if (_nombre == "") { return "Error: El nombre no debe estar vacio"; }
            if (_idmenu == 0) { return "Error: El id no debe estar vacio"; }

            try
            {
                cStore sp = new cStore("spMenu", "U");
                sp.AddParameter("pnombre", _nombre);
                sp.AddParameter("pdescripcion", _descripcion);
                sp.AddParameter("pidmenu", _idmenu);
                return sp.Ejecuta();
            }
            catch (Exception ex) { throw ex; }
        }

        public string Elimina()
        {
            if (_idusuario == 0) { return "Error: No esta instanciado el objeto"; }
            if (_idmenu == 0) { return "Error: El id no debe estar vacio"; }
            try
            {
                cStore sp = new cStore("spMenu", "D");
                sp.AddParameter("pidmenu", _idmenu);
                return sp.Ejecuta();
            }
            catch (Exception ex) { return ex.Message ; }
        }

        //private void ActualizaElementos()
        //{
        //    _elementos  = new clElementosMenu(_idmenu);   
        //}

        //public string AgregaElemento(int idelemento,int rama)
        //{
        //    if (_idmenu == 0) { return "Debe inicializar objeto menu"; }
        //    try
        //    {
        //        cStore sp = new cStore("spMenuElementos", "AE");
        //        sp.AddParameter("pidmenu", _idmenu);
        //        sp.AddParameter("pidelemento", idelemento);
        //        sp.AddParameter("prama", rama);
        //        string respuesta= sp.Ejecuta();
        //        ActualizaElementos();
        //        return respuesta;
        //    }
        //    catch (Exception ex) { throw ex; }
        //}

        //public string RemueveElemento(int idelemento, int rama)
        //{
        //    if (_idmenu == 0) { return "Debe inicializar objeto menu"; }
        //    try
        //    {
        //        cStore sp = new cStore("spMenuElementos", "RE");
        //        sp.AddParameter("pidmenu", _idmenu);
        //        sp.AddParameter("pidelemento", idelemento);
        //        sp.AddParameter("prama", rama);
        //        string respuesta = sp.Ejecuta();
        //        ActualizaElementos();
        //        return respuesta;
        //    }
        //    catch (Exception ex) { throw ex; }
        //}

        //public string RemueveTodosElementoe(int rama)
        //{
        //    if (_idmenu == 0) { return "Debe inicializar objeto menu"; }
        //    try
        //    {
        //        cStore sp = new cStore("spMenuElementos", "RA");
        //        sp.AddParameter("pidmenu", _idmenu);
        //        sp.AddParameter("prama", rama);
        //        string respuesta = sp.Ejecuta();
        //        ActualizaElementos();
        //        return respuesta;
        //    }
        //    catch (Exception ex) { throw ex; }
        //}

        public DataTable  ObtenRamas()
        {
            if (_idmenu == 0) { return null; }
            try
            {
                cStore sp = new cStore("spMenuElementos", "OR");
                sp.AddParameter("pidmenu", _idmenu);               
                return  sp.ObtenDatos().Tables[0];

            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable ObtenElementosenRama(int idrama)
        {
            if (_idmenu == 0) { return null; }
            try
            {
                cStore sp = new cStore("spMenuRama", "SRIN");
                sp.AddParameter("pidmenu", _idmenu);
                sp.AddParameter("pidrama", idrama);
                return sp.ObtenDatos().Tables[0];

            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable ObtenElementosNoenRama(int idrama)
        {
            if (_idmenu == 0) { return null; }
            try
            {
                cStore sp = new cStore("spMenuRama", "SROUT");
                sp.AddParameter("pidmenu", _idmenu);
                sp.AddParameter("pidrama", idrama);
                return sp.ObtenDatos().Tables[0];

            }
            catch (Exception ex) { throw ex; }
        }


    }
