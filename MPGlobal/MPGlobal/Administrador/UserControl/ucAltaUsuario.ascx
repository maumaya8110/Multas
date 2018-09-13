<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAltaUsuario.ascx.cs" Inherits="Administrador_UserControl_ucAltaUsuario" %>
<style type="text/css">
    #formularioAltaCliente label {
        line-height: 35px;
    }
</style>
<asp:UpdatePanel ID="updAltaUsuario" runat="server">
    <ContentTemplate>
        <br />
        <div id="formularioAltaCliente" class="container">
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Estado</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control selectpicker campo_obligatorio" AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Municipio</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control selectpicker campo_obligatorio">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Rol</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control selectpicker"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Nombre(s)</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtFirstName" runat="server" placeholder="Nombre(s)" CssClass="form-control campo_obligatorio"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Apellido Paterno</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtApPaterno" runat="server" placeholder="Apellido Paterno" CssClass="form-control campo_obligatorio"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Apellido Materno</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtApMaterno" runat="server" placeholder="Apellido Materno" CssClass="form-control campo_obligatorio"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Usuario</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control campo_obligatorio" placeholder="Username"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="pnlContrasenias" runat="server">
                <div class="row">
                    <div class="col-sm-4 text-right">
                        <label class="control-label">Contraseña</label>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <div class="inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control campo_obligatorio" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 text-right">
                        <label class="control-label">Confirma Contraseña</label>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <div class="inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <asp:TextBox ID="txtConfirmContrasenia" runat="server" CssClass="form-control campo_obligatorio" TextMode="Password" placeholder="Confirmar contraseña"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">E-Mail</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">

                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control campo_obligatorio" placeholder="e-mail"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 text-right">
                    <label class="control-label">Teléfono</label>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control campo_obligatorio" placeholder="Teléfono" onkeypress="javascript:validaNumeros(this, event);"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="lblError" runat="server" CssClass="danger"></asp:Label>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-6">
                    <a class="btn btn-default" data-dismiss="modal">Cancelar</a>
                </div>
                <div class="col-sm-6 text-right">
                    <asp:LinkButton ID="lnkGuardar" runat="server" CssClass="btn btn-warning" data-target="#formularioAltaCliente" OnClick="lnkGuardar_Click" OnClientClick="javascript:validaCampos(this,event);">
                    Guardar <span class="glyphicon glyphicon-send"></span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>



<style lang="cs">
    #success_message {
        display: none;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function terminaAltaUsuario() {
        $('#modalAddUsuario').modal('hide');
        muestraMensaje('success', 'Proceso terminado', 'Se ha terminado el proceso correctamente.');
    }

</script>
