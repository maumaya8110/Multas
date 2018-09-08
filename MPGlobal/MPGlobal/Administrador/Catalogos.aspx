﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogos.aspx.cs" Inherits="Catalogos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .Titulo {
            text-align: center;
        }
    </style>
    <script src="../Scripts/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
        function QuestionDelete() {
            swal({
                title: "Estas seguro de eliminar el registro?",
                text: "No podrás recuperarlo!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Si, eliminarlo!",
                closeOnConfirm: true
            },
                function (isconfirm) {

                    if (isconfirm)
                        document.getElementById('<%= BtnElimina.ClientID %>').click();

                    swal("Eliminado!", "El registro ha sido eliminado.", "success");
                })
        }
        function Success() {

            swal({
                position: 'top-end',
                type: 'success',
                title: 'La modificación ha sido exitosa',
                showConfirmButton: false,
                timer: 1500

            }, function (isconfirm) { document.getElementById('<%= BtnEdita.ClientID %>').click(); });
        }

        function AltaSuccess() {

            swal({
                position: 'top-end',
                type: 'success',
                title: 'Alta exitosa',
                showConfirmButton: false,
                timer: 1500

            });
        }

         function EditSuccess() {

            swal({
                position: 'top-end',
                type: 'success',
                title: 'Modificación exitosa',
                showConfirmButton: false,
                timer: 1500

            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginReq);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);

        function beginReq(sender, args) {


        }

        function endReq(sender, args) {
            $(function () {
                $('#example1').DataTable()
                $('#GridView1').DataTable()
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                })
            })



        }





    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="box">
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
                                <asp:ListItem>Oficinas</asp:ListItem>

                            </asp:DropDownList>


                        </div>



                        <asp:LinkButton ID="btnNew" runat="server" type="button" class="btn btn-default btn-sm" OnClick="btnNew_Click" CommandName="NUEVO">
                                            <span class="glyphicon glyphicon-plus"></span>AGREGAR
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnCancelarN" runat="server" type="button" class="btn btn-default btn-sm" OnClick="btnCancelarN_Click" Visible="false" CommandName="NUEVO">
                                            <span class="glyphicon glyphicon-remove"></span>CANCELAR
                        </asp:LinkButton>

                    </div>
                    <asp:Button ID="BtnElimina" runat="server" Visible="false" OnClick="BtnElimina_Click" Text="btnElimina" />
                    <asp:Button ID="BtnEdita" runat="server" Visible="false" OnClick="BtnEdita_Click" Text="btnEdita" />
                </div>


                <asp:UpdatePanel ID="UpdtAgregarEdo" runat="server" Visible="false">

                    <ContentTemplate>
                        <div class="panel panel-default" style="margin: 1% 2% 2% 2%;">
                            <div class="panel-heading">Alta de Estado</div>
                            <div class="panel-body">
                                <div class="form-inline col-auto">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEstado" runat="server" placeholder="Estado" CssClass="form-control campo_obligatorio"></asp:TextBox>


                                        <asp:TextBox ID="txtAbreviatura" runat="server" placeholder="Abreviatura" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                        <asp:TextBox ID="txtContacto" runat="server" placeholder="Contacto" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                        <asp:TextBox ID="txtTelefono" runat="server" placeholder="Telefono" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                        <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                        <asp:TextBox ID="txtLicencia" runat="server" placeholder="Licencia" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                        <asp:LinkButton ID="LinkBtnAlta" runat="server" type="button" class="btn btn-default btn-sm" CommandName="LinkBtnAlta" OnClick="LinkBtnAlta_Click">
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
 

           

            <!-- /.box-header -->
            <div class="box-body">

                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="8" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_Rowupdating" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <%--Paginador...--%>
                    <%-- <PagerTemplate>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-lg-1" style="text-align: right;">
                                    <h5>
                                        <asp:Label ID="MessageLabel" Text="Ir a la pág." runat="server" /></h5>
                                </div>
                                 <div class="col-lg-1" style="text-align: left;">
                                    <asp:DropDownList ID="PageDropDownList" Width="50px" AutoPostBack="true" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged" runat="server" CssClass="form-control" /></h3>
                                </div>
                                <div class="col-lg-10" style="text-align: right;">
                                    <h3>
                                        <asp:Label ID="CurrentPageLabel" runat="server" CssClass="label label-warning" /></h3>
                                </div>
                            </div>
                        </PagerTemplate>--%>
                    <Columns>
                        <%--CheckBox para seleccionar varios registros...--%>
                        <%--   <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70px">
                <ItemTemplate>
                    <asp:CheckBox ID="chkEliminar" runat="server" AutoPostBack="true" OnCheckedChanged="chk_OnCheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>   --%>

                        <%--botones de acción sobre los registros...--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="17%">
                            <ItemTemplate>
                                <%--Botones de eliminar y editar cliente...--%>



                                <asp:LinkButton ID="btnEdit" runat="server" ToolTip="EDITAR" type="button" class="btn btn-default btn-xs" CommandName="Edit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server" ToolTip="ELIMINAR" type="button" class="btn btn-default btn-xs" CommandName="Delete" OnClientClick="QuestionDelete();" AutoPostBack="false">
                                            <span class="glyphicon glyphicon-trash"></span>
                                </asp:LinkButton>

                                <%--  <asp:Button ID="btnDelete" runat="server" Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('¿Eliminar cliente?');" />
                                    <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--Botones de grabar y cancelar la edición de registro...--%>
                                <asp:LinkButton ID="btnUpdate" runat="server" type="button" class="btn btn-default btn-xs" CommandName="Update" OnClientClick="Success();">
                                            <span class="glyphicon glyphicon-floppy-disk"></span> GRABAR
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnCancel" runat="server" type="button" class="btn btn-default btn-xs" CommandName="Cancel">
                                            <span class="glyphicon glyphicon-remove-circle"></span> CANCELAR
                                </asp:LinkButton>

                                <%-- <asp:Button ID="btnUpdate" runat="server" Text="Grabar" CssClass="btn btn-success" CommandName="Update" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del cliente?');" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />--%>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <%--campos no editables...--%>
                        <%--     <asp:BoundField DataField="ClienteID" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" ControlStyle-Width="70px" />
            <asp:BoundField DataField="CustomerID" HeaderText="Cód." InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" ControlStyle-Width="70px" />
            <asp:BoundField DataField="CompanyName" HeaderText="Compañía" ReadOnly="True" SortExpression="CompanyName" ControlStyle-Width="300px" />
            <asp:BoundField DataField="Country" HeaderText="Pais" ReadOnly="True" SortExpression="Country" />--%>

                        <%--campos editables...--%>
                        <asp:TemplateField HeaderStyle-Width="300px" HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblIdEstado" runat="server"><%# Eval("IdEstado")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtIdEstado" runat="server" Text='<%# Eval("IdEstado")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ESTADO">
                            <ItemTemplate>
                                <asp:Label ID="lblNomEstado" runat="server"><%# Eval("NomEstado")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtNomEstado" runat="server" Text='<%# Bind("NomEstado")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ABREVIATURA">
                            <ItemTemplate>
                                <asp:Label ID="lblSiglasEstado" runat="server"><%# Eval("SiglasEstado")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtSiglasEstado" runat="server" Text='<%# Bind("SiglasEstado")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="CONTACTO">
                            <ItemTemplate>
                                <asp:Label ID="lblCONTACTO" runat="server"><%# Eval("CONTACTO")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtCONTACTO" runat="server" Text='<%# Bind("CONTACTO")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TELEFONO">
                            <ItemTemplate>
                                <asp:Label ID="lblTELEFONO" runat="server"><%# Eval("TELEFONO")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtTELEFONO" runat="server" Text='<%# Bind("TELEFONO")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="CORREO">
                            <ItemTemplate>
                                <asp:Label ID="lblCORREO" runat="server"><%# Eval("CORREO")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtCORREO" runat="server" Text='<%# Bind("CORREO")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="LICENCIA">
                            <ItemTemplate>
                                <asp:Label ID="lblIdLicencia" runat="server"><%# Eval("IdLicencia")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtIdLicencia" runat="server" Text='<%# Bind("IdLicencia")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ESTATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblEstatusEstado" runat="server"><%# Eval("EstatusEstado")%></asp:Label>
                                
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtEstatusEstado" runat="server" Text='<%# Bind("EstatusEstado")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>




                    </Columns>

                </asp:GridView>

            </div><!-- /.box-body -->
          </div>  


        </ContentTemplate>
    </asp:UpdatePanel>



    <!-- jQuery 3 -->
    <%--<script src="../bower_components/jquery/dist/jquery.min.js"></script>--%>
    <!-- Bootstrap 3.3.7 -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <%--<script src="../dist/js/adminlte.min.js"></script>--%>
    <!-- AdminLTE for demo purposes -->
    <%--<script src="../dist/js/demo.js"></script>--%>
    <!-- page script -->



    <!-- Mirrored from adminlte.io/themes/AdminLTE/pages/tables/data.html by HTTrack Website Copier/3.x [XR&CO'2010], Mon, 27 Aug 2018 16:46:30 GMT -->
    <!-- Added by HTTrack -->
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <!-- /Added by HTTrack -->
</asp:Content>

