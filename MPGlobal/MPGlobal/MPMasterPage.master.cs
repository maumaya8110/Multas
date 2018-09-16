﻿using Microsoft.AspNet.Identity;
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
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        if (!IsPostBack)
        {
            using(DataBase db = new DataBase())
            {
                List<SqlParameter> param = new List<SqlParameter>();
                param.Add(new SqlParameter("@id", Helper.GetUserID()));
                DataTable dt = db.ObtieneDatos("Sp_ObtieneNombre", param.ToArray()).Tables[0];
                lblInfoUsuario.Text = String.Format("{0} - {1}", dt.Rows[0]["nombre"].ToString(), dt.Rows[0]["rol"].ToString()); 
                lblInfoUsuarioHeader.Text = dt.Rows[0]["nombre"].ToString();

                //carga el menu
                List<Ventana> ventanas = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Ventana, null, false).Tables[0].DataTableToList<Ventana>();

                //Obtiene la info del usuario
                Usuario usuario = db.EjecutaSPCatalogos(DataBase.TipoAccion.Consulta, DataBase.TipoCatalogo.Usuarios, null, false).Tables[0].DataTableToList<Usuario>().Find(x => x.userId == Helper.GetUserID());
                rptMenu.DataSource = ventanas.Where(x => x.idEstado == usuario.idEstado && x.IdMunicipio == usuario.idMunicipio);
                rptMenu.DataBind();
            }
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