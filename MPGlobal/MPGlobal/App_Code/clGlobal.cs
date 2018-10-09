using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
 

    public static  class cGlb
    {
        private static clUsuario _usuario;
        public static int iduser=0;
        public static clUsuario Usuario { get { return _usuario; } set { _usuario = value; } }


        private static string _idempresa;
        public static string IdEmpresa { get { return _idempresa ; } set {_idempresa   = value; } }

        private static string _idsucursal;
        public static string IdSucursal { get { return _idsucursal; } set { _idsucursal = value; } }

        //public static string LlenaMenu(ref UltraWebListbar  wlb)
        //{

        //    try {
        //        wlb.Groups.Clear();
        //        clMenu menu = new clMenu(_usuario.Menu.IdMenu );
        //        DataTable dt = menu.ObtenRamas();
        //        for (int x = 0; x < dt.Rows.Count; x++)
        //        {
        //            if ((int)dt.Rows[x]["int_cuenta"] > 0)
        //            {
        //                Group ngrupo = new Group((string)dt.Rows[x]["st_rama"], dt.Rows[x]["id_rama"].ToString());
        //                DataRow[] dr = menu.Elementos.ObtenElementosporRama((int)dt.Rows[x]["id_rama"]);
        //                for (int y = 0; y < dr.Length; y++)
        //                {
        //                    Item nitem = new Item((string)dr[y]["st_elemento"], "/Iconos/Landscape.png", dr[y]["id_elemento"].ToString());
        //                    nitem.TargetUrl = dr[y]["st_url"].ToString();
        //                    nitem.TargetFrame = "centro";
        //                    ngrupo.Items.Add(nitem);
        //                } // for de items por rama

        //                wlb.Groups.Add(ngrupo);
        //            } // For de ramas
        //        }


        //        return "";
        //    }
        //    catch (Exception ex) { return ex.Message ; }
        //}

        //public static DataTable DameEmpresas()
        //{
        //    try
        //    {
        //        StoreProc sp = new StoreProc("spEmpresa", "S");
        //        DataSet ds = sp.DameDatos();
        //        return ds.Tables[0];
        //    }
        //    catch (Exception ex) { throw ex; }
        //}

        #region AyudaJavascript

        public static string JSDameid(string valor)
        {
            return valor.Replace("|", "").Replace("_", "");
        }

        public static string JSDameid(string valor, string car1, string car2)
        {
            return valor.Replace(car1, "").Replace(car2, "");
        }

        #endregion


    }

