<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="monhoc.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.monhoc" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }

    .img {
        width: 32px;
        height: 32px;
        display: inline-block;
        padding: 5px 60px 5px 60px;
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
        height: 18px;
        display: inline-block;
        padding: 5px 5px;
    }
    .auto-style2 {
        height: 61px;
    }
</style>
<div>
    <h2>Quản lý các môn học:
    </h2>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            Tổ môn :
            <asp:DropDownList ID="drToGiaoVien" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drToGiaoVien_SelectedIndexChanged">
                <asp:ListItem Selected="True">Chọn tổ bộ môn</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:ImageButton ID="imgThemMoi0" runat="server" Height="32px" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemMoi_Click" ToolTip="Thêm mới một năm học" Width="32px" />
            <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td colspan="4">Thêm mới môn học:</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>Tên môn:</td>
                        <td>
                            <asp:TextBox ID="txtTenMon" runat="server" CssClass="textbox"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblErrTenM" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Tổ:</td>
                        <td>
                            <asp:DropDownList ID="drTo" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td>Số tiết:</td>
                        <td>
                            <asp:TextBox ID="txtSoTiet" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtSoTiet_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtSoTiet">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrSoT" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Hệ số môn:</td>
                        <td>
                            <asp:TextBox ID="txtHeSo" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtHeSo_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtHeSo">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrHeSo" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel2" runat="server">

                <table class="auto-style1">
                    <tr>
                        <td colspan="4">Sửa thông tin môn học:</td>
                    </tr>
                    <tr>
                        <td>Mã môn:</td>
                        <td>
                            <asp:Label ID="lblMaMon" runat="server"></asp:Label>
                            <br />
                        </td>
                        <td>Tên môn:</td>
                        <td>
                            <asp:TextBox ID="txtTenMon0" runat="server" CssClass="textbox"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblErrTenMSua" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Tổ:</td>
                        <td class="auto-style2">
                            <asp:DropDownList ID="drToSua" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2">Số tiết:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtSoTiet0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtSoTiet0_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtSoTiet0">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrSoTSua" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Hệ số môn:</td>
                        <td>
                            <asp:TextBox ID="txtHeSo0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtHeSo0_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtHeSo0">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrHSSua" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:ImageButton ID="imgSaveSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSaveSua_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancelSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancelSua_Click" ToolTip="Hủy bỏ" />
                        </td>
                    </tr>
                </table>

            </asp:Panel>
            <br />
            <h3>Danh sách các môn học:</h3>
            <p>
                <asp:GridView ID="gvMH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="826px" DataKeyNames="MaMonHoc" ShowFooter="True" OnRowDeleting="gvMH_RowDeleting" OnRowUpdating="gvMH_RowUpdating">
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn?')" ToolTip="Xóa các mục đã chọn" />
                                <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaMonHoc" HeaderText="Mã môn học" />
                        <asp:BoundField DataField="TenMonHoc" HeaderText="Tên môn" />
                        <asp:BoundField DataField="SoTiet" HeaderText="Số tiết" />
                        <asp:BoundField DataField="HeSo" HeaderText="Hệ số môn" />
                        <asp:BoundField DataField="MaTo" HeaderText="Tổ" Visible="False" />
                        <asp:TemplateField HeaderText="Thao tác">
                            <ItemTemplate>
                               <%-- CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"--%>
                                <asp:ImageButton ID="imgEdit" runat="server"  CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" OnClick="imgEdit_Click" />
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />


</div>
