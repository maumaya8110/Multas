<%@ Page Title="" Language="C#" MasterPageFile="~/MPMasterPage.master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Administrador_Usuarios" %>

<%@ Register Src="~/Administrador/UserControl/ucAltaUsuario.ascx" TagName="ucAlta" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .Titulo {
            text-align: center;
        }

        .textTab {
            border: solid 1px #E5E5E5;
            background: -webkit-gradient( linear, left top, left 25, from(#FFFFFF), color-stop(2%, #f4f4f478), to(#FFFFFF) );
            margin: 5px 30px 0px 30px;
            width: 40%;
            padding: 3px;
            display: block;
            font-size: 16px;
        }

        .labelTab {
            display: block;
            padding: 10px 30px 0px 30px;
            margin: 10px,0px 0 px 0px;
            font-size: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updUsuarios" runat="server">
        <ContentTemplate>
            <div class="box">
                <div class="box-header">
                    <div class="row">
                        <div class="col-sm-3">
                            <p>Estado</p>
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" AutoPostBack="true" Width="100%" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-sm-3">
                            <p>Municipio</p>
                            <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-xs-2 col-sm-3 col-lg-1">
                            <p style="visibility: hidden;">Municipio</p>
                            <div>
                                <asp:LinkButton ID="lnkBuscar" runat="server" CssClass="btn btn-default" OnClick="btnBuscar_Click">
                        <span class="glyphicon glyphicon-search"></span> Consultar
                                </asp:LinkButton>

                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-3 col-lg-1">
                            <p style="visibility: hidden;">Municipio</p>
                            <asp:LinkButton ID="lnkAddUsuario" runat="server" OnClick="lnkAddUsuario_Click" CssClass="btn btn-default">
                                    <span class="glyphicon glyphicon-plus"></span>Agregar
                            </asp:LinkButton>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-9"></div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Busqueda rápida..." AutoPostBack="true" CssClass="form-control search" Width="100%" Style="height: 40px;" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <br />
                            <asp:HiddenField ID="hdnEliminar" runat="server" />
                            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Style="visibility: hidden;" />
                            <asp:GridView ID="grdUsuarios" runat="server" Width="100%" AllowPaging="true" PageSize="8" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-hover table-bordered table-striped">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEditar" runat="server" Text="Editar" OnCommand="lnkEditar_Command" CssClass="btn btn-default btn-xs" CommandArgument='<%# Eval("idusuario") %>'>
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a class="btn btn-default btn-xs" onclick="javascript:confirmaEliminaUsuario('<%# Eval("userId") %>');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Estado" DataField="nomEstado" />
                                    <asp:BoundField HeaderText="Municipio" DataField="NomMunicipio" />
                                    <asp:BoundField HeaderText="Nombre" DataField="nombreFull" />
                                    <asp:BoundField HeaderText="Referencia" DataField="Referencia" />
                                    <asp:BoundField HeaderText="Departamento" DataField="Departamento" />
                                    <asp:BoundField HeaderText="Area" DataField="Area" />
                                    <asp:BoundField HeaderText="Email" DataField="Email" />
                                    <asp:BoundField HeaderText="Teléfono" DataField="Telefono" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4>No se encontrarón resultados ...</h4>
                                        </div>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="modalAddUsuario" class="modal fade modal-medium" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Alta usuario</h4>
                </div>
                <div class="modal-body">
                    <uc1:ucAlta ID="ucAltaUsuario" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function muestraModalUsuarios() {
            $('#modalAddUsuario').modal('show');
        }

        function confirmaEliminaUsuario(userId) {
            swal({
                title: "Estas seguro de eliminar el registro?",
                text: "No podrás recuperarlo!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Si, eliminarlo!",
                closeOnConfirm: false,
                cancelButtonText: 'Cancelar'
            }, function (isConfirm) {
                if (isConfirm) {
                    document.getElementById('<%= hdnEliminar.ClientID %>').value = userId;
                    document.getElementById('<%= btnEliminar.ClientID %>').click();
                    }
                });

        }

        function mensajeUsuarioEliminado() {
            $('#modalAddUsuario').modal('hide');
            swal({
                title: "Proceso terminado",
                text: "EL usuario se eliminó correctamente",
                type: "info",
                showCancelButton: false,
                confirmButtonText: "Aceptar",
                closeOnConfirm: true
            });
        }

          
    </script>
</asp:Content>

