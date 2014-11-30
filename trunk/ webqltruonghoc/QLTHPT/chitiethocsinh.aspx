<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="chitiethocsinh.aspx.cs" Inherits="QLTHPT.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
        }

        .auto-style3 {
        }
        .auto-style4 {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thông tin chi tiết của sinh viên:</h2>
    <asp:FormView ID="fvChitietHS" runat="server" Width="649px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataKeyNames="MaHocSinh" OnDataBound="fvChitietHS_DataBound">
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2">Thông tin chung:<br />
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/uploads/hocsinh/images/" + Eval("Anh") %>' />
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
                        <asp:HyperLink ID="hpVetrang" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx?uc=hocsinh">Về trang quản lý học sinh</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </ItemTemplate>

        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />

    </asp:FormView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Menu Chức Năng</h2>

    <ul>
        <li>
            <asp:HyperLink ID="hpNamHoc" runat="server" NavigateUrl="~/QuanLyHocSinh.aspx">Về trang quản lý học sinh</asp:HyperLink>

        </li>
        <li>
            <asp:HyperLink ID="hpadmin" runat="server" NavigateUrl="~/admin.aspx">Về trang quan trị</asp:HyperLink>

        </li>
    </ul>
</asp:Content>
