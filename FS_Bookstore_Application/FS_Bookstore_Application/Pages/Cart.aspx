<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FS_Bookstore_Application.Pages.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridViewCart"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="table"
            DataKeyNames="CartId"
            OnRowCommand="GridViewCart_RowCommand">

            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Book Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total" />

                <asp:ButtonField
                    Text="Remove"
                    CommandName="RemoveItem"
                    ButtonType="Button" />
            </Columns>
        </asp:GridView>

        <a href="Default.aspx">Go to home page</a>
    </form>
</body>
</html>
