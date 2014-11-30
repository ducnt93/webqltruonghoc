<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IndexTracuu.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuu.IndexTracuu" %>
<style type="text/css">
    .style1 {
        width: 91px;
    }

    .style2 {
        width: 81px;
    }
    .drop
     {
         width:200px;
         height:32px;
     }
     .textbox
     {
          width:200px;
         height:32px;
     }


    .style3 {
        width: 68px;
    }

    .auto-style4 {
        width: 103px;
        padding: 0 0 0 30px;
    }

    .auto-style5 {
        width: 83px;
    }

    .auto-style6 {
        width: 90px;
    }

    .auto-style7 {
        width: 83px;
        height: 56px;
    }

    .auto-style8 {
        width: 103px;
        height: 56px;
    }

    .auto-style9 {
        width: 90px;
        height: 56px;
    }

    .auto-style10 {
        width: 91px;
        height: 56px;
    }

    .auto-style11 {
        height: 56px;
    }

    .auto-style12 {
        width: 64px;
        height: 56px;
    }

    .auto-style13 {
        width: 64px;
    }
    .table
    {
        padding: 60px 0 200px 0 ;
    }
</style>
<table border="0" align="center" style="height: 115px; width: 593px" class="table">
    <tr>
     <%--   <td align="center" valign="middle" class="auto-style5">
            <asp:HyperLink ID="hpTrangChu" runat="server"
                ImageUrl="~/App_Themes/nhatruong/images/home.png"
                NavigateUrl="~/Default.aspx" ToolTip="Trang chủ"></asp:HyperLink>
        </td>--%>
        <td align="center" valign="middle" class="auto-style4">
            <asp:ImageButton ID="imgtths" runat="server" ImageUrl="~/App_Themes/nhatruong/images/thongtinhs.png" OnClick="imgtths_Click"/>
        </td>
        <td align="center" class="auto-style4">
            <asp:ImageButton ID="imgdiemhs" runat="server" ImageUrl="~/App_Themes/nhatruong/images/diem.png" OnClick="imgdiemhs_Click" />
        </td>
        <td align="center" class="auto-style4">

            <asp:ImageButton ID="imgHanhKiem" runat="server" ImageUrl="~/App_Themes/nhatruong/images/hanhkiem.png" OnClick="imgHanhKiem_Click" />

        </td>
        <td align="center" class="auto-style4">
            <asp:ImageButton ID="imgThoiKhoaBieu" runat="server" ImageUrl="~/App_Themes/nhatruong/images/thoikhoabieu.png" OnClick="imgThoiKhoaBieu_Click" />
        </td>
    <%--    <td align="center" class="auto-style13">
            <asp:ImageButton ID="imgTienIch" runat="server" ImageUrl="~/App_Themes/admin/images/package_system.png"/>
        </td>--%>

    </tr>
    <tr>
      <%--  <td align="center" valign="top" class="auto-style7">Trang chủ<br />
        </td>--%>
        <td align="center" valign="top" class="auto-style4">Thông tin học
        sinh</td>
        <td align="center" valign="top" class="auto-style4">&nbsp;&nbsp; Điểm học sinh</td>

        <td align="center" valign="top" class="auto-style4">Hạnh kiểm&nbsp;<br />
            học sinh</td>
        <td align="center" valign="top" class="auto-style4">&nbsp;Thời khóa
        <br />
            biểu</td>
    <%--    <td align="center" valign="top" class="auto-style12">Tiện ích </td>--%>
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
