using MPGlobal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.IO;

public partial class Account_Forgot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEnviarEmail_Click(object sender, EventArgs e)
    {
        try
        {
            // Validate the user's email address
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            ApplicationUser user = manager.FindByName(txtEmail.Text);
            if (user == null)// || !manager.IsEmailConfirmed(user.Id))
            {
                FailureText.Text = "El usuario no existe, favor de validar.";
                ErrorMessage.Visible = true;
                return;
            }
            // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
            // Send email with the code and the redirect to reset password page
            string code = manager.GeneratePasswordResetToken(user.Id);
            string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);

            #region obtiene el formato 

            StreamReader fil = File.OpenText(HttpContext.Current.Server.MapPath("~/formatos/formatoOlvideContrasenia.html"));
            String body = fil.ReadToEnd();
            string urlDefault = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath.TrimEnd('/') + "/";
            string urlImage = urlDefault + "Images/header-formato.png";
            body = body.Replace("<%URLIMAGE%>", urlImage);
            body = body.Replace("<%NOMBRE%>", Helper.GetNombreByEmail(txtEmail.Text));
            body = body.Replace("<%USERNAME%>", txtEmail.Text);
            body = body.Replace("<%URL%>", callbackUrl);

            #endregion

            Helper.EnviaEmail(user.Email, "Administración de Usuarios MPGlobal", body, null);

            loginForm.Visible = false;
            DisplayEmail.Visible = true;
        }
        catch { }
    }
}