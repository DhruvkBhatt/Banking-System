<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration_page.aspx.cs" Inherits="project_S_E.Registration_page" %>

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
    
<asp:Label Text="Update Your Details" ID="lb1" runat="server" ForeColor="Green" Font-Bold="true" Font-Size="Larger" />
               <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="User_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="User_id" HeaderText="User_id" InsertVisible="False" ReadOnly="True" SortExpression="User_id" />
                <asp:BoundField DataField="User_name" HeaderText="User_name" SortExpression="User_name" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Pincode" HeaderText="Pincode" SortExpression="Pincode" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Email_id" HeaderText="Email_id" SortExpression="Email_id" />
                <asp:BoundField DataField="Ph_no" HeaderText="Ph_no" SortExpression="Ph_no" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:online_banking_systemConnectionString %>" DeleteCommand="DELETE FROM [User_db] WHERE [User_id] = @original_User_id AND (([User_name] = @original_User_name) OR ([User_name] IS NULL AND @original_User_name IS NULL)) AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Pincode] = @original_Pincode) OR ([Pincode] IS NULL AND @original_Pincode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([DOB] = @original_DOB) OR ([DOB] IS NULL AND @original_DOB IS NULL)) AND [Email_id] = @original_Email_id AND (([Ph_no] = @original_Ph_no) OR ([Ph_no] IS NULL AND @original_Ph_no IS NULL))" InsertCommand="INSERT INTO [User_db] ([User_name], [State], [City], [Pincode], [Country], [DOB], [Email_id], [Ph_no]) VALUES (@User_name, @State, @City, @Pincode, @Country, @DOB, @Email_id, @Ph_no)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [User_id], [User_name], [State], [City], [Pincode], [Country], [DOB], [Email_id], [Ph_no] FROM [User_db] WHERE ([Account_no] = @Account_no)" UpdateCommand="UPDATE [User_db] SET [User_name] = @User_name, [State] = @State, [City] = @City, [Pincode] = @Pincode, [Country] = @Country, [DOB] = @DOB, [Email_id] = @Email_id, [Ph_no] = @Ph_no WHERE [User_id] = @original_User_id AND (([User_name] = @original_User_name) OR ([User_name] IS NULL AND @original_User_name IS NULL)) AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Pincode] = @original_Pincode) OR ([Pincode] IS NULL AND @original_Pincode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([DOB] = @original_DOB) OR ([DOB] IS NULL AND @original_DOB IS NULL)) AND [Email_id] = @original_Email_id AND (([Ph_no] = @original_Ph_no) OR ([Ph_no] IS NULL AND @original_Ph_no IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_User_id" Type="Int32" />
                <asp:Parameter Name="original_User_name" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Pincode" Type="String" />
                <asp:Parameter Name="original_Country" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DOB" />
                <asp:Parameter Name="original_Email_id" Type="String" />
                <asp:Parameter Name="original_Ph_no" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_name" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Pincode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter DbType="Date" Name="DOB" />
                <asp:Parameter Name="Email_id" Type="String" />
                <asp:Parameter Name="Ph_no" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Account_no" SessionField="my_account_no" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_name" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Pincode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter DbType="Date" Name="DOB" />
                <asp:Parameter Name="Email_id" Type="String" />
                <asp:Parameter Name="Ph_no" Type="Decimal" />
                <asp:Parameter Name="original_User_id" Type="Int32" />
                <asp:Parameter Name="original_User_name" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Pincode" Type="String" />
                <asp:Parameter Name="original_Country" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DOB" />
                <asp:Parameter Name="original_Email_id" Type="String" />
                <asp:Parameter Name="original_Ph_no" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
