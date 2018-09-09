<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Administrador_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .Titulo {
            text-align: center;
        }

        .textTab {
            border: solid 1px #E5E5E5;
            background: -webkit-gradient( linear, left top, left 25, from(#FFFFFF), color-stop(2%, #f4f4f478), to(#FFFFFF) );
            margin: 5px 30px 0px 30px;
            width: 40%;
            padding: 3px;
            display: block;
            font-size: 16px;
        }

        .labelTab {
            display: block;
            padding: 10px 30px 0px 30px;
            margin: 10px,0px 0 px 0px;
            font-size: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="well form-horizontal" id="contact_form">
        <div class="container well form-horizontal">
            <div class="row">
                <div class="col-sm-4">
                    <p>Estado</p>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" AutoPostBack="true" Width="100%"></asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <p>Municipio</p>
                    <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" Width="100%"></asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="grdUsuarios" runat="server">

            </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

