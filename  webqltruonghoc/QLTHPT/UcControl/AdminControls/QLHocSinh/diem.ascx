<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="diem.ascx.cs" Inherits="QLTHPT.diem" %>
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
    .auto-style3 {
    }
    .auto-style4 {
        width: 365px;
    }
    .auto-style5 {
        width: 85px;
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 40px 5px 40px;
    
    }
    .auto-style6 {
        width: 339px;
        height: 23px;
    }
    .auto-style7 {
        height: 23px;
    }
    .auto-style8 {
        width: 339px;
    }
</style>
<div>
    <h2>Danh sách điểm của học sinh</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">Môn:
                <asp:DropDownList ID="drMon" runat="server" Height="30px" Width="212px" AutoPostBack="True" OnSelectedIndexChanged="drMon_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style8">Tìm học sinh :
                <asp:TextBox ID="TextBox1" runat="server" Height="24px" Width="182px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnTim" runat="server" Height="29px" Text="Tìm" Width="82px" />
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <hr />
          

            <br />
            <asp:ImageButton ID="imgThemMoi" runat="server" Height="32px" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemMoi_Click" ToolTip="Thêm mới một năm học" Width="32px" />
            <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
            <br />
            <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="204px" OnRowDeleting="gvDiem_RowDeleting" ShowFooter="True" Width="995px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" ToolTip="Xóa các mục đã chọn" />
                            <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" ToolTip="Làm mới" OnClick="imgRefresh_Click" />
                        </FooterTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ckitem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MaHoocSinh" HeaderText="Mã học sinh" />
                    <asp:BoundField DataField="MaMonHoc" HeaderText="Mã môn" />
                    <asp:BoundField DataField="DM_1" HeaderText="Điểm Miệng 1" />
                    <asp:BoundField DataField="DM_2" HeaderText="Điểm miệng 2" />
                    <asp:BoundField DataField="D15_1" HeaderText="Điểm 15p 1" />
                    <asp:BoundField DataField="D15_2" HeaderText="Điểm 15p 2" />
                    <asp:BoundField DataField="D15_3" HeaderText="Điểm 15p 3" />
                    <asp:BoundField DataField="D1T_1" HeaderText="Điểm 1T 1" />
                    <asp:BoundField DataField="D1T_2" HeaderText="Điểm 1T 2" />
                    <asp:BoundField DataField="DThi" HeaderText="Điểm HK" />
                    <asp:TemplateField HeaderText="Thao tác">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CommandName="edit" ImageUrl="~/App_Themes/admin/images/edit.png" CssClass="abc" OnClick="imgEdit_Click" />
                            <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClick="imgDel_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" CssClass="abc" />
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
            <asp:Panel ID="Panel1" runat="server">
                Thêm điểm cho sinh viên:<br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">Mã học sinh:</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtMHS" runat="server" Height="24px" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Môn:</td>
                        <td>
                            <asp:DropDownList ID="drMaMon" runat="server" Height="30px" Width="214px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Điểm miệng 1:</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtDiem1" runat="server" Width="174px"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Điểm 15p 1:</td>
                        <td>
                            <asp:TextBox ID="txt151" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Điểm miệng 2: </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtMieng2" runat="server" Width="178px"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Điểm 15p 2:</td>
                        <td>
                            <asp:TextBox ID="txt15p2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Điểm 1 tiết 1:</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txt1t1" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Điểm 15p 3:</td>
                        <td>
                            <asp:TextBox ID="txt15p3" runat="server" Width="201px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Điểm 1 tiết 2:</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txt1t2" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Điểm học kỳ:</td>
                        <td>
                            <asp:TextBox ID="txtHocKy" runat="server" Width="201px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="4">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
                <br />

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

</div>