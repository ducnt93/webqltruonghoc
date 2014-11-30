<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="giaovien.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLGiaoVien.giaovien" %>
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
        height: 23px;
    }
    .auto-style3 {
        height: 23px;
        width: 357px;
    }
    .auto-style4 {
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
     .text {
         width:100px;
     }
    </style>
<div>
    <h2>Danh sách giáo viên: </h2>
    <br />
    <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                    <br />
        Tổ môn :
        <asp:DropDownList ID="drToGiaoVien" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" Width="193px">
            <asp:ListItem Selected="True">Chọn tổ bộ môn</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
          <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới" Width="32px" OnClick="ImageButton1_Click" />
        &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td colspan="2">Thêm mới giáo viên:</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Mã giáo viên:
                                    <asp:TextBox ID="txtMaGV" runat="server" Height="27px" Width="193px"></asp:TextBox>
                                </td>
                                <td class="auto-style2">Tổ:
                                    <asp:DropDownList ID="drTo" runat="server" Height="30px" Width="232px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Tên tên giáo viên:
                                    <asp:TextBox ID="txtTenGV" runat="server" Height="20px" Width="171px"></asp:TextBox>
                                </td>
                                <td>Ngày sinh:
                                    <asp:TextBox ID="txtNgaySinh" runat="server" Height="23px" Width="178px"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtNgaySinh_CalendarExtender" runat="server" TargetControlID="txtNgaySinh">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Địa chỉ:
                                    <asp:TextBox ID="txtDiaChi" runat="server" Height="23px" Width="227px"></asp:TextBox>
                                </td>
                                <td>Số điện thoại:
                                    <asp:TextBox ID="txtSDT" runat="server" Height="24px" Width="158px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Chủ nhiêm:
                                    <asp:CheckBox ID="ckChuNhiem" runat="server" />
                                </td>
                                <td>Giới tính:
                                    <asp:DropDownList ID="drGioiTinh" runat="server" Height="30px" Width="193px">
                                        <asp:ListItem>Nam</asp:ListItem>
                                        <asp:ListItem>Nữ</asp:ListItem>
                                        <asp:ListItem>Khác</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4" colspan="2">
                                    <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                                    <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
        <br />
    <br />

    <asp:GridView ID="gvGiaoVien" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="898px" DataKeyNames="MaGiaoVien" OnRowCancelingEdit="gvGiaoVien_RowCancelingEdit" OnRowDeleting="gvGiaoVien_RowDeleting" OnRowEditing="gvGiaoVien_RowEditing" OnRowUpdating="gvGiaoVien_RowUpdating" Height="208px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                <FooterTemplate>
                    <asp:ImageButton ID="imgDelAll" CssClass="abc" runat="server" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" ToolTip="Xóa các mục đã chọn" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn?')" />
                    <asp:ImageButton ID="imgRefresh" CssClass="abc" runat="server" ImageUrl="~/App_Themes/admin/images/Refresh.png" ToolTip="Làm mới" OnClick="imgRefresh_Click" />
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="ckAll" runat="server" Text="All" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckitem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MaGiaoVien" HeaderText="Mã giáo viên" ControlStyle-CssClass="text" />
            <asp:BoundField DataField="TenGiaoVien" HeaderText="Tên giáo viên" ControlStyle-CssClass="text" />
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />
            <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" />
            <asp:BoundField DataField="MaTo" HeaderText="Mã tổ" />
            <asp:TemplateField HeaderText="Chủ nhiệm">
                <ItemTemplate>
                    <asp:CheckBox ID="ckChuNhiem" runat="server" Checked='<%# Eval("ChuNhiem") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thao tác">
                <EditItemTemplate>
                    <asp:ImageButton ID="imgUpdate" CssClass="abc" runat="server" CommandName="update" ImageUrl="~/App_Themes/admin/images/Save.png" />
                    <asp:ImageButton ID="imgCancel" CssClass="abc" runat="server" CommandName="cancel" ImageUrl="~/App_Themes/admin/images/cancel.png" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" ImageUrl="~/App_Themes/admin/images/edit.png" CssClass="abc" />
                    <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" CssClass="abc" />
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
    <br />

              </ContentTemplate>
    </asp:UpdatePanel>
        
</div>