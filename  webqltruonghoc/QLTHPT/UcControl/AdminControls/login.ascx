<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="QLTHPT.AdminControls.login" %>
<script>
    function doClick(buttonName, e) {
        var key;
        if (window.event)
            key = window.event.keyCode;     //IE
        else
            key = e.which;     //firefox
        if (key == 13) {
            var btn = document.getElementById(buttonName);
            if (btn != null) {
                btn.click();
                event.keyCode = 0
            }
        }
    }
</script>
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
                                  <br />
                                  <br />  <asp:RequiredFieldValidator ID="vldten" runat="server" ControlToValidate="txtuser" ErrorMessage="*Không được bỏ trống" ForeColor="Red">*Không được bỏ trống</asp:RequiredFieldValidator>
            <br />
        </div>
        <div class="loginform_row">
            <label>
                Password:</label>
            <asp:TextBox ID="txtpass" runat="server" CssClass="loginform_input" TextMode="Password"></asp:TextBox>
                                  <br />
                                  <br />   <asp:RequiredFieldValidator ID="vldpass" runat="server" ControlToValidate="txtpass" ErrorMessage="*Không được bỏ trống" ForeColor="Red">*Không được bỏ trống</asp:RequiredFieldValidator>
            <br />
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
