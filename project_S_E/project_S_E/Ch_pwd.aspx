<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ch_pwd.aspx.cs" Inherits="project_S_E.Ch_pwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url('h1.png');">
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Home" runat="server" Text="HOME"
                            OnClick="home_Click" ForeColor="#cc0066" Width="170px" /><br />
            <center><asp:Label ForeColor="Green" Text="Change Your Passsword" runat="server" Font-Bold="true" Font-Size="Larger"></asp:Label></center>
            <table>
                <tr>
                    <td>Old password</td>
                    <td>:<asp:TextBox ID="txtoldpwd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ErrorMessage="old Password required" Text="*"
                            ControlToValidate="txtoldpwd" ForeColor="Red"
                            Display="Dynamic"></asp:RequiredFieldValidator>

                    </td>

                </tr>
                <tr>
                    <td>New Password
                    </td>
                    <td>:<asp:TextBox ID="txtPassword" TextMode="Password" runat="server">
                    </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword"
                            runat="server" ErrorMessage="New Password required" Text="*"
                            ControlToValidate="txtPassword" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExp1" runat="server"
                            ErrorMessage="Password length must be between 7 to 10 characters"
                            ControlToValidate="txtPassword"
                            ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password
                    </td>
                    <td>:<asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server">
                    </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword"
                            runat="server" ErrorMessage="Confirm Password required" Text="*"
                            ControlToValidate="txtConfirmPassword" ForeColor="Red"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
                            ErrorMessage="Password and Confirm Password must match"
                            ControlToValidate="txtConfirmPassword" ForeColor="Red"
                            ControlToCompare="txtPassword" Display="Dynamic"
                            Type="String" Operator="Equal" Text="*">
                        </asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnRegister" runat="server" Text="Save password"
                            OnClick="btnRegister_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <p>
            &nbsp;
        </p>
    </form>
</body>
</html>
