<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="FS_ECommerce_Website_Review.CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridViewCart"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="table"
        DataKeyNames="CartId"
        OnRowCommand="GridViewCart_RowCommand">

        <Columns>

            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />

            <asp:BoundField DataField="Price" HeaderText="Price"
                DataFormatString="₹ {0}" />

            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

            <asp:BoundField DataField="TotalPrice" HeaderText="Total"
                DataFormatString="₹ {0}" />

            <asp:TemplateField HeaderText="Remove">
                <ItemTemplate>
                    <asp:Button
                        ID="btnRemove"
                        runat="server"
                        Text="Remove"
                        CommandName="RemoveItem"
                        CommandArgument='<%# Eval("CartId") %>'
                        CssClass="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
    <br />

    <asp:Label ID="lblGrandTotal" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>

    <br />
    <br />

    <asp:Button ID="btnPlaceOrder"
        runat="server"
        Text="Place Order"
        CssClass="btn btn-success"
        OnClick="btnPlaceOrder_Click" />
</asp:Content>
