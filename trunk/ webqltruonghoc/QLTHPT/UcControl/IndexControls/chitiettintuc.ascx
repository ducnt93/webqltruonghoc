<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chitiettintuc.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.chitiettintuc" %>
<div>

    <asp:FormView ID="FormView1" runat="server" Height="812px" Width="688px">
        <ItemTemplate>
            Tiêu đề tin:<asp:Label ID="Label1" runat="server" Text='<%# Eval("TieuDeTin") %>'></asp:Label>
            <br />
            <br />
            Ngày đăng:<asp:Label ID="Label4" runat="server" Text='<%# Eval("NgayDangTin") %>'></asp:Label>
            <br />
            Mô tả ngắn:<asp:Label ID="Label2" runat="server" Text='<%# Eval("MoTaNgan") %>'></asp:Label>
            <br />
            <br />
            Nội dung tin tức:
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NoiDungTin") %>'></asp:Label>
            <br />
            
        </ItemTemplate>
    </asp:FormView>

</div>