<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dslop.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.dslop" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style3 {
    }
    .auto-style5 {
        width: 269px;
        height: 26px;
    }
    .auto-style8 {
        width: 69px;
        height: 26px;
    }
    .auto-style9 {
        height: 23px;
    }
    .auto-style10 {
        width: 269px;
        height: 23px;
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
    .auto-style15 {
        width: 262px;
    }
    .auto-style16 {
        width: 128px;
        height: 23px;
    }
    .auto-style17 {
        width: 262px;
        height: 23px;
    }
    .auto-style18 {
        width: 93px;
        height: 23px;
    }
    .auto-style19 {
        width: 93px;
    }
    .auto-style20 {
        height: 26px;
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
                    <td class="auto-style20">Năm học:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="drNamHoc" runat="server" Height="31px" Width="156px" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style8">Học kỳ:</td>
                    <td class="auto-style20">
                        <asp:DropDownList ID="drHocKy" runat="server" Height="31px" Width="180px" OnSelectedIndexChanged="drHocKy_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="4">Khối:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="drKhoi" runat="server" Height="31px" Width="192px" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">Tìm lớp:
                        <asp:TextBox ID="txtTimLop" runat="server" Height="22px" Width="193px"></asp:TextBox>
                    </td>
                    <td class="auto-style11" colspan="2">
                        <asp:Button ID="btnTim" runat="server" Height="25px" Text="Tìm" Width="92px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgAdd_Click" ToolTip="Thêm mới" />
            &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:GridView ID="gvLop" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowFooter="True" Width="767px" OnRowCancelingEdit="gvLop_RowCancelingEdit" OnRowDeleting="gvLop_RowDeleting" OnRowEditing="gvLop_RowEditing" OnRowUpdating="gvLop_RowUpdating" DataKeyNames="MaLop">
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
                    <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" />
                    <asp:BoundField DataField="TenLop" HeaderText="Tên Lớp" />
                    <asp:BoundField DataField="SiSo" HeaderText="Sĩ số" />
                    <asp:BoundField DataField="MaGiaoVien" HeaderText="Giáo viên" />
                    <asp:BoundField DataField="MaKhoi" HeaderText="Khối" />
                    <asp:TemplateField HeaderText="Thao tác">
                        <EditItemTemplate>
                            <asp:ImageButton ID="imgUpdate" runat="server" CommandName="update" CssClass="img" ImageUrl="~/App_Themes/admin/images/Save.png" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel" runat="server" CommandName="cancel" CssClass="img" ImageUrl="~/App_Themes/admin/images/cancel.png" ToolTip="Hủy bỏ" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" CssClass="img" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Chỉnh sửa" />
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
            <asp:Panel ID="Panel1" runat="server">
                Thêm mới lớp:<br />
                <br />
                <table class="auto-style1">
                    <tr>
                        <td colspan="4">Thông tin:</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Mã lớp:</td>
                        <td class="auto-style15">
                            <asp:TextBox ID="txtMaLop" runat="server" Height="22px" Width="152px"></asp:TextBox>
                        </td>
                        <td class="auto-style19">Tên lớp: </td>
                        <td>
                            <asp:TextBox ID="txtTenLop" runat="server" Height="19px" Width="147px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">Sĩ số: </td>
                        <td class="auto-style17">
                            <asp:TextBox ID="txtSiso" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td class="auto-style18">Giáo viên chủ nhiệm:</td>
                        <td class="auto-style9">
                            <asp:DropDownList ID="drChuNhiem" runat="server" Height="20px" Width="153px" OnSelectedIndexChanged="drChuNhiem_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Khối: </td>
                        <td class="auto-style15">
                            <asp:DropDownList ID="drKhoiLop" runat="server" Height="21px" Width="156px" OnSelectedIndexChanged="drKhoiLop_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style19">Mô tả: </td>
                        <td>
                            <asp:TextBox ID="txtMoTa" runat="server" Height="22px" Width="141px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12" colspan="4">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />

        </ContentTemplate>
    </asp:UpdatePanel>
</div>