<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="namhoc.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.namhoc" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
    }
    .auto-style3 {
        height: 36px;
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
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 40px 5px 40px;
    
    }
</style>

<div>
    <h2>Danh sách năm học:</h2>

<br />



    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
    <asp:ImageButton ID="imgThemMoi" runat="server" Height="32px" Width="32px" OnClick="imgThemMoi_Click" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới một năm học" />
    <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
            <br />
            <asp:Panel ID="pnNamHoc" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td colspan="2" style="align-content:center">
                            <h3>Thêm mới năm học</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Thời gian:</td>
                        <td>
                            <asp:TextBox ID="txtTenNH" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:Label ID="lblErrNamHoc" runat="server" ForeColor="Red" Text="*Bạn không được để trống"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2" style="align-content:center; align-items:center">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
    <br />
            <asp:GridView ID="gvNamHoc" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaNamHoc" OnRowCancelingEdit="gvNamHoc_RowCancelingEdit" OnRowDeleting="gvNamHoc_RowDeleting" OnRowEditing="gvNamHoc_RowEditing" OnRowUpdating="gvNamHoc_RowUpdating" ShowFooter="True" Width="820px">
                <Columns>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn?')" ToolTip="Xóa các mục đã chọn" />
                            <asp:ImageButton ID="imgRefersh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                        </FooterTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="ckAll" runat="server" Text="All" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ckitem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MaNamHoc" HeaderText="Mã năm học" />
                    <asp:BoundField DataField="TenNamHoc" HeaderText="Thời gian" />
                    <asp:TemplateField HeaderText="Thao tác">
                        <EditItemTemplate>
                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Save.png" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel" runat="server" CommandName="cancel" CssClass="abc" ImageUrl="~/App_Themes/admin/images/cancel.png" ToolTip="Hủy bỏ" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Sửa" />
                            <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
    <br />
   
    <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    

    </div>