<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tomon.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLGiaoVien.tomon" %>
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
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
    .auto-style2 {
        width: 391px;
    }
    .auto-style3 {
        width: 391px;
        height: 23px;
    }
    .auto-style4 {
    }
</style>
<div>

    <h2>Danh sách năm học:</h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <ContentTemplate>
    <br />
    <asp:ImageButton ID="imgThemMoi" runat="server" Height="32px" Width="32px" OnClick="imgThemMoi_Click" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới một năm học" />
    <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
               <br />
               <asp:Panel ID="pnAdd" runat="server">
                   <table class="auto-style1">
                       <tr>
                           <td colspan="2">
                               <br />
                               Thêm mới 1 tổ:</td>
                       </tr>
                       <tr>
                           <td class="auto-style4">Tên tổ:
                               <asp:TextBox ID="txtTenTo" runat="server" Height="21px" Width="203px"></asp:TextBox>
                           </td>
                           <td class="auto-style4" rowspan="2">Mô tả:
                               <asp:TextBox ID="txtMoTa" runat="server" Height="74px" TextMode="MultiLine" Width="201px"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style2">Loại người dùng:
                               <asp:DropDownList ID="drLoaiND" runat="server" Height="32px" Width="169px">
                                   <asp:ListItem Value="1">Người dùng</asp:ListItem>
                                   <asp:ListItem Value="0">Quản trị</asp:ListItem>
                               </asp:DropDownList>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="2">
                               <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                               <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                           </td>
                       </tr>
                   </table>
               </asp:Panel>
               <hr />
    <br />
    <asp:GridView ID="gvToMon" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="710px" DataKeyNames="MaTo" OnRowCancelingEdit="gvgvToMon_RowCancelingEdit" OnRowDeleting="gvToMon_RowDeleting" OnRowEditing="gvToMon_RowEditing" OnRowUpdating="gvToMon_RowUpdating">
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
            <asp:BoundField DataField="MaTo" HeaderText="Mã tổ" />
            <asp:BoundField DataField="TenToBoMon" HeaderText="Tên tổ" />
            <asp:BoundField DataField="MaLoaiND" HeaderText="Mã loại ND" />
            <asp:BoundField DataField="MoTa" HeaderText="Mô tả khác" />
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