<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LoginForm.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            margin: auto;
            border: 2px black ridge;
        }

        .auto-style2 {
            text-align: center;
            font-size: 30px;
        }

        .auto-style3 {
            width: 180px;
        }

        .auto-style4 {
            width: 438px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2">SIGNUP FORM</td>
                </tr>
                <tr>
                    <td class="auto-style3">FirstName</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstNameTextBox" Display="Dynamic" ErrorMessage="Please enter firstname" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">LastName</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastNameTextBox" Display="Dynamic" ErrorMessage="Please enter lastname" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Gender</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="GenderDropDownList" runat="server" Width="146px">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="Select" ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="Please select a gender" ForeColor="Red" SetFocusOnError="True" ControlToValidate="GenderDropDownList">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Email</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Please enter email" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Enter a valid email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Address</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="Please enter address" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Username</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="UsernameTextBox" Display="Dynamic" ErrorMessage="Please enter username" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Password</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Please enter password" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Confirm Password</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="ConfirmPassTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ConfirmPassTextBox" Display="Dynamic" ErrorMessage="Confirm your password" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPassTextBox" Display="Dynamic" ErrorMessage="Confirm Password should match with password" ForeColor="Red">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="SubmitButton" runat="server" Text="SIGNUP" OnClick="SubmitButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <a href="Login.aspx">Go to login form</a></td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CCCCCC" Font-Size="Large" ForeColor="Red" />
        </div>
    </form>
    <p>
        &nbsp;
    </p>
</body>
</html>
