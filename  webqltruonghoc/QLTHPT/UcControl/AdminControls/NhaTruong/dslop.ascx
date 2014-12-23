<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dslop.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.dslop" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .drop
     {
         width:200px;
         }
     .textbox
     {
          width:200px;
         height:32px;
     }

    .auto-style3 {
    }
    .auto-style5 {
        width: 59px;
        height: 26px;
    }
    .auto-style9 {
    }
    .auto-style11 {
        height: 23px;
    }
    .img {
        width: 18px;
        height:18px;
        display:inline-block;
        padding:5px 5px;
    }
     .abc {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 40px 5px 40px;
    
    }
    .auto-style12 {
    }
    .auto-style16 {
        width: 128px;
        height: 23px;
    }
    .dr
    {
        height: 32px;
        width:200px;
        margin-left: 0px;
    }
    .auto-style23 {
        width: 59px;
        height: 23px;
    }
    .auto-style25 {
        width: 379px;
    }
    .auto-style26 {
        width: 125px;
    }
    .auto-style29 {
        width: 125px;
        height: 26px;
    }
    .auto-style30 {
        width: 125px;
        height: 23px;
    }
    .auto-style31 {
        width: 132px;
    }
    .auto-style32 {
        width: 132px;
        }
    .auto-style33 {
        width: 398px;
        padding: 5px 5px 5px 5px;
    }
</style>
<div>
<h2>Danh sách các lớp:</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style29">Năm học:</td>
                    <td class="auto-style5" colspan="2">
                        <asp:DropDownList ID="drNamHoc" runat="server" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" AutoPostBack="True" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style26">Khối:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style25">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style23" colspan="2">&nbsp;</td>
                    <td class="auto-style11">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgAdd_Click" ToolTip="Thêm mới" />
            &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <h4>Thông tin lớp:</h4>
                <asp:Label ID="lblErr1" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td colspan="4" class="title">Mã lớp:
                            <asp:Label ID="lblMaLop" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Tên lớp: </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="txtTenLop" runat="server" CssClass="textbox"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblErrTenLop" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                            <br />
                        </td>
                        <td class="auto-style31">&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">Sĩ số: </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="txtSiso" runat="server" CssClass="textbox" ></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtSiso_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtSiso">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrSiSo" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                            <br />
                        </td>
                        <td class="auto-style32" rowspan="2">Mô tả: </td>
                        <td class="auto-style9" rowspan="2">
                            <asp:TextBox ID="txtMoTa" runat="server" CssClass="textbox" Height="63px" Width="227px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Khối: </td>
                        <td class="auto-style33">
                            <asp:DropDownList ID="drKhoiLop" runat="server" CssClass="drop" OnSelectedIndexChanged="drKhoiLop_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12" colspan="4">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgLuuSua" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuuSua_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Button ID="btnExxport" runat="server" OnClick="btnExxport_Click" Text="Xuất ra Excel" Width="111px" />
            <br />
            <br />
            <asp:GridView ID="gvLop" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowFooter="True" Width="880px" OnRowDeleting="gvLop_RowDeleting" OnRowUpdating="gvLop_RowUpdating" DataKeyNames="MaLop">
                <Columns>
                    <asp:TemplateField HeaderText="All">
                        <FooterTemplate>
                            <asp:ImageButton ID="imgDelAll" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript : return confirm('Bạn có muốn xóa các mục đã chọn không?')" ToolTip="Xóa tất cả mục đã chọn" />
                            <asp:ImageButton ID="imgRefresh" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                        </FooterTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ckitem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" Visible="False" />
                    <asp:BoundField DataField="TenLop" HeaderText="Tên Lớp" />
                    <asp:BoundField DataField="SiSo" HeaderText="Sĩ số" />
                    <asp:BoundField DataField="TenKhoi" HeaderText="Khối" />
                    <asp:BoundField DataField="MoTaKhac" HeaderText="Mô tả khác" />
                    <asp:TemplateField HeaderText="Thao tác">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CommandName="update" CssClass="img" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Chỉnh sửa" />
                            <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <br />
            <br />

        </ContentTemplate>
    </asp:UpdatePanel>
</div>