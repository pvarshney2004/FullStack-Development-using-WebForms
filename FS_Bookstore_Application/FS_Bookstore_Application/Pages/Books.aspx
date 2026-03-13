<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="FS_Bookstore_Application.Pages.Books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../StyleSheet1.css" />
</head>

<body>
    <form id="form1" runat="server">
        <h1>Our Collection</h1>
        <asp:GridView DataKeyNames="BookId"
            OnRowCommand="GridViewBooks_RowCommand" ID="GridViewBooks" runat="server" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" />
                <asp:ButtonField Text="Add To Cart" CommandName="AddToCart" ButtonType="Button" />
            </Columns>
        </asp:GridView>
        <a class="btn" href="Default.aspx">Go to home page</a>
        <a class="btn" href="Cart.aspx">Go to cart page</a>
        <div>
        </div>
    </form>
</body>
</html>
