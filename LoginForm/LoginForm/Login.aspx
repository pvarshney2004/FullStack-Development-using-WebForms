<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            font-size: 30px;
        }

        table {
            margin: auto;
            width: 349px;
            border: 5px black ridge;
            height: 341px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="3" cellspacing="3">
                <tr>
                    <td class="auto-style2" colspan="2">LOGIN</td>
                </tr>
                <tr>
                    <td>USERNAME</td>
                    <td>
                        <asp:TextBox ID="UserTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserTextBox" Display="Dynamic" ErrorMessage="Please Enter username" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>PASSWORD</td>
                    <td>
                        <asp:TextBox ID="PassTextBox" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PassTextBox" Display="Dynamic" ErrorMessage="Please Enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input type="checkbox" onchange="document.getElementById('PassTextBox').type = this.checked ? 'text' : 'password'" />Show Password</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="LoginButton" runat="server" Height="38px" Text="Login" Width="82px" OnClick="LoginButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="Register.aspx">Not Registered Yet? Click here</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
