using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using MPGlobal;

public partial class Administrador_Roles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            //ROLES
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(Context.GetOwinContext().Get<ApplicationDbContext>()));
           
                roleManager.Create(new IdentityRole(txtNuevoRol.Text));
                txtNuevoRol.Text = "";
           
        }
        catch (Exception x)
        {
        }
    }
}