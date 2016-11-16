<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="project_S_E.Transaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;<asp:Label ID="bal" runat="server" Text="" ></asp:Label>
            <table>
                <tr>
                    <td>Account No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAcc" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Amount: </td>
                    <td>
                        <asp:TextBox ID="txtAmt" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="tnf" runat="server" Text="Send Money" OnClick="Button1_Click" />
                    </td>
                </tr>
                </table>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
            <br /><asp:Label ID="Label2" runat="server" Text="" ></asp:Label>
        </div>
    </form>
</body>
</html>
