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
using System.Data;
using System.Web.Security;
using System.Xml.Linq;

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

            //guarda las ventanas
            int idUsuario = Helper.GetIdUsuario(id);
            string xml = "";
            foreach (RepeaterItem item in rptVentanas.Items)
            {
                CheckBox chk = item.FindControl("chkPermiso") as CheckBox;
                HiddenField hdn = item.FindControl("hdnIdVentana") as HiddenField;
                CheckBox chkReadOnly = item.FindControl("chkSoloLectura") as CheckBox;
                xml += String.Format("<ventana><id>{0}</id><estatus>{1}</estatus><readOnly>{2}</readOnly></ventana>", hdn.Value, chk.Checked ? "1" :"0", chkReadOnly.Checked ? "1" : "0");
            }
            xml = "<permiso>" + xml + "</permiso>";
            XElement xel = XElement.Parse(xml);

            List<SqlParameter> param = new List<SqlParameter>();
            param.Add(new SqlParameter("@idUsuario", idUsuario));
            SqlParameter p = new SqlParameter("@ventanas", SqlDbType.Xml);
            p.Value = xml;
            param.Add(p);
            param.Add(new SqlParameter("@usuario", id));

            db.EjecutaProcedure("sp_InsertaVentanaUsuario", param.ToArray());
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

            List<Municipio> municipios = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Municipios, parametros.ToArray()).Tables[0].DataTableToList<Municipio>();
            Helper.cargaCatalogoGenericCombo(ddlMunicipio, municipios.Where(x => x.idEstado == int.Parse(ddlEstado.SelectedValue)).ToList(), "idMunicipio", "NomMunicipio");
        }

        cargaVentanas();
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

            //carga ventanas de los usuarios
            List<UsuarioVentana> ventanas = db.ObtieneDatos("sp_ObtieneVentanasUsuario", new SqlParameter[] { new SqlParameter("@idUsuario", Helper.GetIdUsuario(Session["UserIdModificar"].ToString())) }).Tables[0].DataTableToList<UsuarioVentana>();
            rptVentanas.DataSource = ventanas;
            rptVentanas.DataBind();
            pnlSinInfoVentanas.Visible = false;

            ScriptManager.RegisterStartupScript(updAltaUsuario, updAltaUsuario.GetType(), "muestraModal", "muestraModalUsuarios();", true);
        }
    }

    public void nuevoUsuario()
    {
        Session["UserIdModificar"] = null;
        pnlContrasenias.Visible = true;
        if(ddlEstado.Items.Count > 0)
            ddlEstado.SelectedIndex = 0;
        if(ddlMunicipio.Items.Count> 0)
            ddlMunicipio.SelectedIndex = 0;
        ddlRol.SelectedIndex = 0;
        txtFirstName.Text = "";
        txtApPaterno.Text = "";
        txtApMaterno.Text = "";
        txtUserName.Text = "";
        txtEmail.Text = "";
        txtTelefono.Text = "";
        pnlSinInfoVentanas.Visible = true;
        rptVentanas.DataSource = null;
        rptVentanas.DataBind();
        ScriptManager.RegisterStartupScript(updAltaUsuario, updAltaUsuario.GetType(), "muestraModal", "muestraModalUsuarios();", true);
    }


    protected void ddlMunicipio_SelectedIndexChanged(object sender, EventArgs e)
    {
        cargaVentanas();
    }
    
    private void cargaVentanas()
    {
        if(ddlEstado.SelectedIndex > 0 && ddlMunicipio.SelectedIndex > 0)
        {
            pnlSinInfoVentanas.Visible = false;
            using(DataBase db = new DataBase())
            {
                //carga ventanas
                IEnumerable<Ventana> ventanas = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Ventana, null, false).Tables[0].DataTableToList<Ventana>();
                int idEstado = 0;
                int.TryParse(ddlEstado.SelectedValue, out idEstado);
                if (idEstado > 0)
                    ventanas = ventanas.Where(x => x.idEstado == idEstado);

                int idMunicipiio = 0;
                int.TryParse(ddlMunicipio.SelectedValue, out idMunicipiio);
                if (idMunicipiio > 0)
                    ventanas = ventanas.Where(x => x.IdMunicipio == idMunicipiio);

                ventanas.ToList().ForEach(x => x.estatus = false);
                rptVentanas.DataSource = ventanas.ToList();
                rptVentanas.DataBind();
            }

            
        }
    }
}