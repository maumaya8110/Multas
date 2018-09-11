<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Roles.aspx.cs" Inherits="Administrador_Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <p>
                    NOMBRE
                </p>
            </div>
            <div class="col-sm-8">
                <asp:TextBox ID="txtNuevoRol" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-CarnicoGenerico right" Text="Agregar Rol" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>
</asp:Content>

