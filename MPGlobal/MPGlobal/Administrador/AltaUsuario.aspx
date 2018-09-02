<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaUsuario.aspx.cs" Inherits="AltaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="formularioAltaCliente" class="container formulario_container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h2><b>Alta Usuario</b></h2>
                <hr />
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
                <label class="control-label">Estado</label>
            </div>
            <div class="col-sm-8">
                <div class="form-group">
                    <div class="inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control selectpicker campo_obligatorio"></asp:DropDownList>
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
                            <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control selectpicker campo_obligatorio"></asp:DropDownList>
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
        <div class="row">
            <div class="col-sm-4 text-right">
                <label class="control-label">E-Mail</label>
            </div>
            <div class="col-sm-8">
                <div class="form-group">

                    <div class="inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" onblur="javascript:validateEmail(this.value);" CssClass="form-control campo_obligatorio" placeholder="e-mail"></asp:TextBox>
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
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control campo_obligatorio" placeholder="Teléfono"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-8">
                <asp:LinkButton ID="lnkGuardar" runat="server" CssClass="btn btn-warning" data-target="#formularioAltaCliente" OnClientClick="javascript:validaCampos(this,event);">
                    Guardar <span class="glyphicon glyphicon-send"></span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
    >
    <style lang="cs">
        #success_message {
            display: none;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            $('#contact_form').bootstrapValidator({
                // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    first_name: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your First Name'
                            }
                        }
                    },
                    last_name: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your Last Name'
                            }
                        }
                    },
                    user_name: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please enter your Username'
                            }
                        }
                    },
                    user_password: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please enter your Password'
                            }
                        }
                    },
                    confirm_password: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please confirm your Password'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter your Email Address'
                            },
                            emailAddress: {
                                message: 'Please enter a valid Email Address'
                            }
                        }
                    },
                    contact_no: {
                        validators: {
                            stringLength: {
                                min: 12,
                                max: 12,
                                notEmpty: {
                                    message: 'Please enter your Contact No.'
                                }
                            }
                        },
                        department: {
                            validators: {
                                notEmpty: {
                                    message: 'Please select your Department/Office'
                                }
                            }
                        },
                    }
                }
            })
                .on('success.form.bv', function (e) {
                    $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                    $('#contact_form').data('bootstrapValidator').resetForm();

                    // Prevent form submission
                    e.preventDefault();

                    // Get the form instance
                    var $form = $(e.target);

                    // Get the BootstrapValidator instance
                    var bv = $form.data('bootstrapValidator');

                    // Use Ajax to submit form data
                    $.post($form.attr('action'), $form.serialize(), function (result) {
                        console.log(result);
                    }, 'json');
                });
        });
    </script>



</asp:Content>


