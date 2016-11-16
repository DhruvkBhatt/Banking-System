<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="project_S_E.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ForeColor="Green" Text="Welcome To Home" runat="server" Font-Size="Larger"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Statement" ForeColor="Red" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Change_password" ForeColor="Red" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Your_detail" ForeColor="Red" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="Loan_req" ForeColor="Red" OnClick="Button4_Click" />
        <asp:Button ID="Button5" runat="server" Text="Change_Detail" ForeColor="Red" OnClick="Button5_Click" />
        <asp:Button ID="Button6" runat="server" Text="Transaction" ForeColor="Red" OnClick="Button6_Click" />
        <br />
    
        <br />
    
    </div>
    </form>
</body>
</html>
