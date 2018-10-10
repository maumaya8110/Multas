<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCatPlacas.ascx.cs" Inherits="Administrador_UserControl_ucCatPlacas" %>

<style type="text/css">
    .Titulo {
        text-align: center;
    }
</style>
<script src="../Scripts/sweetalert2.all.min.js"></script>
<script type="text/javascript">

    function QuestionDelete(IdPlaca) {
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

                    document.getElementById('<%= HiddenField1AutEli.ClientID %>').value = IdPlaca;
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


            <asp:UpdatePanel ID="UpdtAgregarMpo" runat="server" Visible="false">

                <ContentTemplate>
                    <div class="panel panel-default" id="AddPlaca" style="margin: 1% 2% 2% 2%;">
                        <div class="panel-heading">Alta de Placa</div>
                        <div class="panel-body">
                            <div class="form-inline col-auto">
                                <div class="form-group">
                                  


                                    <asp:TextBox ID="txtNomPlaca" runat="server" placeholder="Placa" CssClass="form-control campo_obligatorio"></asp:TextBox>
                                      <asp:TextBox ID="txtMarca" runat="server" placeholder="Marca" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                      <asp:TextBox ID="txtTipo" runat="server" placeholder="Tipo" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                      <asp:TextBox ID="txtModelo" runat="server" placeholder="Modelo" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                      <asp:TextBox ID="txtSerie" runat="server" placeholder="Serie" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                      <%--DropEstado--%>
                                    <div class="form-group">
                                        <div class="inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                <asp:DropDownList ID="DropEstados" runat="server" placeholder="Estados" CssClass="form-control selectpicker campo_obligatorio">
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
                                  


                                    <asp:LinkButton ID="LinkBtnAlta" runat="server" type="button" class="btn btn-default btn-sm" CommandName="LinkBtnAlta" OnClick="LinkBtnAlta_Click" data-target="#AddPlaca" OnClientClick="javascript:validaCampos(this,event);">
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
              
                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No hay registros que mostrar" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_Rowupdating" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <%--Paginador...--%>

                    <Columns>

                        <%--botones de acción sobre los registros...--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="16%">
                            <ItemTemplate>
                                <%--Botones de eliminar y editar cliente...--%>

                                <asp:LinkButton ID="btnEdit" runat="server" ToolTip="EDITAR" type="button" class="btn btn-default btn-xs" CommandName="Edit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                </asp:LinkButton>

                                <a class="btn btn-default btn-xs" onclick="QuestionDelete('<%# Eval("IdPlaca")%>');" tooltip="ELIMINAR"><span class="glyphicon glyphicon-trash"></span></a>

                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--Botones de grabar y cancelar la edición de registro OnClientClick="Success();"...--%>
                                <asp:LinkButton ID="btnUpdate" runat="server" type="button" class="btn btn-default btn-xs" CommandName="Update">
                                            <span class="glyphicon glyphicon-floppy-disk"></span> GRABAR
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnCancel" runat="server" type="button" class="btn btn-default btn-xs" CommandName="Cancel">
                                            <span class="glyphicon glyphicon-remove-circle"></span> CANCELAR
                                </asp:LinkButton>


                            </EditItemTemplate>
                        </asp:TemplateField>


                        <%--campos editables...--%>


                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="PLACA">
                            <ItemTemplate>
                                <asp:Label ID="lblNomPlaca" runat="server"><%# Eval("Placa")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtNomPlaca" runat="server" Text='<%# Bind("Placa")%>' CssClass="form-control"></asp:TextBox>
                                <asp:HiddenField ID="HiddenIdPlaca" runat="server" Value='<%# Eval("IdPlaca") %>'></asp:HiddenField>
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderStyle-Width="150px" HeaderText="PLACA">
                            <ItemTemplate>
                                <asp:Label ID="lblMarca" runat="server"><%# Eval("Marca")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtMarca" runat="server" Text='<%# Bind("Marca")%>' CssClass="form-control"></asp:TextBox>                               
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TIPO">
                            <ItemTemplate>
                                <asp:Label ID="lblTipo" runat="server"><%# Eval("Tipo")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtTipo" runat="server" Text='<%# Bind("Tipo")%>' CssClass="form-control"></asp:TextBox>                               
                            </EditItemTemplate>
                        </asp:TemplateField>
                   
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="MODELO">
                            <ItemTemplate>
                                <asp:Label ID="lblModelo" runat="server"><%# Eval("Modelo")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtModelo" runat="server" Text='<%# Bind("Modelo")%>' CssClass="form-control"></asp:TextBox>                               
                            </EditItemTemplate>
                        </asp:TemplateField>
                   
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="SERIE">
                            <ItemTemplate>
                                <asp:Label ID="lblSerie" runat="server"><%# Eval("Serie")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtSerie" runat="server" Text='<%# Bind("Serie")%>' CssClass="form-control"></asp:TextBox>                               
                            </EditItemTemplate>
                        </asp:TemplateField>
                   
                   

                   
                        
                        <%--Drop Estados--%>
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

                        <%--Drop Municipios--%>
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
                                <asp:CheckBox ID="chkEstatusPlaca" runat="server" Checked='<%# bool.Parse(Eval("Estatus").ToString()) %>' Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkEstatusPlaca" runat="server" Checked='<%# bool.Parse(Eval("Estatus").ToString()) %>' Enabled="true" />
                            </EditItemTemplate>
                        </asp:TemplateField>




                    </Columns>

                </asp:GridView>

            </div>
            <!-- /.box-body -->
        </div>


    </ContentTemplate>
</asp:UpdatePanel>
