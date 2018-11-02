<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Cancelacion.aspx.cs" Inherits="Cancelacion" %>





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
        <h3 class="box-title">Cancelar Multas</h3>
        <br />
        <div>

           


            <%--  <label class="control-label">Reporte de Multas Pagadas</label>--%>
        </div>

    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>




            <div class="well form-horizontal" action="" method="post" id="Dvform">
                <fieldset>







                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>RECIBO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-car"></i>
                                        </div>

                                        <%--<input type="text" class="form-control" placeholder="Search" id="txtPlaca" runat="server">--%>

                                        <asp:TextBox ID="txtRecibo" class="form-control" runat="server"></asp:TextBox>

                                        <div class="input-group-btn">
                                            <%-- <button class="btn btn-default" type="submit" onclick="Buscar();">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>--%>

                                            <asp:Button ID="btnConsultar" class="btn btn-instagram" runat="server" Text="Consultar" OnClick="btnConsultar_Click"  />

                                        </div>
                                    </div>



                                </div>

                            </div>




                            <div class="col-lg-3">
                                <div class="input-group">
                                </div>
                            </div>


                            
                        </div>

                    </div>



                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-1">
                                </div>
                                <div class="col-lg-5">
                                    <div class="input-group">
                                        <label>MOTIVO:</label>

                                        <div class="input-group date">
                                            
                                            <asp:TextBox ID="txtMotivoCancelacion" Style="text-transform: uppercase;" class="form-control pull-right" Width="600"  runat="server" placeholder="TECLEE MOTIVOS"></asp:TextBox>


                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-3">
                                    <div class="input-group">
                                        
                                        <div class="input-group date">
                                           
                                                                                            <asp:Button ID="BtnCancelar" class="btn btn-warning" runat="server" Text="CANCELAR" OnClick="BtnCancelar_Click" />
                                        </div>

                                    </div>

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
                                                <th style="text-align: center">PLACA</th>
                                                <th style="text-align: center">FECHA PAGO</th>
                                                <th style="text-align: center">MONTO PAGO</th>
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
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <br>
                                    </div>
                                </div>
                </fieldset>
            </div>
            <input id="hdnRecPago" name="hdnRecPago" type="hidden" runat="server" />
            <%--<asp:Button ID="cmdBuscar" Style="display: none; visibility: hidden" runat="server" OnClick="cmdBuscar_Click" />--%>
        </ContentTemplate>

        <Triggers>
            <%--  cboAgente--%>


            <%--<asp:AsyncPostBackTrigger ControlID="cboAgente" EventName="SelectedIndexChanged" />    --%>
            <%--<asp:AsyncPostBackTrigger ControlID="cboEdo" EventName="SelectedIndexChanged" />--%>

            <%--<asp:AsyncPostBackTrigger ControlID="cboMunicipio" EventName="SelectedIndexChanged" />--%>

            <%--                <asp:AsyncPostBackTrigger ControlID="cboTipoMulta" EventName="SelectedIndexChanged" />

                  <asp:PostBackTrigger ControlID="txtdatepicker" />--%>

            <%--<asp:PostBackTrigger ControlID="txtImporte" />--%>
        </Triggers>

    </asp:UpdatePanel>



    <script>
        function myFunction() {
            //window.print();


            var placa = document.getElementById("MainContent_txtPlaca").value;
            //alert(placa);

            if (placa != "") {
                window.open('Multas.aspx?Pl=' + placa + "&t=1", '_blank');
            }
            else { alert("Capture una Placa para revisar su Edo de Cuenta."); }


        }


        function myPago() {
            //window.print();


            var rec = document.getElementById("MainContent_hndEliminar").value;
            //alert(placa);

            if (recp != "") {
                window.open('Pago.aspx?Id=' + recp + "&t=2", '_blank');
            }
            else { alert("Error."); }


        }


    </script>


    <script type="text/javascript">




        function Buscar() {

            // document.getElementById("MainContent_hndEliminar").value = renglon;

            if (document.getElementById("MainContent_txtPlaca").value != "") { document.getElementById("MainContent_cmdBuscar").click(); }
            else {
                alert("Favor de teclear numero de placa valido.");
            }
        }


           //function Pago() {

           // // document.getElementById("MainContent_hndEliminar").value = renglon;

           // if (document.getElementById("MainContent_hdnRecPago").value != "") { document.getElementById("MainContent_cmdBuscar").click(); }
           // else {
           //     alert("Favor de teclear numero de placa valido.");
           // }
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
    <script src="../Scripts/jquery.maskMoney.js"></script>


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






        //$("#MainContent_txtImporte").maskMoney({

        //    // The symbol to be displayed before the value entered by the user
        //    prefix: 'MXN$ ',
        //    //prefix: '',

        //    // The suffix to be displayed after the value entered by the user(example: "1234.23 €"). 
        //    suffix: "",

        //    // Delay formatting of text field until focus leaves the field
        //    formatOnBlur: false,

        //    // Prevent users from inputing zero
        //    allowZero: false,

        //    // Prevent users from inputing negative values
        //    allowNegative: true,

        //    // Allow empty input values, so that when you delete the number it doesn't reset to 0.00. 
        //    allowEmpty: false,

        //    // Select text in the input on double click
        //    doubleClickSelection: true,

        //    // Select all text in the input when the element fires the focus event. 
        //    selectAllOnFocus: false,

        //    // The thousands separator
        //    thousands: ',',

        //    // The decimal separator
        //    decimal: '.',

        //    // How many decimal places are allowed
        //    precision: 2,

        //    // Set if the symbol will stay in the field after the user exits the field. 
        //    affixesStay: false,

        //    // Place caret at the end of the input on focus 
        //    bringCaretAtEndOnFocus: true

        //});
    </script>

    <script type="text/javascript">


        function ValidarNumFloat(e, obj) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;

            Punto = obj.value.split('.');
            if (Punto.length >= 2) {
                patron = /[0-9]/;
            } else
                patron = /[0-9.]/;
            te = String.fromCharCode(tecla);

            return patron.test(te);
        }


        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
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



