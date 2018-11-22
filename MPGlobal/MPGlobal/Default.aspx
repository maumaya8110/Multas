<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MPMasterPage.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

     
    <script src="MReportes/Scripts/jquery.min.js"></script>
    <script src="MReportes/Scripts/funciones.js"></script>

        <script src="MReportes/Scripts/chart/highcharts.js"></script>
    <script src="MReportes/Scripts/chart/modules/data.js"></script>
    <script src="MReportes/Scripts/chart/modules/exporting.js"></script>

  
    <script language="javascript" type="text/javascript">

        function graficar() {
            colors = ['#4897f1', '#910000', '#FF0000', '#CCFFCC', '#C0C0C0', '#CCCCFF', '#FFCCE5', '#FFFFCC', '#FF6666', '#CCFFE5'];
            func.CreaBarrasMulti('#graf1', '#MainContent_hdngraf1ley', '#MainContent_hdngraf1a', '#MainContent_hdngraf1b', '', 'MULTAS PENDIENTES', 'MULTAS PAGADAS', 'MULTAS', '', colors);


            func.CreaPie('#graf3', 'AVANCE COBRANZA', '#MainContent_hdngrafPie', '%', colors, false);

        };



    </script>



    <div id="container">
        <div id="wrapper">


            <div id="page-wrapper">

                <div class="form-group" style="background-color:white;">
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bar-chart-o fa-fw"></i>GRAFICA DE MULTAS
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-lg-1">
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="input-group">

                                            <div id="graf3" class="col-lg-4 col-md-12" style="min-width: 350px; width: 350px; height: 342px; margin: 0;"></div>

                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="input-group">

                                            <div id="graf1" class="col-lg-4 col-md-12" style="min-width: 350px; width: 450px; height: 370px; margin: 0;">
                                            </div>


                                        </div>
                                    </div>
                                    <div class="col-lg-1">
                                    </div>
                                    <!-- /.input group -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input id="hdngraf1a" name="hdngraf1a" type="hidden" runat="server" />
        <input id="hdngraf1b" name="hdngraf1b" type="hidden" runat="server" />
        <input id="hdngraf1ley" name="hdngraf1ley" type="hidden" runat="server" />
        <input id="hdngraf2a" name="hdngraf2a" type="hidden" runat="server" />
        <input id="hdngraf2b" name="hdngraf2b" type="hidden" runat="server" />
        <input id="hdngraf2ley" name="hdngraf2ley" type="hidden" runat="server" />

        <input id="hdndatos1" name="hdndatos1" type="hidden" runat="server" />
        <input id="hdnidfilmina" name="hdnidfilmina" type="hidden" runat="server" />

        <input id="hdngrafPie" name="hdngrafPie" type="hidden" runat="server" />

    </div>


</asp:Content>
