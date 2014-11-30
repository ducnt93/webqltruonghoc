<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tintuc.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.WebUserControl1" %>
<div>
    
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
             
            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDeTin") %>' NavigateUrl='<%# "~/chitiettintuc.aspx?id=" + Eval("MaTinTuc") %>'></asp:HyperLink>
            <br />
             Ngày đăng: <asp:Label ID="Label4" runat="server" Text='<%# Eval("NgayDangTin") %>'></asp:Label>
            
            <br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("MoTaNgan") %>'></asp:Label>
            <br />
            <br />
          
            <hr />
        </ItemTemplate>
    </asp:Repeater>
    
</div>