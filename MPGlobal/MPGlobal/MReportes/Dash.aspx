<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Dash.aspx.cs" Inherits="Dash" %>







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




            <div class="well form-horizontal" id="Dvform">
                <fieldset>







                    <div class="form-group">
                        <div class="row">


                            <div class="col-lg-1">
                                <div class="input-group"></div>
                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>ESTADO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-globe"></i>
                                        </div>
                                    

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
                                      


                                    </div>



                                </div>

                            </div>



                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>TIPO INFRACCION:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-car"></i>
                                        </div>
                                       


                                    </div>



                                </div>

                            </div>







                            <div class="col-lg-2">
                                <div class="input-group">
                                    <label>ESTATUS:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-gear"></i>
                                        </div>
                                        
                                    </div>



                                </div>

                            </div>



                        </div>

                    </div>

                    <br />
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                                <div class="input-group"></div>
                            </div>

                            <div class="col-lg-2">
                                <div class="input-group">
                                    <label>FECHA INICIAL:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        
                                    </div>



                                </div>

                            </div>




                            <div class="col-lg-2">
                                <div class="input-group">
                                    <label>FECHA FINAL:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                    
                                    </div>



                                </div>

                            </div>


                            <div class="col-lg-2">
                                <div class="input-group">
                                    <label>ESTATUS:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-gear"></i>
                                        </div>
                                       

                                    </div>



                                </div>

                            </div>



                            <div class="col-lg-3">
                                <div class="input-group">
                                    <br />


                                   

                                </div>

                            </div>



                        </div>

                    </div>













                    <br />

                    <div class="col-xs-12">
                        
                        <div class="box">

                            <div class="box-body">


                                <asp:GridView ID="gvReportes" CssClass="table table-bordered bs-table" runat="server">
                                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#ffffcc" />
                                    <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered" />
                                    <EmptyDataTemplate>
                                        ¡No hay Datos con los parametros seleccionados!  
                                    </EmptyDataTemplate>
                                </asp:GridView>


                                <%--<table id="tbEncabezado"  class="table table-bordered table-striped">
                                 <thead>
                                        <tr>
                                            <th style="text-align: center">PLACA</th>
                                            <th style="text-align: center">FECHA PAGO</th>
                                            <th style="text-align: center">MONTO PAGO</th>
                                         
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

                                </table>--%>
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



          
            <%--                <asp:AsyncPostBackTrigger ControlID="cboTipoMulta" EventName="SelectedIndexChanged" />

                  <asp:PostBackTrigger ControlID="txtdatepicker" />--%>

            <%--<asp:PostBackTrigger ControlID="txtImporte" />--%>
        </Triggers>

    </asp:UpdatePanel>








    <style type="text/css">
        .Titulo {
            text-align: center;
        }
    </style>
    <script src="../Scripts/sweetalert2.all.min.js"></script>

    <%--Para que funcione el datapicker--%>
<%--    <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>--%>

    <script src="../master/jquery213.js"></script>

    <%--Fin--%>
    <script src="../Scripts/jquery.maskMoney.js"></script>


    <%-- <script type="text/javascript">
        

        function Datapicker() {
            $('#txtFechaIni').datetimepicker({
                format: 'DD/MM/YYYY'
            });

            $('#txtFechaFin').datetimepicker({
                format: 'DD/MM/YYYY'
            });

        }
        $(function () {
            Datapicker();

        });



         
    </script>--%>


    <script type="text/javascript">



        $(document).ready(function () {
            SetDatePicker();
            SetDatePicker2();
        });

    
        //On Page Load.
        $(function () {
            SetDatePicker();
            SetDatePicker2();
        });

        //On UpdatePanel Refresh.
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    SetDatePicker();
                    SetDatePicker2();
                }
            });
        };

       




    </script>


</asp:Content>



