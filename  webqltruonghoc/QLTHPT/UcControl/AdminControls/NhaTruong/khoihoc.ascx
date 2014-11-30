<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="khoihoc.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.khoihoc" %>
<style type="text/css">

    .auto-style1 {
        width: 100%;
    }
    .auto-style5 {
        width: 269px;
        height: 26px;
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
     .auto-style19 {
        width: 93px;
        height: 32px;
    }
    .auto-style18 {
        width: 93px;
        height: 23px;
    }
     .abc {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 40px 5px 40px;
    
    }
    .auto-style21 {
        height: 26px;
        width: 165px;
    }
    .auto-style22 {
        width: 165px;
        height: 23px;
    }
    .auto-style23 {
        height: 32px;
    }
    .auto-style24 {
        width: 329px;
    }
</style>
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style21">Năm học:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="drNamHoc" runat="server" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" AutoPostBack="True" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style22">Tìm khối:</td>
                    <td class="auto-style10">&nbsp;<asp:TextBox ID="txtTimLop" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td class="auto-style11">
                        <asp:Button ID="btnTim" runat="server" Height="25px" Text="Tìm" Width="92px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgAdd_Click" ToolTip="Thêm mới" />
            &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <h4>Thêm mới lớp:</h4>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td colspan="2" class="title">Thông tin:</td>
                    </tr>
                    <tr>
                        <td class="auto-style19">Tên khối: </td>
                        <td class="auto-style23">
                            <asp:TextBox ID="txtTenKhoi" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:Label ID="lblErrTenKhoi" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">Năm học:</td>
                        <td class="auto-style9">
                            <asp:DropDownList ID="drDSNamHoc" runat="server" OnSelectedIndexChanged="drDSNamHoc_SelectedIndexChanged" CssClass="textbox" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12" colspan="2">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>Năm học:<asp:Label ID="lblNamHoc" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvKhoi" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaKhoi" OnRowCancelingEdit="gvKhoi_RowCancelingEdit" OnRowDeleting="gvKhoi_RowDeleting" OnRowEditing="gvKhoi_RowEditing" OnRowUpdating="gvKhoi_RowUpdating" ShowFooter="True" style="margin-right: 5px" Width="767px">
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:ImageButton ID="imgDelAll" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript : return confirm('Bạn có muốn xóa các mục đã chọn không?')" ToolTip="Xóa tất cả mục đã chọn" />
                                <asp:ImageButton ID="imgRefresh" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaKhoi" HeaderText="Mã khối" />
                        <asp:BoundField DataField="TenKhoi" HeaderText="Tên khối" />
                        <asp:BoundField DataField="MaNamHoc" HeaderText="Mã năm học" />
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

            </asp:Panel>
            <br />
            <br />
            <br />

        </ContentTemplate>
    </asp:UpdatePanel>

</div>