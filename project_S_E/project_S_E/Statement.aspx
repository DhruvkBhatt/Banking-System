<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statement.aspx.cs" Inherits="project_S_E.Statement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lb1" Text="Amount that send from your account" ForeColor="RoyalBlue" runat="server"/>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" DataSourceID="SqlDataSourceSender" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource
          id="SqlDataSourceSender"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>"
          SelectCommand="SELECT [Transaction_date] [Date Time],[Reciver_Account_no] [Send To], [Amount]  FROM [Transaction_db] WHERE ([Sender_account_no] = @Sender_account_no)">
            <SelectParameters>
                <asp:SessionParameter Name="Sender_account_no" SessionField="my_account_no" Type="String" />
            </SelectParameters>
      </asp:SqlDataSource>
        <asp:Label ID="lb2" Text="Amount that recieve from  your account" ForeColor="RoyalBlue" runat="server"/>
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" DataSourceID="SqlDataSourceSender0" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource
          id="SqlDataSourceSender0"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>"
          SelectCommand="SELECT [Transaction_date] [Date Time],[Sender_account_no]  [Received Form], [Amount]  FROM [Transaction_db] WHERE ([Reciver_Account_no]= @Sender_account_no)">
            <SelectParameters>
                <asp:SessionParameter Name="Sender_account_no" SessionField="my_account_no" Type="String" />
            </SelectParameters>
      </asp:SqlDataSource>

        <br />
    
    </div>
    </form>
</body>
</html>
