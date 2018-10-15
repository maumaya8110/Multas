<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Multas.aspx.cs" Inherits="Multas_Multas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width:500px">
                <tr>
                    <td style="font-size: xx-large; text-decoration: underline; font-family: 'Courier New'; background-color: #0000FF; color: #FFFFFF; text-align: center;">
                        <asp:Label ID="lblTitulo" runat="server" Text=""></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>

                        <table>
                            <tr>
                                <td>Placa:</td>
                                <td>
                                    <asp:Label ID="lblPlaca" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
                                <td></td>
                                <td>Fecha Impresion:</td>
                                <td>
                                    <asp:Label ID="lblFecha" runat="server" Text="" Font-Bold="True" Font-Size="Large"></asp:Label></td>
                            </tr>
                        </table>


                    </td>
                </tr>
                <tr>
                    <td>
                        <table><tr><td>Monto Multas: $</td><td><asp:Label ID="lblMonto" Font-Bold="True" Font-Size="Large" runat="server" Text=""></asp:Label></td></tr></table>
                        

                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:GridView ID="gvMultas" Width="500px" runat="server" CellPadding="4" ForeColor="#333333" HorizontalAlign="Center" GridLines="None" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="FOLIO" HeaderText="FOLIO">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BOLETA" HeaderText="BOLETA">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Underline="true" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>

                    </td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>

                </tr>

            </table>


 

        </div>
    </form>
</body>
</html>
