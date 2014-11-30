<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDiem.aspx.cs" Inherits="QLTHPT.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Menu Chức Năng</h2>
    <ul>
        <li>
            <asp:HyperLink ID="hpVeTrang" runat="server" NavigateUrl="~/admin.aspx">Về trang quản trị</asp:HyperLink>
        </li>
    </ul>
</asp:Content>

