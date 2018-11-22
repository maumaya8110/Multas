<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="CapturaMultas.aspx.cs" Inherits="CapturaMultas" %>


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
                        <img alt="" src="Images/loder-gif-7.gif" height="25px" />
                </span>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <div class="box-header">
        <h3 class="box-title">Captura de Multas</h3>
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
                                    <label>ESTADO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-map"></i>
                                        </div>

                                        <%--<asp:DropDownList ID="cboEdo" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboEdo_SelectedIndexChanged"></asp:DropDownList>--%>
                                        <asp:DropDownList ID="cboEdo" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboEdo_SelectedIndexChanged1"></asp:DropDownList>

                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>





                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>MUNICIPIO:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-map-pin"></i>
                                        </div>

                                        <asp:DropDownList ID="cboMunicipio" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboMunicipio_SelectedIndexChanged"></asp:DropDownList>

                                    </div>
                                    <!-- /.input group -->
                                </div>
                            </div>


                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>USUARIO:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <asp:TextBox ID="txtusuario" class="form-control pull-right" runat="server" Enabled="false" placeholder="TECLEE USUARIO"></asp:TextBox>

                                    </div>
                                    <!-- /.input group -->
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
                                    <label>PLACA:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-car"></i>
                                        </div>
                                        <%--<input type="text" class="form-control pull-right" id="EQWWW">--%>
                                        <asp:TextBox ID="txtPlaca" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" placeholder="TECLEE PLACA" MaxLength="7"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>



                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>ESTADO:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-map"></i>
                                        </div>
                                         
                                        <asp:DropDownList ID="cboEdoPlaca" class="form-control" runat="server"></asp:DropDownList>

                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>





                            <div class="col-lg-3">
                                <div class="input-group">
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>LICENCIA:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-address-card"></i>
                                        </div>

                                        <asp:TextBox ID="txtlicencia" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" placeholder="TECLEE NO LICENCIA"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>



                            <%--                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>FOLIO:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-exclamation"></i>
                                        </div>
                                        <asp:TextBox ID="txtfolio" class="form-control pull-right" runat="server" Enabled="false"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
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
                                    <label>CALLE 1:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-street-view"></i>
                                        </div>
                                        <asp:TextBox ID="txtCalle1" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE CALLE 1" MaxLength="50"></asp:TextBox>


                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>CALLE 2:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-street-view"></i>
                                        </div>
                                        <asp:TextBox ID="txtCalle2" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE CALLE 2" MaxLength="50"></asp:TextBox>
                                    </div>

                                </div>
                                <!-- /.input group -->
                            </div>

                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>CRUCERO:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-crosshairs"></i>
                                        </div>
                                        <asp:TextBox ID="txtCrucero" Style="text-transform: uppercase;" class="form-control pull-right" Width="250" runat="server" placeholder="TECLEE CRUCERO" MaxLength="50"></asp:TextBox>
                                    </div>

                                </div>
                                <!-- /.input group -->
                            </div>



                        </div>

                    </div>




                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>BOLETA:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-file-text"></i>
                                        </div>
                                        <asp:TextBox ID="txtboleta" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" placeholder="TECLEE NO BOLETA" onkeypress="return numbersonly(event);" MaxLength="12"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>





                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>FECHA:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar" id="DATEPICK"></i>
                                        </div>
                                        <%--           <div class='input-group date' id='dteFechaHasta'>
                                <input type='text' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>--%>
                                        <asp:TextBox ID="txtdatepicker" Style="text-transform: uppercase;" class="form-control pull-right" runat="server"></asp:TextBox>
                                        <%--<asp:TextBox ID="txtdatepicker" runat="server" />--%>
                                        <%--<input type="date" name="fecha" id="txtdatepicker" runat="server">--%>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                            </div>








                            <div class="col-lg-2">
                                <div class="input-group">
                                    <label>HORA:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                        <div class="input-group">
                                            <asp:DropDownList ID="cboHora" runat="server" class="form-control">
                                                <asp:ListItem>00</asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <!-- /.input group -->
                                </div>
                            </div>


                            <div class="col-lg-2">
                                <div class="input-group">
                                    <label>MINUTO:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                        <div class="input-group">

                                            <asp:DropDownList ID="cboMinuto" runat="server" class="form-control">
                                                <asp:ListItem>00</asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                                <asp:ListItem>32</asp:ListItem>
                                                <asp:ListItem>33</asp:ListItem>
                                                <asp:ListItem>34</asp:ListItem>
                                                <asp:ListItem>35</asp:ListItem>
                                                <asp:ListItem>36</asp:ListItem>
                                                <asp:ListItem>37</asp:ListItem>
                                                <asp:ListItem>38</asp:ListItem>
                                                <asp:ListItem>39</asp:ListItem>
                                                <asp:ListItem>40</asp:ListItem>
                                                <asp:ListItem>41</asp:ListItem>
                                                <asp:ListItem>42</asp:ListItem>
                                                <asp:ListItem>43</asp:ListItem>
                                                <asp:ListItem>44</asp:ListItem>
                                                <asp:ListItem>45</asp:ListItem>
                                                <asp:ListItem>46</asp:ListItem>
                                                <asp:ListItem>47</asp:ListItem>
                                                <asp:ListItem>48</asp:ListItem>
                                                <asp:ListItem>49</asp:ListItem>
                                                <asp:ListItem>50</asp:ListItem>
                                                <asp:ListItem>51</asp:ListItem>
                                                <asp:ListItem>52</asp:ListItem>
                                                <asp:ListItem>53</asp:ListItem>
                                                <asp:ListItem>54</asp:ListItem>
                                                <asp:ListItem>55</asp:ListItem>
                                                <asp:ListItem>56</asp:ListItem>
                                                <asp:ListItem>57</asp:ListItem>
                                                <asp:ListItem>58</asp:ListItem>
                                                <asp:ListItem>59</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>

                                    </div>
                                    <!-- /.input group -->
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
                                    <label>AGENTE:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-users"></i>
                                        </div>
                                        <asp:DropDownList ID="cboAgente" runat="server" class="form-control"></asp:DropDownList>


                                    </div>
                                </div>

                                <!-- /.input group -->
                            </div>





                            <div class="col-lg-5">
                                <div class="input-group">
                                    <label>DESCRIPCION:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-list"></i>
                                        </div>

                                        <asp:TextBox ID="txtdescripcion" Style="text-transform: uppercase;" Width="600px" class="form-control pull-right" runat="server" placeholder="TECLEE DESCRIPCION" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>





                        </div>

                    </div>









                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                            </div>
                             <div class="col-lg-2">
                                <div class="input-group">
                                    <label>ID MULTA:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-file-text"></i>
                                        </div>
                                        <asp:TextBox ID="txtIdMulta" Style="text-transform: uppercase;" class="form-control pull-right" runat="server" placeholder="ID MULTA" onkeypress="return numbersonly(event);" MaxLength="12" AutoPostBack="true" OnTextChanged="txtIdMulta_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>


                            <div class="col-lg-3">
                                <div class="input-group">
                                    <label>TIPO INFRACCION:</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-warning"></i>
                                        </div>

                                        <asp:DropDownList ID="cboTipoMulta" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboTipoMulta_SelectedIndexChanged" runat="server"></asp:DropDownList>


                                    </div>

                                </div>
                                <!-- /.input group -->
                            </div>

                            <div class="col-lg-2">
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
                                    <br>
                                    <asp:Button ID="btnAgregar" Visible="false" class="btn btn-success" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />

                                    <%--<button type="submit" class="btn btn-success ">AGREGAR <span class="glyphicon glyphicon-download-alt add-on"></span></button>--%>
                                </div>
                            </div>
                        </div>

                    </div>



                    <br />
                    <div class="col-xs-12">

                        <div class="box">
                            <%--  <div class="box-header">
                                            <h3 class="box-title"></h3>
                                        </div>--%>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">ID</th>
                                            <th style="text-align: center">CONCEPTO MULTA</th>
                                            <th style="text-align: center">MONTO MULTA</th>
                                            <th style="text-align: center">ELIMINAR</th>

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
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>

                    <!-- Select Basic -->

                    <!-- Success message -->
                    <%--   <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i>Success!.</div>--%>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <br>
                            <button type="button" onclick="GUARDAR()" class="btn btn-warning">GUARDAR MULTA <span class="glyphicon glyphicon-send"></span></button>

                        </div>
                    </div>
                </fieldset>
            </div>
            <asp:Button ID="cmdEliminar" Style="display: none; visibility: hidden" runat="server" OnClick="cmdEliminar_Click" />
            <input id="hndEliminar" name="hndEliminar" type="hidden" runat="server" />
            <asp:Button ID="btnGrabar" Style="display: none; visibility: hidden" runat="server" OnClick="btnGrabar_Click" />


            <%--variables para guardar--%>
            <input id="hndIdEdo" name="hndIdEdo" type="hidden" runat="server" />
            <input id="hdnIdMpo" name="hdnIdMpo" type="hidden" runat="server" />
            <input id="hdnUsuario" name="hdnUsuario" type="hidden" runat="server" />
            <input id="hdnPlaca" name="hdnPlaca" type="hidden" runat="server" />
            <input id="hdnFolio" name="hdnFolio" type="hidden" runat="server" />
            <input id="hdnCalle1" name="hdnCalle1" type="hidden" runat="server" />
            <input id="hdnCalle2" name="hdnCalle2" type="hidden" runat="server" />
            <input id="hdnCrucero" name="hdnCrucero" type="hidden" runat="server" />
            <input id="hdnBoleta" name="hdnBoleta" type="hidden" runat="server" />
            <input id="hdnFecha" name="hdnFecha" type="hidden" runat="server" />
            <input id="hdnHora" name="hdnHora" type="hidden" runat="server" />
            <input id="hdnMinuto" name="hdnMinuto" type="hidden" runat="server" />
            <input id="hdnIdAgente" name="hdnIdAgente" type="hidden" runat="server" />
            <input id="hdnDescripcion" name="hdnDescripcion" type="hidden" runat="server" />
            <input id="hdnLicencia" name="hdnLicencia" type="hidden" runat="server" />



        </ContentTemplate>
        <Triggers>
            <%--  cboAgente--%>


            <asp:AsyncPostBackTrigger ControlID="cboAgente" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="cboEdo" EventName="SelectedIndexChanged" />

            <asp:AsyncPostBackTrigger ControlID="cboMunicipio" EventName="SelectedIndexChanged" />

            <asp:AsyncPostBackTrigger ControlID="cboTipoMulta" EventName="SelectedIndexChanged" />

            <asp:PostBackTrigger ControlID="txtdatepicker" />

            <asp:AsyncPostBackTrigger ControlID="txtIdMulta" EventName="TextChanged" />
            
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
    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />--%>

    <%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>--%>
  <%--  <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>--%>
    <%--<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>--%>
    <%--Fin--%>

    <script src="../master/jquery213.js"></script>

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
        };


        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        };
  </script>


    <script type="text/javascript">
   

        //function Datapicker() {
        //    $('#datetimepicker1').datetimepicker({
        //        format: 'DD/MM/YYYY'
        //    });

        //    $('#datetimepicker2').datetimepicker({
        //        format: 'DD/MM/YYYY'
        //    });

        //}
        //$(function () {
        //    Datapicker();

        //});

        function SetDatePicker() {

             var dp = $('#<%=txtdatepicker.ClientID%>');
             dp.datepicker({
                 changeMonth: true,
                 changeYear: true,
                 format: "dd/mm/yyyy",
                 language: "es"
             }).on('changeDate', function (ev) {
                 $(this).blur();
                 $(this).datepicker('hide');
             });
        };
       
        $(document).ready(function () {
            SetDatePicker();
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


    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">

        function eliminar(renglon) {

            document.getElementById("MainContent_hndEliminar").value = renglon;
            document.getElementById("MainContent_cmdEliminar").click();
        }


        function GUARDAR() {

            //document.getElementById("MainContent_hndEliminar").value = renglon;
            // alert('Jigsaw is coming for you !');
            document.getElementById("MainContent_btnGrabar").click();
        }



    </script>

    

   <script type="text/javascript">
        //On Page Load.
        $(function () {
            SetDatePicker();
        });

        //On UpdatePanel Refresh.
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    SetDatePicker();
                }
            });
        };
        //function SetDatePicker() {
        //    $("[id$=txtdatepicker]").datepicker({
        //        //showOn: 'button',
        //        //buttonImageOnly: true,
        //        //buttonImage: 'calendar.png'


        //    });
        //}




    </script> 

 
</asp:Content>




