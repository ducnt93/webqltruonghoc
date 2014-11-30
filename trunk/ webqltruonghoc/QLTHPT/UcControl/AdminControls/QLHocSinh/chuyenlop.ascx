<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chuyenlop.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.chuyenlop" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
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
       .tdTieuDe
    {
        font-size:22px;
        font-style:italic oblique;
        font-stretch:ultra-condensed;
        background-color:azure;

    }
    .abc {
        width: 18px;
        height:18px;
        display:inline-block;
        padding:5px 5px;
    }
     .auto-style1 {
        width: 100%;
        height: 89px;
    }
    .auto-style2 {
    }
    .auto-style4 {
        width: 101px;
        height: 44px;
    }
    .auto-style5 {
        height: 44px;
    }
     .auto-style6 {
        width: 277px;
    }
    .auto-style8 {
        width: 263px;
        height: 44px;
    }
    .auto-style9 {
        width: 263px;
    }
    .auto-style10 {
        width: 101px;
    }
     .auto-style11 {
        width: 394px;
    }
    .auto-style12 {
        width: 310px;
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
     </style>
<div>
    <h2>Danh sách học sinh chuyển lớp</h2>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                        <asp:ImageButton ID="imgThemMoi" runat="server" Height="32px" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemMoi_Click" ToolTip="Thêm mới một năm học" Width="32px" />
            <br/>
            <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <h3>Thêm mới học sinh chuyển lớp:</h3>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style4">Chọn năm:</td>
                        <td class="auto-style8">
                            <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style5">Chọn khối: </td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style12">Lớp:</td>
                        <td class="auto-style11">
                            <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLop_SelectedIndexChanged1">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2">Học sinh:</td>
                        <td class="auto-style2">
                            <asp:DropDownList ID="drHocSinh" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Từ lớp:
                            </td>
                        <td class="auto-style11">
                            <asp:DropDownList ID="drTuLop" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td>Đến lớp:</td>
                        <td>
                            <asp:DropDownList ID="drDenLop" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Ngày chuyển:</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="txtNgaychuyen" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:CalendarExtender ID="txtNgaychuyen_CalendarExtender0" runat="server" TargetControlID="txtNgaychuyen">
                            </asp:CalendarExtender>
                            <asp:CalendarExtender ID="txtNgaychuyen_CalendarExtender" runat="server" TargetControlID="txtNgaychuyen">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="vldNgayChuyen" runat="server" ControlToValidate="txtNgaychuyen" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td colspan="2">Chuyển bảng điểm:
                            <asp:CheckBox ID="ckChuyenDiem" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">&nbsp;</td>
                        <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lý do chuyển:</td>
                        <td class="auto-style2" colspan="2">
                            <asp:TextBox ID="txtLydo" runat="server" Height="72px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="4">
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
                            <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" CssClass="abc" ToolTip="Xóa" />
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