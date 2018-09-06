<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogos - Copia.aspx.cs" Inherits="Catalogos" %>

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
                closeOnConfirm: false
            },
                function () {
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
            })
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
                    <div class="row">

                        <label class="col-md-1 control-label" style="width: 7%;">Catalogos</label>
                        <div class="col-md-4 selectContainer" style="width: 31%;">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="DropCatalogos" AutoPostBack="true" runat="server" name="department" class="form-control selectpicker" OnSelectedIndexChanged="DropCatalogos_SelectedIndexChanged">
                                    <asp:ListItem>Selecciona el catalogo</asp:ListItem>
                                    <asp:ListItem>Estados</asp:ListItem>
                                    <asp:ListItem>Municipios</asp:ListItem>
                                    <asp:ListItem>Oficinas</asp:ListItem>

                                </asp:DropDownList>


                            </div>

                        </div>
                        <div class="col-md-1 selectContainer">
                            <asp:LinkButton ID="btnNew" runat="server" type="button" class="btn btn-default btn-sm" CommandName="NUEVO">
                                            <span class="glyphicon glyphicon-plus"></span>AGREGAR
                            </asp:LinkButton>
                        </div>


                    </div>

                </div>


                <!-- /.box-header -->
                <div class="box-body">



                    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="8" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_Rowupdating" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <%--Paginador...--%>
                      <%--  <PagerTemplate>
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


                    <%-- <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Rendering engine</th>
                                <th>Browser</th>
                                <th>Platform(s)</th>
                                <th>Engine version</th>
                                <th>CSS grade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Trident</td>
                                <td>Internet
                    Explorer 4.0
                  </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet
                    Explorer 5.0
                  </td>
                                <td>Win 95+</td>
                                <td>5</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet
                    Explorer 5.5
                  </td>
                                <td>Win 95+</td>
                                <td>5.5</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet
                    Explorer 6
                  </td>
                                <td>Win 98+</td>
                                <td>6</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 7</td>
                                <td>Win XP SP2+</td>
                                <td>7</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>AOL browser (AOL desktop)</td>
                                <td>Win XP</td>
                                <td>6</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Firefox 1.0</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td>1.7</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Firefox 1.5</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Firefox 2.0</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Firefox 3.0</td>
                                <td>Win 2k+ / OSX.3+</td>
                                <td>1.9</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Camino 1.0</td>
                                <td>OSX.2+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Camino 1.5</td>
                                <td>OSX.3+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Netscape 7.2</td>
                                <td>Win 95+ / Mac OS 8.6-9.2</td>
                                <td>1.7</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Netscape Browser 8</td>
                                <td>Win 98SE+</td>
                                <td>1.7</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Netscape Navigator 9</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.0</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.1</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1.1</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.2</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1.2</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.3</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1.3</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.4</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1.4</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.5</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1.5</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.6</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>1.6</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.7</td>
                                <td>Win 98+ / OSX.1+</td>
                                <td>1.7</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Mozilla 1.8</td>
                                <td>Win 98+ / OSX.1+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Seamonkey 1.1</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Gecko</td>
                                <td>Epiphany 2.20</td>
                                <td>Gnome</td>
                                <td>1.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>Safari 1.2</td>
                                <td>OSX.3</td>
                                <td>125.5</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>Safari 1.3</td>
                                <td>OSX.3</td>
                                <td>312.8</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>Safari 2.0</td>
                                <td>OSX.4+</td>
                                <td>419.3</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>Safari 3.0</td>
                                <td>OSX.4+</td>
                                <td>522.1</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>OmniWeb 5.5</td>
                                <td>OSX.4+</td>
                                <td>420</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>iPod Touch / iPhone</td>
                                <td>iPod</td>
                                <td>420.1</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Webkit</td>
                                <td>S60</td>
                                <td>S60</td>
                                <td>413</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 7.0</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 7.5</td>
                                <td>Win 95+ / OSX.2+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 8.0</td>
                                <td>Win 95+ / OSX.2+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 8.5</td>
                                <td>Win 95+ / OSX.2+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 9.0</td>
                                <td>Win 95+ / OSX.3+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 9.2</td>
                                <td>Win 88+ / OSX.3+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera 9.5</td>
                                <td>Win 88+ / OSX.3+</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Opera for Wii</td>
                                <td>Wii</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Nokia N800</td>
                                <td>N800</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Presto</td>
                                <td>Nintendo DS browser</td>
                                <td>Nintendo DS</td>
                                <td>8.5</td>
                                <td>C/A<sup>1</sup></td>
                            </tr>
                            <tr>
                                <td>KHTML</td>
                                <td>Konqureror 3.1</td>
                                <td>KDE 3.1</td>
                                <td>3.1</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>KHTML</td>
                                <td>Konqureror 3.3</td>
                                <td>KDE 3.3</td>
                                <td>3.3</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>KHTML</td>
                                <td>Konqureror 3.5</td>
                                <td>KDE 3.5</td>
                                <td>3.5</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Tasman</td>
                                <td>Internet Explorer 4.5</td>
                                <td>Mac OS 8-9</td>
                                <td>-</td>
                                <td>X</td>
                            </tr>
                            <tr>
                                <td>Tasman</td>
                                <td>Internet Explorer 5.1</td>
                                <td>Mac OS 7.6-9</td>
                                <td>1</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>Tasman</td>
                                <td>Internet Explorer 5.2</td>
                                <td>Mac OS 8-X</td>
                                <td>1</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>NetFront 3.1</td>
                                <td>Embedded devices</td>
                                <td>-</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>NetFront 3.4</td>
                                <td>Embedded devices</td>
                                <td>-</td>
                                <td>A</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>Dillo 0.8</td>
                                <td>Embedded devices</td>
                                <td>-</td>
                                <td>X</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>Links</td>
                                <td>Text only</td>
                                <td>-</td>
                                <td>X</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>Lynx</td>
                                <td>Text only</td>
                                <td>-</td>
                                <td>X</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>IE Mobile</td>
                                <td>Windows Mobile 6</td>
                                <td>-</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>Misc</td>
                                <td>PSP browser</td>
                                <td>PSP</td>
                                <td>-</td>
                                <td>C</td>
                            </tr>
                            <tr>
                                <td>Other browsers</td>
                                <td>All others</td>
                                <td>-</td>
                                <td>-</td>
                                <td>U</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Rendering engine</th>
                                <th>Browser</th>
                                <th>Platform(s)</th>
                                <th>Engine version</th>
                                <th>CSS grade</th>
                            </tr>
                        </tfoot>
                    </table>--%>
                </div>
                <!-- /.box-body -->
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

