<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="phancong.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.NhaTruong.phancong" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }

    .auto-style4 {
        width: 82px;
        height: 30px;
    }

    .auto-style12 {
        width: 217px;
        height: 30px;
    }

    .drop {
        width: 200px;
        height: 32px;
    }

    .auto-style5 {
        height: 30px;
    }

    .auto-style16 {
        width: 82px;
        height: 64px;
    }

    .auto-style17 {
        width: 217px;
        height: 64px;
    }

    .auto-style15 {
        height: 64px;
        width: 113px;
    }

    .auto-style18 {
        height: 64px;
    }

    .img {
        width: 18px;
        height: 18px;
        display: inline-block;
        padding: 5px 5px;
    }

    .auto-style19 {
    }

    .auto-style21 {
        width: 101px;
    }

    .auto-style22 {
        width: 241px;
    }

    .img {
        width: 32px;
        height: 32px;
        display: inline-block;
        padding: 5px 60px 5px 60px;
    }

    .tdTieuDe {
        font-size: 22px;
        font-style: italic oblique;
        font-stretch: ultra-condensed;
        background-color: azure;
    }

    .drop {
        width: 200px;
        height: 32px;
    }

    .textbox {
        width: 200px;
        height: 32px;
    }

    .abc {
        width: 18px;
        height: 18px;
        display: inline-block;
        padding: 5px 5px;
    }

    .auto-style23 {
        width: 102px;
    }
</style>
<div>
    <h2>Hệ thống phân lớp giảng dạy:</h2>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Chọn năm:</td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style16">Chọn khối:
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">Chọn lớp:</td>
                    <td class="auto-style18">
                        <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLop_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>


            <br />
          
                <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgAdd_Click" ToolTip="Thêm mới" />
                &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <table class="auto-style1">
                        <caption>
                            <tr>
                                <td class="auto-style23">Mã phân công:</td>
                                <td class="auto-style22">
                                    <asp:Label ID="lblMaPC" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style21">Giáo viên:</td>
                                <td>
                                    <asp:DropDownList ID="drGiaoVien" runat="server" CssClass="drop">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </caption>
                        <tr>
                        </tr>
                        <tr>
                            <td class="auto-style23">Lớp:</td>
                            <td class="auto-style22">
                                <asp:DropDownList ID="drLopThemSua" runat="server" CssClass="drop">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style21">Môn học:</td>
                            <td>
                                <asp:DropDownList ID="drMonHoc" runat="server" CssClass="drop">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19" colspan="4">
                                <asp:ImageButton ID="imgLuu" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                                <asp:ImageButton ID="imgLuuSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuuSua_Click" ToolTip="Lưu lại" />
                                <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
          <asp:Panel ID="Panel2" runat="server">
                <asp:GridView ID="gvPhancong" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="STT" ForeColor="#333333" GridLines="None" OnRowDeleting="gvPhanlop_RowDeleting" OnRowUpdating="gvPhanlop_RowUpdating" Width="568px" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript : return confirm('Bạn có muốn xóa các mục đã chọn không?')" ToolTip="Xóa tất cả mục đã chọn" />
                                <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="STT" HeaderText="Mã Phân Công" />
                        <asp:BoundField DataField="TenGiaoVien" HeaderText="Tên giáo viên" />
                        <asp:BoundField DataField="TenLop" HeaderText="Lớp" />
                        <asp:BoundField DataField="TenMonHoc" HeaderText="Môn học" />
                        <asp:TemplateField HeaderText="Thao tác">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEdit" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Chỉnh sửa" />
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
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
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
