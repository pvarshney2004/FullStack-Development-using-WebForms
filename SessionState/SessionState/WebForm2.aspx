<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="SessionState.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>This is webform page 2</h2>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/WebForm3.aspx">Go to page 3</asp:LinkButton>
        </div>
    </form>
</body>
</html>
