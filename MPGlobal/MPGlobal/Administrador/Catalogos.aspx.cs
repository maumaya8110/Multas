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
            //Session["TipoMovimiento"] = "";
            //Session["TipoCatalogo"] = "";
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
                btnCancelarN.Visible = false;
                ucCatEstado.GridDatabind();

                ucCatMunicipio.GridDatabind();
                ucCatOficinas.GridDatabind();
                ucCatVentana.GridDatabind();
                ucCatPersonas.GridDatabind();

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;


                break;
            case "Estados":
                btnNew.Visible = true;

                //HacerVisible el UserControl
                ucCatEstado.Visible = true;
                ucCatEstado.LlenaGrid();

                //HacerInVisible los demas UserControl
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;

                break;
            case "Municipios":
                btnNew.Visible = true;

                //HacerVisible el UserControl
                ucCatMunicipio.Visible = true;
                ucCatMunicipio.LlenaGrid();
                ucCatMunicipio.LlenaDrop();

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;

                break;
            case "Oficinas":

                btnNew.Visible = true;

                //HacerVisible el UserControl
                ucCatOficinas.Visible = true;
                ucCatOficinas.LlenaGrid();
                ucCatOficinas.LlenaDrop();

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;

                break;

            case "Ventanas":
                btnNew.Visible = true;

                //HacerVisible el UserControl
                ucCatVentana.Visible = true;
                ucCatVentana.LlenaGrid();
                ucCatVentana.LlenaDrop();

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatPersonas.Visible = false;

                break;
            case "Personas":
                btnNew.Visible = true;

                //HacerVisible el UserControl
                ucCatPersonas.Visible = true;
                ucCatPersonas.LlenaGrid();
                ucCatPersonas.LlenaDrop();

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;


                break;

            default:

                break;
        }


    }

    protected void OcultarUC()
    {
        ucCatEstado.Visible = false;
        ucCatMunicipio.Visible = false;
        ucCatOficinas.Visible = false;
        ucCatVentana.Visible = false;
        ucCatPersonas.Visible = false;
    }


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
                ucCatOficinas.UpdtVisible();

                break;

            case "Ventanas":
                ucCatVentana.UpdtVisible();

                break;
            case "Personas":
                ucCatPersonas.UpdtVisible();

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
                ucCatOficinas.UpdtInVisible(); ucCatOficinas.LimpiaCampos();
                break;

            case "Ventanas":
                ucCatVentana.UpdtInVisible(); ucCatVentana.LimpiaCampos();
                break;
            case "Personas":
                ucCatPersonas.UpdtInVisible(); ucCatPersonas.LimpiaCampos();
                break;
            default:

                break;
        }




        btnCancelarN.Visible = false;
        btnNew.Visible = true;


    }


}
