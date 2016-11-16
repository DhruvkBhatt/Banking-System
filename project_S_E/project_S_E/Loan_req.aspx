<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan_req.aspx.cs" Inherits="project_S_E.Loan_req" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                        Loan Ammount:
            </td>
            <td>
                <asp:TextBox ID="txtamount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtamount"
                    
                    ErrorMessage="Enter the amount"></asp:RequiredFieldValidator>
            </td>
        </tr><tr>
            <td>
                Loan_reason:
            </td>
            <td>
                 <asp:TextBox ID="textreason" TextMode="multiline" Columns="50" Rows="5" runat="server" ></asp:TextBox>
                
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="textreason"
                     runat="server" ErrorMessage="Enter the resoun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
               
            </td>
            <td>
                 <asp:Button ID="btnreq" runat="server" Text="Request" OnClick="btnreq_Click" />
            </td>
        </tr>
    </table>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
