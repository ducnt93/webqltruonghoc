<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ttnhatruong.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.NhaTruong.ttnhatruong" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
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

    .auto-style2 {
        height: 34px;
    }
    .auto-style3 {
        height: 34px;
        width: 351px;
    }
    .auto-style4 {
        width: 351px;
    }
</style>
<div>

    <asp:FormView ID="FormView1" runat="server" Width="779px">
        <ItemTemplate>
            <table cellpadding="5" cellspacing="5" class="auto-style1">
                <tr>
                    <td colspan="2"><h2>Thông tin nhà trường: </h2></td>
                </tr>
                <caption>
                    <hr />
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/App_Themes/nhatruong/images/" + Eval("AnhDaiDien") %>' Height="300px" Width="720px" />
                            <br />
                            (Ảnh đại diện)<br /></td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Mã nhà trường:
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaTruong") %>'></asp:Label>
                        </td>
                        <td class="auto-style2">Tên nhà trường:
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenTruong") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Địa chỉ:
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                        </td>
                        <td>Email:
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Điện thoại:
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DienThoai") %>'></asp:Label>
                        </td>
                        <td>Ngày thành lập:
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("NgayLap") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Tên hiệu trưởng:
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("HieuTruong") %>'></asp:Label>
                        </td>
                        <td>Website:&nbsp;
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Website") %>'></asp:Label>
                        </td>
                    </tr>
                </caption>
            </table>
        </ItemTemplate>
    </asp:FormView>

</div>

