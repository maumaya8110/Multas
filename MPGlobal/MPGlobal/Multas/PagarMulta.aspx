<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="PagarMulta.aspx.cs" Inherits="PagarMulta" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: White; opacity: 0.7; filter: alpha(Opacity=70)}">
                <span style="border-width: 0px; position: fixed; padding: 10px; background-color: #FFFFFF; font-size: 20px; left: 40%; top: 40%;">Espere un momento...
                        <img alt="" src="Images/loder-gif-7.gif" height="25" />
                </span>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <div class="box-header">
        <h3 class="box-title">Consulta de Multas</h3>
        <br />
        <div class="form-inline ">

            <%--  <label class="control-label">Reporte de Multas Pagadas</label>--%>
        </div>

    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="well form-horizontal" action=" " method="post" id="contact_form">
                <fieldset>




                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>PLACA:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-car"></i>
                                        </div>

                                        <%--<input type="text" class="form-control" placeholder="Search" id="txtPlaca" runat="server">--%>

                                        <asp:TextBox ID="txtPlaca" class="form-control" runat="server"></asp:TextBox>

                                        <div class="input-group-btn">
                                            <%-- <button class="btn btn-default" type="submit" onclick="Buscar();">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>--%>

                                            <asp:Button ID="btnConsultar" class="btn btn-successs" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />

                                        </div>
                                    </div>



                                </div>

                            </div>




                            <div class="col-lg-3">
                                <div class="input-group">
                                </div>
                            </div>


                            <%-- <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>FOLIO:</label>

                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-exclamation"></i>
                                            </div>
                                            <asp:TextBox ID="txtfolio" class="form-control pull-right" runat="server" Enabled="false" placeholder="TECLEE FOLIO" Text="MTY0002120"></asp:TextBox>
                                        </div>
                                       
                                    </div>
                                </div>--%>
                        </div>

                    </div>




                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>ESTADO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-map"></i>
                                        </div>
                                        <%--<asp:TextBox ID="txtEdo" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" Enabled="false" Text="NUEVO LEON"></asp:TextBox>--%>
                                        <asp:DropDownList ID="cboEdo" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboEdo_SelectedIndexChanged"></asp:DropDownList>


                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>MUNICIPIO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-map"></i>
                                        </div>
                                        <asp:DropDownList ID="cboMunicipio" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboMunicipio_SelectedIndexChanged"></asp:DropDownList>

                                    </div>
                                </div>

                            </div>




                            <%--                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>MUNICIPIO:</label>

                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-map-pin"></i>
                                            </div>
                                            <asp:TextBox ID="txtMpo" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" Enabled="false" Text="MONTERREY"></asp:TextBox>
                                        
                                        </div>
                                       
                                    </div>
                                </div>--%>


                            <%--   <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>CAJERO:</label>

                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <asp:TextBox ID="txtusuario" class="form-control pull-right" runat="server" Enabled="false" Text="ADMIN MTY"></asp:TextBox>

                                        </div>
                                        
                                    </div>
                                </div>--%>
                        </div>

                    </div>




                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>NOMBRE(S):</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-street-view"></i>
                                        </div>
                                        <asp:TextBox ID="txtnombre" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE NOMBRE(S)"></asp:TextBox>


                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>APELLIDO PATERNO:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-street-view"></i>
                                        </div>
                                        <asp:TextBox ID="txtapellidop" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE APELLIDO PATERNO"></asp:TextBox>
                                    </div>

                                </div>

                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>APELLIDO MATERNO:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-crosshairs"></i>
                                        </div>
                                        <asp:TextBox ID="txtapellidom" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE APELLIDO MATERNO"></asp:TextBox>
                                    </div>

                                </div>

                            </div>



                        </div>

                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>CALLE Y NUMERO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-street-view"></i>
                                        </div>
                                        <asp:TextBox ID="txtcalle" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE CALLE Y NUMERO"></asp:TextBox>


                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>COLONIA:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-street-view"></i>
                                        </div>
                                        <asp:TextBox ID="txtcolonia" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE COLONIA"></asp:TextBox>
                                    </div>

                                </div>

                            </div>

                            <div class="col-lg-3">

                                <div class="input-group">
                                    <label>RFC:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-crosshairs"></i>
                                        </div>
                                        <asp:TextBox ID="txtRFC" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE RFC"></asp:TextBox>
                                    </div>

                                </div>



                            </div>

                        </div>


                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-1">
                                </div>
                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>CELULAR:</label>

                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-street-view"></i>
                                            </div>
                                            <asp:TextBox ID="txtcelular" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE CELULAR"></asp:TextBox>


                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>CORREO:</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-street-view"></i>
                                            </div>
                                            <asp:TextBox ID="txtemail" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE CORREO ELECTRONICO"></asp:TextBox>
                                        </div>

                                    </div>

                                </div>

                                <div class="col-lg-3">
                                    <%-- <div class="input-group">
                                    <label>RFC:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-crosshairs"></i>
                                        </div>
                                        <asp:TextBox ID="TextBox10" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE RFC"></asp:TextBox>
                                    </div>

                                </div>--%>
                                    <!-- /.input group -->
                                </div>



                            </div>

                        </div>


                        <br />

                        <div class="col-xs-12">

                            <div class="box">

                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">FOLIO</th>
                                                <th style="text-align: center">CONCEPTO MULTA</th>
                                                <th style="text-align: center">MONTO MULTA</th>
                                                <%--<th style="text-align: center">ELIMINAR</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody id="tbcapcitaciones" runat="server">
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td style="text-align: center"></td>
                                                <td style="text-align: center"></td>

                                            </tr>
                                        </tbody>

                                    </table>
                                </div>

                            </div>

                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-1">
                                </div>
                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>Pago de Multas de Transito:</label>

                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-warning"></i>
                                            </div>
                                            <asp:Label ID="lblPlaca" class="form-control pull-right" runat="server" Text=""></asp:Label>

                                        </div>

                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <label>MONTO:</label>

                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-money"></i>
                                            </div>
                                            <asp:Label ID="lblMonto" class="form-control pull-right" runat="server" Text=""></asp:Label>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="input-group">
                                        <label>IMPORTE:</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-crosshairs"></i>
                                            </div>
                                            <asp:TextBox ID="txtImporte" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" placeholder="TECLEE IMPORTE"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>

                            </div>


                            <br />

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-1">
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="input-group">
                                            <%--<label>IMPRIMIR EDO CTA</label>--%>

                                            <div class="input-group date">

                                                <button type="button" onclick="myFunction()" class="btn btn-success">IMPRIMIR EDO CTA<span class="glyphicon glyphicon-send"></span></button>

                                            </div>

                                        </div>
                                        <!-- /.input group -->
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="input-group">
                                            <label>FECHA ACTUALIZACION:</label>

                                            <div class="input-group date">
                                                <asp:Label ID="lblhoy" class="form-control pull-right" runat="server" Text=""></asp:Label>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-2">
                                        <div class="input-group">
                                            <%--<label>PAGAR MULTAS:</label>--%>
                                            <div class="input-group date">

                                                <button type="button" onclick="GUARDAR()" class="btn btn-microsoft">PAGAR MULTAS <span class="glyphicon glyphicon-send"></span></button>
                                            </div>

                                        </div>
                                    </div>

                                </div>





                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <br>
                                    </div>
                                </div>
                </fieldset>
            </div>

            <asp:Button ID="cmdBuscar" Style="display: none; visibility: hidden" runat="server" OnClick="cmdBuscar_Click" />
        </ContentTemplate>

        <Triggers>
            <%--  cboAgente--%>


            <%--<asp:AsyncPostBackTrigger ControlID="cboAgente" EventName="SelectedIndexChanged" />    --%>
            <asp:AsyncPostBackTrigger ControlID="cboEdo" EventName="SelectedIndexChanged" />

            <asp:AsyncPostBackTrigger ControlID="cboMunicipio" EventName="SelectedIndexChanged" />

            <%--                <asp:AsyncPostBackTrigger ControlID="cboTipoMulta" EventName="SelectedIndexChanged" />

                  <asp:PostBackTrigger ControlID="txtdatepicker" />--%>
        </Triggers>

    </asp:UpdatePanel>
    <%-- <div id="modalCompletaInformacion" class="modal fade modal-small" role="dialog">
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
    </div>--%>


    <script>
        function myFunction() {
            window.print();
        }
    </script>


    <script type="text/javascript">




        function Buscar() {

            // document.getElementById("MainContent_hndEliminar").value = renglon;

            if (document.getElementById("MainContent_txtPlaca").value != "")
            { document.getElementById("MainContent_cmdBuscar").click(); }
            else {
                alert("Favor de teclear numero de placa valido.");
            }
        }




    </script>

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



