<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCatTipoMulta.ascx.cs" Inherits="Administrador_UserControl_ucCatTipoMulta" %>

<style type="text/css">
    .Titulo {
        text-align: center;
    }
</style>
<script src="../Scripts/sweetalert2.all.min.js"></script>
<script type="text/javascript">

    function QuestionDelete(IdTipoMulta) {
        swal({
            title: "Estas seguro de eliminar el registro?",
            text: "No podrás recuperarlo!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si, eliminarlo!",
            closeOnConfirm: false
        },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Eliminado!", "El registro ha sido eliminado.", "success");

                    document.getElementById('<%= HiddenField1AutEli.ClientID %>').value = IdTipoMulta;
                    //return true;
                    document.getElementById('<%= BtnElimina.ClientID %>').click();


                    //return true;

                }

            });
    }



    function Success() {

        swal({
            position: 'top-end',
            type: 'success',
            title: 'La modificación ha sido exitosa',
            showConfirmButton: false,
            timer: 1500

        });
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

    function DeleteSuccess() {

        swal({
            position: 'top-end',
            type: 'success',
            title: 'Eliminación exitosa',
            showConfirmButton: false,
            timer: 1500

        });
    }
</script>

<asp:HiddenField ID="HiddenField1AutEli" runat="server" />

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


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="box">
            <asp:Button ID="BtnElimina" runat="server" Style="visibility: hidden;" OnClick="BtnElimina_Click" Text="btnElimina" />


            <asp:UpdatePanel ID="UpdtAgregarTipoMulta" runat="server" Visible="false">

                <ContentTemplate>
                    <div class="panel panel-default" id="AddTipoMulta" style="margin: 1% 2% 2% 2%;">
                        <div class="panel-heading">Alta de TipoMulta</div>
                        <div class="panel-body">
                            <div class="form-inline col-auto">
                                <div class="form-group">
                                    <%--DropEstado--%>
                                    <div class="form-group">
                                        <div class="inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                <asp:DropDownList ID="DropEstados" runat="server" CssClass="form-control selectpicker campo_obligatorio">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <%--DropMpo--%>
                                    <div class="form-group">
                                        <div class="inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                <asp:DropDownList ID="DropMpos" runat="server" CssClass="form-control selectpicker campo_obligatorio">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <asp:TextBox ID="txtTipoMulta" runat="server" placeholder="TipoMulta" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                    <asp:TextBox ID="txtURL" runat="server" placeholder="URL" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                   
                                    <asp:LinkButton ID="LinkBtnAlta" runat="server" type="button" class="btn btn-default btn-sm" CommandName="LinkBtnAlta" OnClick="LinkBtnAlta_Click" data-target="#AddTipoMulta" OnClientClick="javascript:validaCampos(this,event);">
                                            <span class="glyphicon glyphicon-plus"></span>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <%--  --%>


            <!-- /.box-header -->
            <div class="box-body">

                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="8" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_Rowupdating" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="16%">
                            <ItemTemplate>
                                <%--Botones de eliminar y editar cliente...--%>



                                <asp:LinkButton ID="btnEdit" runat="server" ToolTip="EDITAR" type="button" class="btn btn-default btn-xs" CommandName="Edit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                </asp:LinkButton>
                                <%--OnClientClick="return QuestionDelete();" OnClick="btnDelete_Click" OnClientClick="QuestionDelete();" AutoPostBack="false"--%>
                                <%--<asp:LinkButton ID="btnDelete" runat="server" ToolTip="ELIMINAR" type="button" class="btn btn-default btn-xs" CommandName="Delete">
                                            <span class="glyphicon glyphicon-trash"></span>
                                    </asp:LinkButton>--%>
                                <a class="btn btn-default btn-xs" onclick="QuestionDelete('<%# Eval("IdTipoMulta")%>');" tooltip="ELIMINAR"><span class="glyphicon glyphicon-trash"></span></a>



                                <%--  <asp:Button ID="btnDelete" runat="server" Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('¿Eliminar cliente?');" />
                                    <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--Botones de grabar y cancelar la edición de registro OnClientClick="Success();"...--%>
                                <asp:LinkButton ID="btnUpdate" runat="server" type="button" class="btn btn-default btn-xs" CommandName="Update">
                                            <span class="glyphicon glyphicon-floppy-disk"></span> GRABAR
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnCancel" runat="server" type="button" class="btn btn-default btn-xs" CommandName="Cancel">
                                            <span class="glyphicon glyphicon-remove-circle"></span> CANCELAR
                                </asp:LinkButton>

                                <%-- <asp:Button ID="btnUpdate" runat="server" Text="Grabar" CssClass="btn btn-success" CommandName="Update" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del cliente?');" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />--%>
                            </EditItemTemplate>
                        </asp:TemplateField>




               
                       
                        <%--campos editables...--%>
             

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TIPO MULTA">
                            <ItemTemplate>
                                
                                <asp:Label ID="lblNomTipoMulta" runat="server"><%# Eval("NomTipoMulta")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtNomTipoMulta" runat="server" Text='<%# Bind("NomTipoMulta")%>' CssClass="form-control"></asp:TextBox>
                                <asp:HiddenField ID="HiddenIdTipoMulta" runat="server" Value=<%# Eval("IdTipoMulta") %> ></asp:HiddenField>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="URL">
                            <ItemTemplate>
                                <asp:Label ID="lblURL" runat="server"><%# Eval("URL")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtURL" runat="server" Text='<%# Bind("URL")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                       
                                   <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ESTADO">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server"><%# Eval("nomEstado")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                              <div class="form-group">
                                        <div class="inputGroupContainer">
                                            <div class="input-group">
                                                <asp:DropDownList ID="DropEstado" runat="server" CssClass="form-control selectpicker campo_obligatorio">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="HiddenIdEstado" runat="server" Value='<%# Eval("IdEstado") %>'></asp:HiddenField>
                                            </div>
                                        </div>
                                    </div>

                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="MUNICIPIO">
                            <ItemTemplate>
                                <asp:Label ID="lblMunicipio" runat="server"><%# Eval("nomMunicipio")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                              <div class="form-group">
                                        <div class="inputGroupContainer">
                                            <div class="input-group">                                              
                                                <asp:DropDownList ID="DropMpo" runat="server" CssClass="form-control selectpicker campo_obligatorio">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="HiddenIdMunicipio" runat="server" Value='<%# Eval("IdMunicipio") %>'></asp:HiddenField>
                                            </div>
                                        </div>
                                    </div>

                            </EditItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="ESTATUS">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkEstatusTipoMulta" runat="server" Checked='<%# bool.Parse(Eval("Estatus").ToString()) %>' Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkEstatusTipoMulta" runat="server" Checked='<%# bool.Parse(Eval("Estatus").ToString()) %>' Enabled="true" />
                            </EditItemTemplate>
                        </asp:TemplateField>




                    </Columns>

                </asp:GridView>

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
