﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Catalogos.aspx.cs" Inherits="Catalogos" %>

<%@ Register Src="~/Administrador/UserControl/ucCatEstado.ascx" TagPrefix="uc1" TagName="ucCatEstado" %>
<%@ Register Src="~/Administrador/UserControl/ucCatMunicipio.ascx" TagPrefix="uc1" TagName="ucCatMunicipio" %>
<%@ Register Src="~/Administrador/UserControl/ucCatOficinas.ascx" TagPrefix="uc1" TagName="ucCatOficinas" %>
<%@ Register Src="~/Administrador/UserControl/ucCatVentana.ascx" TagPrefix="uc1" TagName="ucCatVentana" %>
<%@ Register Src="~/Administrador/UserControl/ucCatPersonas.ascx" TagPrefix="uc1" TagName="ucCatPersonas" %>


<%@ Register Src="~/Administrador/UserControl/ucCatTipoMulta.ascx" TagPrefix="uc1" TagName="ucCatTipoMulta" %>
<%@ Register Src="~/Administrador/UserControl/ucCatAgente.ascx" TagPrefix="uc1" TagName="ucCatAgente" %>
<%@ Register Src="~/Administrador/UserControl/ucCatPlacas.ascx" TagPrefix="uc1" TagName="ucCatPlacas" %>
<%@ Register Src="~/Administrador/UserControl/ucCatProcesos.ascx" TagPrefix="uc1" TagName="ucCatProcesos" %>
<%@ Register Src="~/Administrador/UserControl/ucCatSistemas.ascx" TagPrefix="uc1" TagName="ucCatSistemas" %>
<%@ Register Src="~/Administrador/UserControl/ucCatFunciones.ascx" TagPrefix="uc1" TagName="ucCatFunciones" %>
<%@ Register Src="~/Administrador/UserControl/ucCatCajeros.ascx" TagPrefix="uc1" TagName="ucCatCajeros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="box-header">

        <h3 id="titleHeader" runat="server">Administrador
            <small>Catálogos</small>
        </h3>
        <%--<h3 class="box-title">Administrador de Catálogos</h3>--%>
        <br />
        <div class="form-inline ">

            <label class="control-label">Catalogos</label>

            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                <asp:DropDownList ID="DropCatalogos" AutoPostBack="true" runat="server" name="department" class="form-control selectpicker" OnSelectedIndexChanged="DropCatalogos_SelectedIndexChanged">
                    <asp:ListItem>SELECCIONA UN CATALOGO</asp:ListItem>

                    <asp:ListItem>AGENTES</asp:ListItem>
                    <asp:ListItem>CAJEROS</asp:ListItem>
                    <asp:ListItem>ESTADOS</asp:ListItem>
                    <asp:ListItem>FUNCIONES</asp:ListItem>

                    <asp:ListItem>MUNICIPIOS</asp:ListItem>
                    <asp:ListItem>OFICINAS</asp:ListItem>
                    <asp:ListItem>PERSONAS</asp:ListItem>
                    <asp:ListItem>PLACAS</asp:ListItem>
                    <asp:ListItem>PROCESOS</asp:ListItem>
                    <asp:ListItem>SISTEMAS</asp:ListItem>
                    <asp:ListItem>TIPOS DE MULTA</asp:ListItem>
                    <asp:ListItem>VENTANAS</asp:ListItem>

                </asp:DropDownList>
            </div>

            <asp:LinkButton ID="btnNew" runat="server" type="button" class="btn btn-default btn-sm" OnClick="btnNew_Click" CommandName="NUEVO" Visible="false"> <span class="glyphicon glyphicon-plus"></span>AGREGAR </asp:LinkButton>
            <asp:LinkButton ID="btnCancelarN" runat="server" type="button" class="btn btn-default btn-sm" OnClick="btnCancelarN_Click" Visible="false" CommandName="NUEVO"> <span class="glyphicon glyphicon-remove"></span>CANCELAR </asp:LinkButton>


            <%--<asp:Button ID="BtnEdita" runat="server" Style="visibility: hidden;" OnClick="BtnEdita_Click" Text="btnEdita" />--%>
        </div>

    </div>
    <uc1:ucCatEstado runat="server" ID="ucCatEstado" />
    <uc1:ucCatMunicipio runat="server" ID="ucCatMunicipio" />
    <uc1:ucCatOficinas runat="server" ID="ucCatOficinas" />
    <uc1:ucCatVentana runat="server" ID="ucCatVentana" />
    <uc1:ucCatPersonas runat="server" ID="ucCatPersonas" />

    <uc1:ucCatTipoMulta runat="server" ID="ucCatTipoMulta" />
    <uc1:ucCatAgente runat="server" ID="ucCatAgente" />
    <uc1:ucCatPlacas runat="server" ID="ucCatPlacas" />
    <uc1:ucCatProcesos runat="server" ID="ucCatProcesos" />
    <uc1:ucCatSistemas runat="server" ID="ucCatSistemas" />
    <uc1:ucCatFunciones runat="server" ID="ucCatFunciones" />
    <uc1:ucCatCajeros runat="server" ID="ucCatCajeros" />


    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginReq);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);

        function beginReq(sender, args) {


        }

        function endReq(sender, args) {
            EfectoGrid();
        }

        $(document).ready(function () { EfectoGrid(); });

        function EfectoGrid() {
            if ($('#GridView1').find('thead').size() > 0) {
                 $('#GridView1').DataTable({
                    language: {
                        search: 'Buscar: ',
                        info: 'Mostrar _START_ a _END_ de _TOTAL_ registros',
                        lengthMenu: 'Mostrar _MENU_ registros',
                        zeroRecords: 'No se encontraron registros con esa coincidencia',
                        infoEmpty: 'Mostrando 0 registros',
                        infoFiltered: '(Filtrado de _MAX_ registros en total)',
                        paginate: { first: "Primero", last: "Ultimo", next: "Siguiente", previous: "Anterior" }

                    }
                });
            }
        }

    </script>
</asp:Content>

