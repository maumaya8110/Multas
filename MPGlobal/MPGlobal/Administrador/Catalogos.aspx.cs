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
    public bool ReadOnly
    {
        get
        {
            if (Session["ReadOnlyCatalogos"] == null)
                Session["ReadOnlyCatalogos"] = false;

            return (bool)Session["ReadOnlyCatalogos"];
        }
        set
        {
            Session["ReadOnlyCatalogos"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //obtiene si tiene acceso a agregar y editar
            ReadOnly = false;
            btnNew.Visible = false;

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
            case "SELECCIONA UN CATALOGO":
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

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;


                break;
<<<<<<< HEAD
            case "ESTADOS":
                btnNew.Visible = true;
=======
            case "Estados":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatEstado.Visible = true;
                ucCatEstado.LlenaGrid();
                ucCatEstado.habilitaReadOnly(ReadOnly);
                //HacerInVisible los demas UserControl
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "MUNICIPIOS":
                btnNew.Visible = true;
=======
            case "Municipios":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatMunicipio.Visible = true;
                ucCatMunicipio.LlenaGrid();
                ucCatMunicipio.LlenaDrop();
                ucCatMunicipio.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
            case "OFICINAS":

                btnNew.Visible = !ReadOnly;

                //HacerVisible el UserControl
                ucCatOficinas.Visible = true;
                ucCatOficinas.LlenaGrid();
                ucCatOficinas.LlenaDrop();
                ucCatOficinas.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatVentana.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;

<<<<<<< HEAD
            case "VENTANAS":
                btnNew.Visible = true;
=======
            case "Ventanas":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatVentana.Visible = true;
                ucCatVentana.LlenaGrid();
                ucCatVentana.LlenaDrop();
                ucCatVentana.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "PERSONAS":
                btnNew.Visible = true;
=======
            case "Personas":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatPersonas.Visible = true;
                ucCatPersonas.LlenaGrid();
                ucCatPersonas.LlenaDrop();
                ucCatPersonas.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;


                break;
<<<<<<< HEAD
            case "TIPOS DE MULTA":
                btnNew.Visible = true;
=======
            case "Tipos de multa":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl                
                ucCatTipoMulta.Visible = true;
                ucCatTipoMulta.LlenaGrid();
                ucCatTipoMulta.LlenaDrop();
                ucCatTipoMulta.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatPersonas.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "AGENTES":
                btnNew.Visible = true;
=======
            case "Agentes":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatAgente.Visible = true;
                ucCatAgente.LlenaGrid();
                ucCatAgente.LlenaDrop();
                ucCatAgente.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "PLACAS":
                btnNew.Visible = true;
=======
            case "Placas":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatPlacas.Visible = true;
                ucCatPlacas.LlenaGrid();
                ucCatPlacas.LlenaDrop();
                ucCatPlacas.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "PROCESOS":
                btnNew.Visible = true;
=======
            case "Procesos":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatProcesos.Visible = true;
                ucCatProcesos.LlenaGrid();
                ucCatProcesos.LlenaDrop();
                ucCatProcesos.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "SISTEMAS":
                btnNew.Visible = true;
=======
            case "Sistemas":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatSistemas.Visible = true;
                ucCatSistemas.LlenaGrid();
                ucCatSistemas.LlenaDrop();
                ucCatSistemas.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "FUNCIONES":
                btnNew.Visible = true;
=======
            case "Funciones":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatFunciones.Visible = true;
                ucCatFunciones.LlenaGrid();
                ucCatFunciones.LlenaDrop();
                ucCatFunciones.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatPersonas.Visible = false;
                ucCatCajeros.Visible = false;

                break;
<<<<<<< HEAD
            case "CAJEROS":
                btnNew.Visible = true;
=======
            case "Cajeros":
                btnNew.Visible = !ReadOnly;
>>>>>>> 341ec9fd9915bae36dd443ebe384c97280ce1961

                //HacerVisible el UserControl
                ucCatCajeros.Visible = true;
                ucCatCajeros.LlenaGrid();
                ucCatCajeros.LlenaDrop();
                ucCatCajeros.habilitaReadOnly(ReadOnly);

                //HacerInVisible los demas UserControl
                ucCatEstado.Visible = false;
                ucCatMunicipio.Visible = false;
                ucCatOficinas.Visible = false;
                ucCatVentana.Visible = false;

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatPersonas.Visible = false;

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

        ucCatTipoMulta.Visible = false;
        ucCatAgente.Visible = false;
        ucCatPlacas.Visible = false;
        ucCatProcesos.Visible = false;
        ucCatSistemas.Visible = false;
        ucCatFunciones.Visible = false;
        ucCatCajeros.Visible = false;


    }


    protected void btnNew_Click(object sender, EventArgs e)
    {
        switch (Session["SelectDrop"].ToString())
        {
            case "SELECCIONA UN CATALOGO":

                break;
            case "ESTADOS":
                ucCatEstado.UpdtVisible();

                break;
            case "MUNICIPIOS":
                ucCatMunicipio.UpdtVisible();

                break;
            case "OFICINAS":
                ucCatOficinas.UpdtVisible();

                break;

            case "VENTANAS":
                ucCatVentana.UpdtVisible();

                break;
            case "PERSONAS":
                ucCatPersonas.UpdtVisible();

                break;

            case "TIPOS DE MULTA":
                ucCatTipoMulta.UpdtVisible();

                break;
            case "AGENTES":
                ucCatAgente.UpdtVisible();

                break;
            case "PLACAS":
                ucCatPlacas.UpdtVisible();

                break;
            case "PROCESOS":
                ucCatProcesos.UpdtVisible();

                break;
            case "SISTEMAS":
                ucCatSistemas.UpdtVisible();

                break;
            case "FUNCIONES":
                ucCatFunciones.UpdtVisible();

                break;
            case "CAJEROS":
                ucCatCajeros.UpdtVisible();

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
            case "SELECCIONA UN CATALOGO":

                break;
            case "ESTADOS":
                ucCatEstado.UpdtInVisible(); ucCatEstado.LimpiaCampos();

                break;
            case "MUNICIPIOS":
                ucCatMunicipio.UpdtInVisible(); ucCatMunicipio.LimpiaCampos();

                break;
            case "OFICINAS":
                ucCatOficinas.UpdtInVisible(); ucCatOficinas.LimpiaCampos();
                break;

            case "VENTANAS":
                ucCatVentana.UpdtInVisible(); ucCatVentana.LimpiaCampos();
                break;
            case "PERSONAS":
                ucCatPersonas.UpdtInVisible(); ucCatPersonas.LimpiaCampos();
                break;

            case "TIPOS DE MULTA":
                ucCatTipoMulta.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "AGENTES":
                ucCatAgente.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "PLACAS":
                ucCatPlacas.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "PROCESOS":
                ucCatProcesos.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "SISTEMAS":
                ucCatSistemas.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "FUNCIONES":
                ucCatFunciones.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "CAJEROS":
                ucCatCajeros.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            default:

                break;
        }




        btnCancelarN.Visible = false;
        btnNew.Visible = true;


    }


}
