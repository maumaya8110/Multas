using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using MPGlobal;
using Microsoft.AspNet.Identity.Owin;
using System.Data.SqlClient;

public partial class AltaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ////Asigna los titulos de la pagina
            //MasterPage master = (MasterPage)this.Master;
            //master.setTitle("Administrador");

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
                usuarioID = Helper.GetUserID();
                if (txtContrasenia.Text.Trim() == "" || txtConfirmContrasenia.Text == "")
                {
                    lblError.Text = "La contraseña es obligatoria.";
                    return;
                }

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                var user = new ApplicationUser() { UserName = txtUserName.Text, Email = txtUserName.Text };
                IdentityResult result = manager.Create(user, txtContrasenia.Text);
                if (result.Succeeded)
                {
                    completaInformacion(user.Id);
                }
                else
                {
                    //ScriptManager.RegisterStartupScript(updNuevoUsuario, updNuevoUsuario.GetType(), "mensaje_warning", String.Format("muestraMensajeUsuario('{0}');", result.Errors.FirstOrDefault().Replace("'", "").Replace("\r\n", "<br />")), true);
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
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mensaje_correcto", "muestraMensaje('error', 'Ocurrio un error', '" + x.Message + "')", true);
        }
    }

    private void completaInformacion(string id)
    {
        List<SqlParameter> parametros = new List<SqlParameter>();
        parametros.Add(new SqlParameter("@idEstado", int.Parse(ddlEstado.SelectedValue)));
        parametros.Add(new SqlParameter("@idMunicipio", int.Parse(ddlMunicipio.SelectedValue)));
        parametros.Add(new SqlParameter("@idRol", ddlRol.SelectedValue));
        parametros.Add(new SqlParameter("@nombre", txtFirstName.Text));
        parametros.Add(new SqlParameter("@aPaterno", txtApPaterno.Text));
        parametros.Add(new SqlParameter("@aMaterno", txtApMaterno.Text));
        parametros.Add(new SqlParameter("@usuario", txtUserName.Text));
        parametros.Add(new SqlParameter("@email", txtEmail.Text));
        parametros.Add(new SqlParameter("@telefono", txtTelefono.Text));
        parametros.Add(new SqlParameter("@userId", id));
        using(DataBase db = new DataBase())
        {
            db.EjecutaSPCatalogos(DataBase.TipoAccion.Insertar, DataBase.TipoCatalogo.Usuarios, parametros.ToArray());
        }
        ddlEstado.SelectedIndex = 0;
        ddlMunicipio.SelectedIndex = 0;
        ddlRol.SelectedIndex = 0;
        txtFirstName.Text = "";
        txtApPaterno.Text = "";
        txtApMaterno.Text = "";
        txtUserName.Text = "";
        txtContrasenia.Text = "";
        txtConfirmContrasenia.Text = "";
        txtEmail.Text = "";
        txtTelefono.Text = "";
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mensaje_correcto", "muestraMensaje('success', 'Proceso terminado', 'Se ha registrado correctamente el usuario')", true);
    }

}