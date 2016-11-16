<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="interest_change.aspx.cs" Inherits="project_S_E.interest_change" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4" DataKeyNames="Account_type_no" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="50px" Width="125px" BorderStyle="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" ForeColor="White" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Interest" HeaderText="Interest" SortExpression="Interest" />
                <asp:BoundField DataField="Account_type_no" HeaderText="Account_type_no" ReadOnly="True" SortExpression="Account_type_no" />
                <asp:BoundField DataField="Acc_Type_Nm" HeaderText="Acc_Type_Nm" SortExpression="Acc_Type_Nm" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" SelectCommand="SELECT [Interest], [Account_type_no], [Acc_Type_Nm] FROM [Account_type]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Account_type] WHERE [Account_type_no] = @original_Account_type_no AND [Interest] = @original_Interest AND [Acc_Type_Nm] = @original_Acc_Type_Nm" InsertCommand="INSERT INTO [Account_type] ([Interest], [Account_type_no], [Acc_Type_Nm]) VALUES (@Interest, @Account_type_no, @Acc_Type_Nm)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Account_type] SET [Interest] = @Interest, [Acc_Type_Nm] = @Acc_Type_Nm WHERE [Account_type_no] = @original_Account_type_no AND [Interest] = @original_Interest AND [Acc_Type_Nm] = @original_Acc_Type_Nm">
            <DeleteParameters>
                <asp:Parameter Name="original_Account_type_no" Type="String" />
                <asp:Parameter Name="original_Interest" Type="Double" />
                <asp:Parameter Name="original_Acc_Type_Nm" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Interest" Type="Double" />
                <asp:Parameter Name="Account_type_no" Type="String" />
                <asp:Parameter Name="Acc_Type_Nm" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Interest" Type="Double" />
                <asp:Parameter Name="Acc_Type_Nm" Type="String" />
                <asp:Parameter Name="original_Account_type_no" Type="String" />
                <asp:Parameter Name="original_Interest" Type="Double" />
                <asp:Parameter Name="original_Acc_Type_Nm" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
