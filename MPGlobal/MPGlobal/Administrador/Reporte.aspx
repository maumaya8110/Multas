<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Reporte.aspx.cs" Inherits="Reporte" %>


<%@ Register Src="~/Administrador/UserControl/ucCatReporte.ascx" TagPrefix="uc1" TagName="ucCatReporte" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="box-header">
        <h3 class="box-title">Reporte de Multas Pagadas</h3>
        <br />
        <div class="form-inline ">

            <%--  <label class="control-label">Reporte de Multas Pagadas</label>--%>
        </div>

    </div>
    <uc1:ucCatReporte runat="server" ID="ucCatReporte" />

   

</asp:Content>

