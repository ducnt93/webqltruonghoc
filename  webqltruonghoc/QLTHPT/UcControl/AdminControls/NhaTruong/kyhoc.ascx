<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="kyhoc.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.kyhoc" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }

    .auto-style2 {
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
    <h2>Danh sách các học kỳ:</h2>
      
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <br />
                <br />
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới" Width="32px" OnClick="ImageButton1_Click" />
                &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
    <br />
                <asp:Panel ID="Panel2" runat="server">
                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2">Thêm mới một kỳ học:</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Tên học kỳ: </td>
                            <td>
                                <asp:TextBox ID="txtTenHK0" runat="server" CssClass="textbox"></asp:TextBox>
                                <asp:Label ID="lblErrTenHK" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Từ ngày:</td>
                            <td>
                                <asp:TextBox ID="txtTuNgay0" runat="server" CssClass="textbox"></asp:TextBox>
                                <asp:CalendarExtender ID="txtTuNgay0_CalendarExtender0" runat="server" TargetControlID="txtTuNgay0">
                                </asp:CalendarExtender>
                                <asp:CalendarExtender ID="txtTuNgay0_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtTuNgay0">
                                </asp:CalendarExtender>
                                <asp:Label ID="lblErrTuNgay" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Đến ngày:</td>
                            <td>
                                <asp:TextBox ID="txtDenNgay0" runat="server" CssClass="textbox"></asp:TextBox>
                                <asp:CalendarExtender ID="txtDenNgay0_CalendarExtender0" runat="server" TargetControlID="txtDenNgay0">
                                </asp:CalendarExtender>
                                <asp:CalendarExtender ID="txtDenNgay0_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDenNgay0">
                                </asp:CalendarExtender>
                                <asp:Label ID="lblErrDenNgay" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="2">
                                <asp:ImageButton ID="imgSave" runat="server" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" CssClass="img" />
                                <asp:ImageButton ID="imgCancel0" runat="server" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" CssClass="img" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
    <br />
    
                <br />
                <asp:GridView ID="gvKyHoc" runat="server" AutoGenerateColumns="False" DataKeyNames="MaHK" ShowFooter="True" Width="755px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" PageSize="5" OnRowCancelingEdit="gvKyHoc_RowCancelingEdit" OnRowDeleting="gvKyHoc_RowDeleting" OnRowEditing="gvKyHoc_RowEditing" OnRowUpdating="gvKyHoc_RowUpdating" Height="251px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:ImageButton ID="imgDelAll" runat="server" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn?')" ToolTip="Xóa các mục đã chọn" CssClass="abc" />
                                <asp:ImageButton ID="imgRefresh" runat="server" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" CssClass="abc" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckALl" runat="server" AutoPostBack="True" OnCheckedChanged="ckALl_CheckedChanged" Text="All" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaHK" HeaderText="Mã học kỳ" Visible="False" />
                        <asp:BoundField DataField="TenHK" HeaderText="Tên học kỳ" />
                        <asp:BoundField DataField="TuNgay" HeaderText="Từ ngày" />
                        <asp:BoundField DataField="DenNgay" HeaderText="Đến ngày" />
                        <asp:TemplateField HeaderText="Thao tác">
                            <EditItemTemplate>
                                <asp:ImageButton ID="imgUpdate" runat="server" CommandName="update" ImageUrl="~/App_Themes/admin/images/Save.png" ToolTip="Lưu lại" CssClass="abc" />
                                <asp:ImageButton ID="imgCancel" runat="server" CommandName="cancel" ImageUrl="~/App_Themes/admin/images/cancel.png" ToolTip="Hủy bỏ" CssClass="abc" />

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Sửa thông tin" CssClass="abc" />
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa ?')" ToolTip="Xóa" CssClass="abc" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle HorizontalAlign="Center" BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <br />
                <br />
                
    <br />

            </ContentTemplate>
        </asp:UpdatePanel>
</div>
