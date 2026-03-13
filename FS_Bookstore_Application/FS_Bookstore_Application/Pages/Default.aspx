<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FS_Bookstore_Application._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="home-container">

        <div class="top-bar">
            <h2 class="welcome-text">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </h2>

            <asp:Button ID="LogoutButton"
                runat="server"
                Text="Logout"
                CssClass="logout-btn"
                OnClick="LogoutButton_Click" />
        </div>

        <div class="hero-section">
            <h1 class="main-heading">Welcome to FS Bookstore 📚</h1>

            <p class="description">
                Discover a world of books at your fingertips. Whether you're a fiction lover,
                a non-fiction enthusiast, or looking for the latest bestsellers,
                FS Bookstore has something for everyone.
            </p>

            <a href="Books.aspx" class="explore-btn">Explore Our Book Collection
            </a>
        </div>

    </div>

</asp:Content>
