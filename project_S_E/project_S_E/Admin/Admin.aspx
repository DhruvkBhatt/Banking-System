<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_page.aspx.cs" Inherits="project_S_E.Admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('admin.png');">
    <form id="form1" runat="server">
            <asp:Label ForeColor="Green" Text="Admin Page" Font-Bold="true" Font-Size="Larger" runat="server" ID="Label3"></asp:Label>
        <br />
        <asp:Button ID="Button3" runat="server" Text="Add Account" OnClick="Button3_Click"/>
        
        
        <asp:Button ID="btnint" runat="server" Text="Add Interest" OnClick="btnint_Click" />
        <asp:Button ID="btnloan" runat="server" Text="Loan_requested" OnClick="Button4_Click" />
        <asp:Button ID="btndeb" runat="server" Text="See Debit req" OnClick="btndeb_Click" />
        
        <asp:Button ID="btn" runat="server" Text="All Transcations" OnClick="btntra_Click" />
        <asp:Button ID="btnCharge" runat="server" Text="Change interest" OnClick="btnCharge_Click" />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Visible="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" DataKeyNames="Loan_id" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Account_no" HeaderText="Account_no" ReadOnly="True" SortExpression="Account_no" />
                <asp:BoundField DataField="Req_date" HeaderText="Req_date" ReadOnly="True" SortExpression="Req_date" />
                <asp:BoundField DataField="Loan_Reason" HeaderText="Loan_Reason" ReadOnly="True" SortExpression="Loan_Reason" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="True" SortExpression="Amount" />
                <asp:BoundField DataField="Loan_id" HeaderText="Loan_id" InsertVisible="False" ReadOnly="True" SortExpression="Loan_id" />
                <asp:BoundField DataField="Grant" HeaderText="Grant" SortExpression="Grant" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" SelectCommand="SELECT [Account_no], [Req_date], [Loan_Reason], [Amount], [Loan_id], [Grant] FROM [Loan_req]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Loan_req] WHERE [Loan_id] = @original_Loan_id AND (([Account_no] = @original_Account_no) OR ([Account_no] IS NULL AND @original_Account_no IS NULL)) AND (([Req_date] = @original_Req_date) OR ([Req_date] IS NULL AND @original_Req_date IS NULL)) AND [Loan_Reason] = @original_Loan_Reason AND [Amount] = @original_Amount AND (([Grant] = @original_Grant) OR ([Grant] IS NULL AND @original_Grant IS NULL))" InsertCommand="INSERT INTO [Loan_req] ([Account_no], [Req_date], [Loan_Reason], [Amount], [Grant]) VALUES (@Account_no, @Req_date, @Loan_Reason, @Amount, @Grant)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Loan_req] SET [Account_no] = @Account_no, [Req_date] = @Req_date, [Loan_Reason] = @Loan_Reason, [Amount] = @Amount, [Grant] = @Grant WHERE [Loan_id] = @original_Loan_id AND (([Account_no] = @original_Account_no) OR ([Account_no] IS NULL AND @original_Account_no IS NULL)) AND (([Req_date] = @original_Req_date) OR ([Req_date] IS NULL AND @original_Req_date IS NULL)) AND [Loan_Reason] = @original_Loan_Reason AND [Amount] = @original_Amount AND (([Grant] = @original_Grant) OR ([Grant] IS NULL AND @original_Grant IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Loan_id" Type="Int32" />
                <asp:Parameter Name="original_Account_no" Type="String" />
                <asp:Parameter Name="original_Req_date" Type="DateTime" />
                <asp:Parameter Name="original_Loan_Reason" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
                <asp:Parameter Name="original_Grant" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Account_no" Type="String" />
                <asp:Parameter Name="Req_date" Type="DateTime" />
                <asp:Parameter Name="Loan_Reason" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="Grant" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Account_no" Type="String" />
                <asp:Parameter Name="Req_date" Type="DateTime" />
                <asp:Parameter Name="Loan_Reason" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="Grant" Type="String" />
                <asp:Parameter Name="original_Loan_id" Type="Int32" />
                <asp:Parameter Name="original_Account_no" Type="String" />
                <asp:Parameter Name="original_Req_date" Type="DateTime" />
                <asp:Parameter Name="original_Loan_Reason" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
                <asp:Parameter Name="original_Grant" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
