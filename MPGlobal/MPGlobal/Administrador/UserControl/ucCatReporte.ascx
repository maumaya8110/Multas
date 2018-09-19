<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCatReporte.ascx.cs" Inherits="Administrador_UserControl_ucCatReporte" %>

<style type="text/css">
    .Titulo {
        text-align: center;
    }
</style>
<script src="../Scripts/sweetalert2.all.min.js"></script>
<script type="text/javascript">
    $("#datetime").datetimepicker({
        format: 'yyyy-mm-dd hh:ii'
    });
</script>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format: "dd MM yyyy - hh:ii"
    });
</script> 
<script type="text/javascript">




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
            &nbsp;<asp:UpdatePanel ID="UpdtFiltros" runat="server">
                <ContentTemplate>
                    <div id="AddFiltros" class="panel panel-default" style="margin: 1% 2% 2% 2%;">
                        <%--<div class="panel-heading">Reporte de Multas Pagadas</div>--%>
                        <div class="panel-body">
                            <div class="form-inline col-auto">
                                <div class="form-group">

                                    <div class="input-append date form_datetime">
                                        <input size="16" type="text" value="" readonly>
                                        <span class="add-on"><i class="icon-th"></i></span>
                                    </div>

                                    <asp:TextBox ID="txtFechaIni" runat="server" CssClass="form-control campo_obligatorio" placeholder="Fecha Inicial"></asp:TextBox>
                                    <asp:TextBox ID="txtFechaFin" runat="server" CssClass="form-control campo_obligatorio" placeholder="FechaFinal"></asp:TextBox>
                                    <asp:LinkButton ID="LinkBtnConsulta" runat="server" class="btn btn-default btn-sm" CommandName="LinkBtnConsulta" data-target="#AddConsulta" OnClick="LinkBtnConsulta_Click" OnClientClick="javascript:validaCampos(this,event);" type="button">
                                            <span class="glyphicon glyphicon-search"></span>Consultar
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
                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" AutoGenerateColumns="false" ClientIDMode="Static" CssClass="table table-bordered table-striped" PageSize="8">
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
                        <%--CheckBox para seleccionar varios registros...--%><%--   <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70px">
                <ItemTemplate>
                    <asp:CheckBox ID="chkEliminar" runat="server" AutoPostBack="true" OnCheckedChanged="chk_OnCheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>   --%><%--botones de acción sobre los registros...--%>
                        <asp:TemplateField HeaderStyle-Width="16%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%--CheckBox para seleccionar registros...--%>
                                <asp:CheckBox ID="CheckBoxMulta" runat="server" />
                                <%--                                <asp:LinkButton ID="btnEdit" runat="server" ToolTip="EDITAR" type="button" class="btn btn-default btn-xs" CommandName="Edit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                </asp:LinkButton>--%><%-- <a class="btn btn-default btn-xs" onclick="QuestionDelete('<%# Eval("IdEstado")%>');" tooltip="ELIMINAR"><span class="glyphicon glyphicon-trash"></span></a>
                                --%><%--  <asp:Button ID="btnDelete" runat="server" Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('¿Eliminar cliente?');" />
                                    <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />--%>
                            </ItemTemplate>
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
                                            <asp:HiddenField ID="HiddenIdEstado" runat="server" Value='<%# Eval("IdEstado") %>' />
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
                                            <asp:HiddenField ID="HiddenIdMunicipio" runat="server" Value='<%# Eval("IdMunicipio") %>' />
                                        </div>
                                    </div>
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TIPO MULTA">
                            <ItemTemplate>
                                <asp:Label ID="lblTipoMulta" runat="server"><%# Eval("TipoMulta")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtTipoMulta" runat="server" CssClass="form-control" Text='<%# Bind("TipoMulta")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="IMPORTE">
                            <ItemTemplate>
                                <asp:Label ID="lblIMPORTE" runat="server"><%# Eval("IMPORTE")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtIMPORTE" runat="server" CssClass="form-control" Text='<%# Bind("IMPORTE")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Descuento">
                            <ItemTemplate>
                                <asp:Label ID="lblDescuento" runat="server"><%# Eval("Descuento")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtDescuento" runat="server" CssClass="form-control" Text='<%# Bind("Descuento")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TOTAL">
                            <ItemTemplate>
                                <asp:Label ID="lblTotal" runat="server"><%# Eval("Total")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtTotal" runat="server" CssClass="form-control" Text='<%# Bind("Total")%>'></asp:TextBox>
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
