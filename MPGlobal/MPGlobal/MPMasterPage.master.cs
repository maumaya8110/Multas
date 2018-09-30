using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MPMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            if (!IsPostBack)
            {
                using (DataBase db = new DataBase())
                {
                    List<SqlParameter> param = new List<SqlParameter>();
                    param.Add(new SqlParameter("@id", Helper.GetUserID()));
                    DataTable dt = db.ObtieneDatos("Sp_ObtieneNombre", param.ToArray()).Tables[0];
                    lblInfoUsuario.Text = String.Format("{0} - {1}", dt.Rows[0]["nombre"].ToString(), dt.Rows[0]["rol"].ToString());
                    lblInfoUsuarioHeader.Text = dt.Rows[0]["nombre"].ToString();

                    //carga el menu
                    int idUsuario = Helper.GetIdUsuario(Helper.GetUserID());
                    List<UsuarioVentana> ventanas = db.ObtieneDatos("sp_ObtieneVentanasUsuario", new SqlParameter[] { new SqlParameter("@idUsuario", idUsuario) }).Tables[0].DataTableToList<UsuarioVentana>();

                    //Obtiene la info del usuario
                    if(MPGlobalSessiones.Current.UsuarioLogueado.Usuario == null || MPGlobalSessiones.Current.UsuarioLogueado.Usuario.UserId == "")
                        MPGlobalSessiones.Current.UsuarioLogueado.Usuario = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null, false).Tables[0].DataTableToList<Usuario>().Find(x => x.UserId == Helper.GetUserID());
                    rptMenu.DataSource = ventanas.Where(x => x.estatus).ToList();
                    rptMenu.DataBind();
                }
            }
        }
        catch(Exception x)
        {
            Response.Redirect("~/Account/login.aspx");
            Helper.registraError(x.Message);
        }
       
    }
    
    public void setTitle(string title)
    {
        titleHeader.InnerText = title;
    }


    protected void btnSingOut_Click(object sender, EventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        Response.Redirect("~/Account/Login.aspx");
    }
}
