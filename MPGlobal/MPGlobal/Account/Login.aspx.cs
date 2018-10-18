using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using MPGlobal;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //RegisterHyperLink.NavigateUrl = "Register";
        //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        //if (!String.IsNullOrEmpty(returnUrl))
        //{
        //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        //}
    }

    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {
            // Validate the user password
            var manager = new UserManager();
            ApplicationUser user = manager.Find(UserName.Text, Password.Text);
            if (user != null)
            {
                Session["loginId"] = user.Id;
                IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                ObtieneUsuario(UserName.Text);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                FailureText.Text = "Usuario o contraseña incorrectos.";
                ErrorMessage.Visible = true;
            }
        }
    }

    /// <summary>
    /// Carga la información del usuario logueado en session
    /// </summary>
    /// <param name="userName"></param>
    public void ObtieneUsuario(string userName)
    {
        using(DataBase db = new DataBase())
        {
            UsuarioLogueado usuario = new UsuarioLogueado();
            usuario.Usuario = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null, false).Tables[0].DataTableToList<Usuario>().Find(x => x.UserName == userName);
        }
    }
}