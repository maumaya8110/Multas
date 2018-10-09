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
                                <%--<a class="btn btn-default btn-sm" data-target="#modalCompletaInformacion" data-toggle="modal">
                                    <span class="glyphicon glyphicon-transfer"></span>Procesar
                                </a>--%>
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
                            <asp:TemplateField HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    
                                    <a class="btn btn-default btn-sm" onclick=' Var(<%# Eval("IdProcesado")%>,<%# Eval("MontoPagoMpoGenera")%>,<%# Eval("MontoPagoMpoCobra")%>,<%# Eval("MontoPagoEmpresa")%>)'>
                                        <span class=""></span>Seleccionar
                                    </a>
                                    <%--CheckBox para seleccionar registros...--%>
                                    <asp:CheckBox ID="CheckBoxMulta" Checked="true" runat="server" />


                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server"><%# Eval("NomEstado")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdEstado" runat="server" Value='<%# Eval("IdEstado") %>' />

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Municipio">
                                <ItemTemplate>
                                    <asp:Label ID="lblMunicipio" runat="server"><%# Eval("NomMunicipio")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdMunicipio" runat="server" Value='<%# Eval("IdMunicipio") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Id">
                                <ItemTemplate>
                                    <asp:Label ID="lblIdProcesado" runat="server"><%# Eval("IdProcesado")%></asp:Label>
                                    <asp:HiddenField ID="HiddenIdProcesado" runat="server" Value='<%# Eval("IdProcesado") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Descripción">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescripcion" runat="server"><%# Eval("Descripcion")%></asp:Label>
                                    <asp:HiddenField ID="HiddenDescripcion" runat="server" Value='<%# Eval("Descripcion") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Fecha Procesado">
                                <ItemTemplate>
                                    <asp:Label ID="lblFechaProcesado" runat="server"><%# Eval("FechaProcesado")%></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Usuario">
                                <ItemTemplate>
                                    <asp:Label ID="lblUsuario" runat="server"><%# Eval("UsuarioProcesado")%></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Monto Municipio Generador">
                                <ItemTemplate>
                                    <asp:Label ID="lblMontoPagoMpoGenera" runat="server"><%# Eval("MontoPagoMpoGenera")%></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Monto Municipio Captador">
                                <ItemTemplate>
                                    <asp:Label ID="lblMontoPagoMpoCobra" runat="server"><%# Eval("MontoPagoMpoCobra")%></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Monto Empresa">
                                <ItemTemplate>
                                    <asp:Label ID="lblMontoPagoEmpresa" runat="server"><%# Eval("MontoPagoEmpresa")%></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>



                <!-- /.box-body -->
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="modalCompletaInformacion" class="modal fade modal-medium" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Seguimiento de pagos</h4>
                </div>
                <div class="modal-body">
                    <div class="container">
                         <asp:Label ID="lblIdP" runat="server" Text="IdProceso"></asp:Label>

                        <table class="table table-bordered">
                            <thead>
                                <tr>

                                    <th scope="col">Monto Municipio Generador</th>
                                    <th scope="col">Monto Municipio Captador</th>
                                    <th scope="col">Monto Empresa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <td>
                                        <%--<div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>--%>
                                            <asp:Label ID="lblM1" runat="server" Text="MontoPagoMpoGenera"></asp:Label>
                                        <%--/div>--%>
                                    </td>
                                    <td>

                                        <asp:Label ID="lblM2" runat="server" Text="MontoPagoMpoCobra"></asp:Label></td>
                                    <td>

                                        <asp:Label ID="lblM3" runat="server" Text="MontoPagoEmpresa"></asp:Label></td>
                                </tr>
                                <tr>

                                    <td>
                                        <div class="input-group date" id="datetimepicker3" data-date-format="dd-mm-yyyy">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <asp:TextBox ID="txtFechaPagoM1" runat="server" CssClass="form-control campo_obligatorio input-group-addon" Style="width: 100%; text-align: left;" placeholder="Fecha pago"></asp:TextBox>

                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group date" id="datetimepicker4" data-date-format="dd-mm-yyyy">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <asp:TextBox ID="txtFechaPagoM2" runat="server" CssClass="form-control campo_obligatorio input-group-addon" Style="width: 100%; text-align: left;" placeholder="Fecha pago"></asp:TextBox>

                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group date" id="datetimepicker5" data-date-format="dd-mm-yyyy">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <asp:TextBox ID="txtFechaPagoM3" runat="server" CssClass="form-control campo_obligatorio input-group-addon" Style="width: 100%; text-align: left;" placeholder="Fecha pago"></asp:TextBox>

                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-sm-12 right">
                                <br />
                                <asp:LinkButton CssClass="btn btn-default btn-sm" ID="lnkGuardar" runat="server" OnClick="lnkGuardar_Click" data-target="#modalCompletaInformacion" OnClientClick="javascript:validaCampos(this,event);" Text="Guardar Modificaciones"></asp:LinkButton>
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
            if ($('#GridView1').find('thead').size() > 0)
                $('#GridView1').DataTable({
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

        function Datapicker() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY'
            });

            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });

            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker4').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker5').datetimepicker({
                format: 'DD/MM/YYYY'
            });

        }
        $(function () {
            Datapicker();

        });



    </script>
    <script type="text/javascript">
        function Var(IdP, M1, M2, M3) {

            $('span[id$="lblIdP"]').text(IdP);
            $('span[id$="lblM1"]').text(M1);
            $('span[id$="lblM2"]').text(M2);
            $('span[id$="lblM3"]').text(M3);

            $('#modalCompletaInformacion').modal('show');

        }

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
