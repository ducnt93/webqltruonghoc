<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QuanLyHocSinh.aspx.cs" Inherits="QLTHPT.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
    </asp:PlaceHolder>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <h2>Menu Chức Năng</h2>
    
        <ul>
       
            <li>
                <asp:HyperLink ID="hpDiem" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=diem">Bảng điểm</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpHanhKiem" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=hanhkiem">Hạnh kiểm</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpKhenThuong" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=khenthuong">Khen thưởng</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpKyLuat" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=kyluat">Kỷ luật</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="hpThoiKhoaBieu" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=thoikhoabieu">Thời khóa biểu</asp:HyperLink>

            </li>
           <li>
                <asp:HyperLink ID="hpChuyenLop" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=chuyenlop">Chuyển lớp</asp:HyperLink>

            </li>
              <li><a href="admin.aspx">Về trang quản trị</a></li>
        </ul>
</asp:Content>
