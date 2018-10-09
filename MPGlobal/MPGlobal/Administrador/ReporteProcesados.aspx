<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="ReporteProcesados.aspx.cs" Inherits="ReporteProcesados" %>


<%@ Register Src="~/Administrador/UserControl/ucCatReporte.ascx" TagPrefix="uc1" TagName="ucCatReporte" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="box-header">
        <h3 class="box-title">Reporte de Procesados</h3>
        <br />
        <div class="form-inline ">

            <%--  <label class="control-label">Reporte de Multas Pagadas</label>--%>
        </div>

    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="box">

                <div id="AddFiltros" class="panel panel-default" style="margin: 1% 2% 2% 2%;">

                    <div class="panel-body">
                        <div class="form-inline col-auto">
                            <div class="form-group">

                                <div class="input-group date" id="datetimepicker1" data-date-format="dd-mm-yyyy">
                                    <asp:TextBox ID="txtFechaIni" runat="server" CssClass="form-control campo_obligatorio input-group-addon" placeholder="Fecha Inicial"></asp:TextBox>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>

                                </div>


                                <div class="input-group date" id="datetimepicker2" data-date-format="dd-mm-yyyy">
                                    <asp:TextBox ID="txtFechaFin" runat="server" CssClass="form-control campo_obligatorio  input-group-addon" placeholder="Fecha Final"></asp:TextBox>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>

                                </div>

                                <asp:LinkButton ID="LinkBtnConsulta" runat="server" class="btn btn-default btn-sm" CommandName="LinkBtnConsulta" OnClick="LinkBtnConsulta_Click" type="button">
                                            <span class="glyphicon glyphicon-search"></span>Consultar
                                </asp:LinkButton>
                                <a class="btn btn-default btn-sm" data-target="#modalCompletaInformacion" data-toggle="modal">
                                    <span class="glyphicon glyphicon-transfer"></span>Procesar
                                </a>

                            </div>
                        </div>
                    </div>
                </div>

                <%--  --%>
                <!-- /.box-header -->
                <div class="box-body">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" EmptyDataText="No hay registros que mostrar" AutoGenerateColumns="false" ClientIDMode="Static" CssClass="table table-bordered table-striped" PageSize="8">

                        <Columns>
                            <%--botones de acción sobre los registros...--%>
                            <asp:TemplateField HeaderStyle-Width="16%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
<<<<<<< HEAD
                                    
                                    <a class="btn btn-default btn-sm" onclick=' Var(<%# Eval("IdProcesado")%>,<%# Eval("MontoPagoMpoGenera")%>,<%# Eval("MontoPagoMpoCobra")%>,<%# Eval("MontoPagoEmpresa")%>)'>
                                        <span class=""></span>Seleccionar
                                    </a>
=======
                                    <%--CheckBox para seleccionar registros...--%>
                                    <asp:CheckBox ID="CheckBoxMulta" Checked="true" runat="server" />

>>>>>>> d56a41015789c013c0af8e7f0f9d5c6c5d034d39
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ESTADO">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server"><%# Eval("nomEstado")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdEstado" runat="server" Value='<%# Eval("IdEstado") %>' />

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="MUNICIPIO">
                                <ItemTemplate>
                                    <asp:Label ID="lblMunicipio" runat="server"><%# Eval("nomMunicipio")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdMunicipio" runat="server" Value='<%# Eval("IdMunicipio") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="BOLETA">
                                <ItemTemplate>
                                    <asp:Label ID="lblBoleta" runat="server"><%# Eval("IdBoleta")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdBoleta" runat="server" Value='<%# Eval("IdBoleta") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TIPO MULTA">
                                <ItemTemplate>
                                    <asp:Label ID="lblTipoMulta" runat="server"><%# Eval("Descripcion")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdMulta" runat="server" Value='<%# Eval("IdMulta") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="IMPORTE">
                                <ItemTemplate>
                                    <asp:Label ID="lblIMPORTE" runat="server"><%# Eval("Cantidad")%></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="DESCUENTO">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescuento" runat="server"><%# Eval("AplicaDesc")%></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TOTAL">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotal" runat="server"><%# Eval("Total")%></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>



                <!-- /.box-body -->
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="modalCompletaInformacion" class="modal fade modal-small" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Completa la siguiente información</h4>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <div class="inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control campo_obligatorio" placeholder="DESCRIPCIÓN"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12 right">
                                <br />
                                <asp:LinkButton CssClass="btn btn-default btn-sm" ID="lnkContinuar" runat="server" OnClick="lnkContinuar_Click" data-target="#modalCompletaInformacion" OnClientClick="javascript:validaCampos(this,event);" Text="Continuar"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <style type="text/css">
    .Titulo {
        text-align: center;
    }
</style>
<script src="../Scripts/sweetalert2.all.min.js"></script>

<%--Para que funcione el datapicker--%>
<link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />
<link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<%--Fin--%>



<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginReq);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);

    function beginReq(sender, args) {
    }

    function endReq(sender, args) {
        Datapicker();
        if($('#GridView1').find('thead').size() > 0)
            $('#GridView1').DataTable({
                language: {
                    search: 'Buscar: ',
                    info: 'Mostrar _START_ a _END_ de _TOTAL_ registros',
                    lengthMenu: 'Mostrar _MENU_ registros',
                    zeroRecords: 'No se encontraron registros con esa coincidencia',
                    infoEmpty: 'Mostrando 0 registros',
                    infoFiltered: '(Filtrado de _MAX_ registros en total)',
                    paginate: {first: "Primero", last:"Ultimo", next:"Siguiente",  previous:"Anterior"} 
                       
                }
            });
    }

    function Datapicker() {
        $('#datetimepicker1').datetimepicker({
            format: 'DD/MM/YYYY'
        });

        $('#datetimepicker2').datetimepicker({
            format: 'DD/MM/YYYY'
        });

    }
    $(function () {
        Datapicker();

    });



</script>
<script type="text/javascript">
          
    function Success() {

        swal({
            position: 'top-end',
            type: 'success',
            title: 'Multas Procesadas exitosamente',
            showConfirmButton: true
            //timer: 1500

        });
    }

</script>
</asp:Content>



