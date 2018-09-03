<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogos.aspx.cs" Inherits="Catalogos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .Titulo {
            text-align: center;
        }

        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">

        <form class="well form-horizontal" method="post" id="contact_form">
            <fieldset>

                <!-- Form Name -->
                <fieldset>
                    <legend class="Titulo">Administrador de Catálagos</legend>
                </fieldset>

                <div class="row">
                    <div class="col-md-6">
                        <label class="col-md-1 control-label" style="width: 15%;">Catalogos</label>
                        <div class="col-md-4 selectContainer" style="width: 80%;">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="DropCatalogos" AutoPostBack="true" runat="server" name="department" class="form-control selectpicker" OnSelectedIndexChanged="DropCatalogos_SelectedIndexChanged">
                                    <asp:ListItem>Selecciona el catalogo</asp:ListItem>
                                    <asp:ListItem>Estados</asp:ListItem>

                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-2 selectContainer">
                            <asp:LinkButton ID="BtnNuevo" runat="server" type="button" class="btn btn-default btn-LG">
                            <span class="glyphicon glyphicon-plus"></span>NUEVO
                            </asp:LinkButton>
                        </div>
                        <div class="col-md-2 selectContainer">
                            <asp:LinkButton ID="BtnEditar" runat="server" type="button" class="btn btn-default btn-LG" >
                            <span class="glyphicon glyphicon-pencil"></span>EDITAR
                            </asp:LinkButton>
                        </div>
                        <div class="col-md-2 selectContainer">
                            <asp:LinkButton ID="BtnEliminar" runat="server" type="button" class="btn btn-default btn-LG" >
                            <span class="glyphicon glyphicon-trash"></span>ELIMINAR
                            </asp:LinkButton>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6"  style="width: 100%;">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
            </fieldset>
        </form>
    </div>


</asp:Content>

