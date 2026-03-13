<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FS_ECommerce_Website_Review._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; margin-top: 80px; font-family: Arial;">
        <h1 style="color: #333;">Welcome to FS Fashion</h1>

        <h3 style="color: #666;">Hello, 
        <asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="#007bff"></asp:Label>

        </h3>

        <p style="margin-top: 20px; font-size: 18px; color: #555;">
            Discover the latest trends in Men, Women & Kids fashion.
        </p>

        <div style="margin-top: 40px;">

            <asp:HyperLink
                ID="HyperLink1"
                runat="server"
                NavigateUrl="ProductsPage.aspx"
                Text="🛒 Browse Products"
                Style="padding: 12px 25px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; font-size: 16px;">
            </asp:HyperLink>

            <asp:Button ID="LogoutButton" runat="server" Height="41px" OnClick="LogoutButton_Click1" Text="LOGOUT" Width="92px" />

            <asp:HyperLink
                ID="lnkChangePassword"
                runat="server"
                NavigateUrl="ChangePassword.aspx"
                Text="Change Password"
                Style="margin-right: 15px;" />

        </div>

    </div>


</asp:Content>
