﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="index.ascx.cs" Inherits="QLTHPT.AdminControls.tracuuindex" %>
<style type="text/css">
    .style1 {
        width: 91px;
    }

    .style2 {
        width: 81px;
    }

    .style3 {
        width: 68px;
    }

    .auto-style5 {
        width: 83px;
    }

    .auto-style7 {
        width: 83px;
        height: 56px;
    }

    .auto-style12 {
        width: 74px;
        height: 56px;
    }

    .auto-style13 {
        width: 74px;
    }
    .auto-style15 {
        width: 103px;
        height: 56px;
    }
    .auto-style16 {
        width: 103px;
    }
    .auto-style17 {
        width: 98px;
    }
    .auto-style18 {
        width: 98px;
        height: 56px;
    }
</style>
        <table border="0" align="center" style="height: 115px; width: 690px">
    <tr>
        <td align="center" valign="middle" class="auto-style5">
            <asp:HyperLink ID="hpTrangChu" runat="server"
                ImageUrl="~/App_Themes/admin/images/home.png"
                NavigateUrl="~/Default.aspx" ToolTip="Trang chủ"></asp:HyperLink>
        </td>
        <td align="center" valign="middle" class="auto-style16">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/App_Themes/admin/images/student.png" OnClick="ImageButton2_Click" />
        </td>
        <td align="center" class="auto-style17">
            <asp:ImageButton ID="imgTeacher" runat="server" ImageUrl="~/App_Themes/admin/images/Teacher_64.png" OnClick="imgTeacher_Click" />


        </td>
        <td align="center" class="auto-style16">
            <asp:ImageButton ID="imgNguoiDung" runat="server" ImageUrl="~/App_Themes/admin/images/account-msn.png" OnClick="imgNguoiDung_Click" />
        </td>
        <td align="center" class="auto-style13">
            <asp:ImageButton ID="imgNhaTrung" runat="server" ImageUrl="~/App_Themes/admin/images/education.png" OnClick="imgNhaTrung_Click" />
        </td>

    </tr>
    <tr>
        <td align="center" valign="top" class="auto-style7">Trang chủ<br />
        </td>
        <td align="center" valign="top" class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp; Quản lý học
        sinh</td>

        <td align="center" valign="top" class="auto-style18">Quản lý
            giáo viên</td>
        <td align="center" valign="top" class="auto-style15">&nbsp;Quản lý người<br />
            dùng</td>
        <td align="center" valign="top" class="auto-style12">Quản lý
            <br />
            nhà trường</td>
    </tr>
</table>
<hr />
<%--<div class="toogle_wrap">
            <div class="trigger active"><a href="#">Tổng Quan Về Trang Quản Trị</a></div>

            <div class="toggle_container" style="display: block;">
			<p>
      demo
			</p>
            </div>
        </div>--%>
<table align="center">
    <tr>
        <td>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </td>
    </tr>
</table>

