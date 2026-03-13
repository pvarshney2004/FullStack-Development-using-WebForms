<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validation_Form.aspx.cs" Inherits="Validation.Validation_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 77%;
            height: 94px;
        }

        .auto-style2 {
            width: 574px;
        }

        .auto-style3 {
        }
        .auto-style4 {
            height: 34px;
        }
        .auto-style5 {
            width: 574px;
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student registration form</h2>


            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="LightGray" Font-Size="Large" ForeColor="Red" Width="531px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Student Name</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="NameTextBox" runat="server" Width="164px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Please enter your name" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Student Email</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Enter your email" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Email is not valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Re-Enter Email</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="ReEnterTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ReEnterTextBox" ErrorMessage="Re-Enter your email" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="EmailTextBox" ControlToValidate="ReEnterTextBox" Display="Dynamic" ErrorMessage="Email is not same" ForeColor="Red" SetFocusOnError="True">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Class</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="ClassTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ClassTextBox" Display="Dynamic" ErrorMessage="Please enter class" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ClassTextBox" Display="Dynamic" ErrorMessage="Class should be from 1 to 12" ForeColor="Red" MaximumValue="12" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Gender</td>
                    <td class="auto-style5">
                        <asp:RadioButton ID="MaleRadioButton" runat="server" Text="Male" GroupName="GenderGroup" />
                        <asp:RadioButton ID="FemaleRadioButton" runat="server" Text="Female" GroupName="GenderGroup" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please select a gender" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Height="34px" OnClick="Button1_Click" Text="Submit" Width="94px" />
                    </td>
                </tr>
            </table>


        </div>
    </form>
</body>
</html>
