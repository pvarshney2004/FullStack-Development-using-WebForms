<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="FS_ECommerce_Website_Review.ProductsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Our Collection</h1>
    <asp:GridView DataKeyNames="ProductId"
        OnRowCommand="GridViewProducts_RowCommand"
        ID="GridViewProducts" runat="server" AutoGenerateColumns="False" CssClass="table">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" />
            <asp:ButtonField Text="Add To Cart" CommandName="AddToCart" ButtonType="Button" />
        </Columns>
    </asp:GridView>
    <div>
    </div>
</asp:Content>
