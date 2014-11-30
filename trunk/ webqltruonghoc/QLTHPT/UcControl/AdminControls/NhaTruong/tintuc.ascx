<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tintuc.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.NhaTruong.tintuc" %>

<div>

   <h2> Quản lý tin tức của nhà trường:</h2>
    <br />


    <asp:DataList ID="dlTintuc" runat="server" Width="830px">
        <ItemTemplate>
            Tiêu đề tin:<asp:Label ID="Label1" runat="server" Text='<%# Eval("TieuDeTin") %>'></asp:Label>
            <br />
            <br />
            Mô tả ngắn:<asp:Label ID="Label2" runat="server" Text='<%# Eval("MoTaNgan") %>'></asp:Label>
            <br />
            <br />
            Nội dung tin tức:
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NoiDungTin") %>'></asp:Label>
            <br />
            <br />
            Ngày đăng:<asp:Label ID="Label4" runat="server" Text='<%# Eval("NgayDangTin") %>'></asp:Label>
            <br />
            <hr />
        </ItemTemplate>
    </asp:DataList>


</div>

