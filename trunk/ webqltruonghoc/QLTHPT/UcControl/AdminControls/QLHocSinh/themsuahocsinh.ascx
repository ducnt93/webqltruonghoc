<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="themsuahocsinh.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.themsuahocsinh" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style type="text/css">
    .abc {
        width: 32px;
        height: 32px;
        display: inline-block;
        padding: 5px 60px 5px 60px;
    }

    .drop {
        width: 200px;
        height: 32px;
    }

    .textbox {
        width: 200px;
        height: 32px;
    }

    .img {
        width: 20px;
        height: 20px;
        display: inline-block;
        padding: 5px 5px;
    }

    .tdTieuDe {
        font-size: 22px;
        font-style: italic oblique;
        font-stretch: ultra-condensed;
        background-color: azure;
    }

    .auto-style1 {
        border-style: none;
        border-color: inherit;
        border-width: thick;
        width: 100%;
        height: 50px;
        }

    .auto-style5 {
        height: 30px;
    }

    .auto-style19 {
        width: 134px;
        height: 65px;
    }

    .auto-style21 {
        width: 134px;
        height: 62px;
    }

    .auto-style22 {
        width: 242px;
        height: 62px;
    }

    .auto-style23 {
        width: 134px;
        height: 64px;
    }

    .auto-style24 {
        width: 242px;
        height: 64px;
    }

    .auto-style25 {
        height: 72px;
    }

    .auto-style33 {
        height: 59px;
    }

    .auto-style34 {
        width: 134px;
        height: 59px;
    }

    .auto-style35 {
        width: 242px;
        height: 59px;
    }

    .auto-style36 {
        height: 65px;
    }

    .auto-style37 {
        height: 52px;
    }

    .auto-style38 {
        width: 134px;
        height: 52px;
    }

    .auto-style39 {
        width: 242px;
        height: 52px;
    }

    .auto-style40 {
        height: 54px;
    }

    .auto-style41 {
        width: 134px;
        height: 54px;
    }

    .auto-style42 {
        width: 242px;
        height: 54px;
    }

    .auto-style43 {
        width: 134px;
        height: 50px;
    }

    .auto-style44 {
        width: 242px;
        height: 50px;
    }

    .auto-style45 {
        height: 50px;
    }

    .auto-style46 {
        width: 242px;
        height: 65px;
    }
</style>
<div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <h2>Thông tin</h2>
    <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image2" runat="server" Height="183px" Width="145px" />
    <br />
    (Ảnh đại diện)<br />
    * Ảnh có dung lượng nhỏ hơn 1MB. Kích thước 145x183<br />
    <asp:FileUpload ID="FileUploadControl_" runat="server" />                           
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnEdit0" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td >Mã học sinh:</td>
                        <td >
                            <asp:TextBox ID="txtMaHS" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldMaHS" runat="server" ControlToValidate="txtMaHS" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                    </tr>
                </table>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style25" colspan="2">Tên học sinh:
                            <asp:TextBox ID="txtTenHS0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldTenHS" runat="server" ControlToValidate="txtTenHS0" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style25" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Năm học: </td>
                        <td class="auto-style24">
                            <asp:DropDownList ID="drNamHocThem" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style5" colspan="2" rowspan="3">Giới tính:
                                 <asp:RadioButtonList ID="rbGioiTinh0" runat="server">
                                     <asp:ListItem Value="True">Nam</asp:ListItem>
                                     <asp:ListItem Value="False">Nữ</asp:ListItem>
                                 </asp:RadioButtonList>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="vldGioiTinh" runat="server" ControlToValidate="rbGioiTinh0" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">Ngày sinh:<br />
                        </td>
                        <td class="auto-style46">
                            <asp:TextBox ID="txtNgaySinh0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:CalendarExtender ID="txtNgaySinh0_CalendarExtender" runat="server" TargetControlID="txtNgaySinh0">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="vldNgaySinh" runat="server" ControlToValidate="txtNgaySinh0" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style21">Địa chỉ:</td>
                        <td class="auto-style22">
                            <asp:TextBox ID="txtDiachi" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldDiaChi" runat="server" ControlToValidate="txtDiachi" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdTieuDe" colspan="4">Thông tin gia đình:</td>
                    </tr>
                    <tr>
                        <td class="auto-style19">Họ tên bố:</td>
                        <td class="auto-style46">
                            <asp:TextBox ID="txtTenBo0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldTenBo" runat="server" ControlToValidate="txtTenBo0" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style36">Nghề bố:</td>
                        <td class="auto-style36">
                            <asp:TextBox ID="txtNgheBo0" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">Họ tên mẹ:</td>
                        <td class="auto-style35">
                            <asp:TextBox ID="txtTenMe0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldTenMe" runat="server" ControlToValidate="txtTenMe0" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style33">Nghề mẹ:</td>
                        <td class="auto-style33">
                            <asp:TextBox ID="txtNgheMe0" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdTieuDe" colspan="4">Thông tin khác:</td>
                    </tr>
                    <tr>
                        <td class="auto-style38">Nơi sinh:</td>
                        <td class="auto-style39">
                            <asp:TextBox ID="txtNoiSinh0" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td class="auto-style37">Ngày nhập học:</td>
                        <td class="auto-style37">
                            <asp:TextBox ID="txtNgayNhapHoc0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:CalendarExtender ID="txtNgayNhapHoc0_CalendarExtender" runat="server" TargetControlID="txtNgayNhapHoc0">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style41">Ngày vào đoàn:</td>
                        <td class="auto-style42">
                            <asp:TextBox ID="txtNgayVaoDoan0" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:CalendarExtender ID="txtNgayVaoDoan0_CalendarExtender" runat="server" TargetControlID="txtNgayVaoDoan0">
                            </asp:CalendarExtender>
                        </td>
                        <td class="auto-style40">Email:</td>
                        <td class="auto-style40">
                            <asp:TextBox ID="txtEmail0" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style43">Trạng thái: </td>
                        <td class="auto-style44">
                            <asp:DropDownList ID="drTrangThai" runat="server" CssClass="drop">
                                <asp:ListItem>Đang học</asp:ListItem>
                                <asp:ListItem>Nghỉ học</asp:ListItem>
                                <asp:ListItem>Bảo lưu</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style45">Số điện thoại:&nbsp; </td>
                        <td class="auto-style45">
                            <asp:TextBox ID="txtSDT0" runat="server" CssClass="textbox" MaxLength="11"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtSDT0_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtSDT0">
                            </asp:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="4">                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ImageButton ID="imgLuu0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
    <asp:ImageButton ID="imgLuuSua0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuuSua_Click" ToolTip="Lưu lại" />
    <asp:ImageButton ID="imgCancel0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click1" ToolTip="Hủy" />
</div>
