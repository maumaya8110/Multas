using MPGlobal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

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
            if (user == null || !manager.IsEmailConfirmed(user.Id))
            {
                FailureText.Text = "El usuario no existe, favor de validar.";
                ErrorMessage.Visible = true;
                return;
            }
            // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
            // Send email with the code and the redirect to reset password page
            string code = manager.GeneratePasswordResetToken(user.Id);
            string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);
            //Helper.SendMail(Email.Text, "Administración de Usuarios Wazte", "Por favor resetea tu contraseña dando clic <a href=\"" + callbackUrl + "\">aquí</a>.", "");
            loginForm.Visible = false;
            DisplayEmail.Visible = true;
        }
        catch { }
    }
}