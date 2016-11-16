<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_page.aspx.cs" Inherits="project_S_E.Admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button3" runat="server" Text="Add Account" OnClick="Button3_Click"/>
        
        
        <asp:Button ID="btnCharge" runat="server" Text="Change interest" OnClick="btnCharge_Click" />
        <asp:Button ID="btnint" runat="server" Text="Interest" OnClick="btnint_Click" />
        <asp:Button ID="btnloan" runat="server" Text="Loan_requested" OnClick="Button4_Click" />
        <asp:Button ID="btndeb" runat="server" Text="Debit req" OnClick="btndeb_Click" />

        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Visible="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Account_no" HeaderText="Account_no" SortExpression="Account_no" />
                <asp:BoundField DataField="Req_date" HeaderText="Req_date" SortExpression="Req_date" />
                <asp:BoundField DataField="Loan_Reason" HeaderText="Loan_Reason" SortExpression="Loan_Reason" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" SelectCommand="SELECT [Account_no], [Req_date], [Loan_Reason], [Amount] FROM [Loan_req]"></asp:SqlDataSource>

    </form>
</body>
</html>
