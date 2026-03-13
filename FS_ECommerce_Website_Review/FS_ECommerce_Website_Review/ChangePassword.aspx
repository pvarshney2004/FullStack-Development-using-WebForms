<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FS_ECommerce_Website_Review.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Change Password</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        <br />
        <br />

        <asp:Label Text="Current Password" runat="server" />
        <br />
        <asp:TextBox ID="txtCurrentPassword" runat="server"
            TextMode="Password"></asp:TextBox>

        <br />
        <br />

        <asp:Label Text="New Password" runat="server" />
        <br />
        <asp:TextBox ID="txtNewPassword" runat="server"
            TextMode="Password"></asp:TextBox>

        <br />
        <br />

        <asp:Label Text="Confirm New Password" runat="server" />
        <br />
        <asp:TextBox ID="txtConfirmPassword" runat="server"
            TextMode="Password"></asp:TextBox>

        <br />
        <br />

        <asp:Button ID="btnChangePassword"
            runat="server"
            Text="Change Password"
            OnClick="btnChangePassword_Click" />

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login Now" />

    </form>
</body>
</html>
