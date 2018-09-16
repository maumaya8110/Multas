﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using MPGlobal;
using Microsoft.AspNet.Identity.Owin;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Administrador_UserControl_ucAltaUsuario : System.Web.UI.UserControl
{
    public event OnAgregaUsuario OnUsuarioAgregado;
    public delegate void OnAgregaUsuario(string id);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ////Asigna los titulos de la pagina
            //MPMasterPage master = (MPMasterPage)this.Page.Master;
            //master.setTitle("Administrador");
            using(DataBase db = new DataBase())
            {
                Helper.cargaCatalogoGenericCombo(ddlEstado, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Estados, null).Tables[0].DataTableToList<Estado>(), "idEstado", "nomEstado");

                Helper.cargaCatalogoGenericCombo(ddlRol, db.ObtieneDatos("Sp_CargaRoles", null).Tables[0].DataTableToList<CatalogoGenerico>(), false);
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
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

                //valida el usuario
                using (DataBase db = new DataBase())
                {
                    //valida si el usuario fue eliminado anteriormente
                    var usuarioEliminado = db.ObtieneDatos("Sp_ValidaUsuarioEliminado", new SqlParameter[] { new SqlParameter("@username", txtUserName.Text), new SqlParameter("@email", txtEmail.Text) });
                    if (usuarioEliminado.Tables[0].Rows.Count > 0)
                    {
                        completaInformacion(DataBase.TipoAccion.Modificar, usuarioEliminado.Tables[0].Rows[0]["Id"].ToString());
                        return;
                    }

                    pnlUsuarioExiste.Visible = false;
                    //valida si el usuario ya fue registrado
                    var usuarioExiste = db.ObtieneDatos("Sp_ObtieneUsuarioByUserName", new SqlParameter[] {new SqlParameter("@username", txtUserName.Text) });
                    if (usuarioExiste.Tables[0].Rows.Count > 0)
                    {
                        pnlUsuarioExiste.Visible = usuarioExiste != null;
                        return;
                    }

                    pnlEmailExiste.Visible = false;
                    //valida si el email ya fue registrado
                    var emailExiste = db.ObtieneDatos("Sp_ObtieneUsuarioByEmail", new SqlParameter[] { new SqlParameter("@email", txtEmail.Text) });
                    if(emailExiste.Tables[0].Rows.Count > 0)
                    {
                        pnlEmailExiste.Visible = emailExiste != null;
                        return;
                    }
                }

                usuarioID = Helper.GetUserID();
                if (txtContrasenia.Text.Trim() == "" || txtConfirmContrasenia.Text == "")
                {
                    lblError.Text = "La contraseña es obligatoria.";
                    return;
                }

                
                var user = new ApplicationUser() { UserName = txtUserName.Text, Email = txtEmail.Text };
                IdentityResult result = manager.Create(user, txtContrasenia.Text);
                if (result.Succeeded)
                {
                    completaInformacion(DataBase.TipoAccion.Insertar, user.Id);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(updAltaUsuario, updAltaUsuario.GetType(), "mensaje_warning", String.Format("muestraMensaje('warning','Favor de validar','{0}');", result.Errors.FirstOrDefault().Replace("'", "").Replace("\r\n", "<br />")), true);
                }
            }
            else
            {
                usuarioID = Session["UserIdModificar"].ToString();
                completaInformacion(DataBase.TipoAccion.Modificar, Session["UserIdModificar"].ToString());
            }
        }
        catch (Exception x)
        {
            ScriptManager.RegisterStartupScript(updAltaUsuario, updAltaUsuario.GetType(), "mensaje_correcto", "muestraMensaje('error', 'Ocurrio un error', '" + x.Message + "')", true);
        }
    }

    private void completaInformacion(DataBase.TipoAccion tipo, string id)
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
        using (DataBase db = new DataBase())
        {
            db.EjecutaSPCatalogos(tipo, DataBase.TipoCatalogo.Usuarios, parametros.ToArray());
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
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mensaje_correcto", "terminaAltaUsuario();", true);
        this.OnUsuarioAgregado?.Invoke(id);
    }

    protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        using(DataBase db = new DataBase())
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", ddlEstado.SelectedValue));
            Helper.cargaCatalogoGenericCombo(ddlMunicipio, db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, parametros.ToArray()).Tables[0].DataTableToList<Municipio>(), "idMunicipio", "NomMunicipio");
        }
    }

    public void cargaInfoUsuario(int id)
    {
        pnlContrasenias.Visible = false;
        using (DataBase db = new DataBase())
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idEstado", ddlEstado.SelectedValue));
            string idMunicipio = "-1";
            if (ddlMunicipio.SelectedValue != "")
                idMunicipio = ddlMunicipio.SelectedValue;
            parametros.Add(new SqlParameter("@idMunicipio", idMunicipio));

            DataTable dt = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, parametros.ToArray()).Tables[0];
            DataRow dr = dt.Select(String.Format("idusuario={0}", id.ToString()))[0];

            ddlEstado.SelectedValue = dr["idEstado"].ToString();
            ddlEstado_SelectedIndexChanged(null, null);

            ddlMunicipio.SelectedValue = dr["idMunicipio"].ToString();
            ddlRol.SelectedValue = dr["RoleId"].ToString();
            txtFirstName.Text = dr["Nombre"].ToString();
            txtApPaterno.Text = dr["Apaterno"].ToString();
            txtApMaterno.Text = dr["Amaterno"].ToString();
            txtUserName.Text = dr["Email"].ToString();
            txtEmail.Text = dr["Email"].ToString();
            txtTelefono.Text = dr["Telefono"].ToString();

            Session["UserIdModificar"] = dr["userId"].ToString();

            ScriptManager.RegisterStartupScript(updAltaUsuario, updAltaUsuario.GetType(), "muestraModal", "muestraModalUsuarios();", true);
        }
    }

    public void nuevoUsuario()
    {
        pnlContrasenias.Visible = true;
        ddlEstado.SelectedIndex = 0;
        ddlMunicipio.SelectedIndex = 0;
        ddlRol.SelectedIndex = 0;
        txtFirstName.Text = "";
        txtApPaterno.Text = "";
        txtApMaterno.Text = "";
        txtUserName.Text = "";
        txtEmail.Text = "";
        txtTelefono.Text = "";
        ScriptManager.RegisterStartupScript(updAltaUsuario, updAltaUsuario.GetType(), "muestraModal", "muestraModalUsuarios();", true);
    }
}