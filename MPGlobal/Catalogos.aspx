<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogos.aspx.cs" Inherits="Catalogos" %>

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

    <div class="container">

        <form class="well form-horizontal" method="post" id="contact_form">
            <fieldset>

                <!-- Form Name -->
                <fieldset>
                    <legend class="Titulo">Administrador de Catálagos</legend>
                </fieldset>


                <div class="form-group">
                    <label class="col-md-1 control-label">Catalogos</label>
                    <div class="col-md-4 selectContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                            <select name="department" class="form-control selectpicker">
                                <option value="">Selecciona el catalogo</option>
                                <option>Estados</option>
                                <option>Municipios</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <asp:Label ID="lblFolio" runat="server" Text="Folio" CssClass="labelTab"></asp:Label>
                    <asp:TextBox ID="txtFolio" runat="server" CssClass="textTab" Enabled="true"></asp:TextBox>



                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción" CssClass="labelTab"></asp:Label>
                    <asp:TextBox ID="TxtDescripcion" runat="server" CssClass="textTab" Enabled="true"></asp:TextBox>
                </div>





            </fieldset>
        </form>
    </div>


</asp:Content>

