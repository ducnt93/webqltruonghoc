<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chuyenlop.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.chuyenlop" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">

    .abc {
        width: 18px;
        height:18px;
        display:inline-block;
        padding:5px 5px;
    }
     .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
    }
    .auto-style4 {
        width: 405px;
        height: 30px;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style3 {
        width: 405px;
    }
     </style>
<div>
    <h2>Danh sách học sinh chuyển lớp</h2>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ImageButton ID="imgThemMoi" runat="server" Height="32px" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemMoi_Click" ToolTip="Thêm mới một năm học" Width="32px" />
            <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Chọn năm:<asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" Width="202px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">Chọn kỳ:<asp:DropDownList ID="drKyHoc" runat="server" AutoPostBack="True" Height="35px" OnSelectedIndexChanged="drKyHoc0_SelectedIndexChanged" Width="209px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Chọn khối:
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" Height="41px" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1" Width="193px">
                        </asp:DropDownList>
                    </td>
                    <td>Chọn lớp:<asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" Height="36px" OnSelectedIndexChanged="drLop_SelectedIndexChanged1" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Panel1" runat="server">
                <h3>Thêm mới học sinh chuyển lớp:</h3>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2" colspan="2">Học sinh:<asp:DropDownList ID="drHocSinh" runat="server" Height="32px" Width="156px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Từ lớp:
                            <asp:TextBox ID="txtTulop" runat="server"></asp:TextBox>
                        </td>
                        <td>Đến lớp:<asp:TextBox ID="txtDenlop" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Ngày chuyển:<asp:TextBox ID="txtNgaychuyen" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="txtNgaychuyen_CalendarExtender" runat="server" TargetControlID="txtNgaychuyen">
                            </asp:CalendarExtender>
                        </td>
                        <td>Chuyển bảng điểm:
                            <asp:CheckBox ID="ckChuyenDiem" runat="server" OnCheckedChanged="Unnamed1_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2">Lý do chuyển:<asp:TextBox ID="txtLydo" runat="server" Height="72px" TextMode="MultiLine" Width="528px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:GridView ID="gvChuyenlop" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaHocSinh" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="gvChuyenLop_RowCancelingEdit" OnRowDeleting="gvChuyenLop_RowDeleting" OnRowEditing="gvChuyenLop_RowEditing" OnRowUpdating="gvChuyenLop_RowUpdating" ShowFooter="True" Width="763px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" ToolTip="Xóa các mục đã chọn" />
                            <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" ToolTip="Làm mới" OnClick="imgRefresh_Click" />
                        </FooterTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ckitem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MaHocSinh" HeaderText="Mã học sinh" />
                    <asp:BoundField DataField="TuLop" HeaderText="Từ lớp" />
                    <asp:BoundField DataField="DenLop" HeaderText="Đến lớp" />
                    <asp:BoundField DataField="NgayChuyen" HeaderText="Ngày chuyển" />
                    <asp:BoundField DataField="ChuyenBangDiem" HeaderText="Chuyển bảng điểm" />
                    <asp:BoundField DataField="LyDoChuyen" HeaderText="Lý do chuyển" />
                    <asp:TemplateField HeaderText="Thao tác">
                        <EditItemTemplate>
                            <asp:ImageButton ID="imgUpdate" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Save.png" ToolTip="Cập nhật" />
                            <asp:ImageButton ID="imgCancel" runat="server" CommandName="cancel" CssClass="abc" ImageUrl="~/App_Themes/admin/images/cancel.png" ToolTip="Hủy bỏ" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" ImageUrl="~/App_Themes/admin/images/edit.png" CssClass="abc" ToolTip="Sửa" />
                            <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClick="imgDel_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" CssClass="abc" ToolTip="Xóa" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>