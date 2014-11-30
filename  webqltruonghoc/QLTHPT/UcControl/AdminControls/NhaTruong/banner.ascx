﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="banner.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.NhaTruong.banner" %>
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
        width: 379px;
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
    .auto-style3 {
        width: 397px;
    }
</style>
<div>
 <h2>Quản trị banner: </h2>   

    <br />
          <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới" Width="32px" OnClick="ImageButton1_Click" />
        <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
        &nbsp;<br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Tìm theo tên banner:
                <asp:TextBox ID="txtTim" runat="server" Height="24px" Width="229px" ToolTip="Tìm kiếm banner theo tên"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnTim" runat="server" Height="25px" Text="Tìm" Width="90px" />
            </td>
        </tr>
    </table>
    <br />

    <asp:GridView ID="gvBanner" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="783px" DataKeyNames="TenBanner" OnRowCancelingEdit="gvBanner_RowCancelingEdit" OnRowDeleting="gvBanner_RowDeleting" OnRowEditing="gvBanner_RowEditing" OnRowUpdating="gvBanner_RowUpdating">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                <FooterTemplate>
                    <asp:ImageButton ID="imgDelAll" CssClass="abc" runat="server" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" ToolTip="Xóa các mục đã chọn" OnClick="imgDelAll_Click" />
                    <asp:ImageButton ID="imgRefresh" CssClass="abc" runat="server" ImageUrl="~/App_Themes/admin/images/Refresh.png" ToolTip="Làm mới" OnClick="imgRefresh_Click" />
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="ckAll" runat="server" Text="All" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckitem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TenBanner" HeaderText="Tên banner" />
            <asp:BoundField DataField="Link" HeaderText="Đường dẫn" />
            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
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

</div>

<p>
    &nbsp;</p>
<asp:Panel ID="Panel1" runat="server" Height="148px">
    <table class="auto-style1">
        <tr>
            <td colspan="2">Thêm banner:</td>
        </tr>
        <tr>
            <td class="auto-style2">Tên banner:<asp:TextBox ID="txtTen" runat="server" Height="27px" Width="257px"></asp:TextBox>
            </td>
            <td rowspan="2">Mô tả:
                <asp:TextBox ID="txtMoTa" runat="server" Height="60px" Width="323px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Đường dẫn:<asp:TextBox ID="txtDuongdan" runat="server" Height="26px" Width="257px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>


