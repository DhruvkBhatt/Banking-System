<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan_req_status.aspx.cs" Inherits="project_S_E.Loan_req_status" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('h1.png');">
    
    <div>
    <form id="form1" runat="server">
        <p>
                    <asp:Button ID="Home" runat="server" Text="HOME"
                            OnClick="home_Click" ForeColor="#cc0066"  Width="170px" />
                    </p>
        <center>
            <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="Larger" ForeColor="Green" Text="Requested Loan status"></asp:Label>
        </center>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Loan_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Req_date" HeaderText="Req_date" SortExpression="Req_date" />
                    <asp:BoundField DataField="Loan_Reason" HeaderText="Loan_Reason" SortExpression="Loan_Reason" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Grant" HeaderText="Grant" SortExpression="Grant" />
                    <asp:BoundField DataField="Loan_id" HeaderText="Loan_id" InsertVisible="False" ReadOnly="True" SortExpression="Loan_id" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" DeleteCommand="DELETE FROM [Loan_req] WHERE [Loan_id] = @original_Loan_id AND (([Req_date] = @original_Req_date) OR ([Req_date] IS NULL AND @original_Req_date IS NULL)) AND [Loan_Reason] = @original_Loan_Reason AND [Amount] = @original_Amount AND (([Grant] = @original_Grant) OR ([Grant] IS NULL AND @original_Grant IS NULL))" InsertCommand="INSERT INTO [Loan_req] ([Req_date], [Loan_Reason], [Amount], [Grant]) VALUES (@Req_date, @Loan_Reason, @Amount, @Grant)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Req_date], [Loan_Reason], [Amount], [Grant], [Loan_id] FROM [Loan_req] WHERE ([Account_no] = @Account_no)" UpdateCommand="UPDATE [Loan_req] SET [Req_date] = @Req_date, [Loan_Reason] = @Loan_Reason, [Amount] = @Amount, [Grant] = @Grant WHERE [Loan_id] = @original_Loan_id AND (([Req_date] = @original_Req_date) OR ([Req_date] IS NULL AND @original_Req_date IS NULL)) AND [Loan_Reason] = @original_Loan_Reason AND [Amount] = @original_Amount AND (([Grant] = @original_Grant) OR ([Grant] IS NULL AND @original_Grant IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Loan_id" Type="Int32" />
                    <asp:Parameter Name="original_Req_date" Type="DateTime" />
                    <asp:Parameter Name="original_Loan_Reason" Type="String" />
                    <asp:Parameter Name="original_Amount" Type="Int32" />
                    <asp:Parameter Name="original_Grant" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Req_date" Type="DateTime" />
                    <asp:Parameter Name="Loan_Reason" Type="String" />
                    <asp:Parameter Name="Amount" Type="Int32" />
                    <asp:Parameter Name="Grant" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Account_no" SessionField="my_account_no" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Req_date" Type="DateTime" />
                    <asp:Parameter Name="Loan_Reason" Type="String" />
                    <asp:Parameter Name="Amount" Type="Int32" />
                    <asp:Parameter Name="Grant" Type="String" />
                    <asp:Parameter Name="original_Loan_id" Type="Int32" />
                    <asp:Parameter Name="original_Req_date" Type="DateTime" />
                    <asp:Parameter Name="original_Loan_Reason" Type="String" />
                    <asp:Parameter Name="original_Amount" Type="Int32" />
                    <asp:Parameter Name="original_Grant" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
        </p></form>
    </div>
    
</body>
</html>
