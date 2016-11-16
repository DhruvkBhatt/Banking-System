<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transc.aspx.cs" Inherits="project_S_E.Admin.Transc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('admin.png');">
    <form id="form1" runat="server">
    <div>
    
                        <asp:Button ID="Home" runat="server" Text="HOME"
                            OnClick="home_Click" ForeColor="#cc0066" Width="170px" />
                        <br />
            <asp:Label ForeColor="Green" Text="Transaction" Font-Bold="true" Font-Size="Larger" runat="server" ID="Label3"></asp:Label>
        <br />
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" SelectCommand="SELECT * FROM [Transaction_db]"></asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="314px" Width="857px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Transaction_id" HeaderText="Transaction_id" InsertVisible="False" ReadOnly="True" SortExpression="Transaction_id" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                <asp:BoundField DataField="Reciver_Account_no" HeaderText="Reciver_Account_no" SortExpression="Reciver_Account_no" />
                                <asp:BoundField DataField="Transaction_date" HeaderText="Transaction_date" SortExpression="Transaction_date" />
                                <asp:BoundField DataField="Sender_account_no" HeaderText="Sender_account_no" SortExpression="Sender_account_no" />
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
    
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
