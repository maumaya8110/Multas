<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCatEstado.ascx.cs" Inherits="Administrador_UserControl_ucCatEstado" %>

<style type="text/css">
    .Titulo {
        text-align: center;
    }
</style>

<script src="../Scripts/sweetalert2.all.min.js"></script>
<script type="text/javascript">

    function QuestionDelete(IdEstado) {
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

                    document.getElementById('<%= HiddenField1AutEli.ClientID %>').value = IdEstado;
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


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="box">
            <asp:Button ID="BtnElimina" runat="server" Style="visibility: hidden;" OnClick="BtnElimina_Click" Text="btnElimina" />


            <asp:UpdatePanel ID="UpdtAgregarEdo" runat="server" Visible="false">

                <ContentTemplate>
                    <div class="panel panel-default" id="AddEstado" style="margin: 1% 2% 2% 2%;">
                        <div class="panel-heading">Alta de Estado</div>
                        <div class="panel-body">
                            <div class="form-inline col-auto">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEstado" runat="server" placeholder="Estado" CssClass="form-control campo_obligatorio"></asp:TextBox>


                                    <asp:TextBox ID="txtAbreviatura" runat="server" placeholder="Abreviatura" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                    <asp:TextBox ID="txtContacto" runat="server" placeholder="Contacto" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                    <asp:TextBox ID="txtTelefono" runat="server" placeholder="Telefono" CssClass="form-control campo_obligatorio" onkeypress="javascript:validaNumeros(this, event);"></asp:TextBox>

                                    <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo" CssClass="form-control campo_obligatorio"></asp:TextBox>

                                    <asp:TextBox ID="txtLicencia" runat="server" placeholder="Licencia" CssClass="form-control campo_obligatorio" onkeypress="javascript:validaNumeros(this, event);"></asp:TextBox>

                                    <asp:LinkButton ID="LinkBtnAlta" runat="server" type="button" class="btn btn-default btn-sm" CommandName="LinkBtnAlta" OnClick="LinkBtnAlta_Click" data-target="#AddEstado" OnClientClick="javascript:validaCampos(this,event);">
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

                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No hay registros que mostrar" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_Rowupdating" >
                   
                    <Columns>                     

                        <%--botones de acción sobre los registros...--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="16%">
                            <ItemTemplate>
                                <%--Botones de eliminar y editar cliente...--%>
                                                               
                                <asp:LinkButton ID="btnEdit" runat="server" ToolTip="EDITAR" type="button" class="btn btn-default btn-xs" CommandName="Edit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                </asp:LinkButton>                           
                                <a class="btn btn-default btn-xs" onclick="QuestionDelete('<%# Eval("IdEstado")%>');" tooltip="ELIMINAR"><span class="glyphicon glyphicon-trash"></span></a>
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
                        

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ESTADO">
                            <ItemTemplate>
                                <asp:Label ID="lblNomEstado" runat="server"><%# Eval("NomEstado")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtNomEstado" runat="server" Text='<%# Bind("NomEstado")%>' CssClass="form-control"></asp:TextBox>
                                 <asp:HiddenField ID="HiddenIdEstado" runat="server" Value='<%# Eval("IdEstado") %>'></asp:HiddenField>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="ABREVIATURA">
                            <ItemTemplate>
                                <asp:Label ID="lblSiglasEstado" runat="server"><%# Eval("SiglasEstado")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtSiglasEstado" runat="server" Text='<%# Bind("SiglasEstado")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="CONTACTO">
                            <ItemTemplate>
                                <asp:Label ID="lblCONTACTO" runat="server"><%# Eval("CONTACTO")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtCONTACTO" runat="server" Text='<%# Bind("CONTACTO")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="TELEFONO">
                            <ItemTemplate>
                                <asp:Label ID="lblTELEFONO" runat="server"><%# Eval("TELEFONO")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtTELEFONO" runat="server" Text='<%# Bind("TELEFONO")%>' CssClass="form-control campo_obligatorio" onkeypress="javascript:validaNumeros(this, event);"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="CORREO">
                            <ItemTemplate>
                                <asp:Label ID="lblCORREO" runat="server"><%# Eval("CORREO")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtCORREO" runat="server" Text='<%# Bind("CORREO")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="LICENCIA">
                            <ItemTemplate>
                                <asp:Label ID="lblIdLicencia" runat="server"><%# Eval("IdLicencia")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtIdLicencia" runat="server" Text='<%# Bind("IdLicencia")%>' CssClass="form-control campo_obligatorio" onkeypress="javascript:validaNumeros(this, event);"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="ESTATUS">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkEstatusEstado" runat="server" Checked='<%# bool.Parse(Eval("EstatusEstado").ToString()) %>' Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkEstatusEstado" runat="server" Checked='<%# bool.Parse(Eval("EstatusEstado").ToString()) %>' Enabled="true"/>
                            </EditItemTemplate>
                        </asp:TemplateField>




                    </Columns>

                </asp:GridView>

            </div>
            <!-- /.box-body -->
        </div>


    </ContentTemplate>
</asp:UpdatePanel>





