<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="QLTHPT.AdminControls.login" %>
<div id="loginpanelwrap">
    <div class="loginheader">
        <div class="logintitle">
            <a href="#">Đăng nhập hệ thống</a></div>
    </div>
    <div class="loginform">
        <div class="loginform_row">
            <label>
                Username:</label>
            <asp:TextBox ID="txtuser" runat="server" CssClass="loginform_input"></asp:TextBox>
        </div>
        <div class="loginform_row">
            <label>
                Password:</label>
            <asp:TextBox ID="txtpass" runat="server" CssClass="loginform_input" TextMode="Password"></asp:TextBox>
        </div>
        <div class="loginform_row">
            <asp:Button ID="bntLogin" runat="server" Text="Login" CssClass="loginform_submit" OnClick="bntLogin_Click"
                 />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Style="color: #FF0000"></asp:Label>
        </div>
        <div class="clear">
        </div>
    </div>
</div>
