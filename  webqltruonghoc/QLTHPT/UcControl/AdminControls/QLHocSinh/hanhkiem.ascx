<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hanhkiem.ascx.cs" Inherits="QLTHPT.hanhkiem" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
      .tdTieuDe
    {
        font-size:22px;
        font-style:italic oblique;
        font-stretch:ultra-condensed;
        background-color:azure;

    }
    .drop
     {
         width:200px;
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
    .auto-style1 {
        width: 100%;
    }
    .auto-style12 {
        width: 98px;
        height: 30px;
    }
    .auto-style4 {
        width: 249px;
        height: 30px;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style3 {
        width: 98px;
        height: 49px;
    }
    .auto-style11 {
        height: 49px;
    }
    .auto-style14 {
        width: 249px;
        height: 49px;
    }
    .auto-style18 {
        width: 256px;
    }
    .auto-style19 {
        width: 141px;
        height: 26px;
    }
    .auto-style20 {
        width: 256px;
        height: 26px;
    }
    .auto-style21 {
        height: 26px;
    }
    .auto-style22 {
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
     .auto-style23 {
        height: 93px;
    }
    .auto-style24 {
        width: 256px;
        height: 93px;
    }
    .auto-style25 {
        height: 96px;
    }
    .auto-style26 {
        width: 256px;
        height: 96px;
    }
     .auto-style27 {
        width: 378px;
    }
     </style>
<div>
    <h2>Danh sách hạnh kiểm của học sinh:</h2>


    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style12">Chọn năm:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">Học kỳ:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="drHocKy" runat="server" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Chọn khối: </td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">Chọn lớp:</td>
                    <td class="auto-style11">
                        <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLop_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style11" colspan="2">
                        <asp:Button ID="btnLDS" runat="server" OnClick="btnLDS_Click" Text="Lọc danh sách" Height="37px" />
                    </td>
                </tr>
            </table>
            <asp:ImageButton ID="imgThemmoi" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemmoi_Click" />
            <br />
            <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Panel ID="Panel1" runat="server">
            <br />
                <table class="auto-style1">
                    <tr>
                        <td colspan="4" class="tdTieuDe">Thông tin hạnh kiểm cho học sinh:</td>
                    </tr>
                    <tr>
                        <td class="auto-style19">Lớp:</td>
                        <td class="auto-style20">
                            <asp:DropDownList ID="drLopThem" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLopThem_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style21">Học sinh:
                            <asp:Label ID="lblMaHS" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:DropDownList ID="drHsThem" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style25">Học kỳ:</td>
                        <td class="auto-style26">
                            <asp:DropDownList ID="drHK" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style25">Ngày nghỉ có phép:</td>
                        <td class="auto-style25">
                            <asp:TextBox ID="txtNghiCoPhep" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtNghiCoPhep_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtNghiCoPhep">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrNghiCoPhep" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Ngày nghỉ không phép:</td>
                        <td class="auto-style24">
                            <asp:TextBox ID="txtNghiKoPhep" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtNghiKoPhep_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtNghiKoPhep">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrNghiKoPhep" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                        <td class="auto-style23">Lần kỷ luật:</td>
                        <td class="auto-style23">
                            <asp:TextBox ID="txtLanKyLuat" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtLanKyLuat_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtLanKyLuat">
                            </asp:FilteredTextBoxExtender>
                            <br />
                            <asp:Label ID="lblErrLanKL" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">Hạnh kiểm:</td>
                        <td class="auto-style18">
                            <asp:DropDownList ID="drHanhKiem" runat="server" CssClass="drop">
                                <asp:ListItem>--Chọn--</asp:ListItem>
                                <asp:ListItem>Xuất sắc</asp:ListItem>
                                <asp:ListItem>Giỏi</asp:ListItem>
                                <asp:ListItem>Khá</asp:ListItem>
                                <asp:ListItem>Trung bình</asp:ListItem>
                                <asp:ListItem>Yếu</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style22" colspan="4">
                            <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgSaveSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSaveSua_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Button ID="btnXuat1" runat="server" Height="32px" OnClick="btnXuat_Click" Text="Xuất danh sách" Width="115px" />
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style27">Lớp:<asp:Label ID="lblLop" runat="server"></asp:Label>
                        </td>
                        <td>Học kỳ:<asp:Label ID="lblHocKy" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="gvHanhKiem" runat="server" AutoGenerateColumns="False" CellPadding="6" CellSpacing="2" DataKeyNames="MaHS" ForeColor="#333333" GridLines="None" OnRowDeleting="gvHanhKiem_RowDeleting" OnRowUpdating="gvHanhKiem_RowUpdating" ShowFooter="True" Width="890px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:ImageButton ID="imgDelAll0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Xóa các mục mà bạn đã chọn!')" ToolTip="Xóa các mục bạn đã chọn" />
                                <asp:ImageButton ID="imgRefresh0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaHS" HeaderText="Mã HS" />
                        <asp:BoundField DataField="TenHocSinh" HeaderText="Tên học sinh" />
                        <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" Visible="False" />
                        <asp:BoundField DataField="MaHK" HeaderText="Mã HK" Visible="False" />
                        <asp:BoundField DataField="NgayNghiCoPhep" HeaderText="Nghỉ có phép" />
                        <asp:BoundField DataField="NgayNghiKoPhep" HeaderText="Nghỉ không phép" />
                        <asp:BoundField DataField="SoLanKyLuat" HeaderText="Lần kỷ luật" />
                        <asp:BoundField DataField="HanhKiem" HeaderText="Hạnh kiểm" />
                        <asp:TemplateField HeaderText="Thao tác">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgSua0" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Sửa" />
                                <asp:ImageButton ID="imgDel0" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
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
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>


</div>
