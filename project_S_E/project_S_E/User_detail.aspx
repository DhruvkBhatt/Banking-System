<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_detail.aspx.cs" Inherits="project_S_E.User_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('h1.png');">
    <form id="form1" runat="server">
    <div>
        
        <asp:Button ID="Home" runat="server" ForeColor="#cc0066" Height="35px" OnClick="home_Click" Text="HOME" Width="170px" />
        
        <br />
    <asp:Label ID="lb1" Text="Your Detail" Font-Bold="true" Font-Size="Larger" ForeColor="Black" runat="server"/>
        
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="User_name" HeaderText="User_name" SortExpression="User_name" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Pincode" HeaderText="Pincode" SortExpression="Pincode" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Ph_no" HeaderText="Ph_no" SortExpression="Ph_no" />
                <asp:BoundField DataField="Email_id" HeaderText="Email_id" SortExpression="Email_id" />
                <asp:BoundField DataField="Account_no" HeaderText="Account_no" SortExpression="Account_no" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" SelectCommand="SELECT [User_name], [City], [State], [Pincode], [Country], [DOB], [Ph_no], [Email_id], [Account_no] FROM [User_db] WHERE ([Account_no] = @Account_no)">
            <SelectParameters>
                <asp:SessionParameter Name="Account_no" SessionField="my_account_no" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
