<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FS_ECommerce_Website_Review.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %> Page</h2>
        <h3>Contact us at:</h3>
        <address>
            Room No. 101, StartUp Baithak, CSED, AB-11<br />
            GLA University, Mathura<br />
            <abbr title="Phone">Phone:</abbr>
            9999988888
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">fs.ecommerce@gmail.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">fs.ecommerce.marketing@gmail.com</a>
        </address>
    </main>
</asp:Content>
