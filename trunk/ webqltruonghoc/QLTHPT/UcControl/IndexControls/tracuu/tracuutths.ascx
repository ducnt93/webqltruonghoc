<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tracuutths.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuu.tracuutths" %>
<style type="text/css">

        .auto-style1 {
            width: 100%;
        }

        .auto-style4 {
            height: 19px;
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

    a{color:#0291d4; text-decoration:none;}
    .table {
        width: 646px;
    }
</style>
<div>
    <h2>Thông tin học sinh:</h2>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <br />
    <h3>Xem thông tin học sinh:</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <table class="table">
                <tr>
                    <td class="auto-style7" colspan="2">Hạnh kiểm theo lớp:</td>
                    <td class="auto-style5" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">Chọn năm:</td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        </td>
                    <td>Chọn lớp:</td>
                    <td>
                        <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLop_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Chọn khối: </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td>Học sinh:</td>
                    <td>
                        <asp:DropDownList ID="drHocSinh" runat="server" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13" colspan="2"></td>
                    <td colspan="3" class="auto-style14">
                        <asp:Button ID="btnLocDS" runat="server" CssClass="buttom" Height="32px" Text="Lọc danh sách" Width="130px" OnClick="btnLocDS_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2">&nbsp;</td>
                    <td colspan="3" class="auto-style15">&nbsp;</td>
                </tr>
            </table>
            <br />
            &nbsp;<asp:FormView ID="fvChitietHS" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaHocSinh" ForeColor="Black" GridLines="Vertical" OnDataBound="fvChitietHS_DataBound" Width="522px">
                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2" colspan="2">Thông tin chung:<br />
                        <br />
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/uploads/hocsinh/images/" + Eval("Anh") %>' Height="165px" />
                        <br />
                        <br />
                                (Ảnh thẻ)</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Mã học sinh:
                                <asp:Label ID="lblMaHS" runat="server" Text='<%# Eval("MaHocSinh") %>'></asp:Label>
                            </td>
                            <td>&nbsp;<asp:Label ID="lblLop" runat="server" Text='<%# Eval("MaLop") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Tên học sinh:
                                <asp:Label ID="lblTenHS" runat="server" Text='<%# Eval("TenHocSinh") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">Giới tính:
                                <asp:Label ID="lblGioiTinh" runat="server" Text='<%# Eval("GioiTinh") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Địa chỉ:
                                <asp:Label ID="lblDiaChi" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3" colspan="2">
                        <br />
                                Thông tin gia đình:</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Họ tên bố:
                                <asp:Label ID="lblTenBo" runat="server" Text='<%# Eval("HoTenBo") %>'></asp:Label>
                            </td>
                            <td>Nghề nghiệp:
                                <asp:Label ID="lblNgheBo" runat="server" Text='<%# Eval("NgheBo") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Họ tên mẹ:
                                <asp:Label ID="lblTenMe" runat="server" Text='<%# Eval("HoTenMe") %>'></asp:Label>
                            </td>
                            <td>Nghề nghiệp:
                                <asp:Label ID="lblNgheMe" runat="server" Text='<%# Eval("NgheMe") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" colspan="2">
                        <br />
                                Thông tin khác:<br /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Nơi sinh:<asp:Label ID="lblNoiSinh" runat="server" Text='<%# Eval("NoiSinh") %>'></asp:Label>
                            </td>
                            <td>Trạng thái:<asp:Label ID="lblTrangThai" runat="server" Text='<%# Eval("TrangThai") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Ngày vào trường:<asp:Label ID="lblNgayVaoDoan" runat="server" Text='<%# Eval("NgayVaoDoan") %>'></asp:Label>
                            </td>
                            <td>Ngày nhâp học:<asp:Label ID="lblNgayNhapHoc" runat="server" Text='<%# Eval("NgayNhapHoc") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Số điện thoại nhà:
                                <asp:Label ID="lblSDT" runat="server" Text='<%# Eval("SoDienThoaiNha") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3" colspan="2">
                                <asp:HyperLink ID="hpVetrang" runat="server" NavigateUrl="~/TraCuu.aspx">Về trang tra cứu</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
            </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

</div>