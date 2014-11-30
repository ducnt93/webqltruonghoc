<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="quantri.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLNguoiDung.quantri" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
    }
    .auto-style4 {
        height: 23px;
        width: 262px;
    }
    .auto-style5 {
        width: 93px;
    }
    .auto-style6 {
        width: 103px;
        height: 23px;
    }
     

    .abc {
        width: 18px;
        height:18px;
        display:inline-block;
        padding:5px 5px;
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


    .auto-style8 {
        width: 103px;
    }
    .auto-style9 {
        width: 262px;
    }


    </style>
<div>
    <h2>Quản lý tài khoản: 

    </h2>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
          <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới" Width="32px" OnClick="ImageButton1_Click" />
        <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                    <br />
    <asp:Panel ID="Panel1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="4">Thêm mới tài khoản: </td>
            </tr>
            <tr>
                <td class="auto-style8">Tên đăng nhập: </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtTenDN" runat="server" CssClass="textbox"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblErrTenDN" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                </td>
                <td class="auto-style5">Mật khẩu:</td>
                <td>
                    <asp:TextBox ID="txtMK" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblErrMK" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Trạng thái: </td>
                <td class="auto-style4">
                    <asp:CheckBox ID="ckTT" runat="server" />
                </td>
                </tr>
            <tr>
                <td class="auto-style2" colspan="4">
                    <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                    <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <asp:GridView ID="gvQT" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowCancelingEdit="gvQT_RowCancelingEdit" OnRowDeleting="gvQT_RowDeleting" OnRowEditing="gvQT_RowEditing" OnRowUpdating="gvQT_RowUpdating" ShowFooter="True" Width="739px" DataKeyNames="MaND">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:TemplateField>
                <FooterTemplate>
                    <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn?')" ToolTip="Xóa các mục đã chọn" />
                    <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckitem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MaND" HeaderText="Mã người dùng" Visible="False" />
            <asp:BoundField DataField="TenDNhap" HeaderText="Tên đăng nhập" />
            <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" />
            <asp:TemplateField HeaderText="Trạng thái">
                <ItemTemplate>
                    <asp:CheckBox ID="ckTT" runat="server" Checked='<%# Eval("TrangThai") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thao tác">
                <EditItemTemplate>
                    <asp:ImageButton ID="imgUpdate" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Save.png" />
                    <asp:ImageButton ID="imgCancel" runat="server" CommandName="cancel" CssClass="abc" ImageUrl="~/App_Themes/admin/images/cancel.png" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" />
                    <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>

        </ContentTemplate>
    </asp:UpdatePanel>
    
</div>