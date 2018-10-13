﻿using System;
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

                ucCatTipoMulta.Visible = false;
                ucCatAgente.Visible = false;
                ucCatPlacas.Visible = false;
                ucCatProcesos.Visible = false;
                ucCatSistemas.Visible = false;
                ucCatFunciones.Visible = false;
                ucCatCajeros.Visible = false;


                break;
            case "Estados":
                btnNew.Visible = !ReadOnly;

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
            case "Municipios":
                btnNew.Visible = !ReadOnly;

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
            case "Oficinas":

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

            case "Ventanas":
                btnNew.Visible = !ReadOnly;

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
            case "Personas":
                btnNew.Visible = !ReadOnly;

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
            case "Tipos de multa":
                btnNew.Visible = !ReadOnly;

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
            case "Agentes":
                btnNew.Visible = !ReadOnly;

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
            case "Placas":
                btnNew.Visible = !ReadOnly;

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
            case "Procesos":
                btnNew.Visible = !ReadOnly;

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
            case "Sistemas":
                btnNew.Visible = !ReadOnly;

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
            case "Funciones":
                btnNew.Visible = !ReadOnly;

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
            case "Cajeros":
                btnNew.Visible = !ReadOnly;

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

            case "Tipos de multa":
                ucCatTipoMulta.UpdtVisible();

                break;
            case "Agentes":
                ucCatAgente.UpdtVisible();

                break;
            case "Placas":
                ucCatPlacas.UpdtVisible();

                break;
            case "Procesos":
                ucCatProcesos.UpdtVisible();

                break;
            case "Sistemas":
                ucCatSistemas.UpdtVisible();

                break;
            case "Funciones":
                ucCatFunciones.UpdtVisible();

                break;
            case "Cajeros":
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

            case "Tipos de multa":
                ucCatTipoMulta.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "Agentes":
                ucCatAgente.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "Placas":
                ucCatPlacas.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "Procesos":
                ucCatProcesos.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "Sistemas":
                ucCatSistemas.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "Funciones":
                ucCatFunciones.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            case "Cajeros":
                ucCatCajeros.UpdtInVisible(); ucCatPersonas.LimpiaCampos();

                break;
            default:

                break;
        }




        btnCancelarN.Visible = false;
        btnNew.Visible = true;


    }


}
