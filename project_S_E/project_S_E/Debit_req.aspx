<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Debit_req.aspx.cs" Inherits="project_S_E.Debit_req" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

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
        </div>
    </form>
</body>
</html>
