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
                        </div>
                        <div class="col-md-2 selectContainer">
                        </div>
                        <div class="col-md-2 selectContainer">
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6" style="width: 100%;">
                            <asp:GridView ID="GridView1" runat="server" ClientIDMode="Static" CssClass="table table-bordered bs-table" OnRowDeleting="GridView1_RowDeleting">

                                <Columns>
                                    <%--CheckBox para seleccionar varios registros...--%>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="100%">
                                        <ItemTemplate>

                                            <%--Botones de eliminar y editar cliente...--%>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="col-md-2 selectContainer">
                                                        <asp:LinkButton ID="BtnNuevo" runat="server" type="button" class="btn btn-default btn-sm" CommandName="NUEVO" OnClientClick="return confirm('¿Eliminar cliente?');">
                                            <span class="glyphicon glyphicon-plus"></span>NUEVO
                                                        </asp:LinkButton>
                                                    </div>
                                                    <div class="col-md-2 selectContainer">
                                                        <asp:LinkButton ID="BtnEditar" runat="server" type="button" class="btn btn-default btn-sm" CommandName="Editar">
                                            <span class="glyphicon glyphicon-pencil"></span>EDITAR
                                                        </asp:LinkButton>
                                                    </div>
                                                    <div class="col-md-2 selectContainer">
                                                        <asp:LinkButton ID="BtnEliminar" runat="server" type="button" class="btn btn-default btn-sm" CommandName="Eliminar">
                                            <span class="glyphicon glyphicon-trash"></span>ELIMINAR
                                                        </asp:LinkButton>
                                                    </div>

                                                </div>





                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%--Botones de grabar y cancelar la edición de registro...--%>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Grabar" CssClass="btn btn-success" CommandName="Update" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del cliente?');" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
            </fieldset>
        </form>
    </div>


    <!-- jQuery 3 -->
    <%-- <script src="../bower_components/jquery/dist/jquery.min.js"></script>
   

    <!-- Bootstrap 3.3.7 -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- DataTables -->--%>
    <%--<script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>--%>

    <%-- <script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../bower_components/fastclick/lib/fastclick.js"></script>--%>
    <%-- <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>--%>


    <!-- page script -->
    <script>
        $(function () {
            $('#GridView1').DataTable()
            $('#GridView1').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })
</script>


</asp:Content>

