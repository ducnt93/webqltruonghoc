<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tintuctomtat.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tintuctomtat" %>
<style type="text/css">
    div.tintomtat {
    margin: 20px 25px 46px 3px;
   
}
</style>
<div>
    <div class="news">
    <h2>Tin tức</h2>
    </div>
    <br />
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="tintomtat">


                <hr />
                <br />
                <h3>Tiêu đề:
                <asp:HyperLink ID="hpTieuDe" CssClass="tieudetin" runat="server" Text='<%# Eval("TieuDeTin") %>' NavigateUrl='<%# "~/chitiettintuc.aspx?id=" + Eval("MaTinTuc") %>'></asp:HyperLink>
               </h3>
                <h3>Ngày đăng:
                <asp:Label ID="lblNgayDang" CssClass="ngaydang" runat="server" Text='<%# Eval("NgayDangTin")  %>'></asp:Label>
                </h3>
                <asp:Label ID="lblTomTat" runat="server" Text='<%# Eval("MoTaNgan") %>'></asp:Label>
            </div>
        </ItemTemplate>

    </asp:Repeater>
    <hr />
    <h3>Các tin khác:</h3>
    <asp:Repeater ID="rptTinLienQuan" runat="server">
        <ItemTemplate>
            <asp:HyperLink ID="hpTinKhac" NavigateUrl='<%# "~/chitiettintuc.aspx?id=" + Eval("MaTinTuc") %>' Text='<%# Eval("TieuDeTin") %>' runat="server"></asp:HyperLink> Ngày đăng: <asp:Label ID="Label1" runat="server" Text='<%# Eval("NgayDangTin") %>'></asp:Label>
            <br />
        </ItemTemplate>
    </asp:Repeater>
</div>