<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="FS_ECommerce_Website_Review.OrdersPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/">Full-Stack Fashion E-Commerce Website </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Default">Home</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/About">About</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/CartPage">Cart</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/OrdersPage">Orders</a></li>

                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <h2>My Orders</h2>

        <asp:GridView ID="GridViewOrders"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="table"
            DataKeyNames="OrderId">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                <asp:BoundField DataField="OrderDate"
                    HeaderText="Date"
                    DataFormatString="{0:dd-MM-yyyy}" />

                <asp:BoundField DataField="TotalAmount"
                    HeaderText="Total"
                    DataFormatString="₹ {0}" />

                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
        <br />
        <a href="Default.aspx">Go to home page</a>
    </form>
</body>
</html>
