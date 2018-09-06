using Microsoft.AspNet.Identity.Owin;
using MPGlobal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Owin;

public partial class Account_ResetPassword : System.Web.UI.Page
{
    protected string StatusMessage
    {
        get;
        private set;
    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        string code = IdentityHelper.GetCodeFromRequest(Request);
        if (code != null)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            var user = manager.FindByName(Email.Text);
            if (user == null)
            {
                ErrorMessage.Text = "El usuario no existe, favor de validar.";
                return;
            }
            var result = manager.ResetPassword(user.Id, code, Password.Text);
            if (result.Succeeded)
            {
                Response.Redirect("~/Account/ResetPasswordConfirmation");
                return;
            }
            ErrorMessage.Text = result.Errors.FirstOrDefault();
            return;
        }

        ErrorMessage.Text = "Ah ocurrido un error";
    }
}