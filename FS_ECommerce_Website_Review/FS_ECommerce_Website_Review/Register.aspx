<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FS_ECommerce_Website_Review.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 31px;
        }

        .auto-style3 {
            width: 166px;
        }

        .auto-style4 {
            height: 31px;
            width: 166px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to our E-Commerce Website</h1>
            <h2>Signup</h2>
            <table cellpadding="3" cellspacing="3" class="auto-style1">
                <tr>
                    <td class="auto-style3">Username:</td>
                    <td>
                        <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsernameTextBox" Display="Dynamic" ErrorMessage="Username is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Email is not valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Password:</td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="RegisterButton" runat="server" Height="34px" Text="Register" Width="95px" OnClick="RegisterButton_Click" />
                        <br />
                        <br />
                        Already a user? <a href="Login.aspx">Login</a></td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    </form>
</body>
</html>
