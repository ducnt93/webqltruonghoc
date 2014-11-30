<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="nhomnguoidung.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLNguoiDung.nhomnguoidung" %>
<style type="text/css">

    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        height: 23px;
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
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

    .abc {
        width: 18px;
        height:18px;
        display:inline-block;
        padding:5px 5px;
    }
    .auto-style4 {
        height: 23px;
        width: 424px;
    }
    .auto-style7 {
        height: 23px;
        width: 227px;
    }
    .auto-style8 {
        height: 23px;
        width: 107px;
    }
    .auto-style9 {
        height: 23px;
        width: 83px;
    }
    </style>
<div>
    <h2>Quản lý người dùng: </h2>

    <br />
    <br />
    <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
        <br />
        <br />
          <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới" Width="32px" OnClick="ImageButton1_Click" />
        &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td colspan="4">Thêm mới người dùng:</td>
                            </tr>
                            <tr>
                                <td class="auto-style8">Loại:
                                    </td>
                                <td class="auto-style7">
                                    <asp:DropDownList ID="drLoai" runat="server" CssClass="drop">
                                        <asp:ListItem Value="Admin">Quản trị</asp:ListItem>
                                        <asp:ListItem Value="GV">Giáo viên</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style9">Tên :
                                    </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="txtTenLoai" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldten" runat="server" ControlToValidate="txtTenLoai" ErrorMessage="*Bạn không được bỏ trống" ForeColor="Red">*Bạn không được bỏ trống</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">Tên đăng nhập:
                                    </td>
                                <td class="auto-style7">
                                    <asp:DropDownList ID="drND" runat="server" CssClass="drop">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style9">Giáo viên:
                                    </td>
                                <td class="auto-style2">
                                    <asp:DropDownList ID="drGV" runat="server" CssClass="drop">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4" colspan="4">
                                    <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                                    <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
        <br />
    <br />

    <asp:GridView ID="gvLoaiND" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="898px" DataKeyNames="MaND" OnRowCancelingEdit="gvLoaiND_RowCancelingEdit" OnRowDeleting="gvLoaiND_RowDeleting" OnRowEditing="gvLoaiND_RowEditing" OnRowUpdating="gvLoaiND_RowUpdating" Height="208px">
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
            <asp:BoundField DataField="MaND" HeaderText="Mã người dùng" />
            <asp:BoundField DataField="MaGiaoVien" HeaderText="Mã giáo viên" />
            <asp:BoundField DataField="MaLoaiND" HeaderText="Mã loại" ControlStyle-CssClass="text" Visible="False" >
            <ControlStyle CssClass="text" />
            </asp:BoundField>
            <asp:BoundField DataField="TenLoaiND" HeaderText="Tên " ControlStyle-CssClass="text" >
            <ControlStyle CssClass="text" />
            </asp:BoundField>
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