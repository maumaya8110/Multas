using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Catalogos : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["TipoMovimiento"] = "";
            Session["TipoCatalogo"] = "";
            Session["SelectDrop"] = "";

            OcultarUC();
        }
    }

    protected void Page_Init(object sender, EventArgs e) { ucCatEstado.BtnHabilita += BtnHabilita; }

    protected void BtnHabilita()
    {
        btnCancelarN.Visible = false;
        btnNew.Visible = true;
    }

    protected void DropCatalogos_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectDrop"] = DropCatalogos.SelectedValue;

        switch (Session["SelectDrop"].ToString())
        {
            case "Selecciona el catalogo":
                btnNew.Visible = false;
                ucCatEstado.GridDatabind();

                break;
            case "Estados":
                btnNew.Visible = true;
                Session["TipoMovimiento"] = "CONSULTAR";
                Session["TipoCatalogo"] = "Sp_Cat_Estados";

                //HacerVisible el UserControl
                ucCatEstado.Visible = true;
                ucCatEstado.LlenaGrid();

                //HacerInVisible los demas UserControl
                ucCatMunicipio.Visible = false;

                break;
            case "Municipios":
                btnNew.Visible = true;
                Session["TipoMovimiento"] = "CONSULTAR";
                Session["TipoCatalogo"] = "Sp_Cat_Municipios";

                //HacerVisible el UserControl
                ucCatMunicipio.Visible = true;
                ucCatMunicipio.LlenaGrid();


                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;


                break;
            case "Oficinas":

                break;
            default:

                break;
        }


    }

    protected void OcultarUC() { ucCatEstado.Visible = false; ucCatMunicipio.Visible = false; }


    protected void btnNew_Click(object sender, EventArgs e)
    {
        switch (Session["SelectDrop"].ToString())
        {
            case "Selecciona el catalogo":

                break;
            case "Estados":
                ucCatEstado.UpdtVisible();

                break;
            case "Municipios":
                ucCatMunicipio.UpdtVisible();

                break;
            case "Oficinas":

                break;
            default:

                break;
        }




        btnCancelarN.Visible = true;
        btnNew.Visible = false;
    }

    protected void btnCancelarN_Click(object sender, EventArgs e)
    {
        switch (Session["SelectDrop"].ToString())
        {
            case "Selecciona el catalogo":

                break;
            case "Estados":
                ucCatEstado.UpdtInVisible(); ucCatEstado.LimpiaCampos();

                break;
            case "Municipios":
                ucCatMunicipio.UpdtInVisible(); ucCatMunicipio.LimpiaCampos();

                break;
            case "Oficinas":

                break;
            default:

                break;
        }




        btnCancelarN.Visible = false;
        btnNew.Visible = true;


    }


}