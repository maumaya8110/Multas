<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="DescarteMulta.aspx.cs" Inherits="Caja_DescarteMulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updDescargaMulta" runat="server">
        <ContentTemplate>
            <div id="AddFiltros" class="panel panel-default" style="margin: 1% 2% 2% 2%;">
                <div class="panel-body">
                    <div class="form-inline col-auto">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-list-alt"></span></span>
                                <asp:TextBox ID="txtPlaca" runat="server" CssClass="form-control" placeholder="Placa"></asp:TextBox>
                            </div>
                        </div>
                        <asp:LinkButton ID="lnkBuscaMulta" runat="server" CssClass="btn btn-default btn-sm" OnClick="btnBuscarMulta_Click">
                      <span class="glyphicon glyphicon-search"></span>Consultar
                        </asp:LinkButton>
                        <a id="lnkModalInfoDescartar" runat="server" class="btn btn-default btn-sm" onclick="javascript:abreModalDescartar();" visible="false">
                            <span class="glyphicon glyphicon-transfer"></span>Descartar
                        </a>
                    </div>
                </div>
            </div>
            <br />
            <div class="box-body">

                <asp:GridView ID="grdDetalleMultas" runat="server" Width="100%" EmptyDataText="No hay registros que mostrar" AllowPaging="true" PageSize="8" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-hover table-bordered table-striped">
                    <Columns>
                        <%--botones de acción sobre los registros...--%>
                        <asp:TemplateField HeaderStyle-Width="16%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%--CheckBox para seleccionar registros...--%>
                                <asp:CheckBox ID="CheckBoxMulta" Checked="true" runat="server" />

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
                                <asp:Label ID="lblIMPORTE" runat="server"><%# Eval("TotalPago")%></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="DESCUENTO">
                            <ItemTemplate>
                                <asp:Label ID="lblDescuento" runat="server"><%# Eval("AplicaDesc")%></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>

            <div id="modalCompletaInformacion" class="modal fade modal-small" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Descartar multas</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <p>Por favor proporciona la siguiente información</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <div class="inputGroupContainer">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <asp:TextBox ID="txtRecibo" runat="server" CssClass="form-control campo_obligatorio" placeholder="Recibo"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <br />
                                        <div class="input-group date" id="datetimepicker1" data-date-format="dd-mm-yyyy">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <asp:TextBox ID="txtFechaPago" runat="server" CssClass="form-control campo_obligatorio input-group-addon" Style="width: 100%; text-align: left;" placeholder="Fecha pago"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <br />
                                        <a class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</a>
                                    </div>
                                    <div class="col-sm-6 text-right">
                                        <br />
                                        <asp:LinkButton CssClass="btn btn-default btn-sm right" ID="lnkDescartar" runat="server" OnClick="lnkDescartar_Click" data-target="#modalCompletaInformacion" OnClientClick="javascript:validaCampos(this,event);" Text="Continuar"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginReq);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);

        function beginReq(sender, args) {
        }

        function endReq(sender, args) {
            formatoFecha();

            $('#grdDetalleMultas').DataTable({
                language: {
                    search: 'Buscar: ',
                    info: 'Mostrar _START_ a _END_ de _TOTAL_ registros',
                    lengthMenu: 'Mostrar _MENU_ registros',
                    zeroRecords: 'No se encontraron registros con esa coincidencia',
                    infoEmpty: 'Mostrando 0 registros',
                    infoFiltered: '(Filtrado de _MAX_ registros en total)',
                    paginate: { first: "Primero", last: "Ultimo", next: "Siguiente", previous: "Anterior" }

                }
            });
        }

        function formatoFecha() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }

        $(document).ready(function () {
            formatoFecha();
        });

        function abreModalDescartar() {
            if ($('#CheckBoxMulta:checked').size() > 0) {
                $('#modalCompletaInformacion').modal('show');
            }
            else {
                swal({
                    title: 'Favor de validar',
                    text: 'Por favor selecciona al menos una multa antes de descartar.',
                    type: 'info',
                    confirmButtonText: 'Aceptar'
                });
            }
        }

        function terminaDescarte() {
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');
            $('#modalCompletaInformacion').modal('hide');
            swal({
                position: 'top-end',
                type: 'success',
                title: 'Se ha hecho el descarte correctamente.',
                showConfirmButton: false,
                timer: 1500

            });
        }
    </script>
      <%--Para que funcione el datapicker--%>

    
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <%--Fin--%>
</asp:Content>
