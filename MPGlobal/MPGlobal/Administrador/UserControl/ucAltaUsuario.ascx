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
                <div class="col-sm-2 text-right">
                    <label class="control-label">Estado</label>
                </div>
                <div class="col-sm-4">
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
                <div class="col-sm-2 text-right">
                    <label class="control-label">Municipio</label>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control selectpicker campo_obligatorio" AutoPostBack="true" OnSelectedIndexChanged="ddlMunicipio_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2 text-right">
                    <label class="control-label">Nombre(s)</label>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtFirstName" runat="server" placeholder="Nombre(s)" MaxLength="20" CssClass="form-control campo_obligatorio"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 text-right">
                    <label class="control-label">Apellido Paterno</label>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtApPaterno" runat="server" placeholder="Apellido Paterno" MaxLength="50" CssClass="form-control campo_obligatorio"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2 text-right">
                    <label class="control-label">Apellido Materno</label>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtApMaterno" runat="server" placeholder="Apellido Materno" MaxLength="50" CssClass="form-control campo_obligatorio"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 text-right">
                    <label class="control-label">E-Mail</label>
                </div>
                <div class="col-sm-4">
                    <asp:Panel ID="pnlEmailExiste" runat="server" CssClass="alert alert-danger" Visible="false">
                        <strong>Email registrado!</strong> El email ya se encuentra registrado.
                    </asp:Panel>
                    <div class="form-group">

                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control campo_obligatorio" MaxLength="50" placeholder="e-mail"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2 text-right">
                    <label class="control-label">Teléfono</label>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control campo_obligatorio" MaxLength="20" placeholder="Teléfono" onkeypress="javascript:validaNumeros(this, event);"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-sm-2 text-right">
                    <label class="control-label">Rol</label>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control selectpicker campo_obligatorio"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 text-right">
                    <label class="control-label">Usuario</label>
                </div>
                <div class="col-sm-4">
                    <asp:Panel ID="pnlUsuarioExiste" runat="server" CssClass="alert alert-danger" Visible="false">
                        <strong>Usuario no disponible!</strong> Intenta con otro diferente.
                    </asp:Panel>
                    <div class="form-group">
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control campo_obligatorio" MaxLength="20" placeholder="Username"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <asp:Panel ID="pnlContrasenias" runat="server">
                <div class="row">
                    <div class="col-sm-2 text-right">
                        <label class="control-label">Contraseña</label>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control campo_obligatorio" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-2 text-right">
                        <label class="control-label">Confirma Contraseña</label>
                    </div>
                    <div class="col-sm-4">
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
            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <h4>Ventanas</h4>
                </div>
            </div>
            <div class="row">
                <asp:Panel ID="pnlSinInfoVentanas" runat="server">
                    <div class="col-sm-12"><h5>Selecciona el <b>Estado</b> y <b>Municipio</b> para ver las ventanas.</h5></div>
                </asp:Panel>
                <asp:Repeater ID="rptVentanas" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-2 text-center">
                            <b><%# Eval("NomVentana") %></b><br />
                            <asp:CheckBox ID="chkPermiso" runat="server"  Checked='<%# bool.Parse(Eval("estatus").ToString()) %>' />
                            <asp:HiddenField ID="hdnIdVentana" runat="server" Value='<%# Eval("idVentana") %>' />
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Panel ID="pnlSinVentanas" runat="server" Visible='<%# rptVentanas.Items.Count == 0 %>'>
                            <div class="col-sm-12"><h5>El <b>Estado</b> y <b>Municipio</b> seleccionados no cuenta con Ventanas asignadas.</h5></div>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:Repeater>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function terminaAltaUsuario() {
        $('#modalAddUsuario').modal('hide');
        muestraMensaje('success', 'Proceso terminado', 'Se ha terminado el proceso correctamente.');
    }

</script>
