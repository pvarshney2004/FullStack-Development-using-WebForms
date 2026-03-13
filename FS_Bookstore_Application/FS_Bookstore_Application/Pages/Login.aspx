<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FS_Bookstore_Application.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 67%;
        }
        .auto-style2 {
            width: 42px;
        }
        .auto-style3 {
            width: 1010px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="3" class="auto-style1">
                <tr>
                    <td colspan="2"><h1 class="auto-style3">WELCOME TO OUR BOOKSTORE APPLICATION</h1></td>
                </tr>
                <tr>
                    <td colspan="2"><h2>LOGIN FORM</h2></td>
                </tr>
                <tr>
                    <td class="auto-style2">EMAIL</td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">PASSWORD</td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="LoginButton" runat="server" Height="41px" Text="Login" Width="116px" OnClick="LoginButton_Click" />
                        <a href="Register.aspx">Don't have an account? Register</a>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
