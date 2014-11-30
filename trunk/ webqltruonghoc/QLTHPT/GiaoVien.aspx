<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="GiaoVien.aspx.cs" Inherits="QLTHPT.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Menu Chức Năng</h2>
    
        <ul>
            <li> <asp:HyperLink ID="hpGiaoVien" runat="server" NavigateUrl="~/GiaoVien.aspx?id=giaovien">Giáo viên</asp:HyperLink></li>
            <li><asp:HyperLink ID="hpToMon" runat="server" NavigateUrl="~/GiaoVien.aspx?id=tomon">Tổ bộ môn</asp:HyperLink></li>
            <li><a href="admin.aspx">Về trang quản trị</a></li>
        </ul>
</asp:Content>
