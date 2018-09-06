using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MPGlobal;

public partial class AltaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Asigna los titulos de la pagina
            MasterPage master = (MasterPage)this.Master;
            master.setTitle("Administrador");

            using (DataBase db = new DataBase())
            {
                Helper.cargaCatalogoGenericCombo(ddlRol, db.ObtieneDatos("Sp_CargaRoles", null).Tables[0].DataTableToList<CatalogoGenerico>());
            }
        }
    }

    protected void lnkGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            string usuarioID = "";
            if (!txtContrasenia.Text.Equals(txtConfirmContrasenia.Text))
            {
                lblError.Text = "Las contraseñas deben de coincidir.";
                return;
            }

            if (Session["UserIdModificar"] == null)
            {
                usuarioID = UserControlCarnico.GetUserID();
                if (txtContrasenia.Text.Trim() == "" || txtConfirmContrasenia.Text == "")
                {
                    lblError.Text = "La contraseña es obligatoria.";
                    return;
                }
                List<GetUsuarioInactivoByUserNameResult> userExisst = ctx.GetUsuarioInactivoByUserName(txtCorreo.Text).ToList();
                if (userExisst.Count == 0)
                {
                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                    var user = new ApplicationUser() { UserName = txtCorreo.Text, Email = txtCorreo.Text };
                    IdentityResult result = manager.Create(user, txtContrasenia.Text);
                    if (result.Succeeded)
                    {
                        completaInformacion(user.Id);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(updNuevoUsuario, updNuevoUsuario.GetType(), "mensaje_warning", String.Format("muestraMensajeUsuario('{0}');", result.Errors.FirstOrDefault().Replace("'", "").Replace("\r\n", "<br />")), true);
                    }
                }
                else
                {
                    if (actualizaContrasenia(userExisst[0].userIdOwner, txtContrasenia.Text))
                        completaInformacion(userExisst[0].userIdOwner);
                    else
                        ScriptManager.RegisterStartupScript(updNuevoUsuario, updNuevoUsuario.GetType(), "mensaje_warning", String.Format("muestraMensajeUsuario('{0}');", "Ocurrio un error al intentar agreagr al nuevo usuario, por favor intentarlo nuevamente."), true);
                }
            }
            else
            {
                usuarioID = Session["UserIdModificar"].ToString();
                completaInformacion(Session["UserIdModificar"].ToString());
            }
        }
        catch(Exception x)
        {

        }
    }
}