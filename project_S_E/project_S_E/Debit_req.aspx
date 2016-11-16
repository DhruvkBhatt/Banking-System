<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Debit_req.aspx.cs" Inherits="project_S_E.Debit_req" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('h1.png');">
    <form id="form1" runat="server">
        <div>
                        <asp:Button ID="Home" runat="server" Text="HOME"
                            OnClick="home_Click" ForeColor="#cc0066" Width="170px" />
                        <br />
            <asp:Label ForeColor="Green" Text="Debit Request" Font-Bold="true" Font-Size="Larger" runat="server" ID="Label3"></asp:Label></center><br />
            <asp:Calendar ID="Calendar2" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar2_DayRender"></asp:Calendar>
<asp:Label ID="label1" runat="server"></asp:Label>
<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">PickDate...</asp:LinkButton>
            <table>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>

                <tr>
                    <td>Requested Money</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td></td>
                    <td>

                        <asp:Button ID="Button1" runat="server" Text="Conform" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">sign out</asp:LinkButton>
        </div>
    </form>
</body>
</html>
