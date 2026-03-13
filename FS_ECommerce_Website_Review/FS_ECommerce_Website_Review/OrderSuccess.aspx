<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="FS_ECommerce_Website_Review.OrderSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Order Placed Successfully!</h2>
    <asp:HyperLink ID="HyperLink1" runat="server"
        NavigateUrl="OrdersPage.aspx"
        Text="View My Orders" />
</asp:Content>
