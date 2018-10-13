<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot.aspx.cs" Inherits="Account_Forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link href="../Content/login.min.css" rel="stylesheet" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <!-- Morris chart 
    <link rel="stylesheet" href="bower_components/morris.js/morris.css">-->
    <!-- jvectormap -->
    <link rel="stylesheet" href="../bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>MP</b>Global</a>
            </div>
            <div id="box-inbox" class="container">
                <div class="row">
                    <asp:PlaceHolder ID="loginForm" runat="server">
                        <div class="col-md-12">
                            <section id="loginForm_2">
                                <div class="form-horizontal">
                                    <br />
                                    <h5 class="text-center">Proporciona tu usuario y te enviaremos un email para que puedas restablecerla.</h5>
                                    <br />
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="inputGroupContainer">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Usuario" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                            CssClass="text-danger" ErrorMessage="El campo de nombre de usuario es obligatorio." />
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                                <p class="text-danger">
                                                    <asp:Literal runat="server" ID="FailureText" />
                                                </p>
                                            </asp:PlaceHolder>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <br />
                                            <p>
                                                <asp:HyperLink ID="lnkRegresar" runat="server" CssClass="btn btn-default" NavigateUrl="~/Account/Login.aspx" Text="Regresar"></asp:HyperLink>
                                            </p>
                                        </div>
                                        <div class="col-sm-6 text-right">
                                            <br />
                                            <p>
                                                <asp:Button ID="btnEnviarEmail" runat="server" CssClass="btn btn-primary" Text="Validar correo" OnClick="btnEnviarEmail_Click" />
                                            </p>
                                        </div>
                                    </div>

                                </div>
                            </section>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">

                        <div class="container-full">
                            <div class="row">
                                <div class="col-md-12">
                                    <section class="confirmForgot" style="padding: 15px;">
                                        <div class="form-horizontal">
                                            <br />
                                            <h4 class="text-info">Por favor valida tu correo para recuperar tu contraseña
                        
                                            </h4>
                                            <br />
                                            <div class="col-sm-12 text-right">
                                                <asp:HyperLink ID="lnkIniciarSesion" runat="server" NavigateUrl="~/Account/Login.aspx" Text="Iniciar sesión" CssClass="btn btn-primary" Style="margin-bottom: 15px;"></asp:HyperLink>
                                                <br />
                                            </div>
                                        </div>
                                        <br />
                                    </section>
                                </div>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </div>

        </div>


    </form>
</body>
</html>
