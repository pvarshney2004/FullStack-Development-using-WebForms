<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FS_ECommerce_Website_Review.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to our E-Commerce Website</h1>
            <h2>Login</h2>
            <asp:Label ID="Label1" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>

            <br />
            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
            <p>Not a user? <a href="Register.aspx">Signup</a></p>
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        </div>
    </form>
</body>
</html>
