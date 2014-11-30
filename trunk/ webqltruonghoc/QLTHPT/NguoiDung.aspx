<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="NguoiDung.aspx.cs" Inherits="QLTHPT.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <h2>Menu Chức Năng</h2>
    
        <ul>
            <li>
                <asp:HyperLink ID="hpNguoiDung" runat="server" NavigateUrl="~/NguoiDung.aspx?uc=nguoidung">Người dùng</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpNhomNguoiDung" runat="server" NavigateUrl="~/NguoiDung.aspx?uc=nhomnguoidung">Nhóm người dùng</asp:HyperLink></li>
            <li><a href="admin.aspx">Về trang quản trị</a></li>
        </ul>
</asp:Content>
