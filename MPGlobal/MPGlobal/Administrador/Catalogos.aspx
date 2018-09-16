<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Catalogos.aspx.cs" Inherits="Catalogos" %>

<%@ Register Src="~/Administrador/UserControl/ucCatEstado.ascx" TagPrefix="uc1" TagName="ucCatEstado" %>
<%@ Register Src="~/Administrador/UserControl/ucCatMunicipio.ascx" TagPrefix="uc1" TagName="ucCatMunicipio" %>
<%@ Register Src="~/Administrador/UserControl/ucCatOficinas.ascx" TagPrefix="uc1" TagName="ucCatOficinas" %>
<%@ Register Src="~/Administrador/UserControl/ucCatVentana.ascx" TagPrefix="uc1" TagName="ucCatVentana" %>
<%@ Register Src="~/Administrador/UserControl/ucCatPersonas.ascx" TagPrefix="uc1" TagName="ucCatPersonas" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="box-header">
        <%--<h3 class="box-title">Administrador de Catálogos</h3>--%>
        <br />
        <div class="form-inline ">

            <label class="control-label">Catalogos</label>

            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                <asp:DropDownList ID="DropCatalogos" AutoPostBack="true" runat="server" name="department" class="form-control selectpicker" OnSelectedIndexChanged="DropCatalogos_SelectedIndexChanged">
                    <asp:ListItem>Selecciona el catalogo</asp:ListItem>
                    <asp:ListItem>Estados</asp:ListItem>
                    <asp:ListItem>Municipios</asp:ListItem>
                    <asp:ListItem>Personas</asp:ListItem>
                    <asp:ListItem>Oficinas</asp:ListItem>
                    <asp:ListItem>Ventanas</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:LinkButton ID="btnNew" runat="server" type="button" class="btn btn-default btn-sm" OnClick="btnNew_Click" CommandName="NUEVO" Visible="false"> <span class="glyphicon glyphicon-plus"></span>AGREGAR </asp:LinkButton>
            <asp:LinkButton ID="btnCancelarN" runat="server" type="button" class="btn btn-default btn-sm" OnClick="btnCancelarN_Click" Visible="false" CommandName="NUEVO"> <span class="glyphicon glyphicon-remove"></span>CANCELAR </asp:LinkButton>

           
            <%--<asp:Button ID="BtnEdita" runat="server" Style="visibility: hidden;" OnClick="BtnEdita_Click" Text="btnEdita" />--%>
        </div>

    </div>
    <uc1:ucCatEstado runat="server" ID="ucCatEstado" />
    <uc1:ucCatMunicipio runat="server" id="ucCatMunicipio" />
    <uc1:ucCatOficinas runat="server" ID="ucCatOficinas" />
    <uc1:ucCatVentana runat="server" ID="ucCatVentana" />
    <uc1:ucCatPersonas runat="server" ID="ucCatPersonas" />

</asp:Content>

