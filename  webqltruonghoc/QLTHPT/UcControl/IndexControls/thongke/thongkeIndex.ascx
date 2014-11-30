<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="thongkeIndex.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.thongke.thongkeIndex" %>
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

    .table
    {
        padding: 60px 0 200px 0 ;
    }
    .auto-style5 {
        width: 130px;
        padding: 0 0 0 30px;
    }
    .auto-style6 {
        width: 118px;
        padding: 0 0 0 30px;
    }
</style>
<table border="0" align="center" style="height: 115px; width: 667px" class="table">
    <tr>
        <%--   <td align="center" valign="middle" class="auto-style5">
            <asp:HyperLink ID="hpTrangChu" runat="server"
                ImageUrl="~/App_Themes/nhatruong/images/home.png"
                NavigateUrl="~/Default.aspx" ToolTip="Trang chủ"></asp:HyperLink>
        </td>--%>
        <td align="center" valign="middle" class="auto-style4">
            <asp:ImageButton ID="imgDanhGiaDiem" runat="server" ImageUrl="~/App_Themes/IndexPage/stats.png" OnClick="imgDanhGiaDiem_Click" Height="64px" Width="64px"/>
        </td>
        <td align="center" class="auto-style5">
            <asp:ImageButton ID="imgTKLop" runat="server" ImageUrl="~/App_Themes/IndexPage/stats (1).png" Height="64px" Width="64px" />
        </td>
        <td align="center" class="auto-style6">

            <asp:ImageButton ID="img" runat="server" ImageUrl="~/App_Themes/nhatruong/images/hanhkiem.png" />

        </td>
        <td align="center" class="auto-style4">
            <asp:ImageButton ID="img2" runat="server" ImageUrl="~/App_Themes/nhatruong/images/thoikhoabieu.png" PostBackUrl="~/UcControl/IndexControls/thongke/Thong_ke.aspx" />
        </td>
        <%--    <td align="center" class="auto-style13">
            <asp:ImageButton ID="imgTienIch" runat="server" ImageUrl="~/App_Themes/admin/images/package_system.png"/>
        </td>--%>

    </tr>
    <tr>
        <%--  <td align="center" valign="top" class="auto-style7">Trang chủ<br />
        </td>--%>
        <td align="center" valign="top" class="auto-style4">Thống kê điểm theo lớp</td>
        <td align="center" valign="top" class="auto-style5">&nbsp;&nbsp; Thống kê danh sách học sinh kỷ luật</td>

        <td align="center" valign="top" class="auto-style6">Thống kê danh sách khen thưởng</td>
        <td align="center" valign="top" class="auto-style4">Điểm tổng kết và sếp hạng học sinh</td>
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
