<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="NhaTruong.aspx.cs" Inherits="QLTHPT.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Menu Chức Năng</h2>

    <ul>
           <li>
                 <asp:HyperLink ID="hpNamHoc" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=namhoc">Năm học</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpHocKy" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=kyhoc">Học kỳ</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpKhoiHoc" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=khoihoc">Khối lớp học</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpDSLop" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=dslop">Danh sách lớp</asp:HyperLink></li>
            
        <li>
            <asp:HyperLink ID="hpTTTruong" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=ttnhatruong">Thông tin nhà trường</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="hpTinTuc" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=tintuc">Tin tức</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="hpBanner" runat="server" NavigateUrl="~/NhaTruong.aspx?uc=banner">Banner</asp:HyperLink></li>
        <li><a href="admin.aspx">Về trang quản trị</a></li>
    </ul>
</asp:Content>
