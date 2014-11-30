<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="diem.ascx.cs" Inherits="QLTHPT.diem" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<style type="text/css">
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
    .auto-style1 {
        width: 99%;
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
    .auto-style8 {
        width: 248px;
    }
    .auto-style15 {
        height: 30px;
    }
    .auto-style16 {
        width: 100%;
    }
    .auto-style17 {
        width: 323px;
    }
    .drop
    {
        width:200px;
        height:33px;
    }
    .t 
    {
        width:200px;
        height:33px;
    }
    .auto-style18 {
        width: 265px;
        height: 30px;
    }
    .auto-style20 {
        width: 113px;
        height: 30px;
    }
    .buttom
    {
        padding:5px 30px 5px 30px; 
    }
    .auto-style32 {
        width: 113px;
    }
    .auto-style33 {
        width: 265px;
    }
      .tdTieuDe
    {
        font-size:22px;
        font-style:italic oblique;
        font-stretch:ultra-condensed;
        background-color:azure;

    }
    .auto-style34 {
        width: 128px;
    }
    </style>
<div>
    <h2>Danh sách điểm của học sinh</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style20">Chọn năm:</td>
                    <td class="auto-style18">
                        <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drNamHoc0_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">Học kỳ:
                        </td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="drKyHoc" runat="server" CssClass="drop" OnSelectedIndexChanged="drKyHoc_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style32">Chọn khối:
                        </td>
                    <td class="auto-style33">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi0_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>Chọn lớp:</td>
                    <td>
                        <asp:DropDownList ID="drLopLoad1" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLopLoad_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style32">Môn:
                        </td>
                    <td class="auto-style33">
                        <asp:DropDownList ID="drMon" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drMon_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td colspan="2" rowspan="2">
                        <asp:Button ID="btnHienthi" runat="server" OnClick="btnHienthi_Click" Text="Hiện thị" CssClass="buttom" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2"></td>
                </tr>
            </table>

            <hr />
          

            <asp:Panel ID="Panel1" runat="server" ForeColor="Red">
                <asp:HyperLink ID="hpThemMoi" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" NavigateUrl="~/themdiem.aspx?id=them" ToolTip="Thêm mới">Thêm mới</asp:HyperLink>
                <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
                <br />
                <asp:Button ID="btnFileMau" runat="server" Height="25px" OnClick="btnFileMau_Click" Text="File mẫu" Width="91px" />
                &nbsp;: dùng cho việc nạp danh sách học sinh.<br />
                <asp:FileUpload ID="fUploadDL" runat="server" Height="31px" Width="334px" />
                <br />
                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                <br />
                *Lưu ý: bạn nên thêm vào file mẫu sau đó mới nạp danh sách để tránh có lỗi xảy ra.<br />
                <br />
                <table class="auto-style16">
                    <tr>
                        <td class="auto-style17">
                            <asp:Button ID="btnAdd" runat="server" Text="Nạp dữ liệu" />
                        </td>
                        <td>
                            <asp:Button ID="btnExport" runat="server" Text="Xuất danh sách" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">&nbsp;</td>
                        <td>Học kỳ:
                            <asp:Label ID="lblHocKy" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">Môn học:
                            <asp:Label ID="lblMonHoc" runat="server"></asp:Label>
                        </td>
                        <td>Lớp:
                            <asp:Label ID="lblLop" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style34">Tìm học sinh :
                            </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtTK" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnTim" runat="server" Height="39px" OnClick="btnTim_Click" Text="Tìm" Width="116px" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="204px" OnRowDeleting="gvDiem_RowDeleting" ShowFooter="True" Width="890px" DataKeyNames="MaHocSinh">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:ImageButton ID="imgDelAll0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" ToolTip="Xóa các mục đã chọn" />
                                <asp:ImageButton ID="imgRefresh0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaHocSinh" HeaderText="Mã HS" />
                        <asp:BoundField DataField="TenHocSinh" HeaderText="Tên" />
                        <asp:BoundField DataField="DM_1" HeaderText="Miệng 1" />
                        <asp:BoundField DataField="DM_2" HeaderText="Miệng 2" />
                        <asp:BoundField DataField="D15_1" HeaderText="15p 1" />
                        <asp:BoundField DataField="D15_2" HeaderText="15p 2" />
                        <asp:BoundField DataField="D15_3" HeaderText="15p 3" />
                        <asp:BoundField DataField="D1T_1" HeaderText="1 Tiết 1" />
                        <asp:BoundField DataField="D1T_2" HeaderText="1 Tiết 2" />
                        <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" Visible="False" />
                        <asp:BoundField DataField="DThi" HeaderText="Điểm thi" />
                        <asp:TemplateField HeaderText="Thao tác">
                            <ItemTemplate>
                                <asp:HyperLink ID="hpSua" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" NavigateUrl='<%# "~/themdiem.aspx?id=" + Eval("MaHocSinh")+"&lop="+ Eval("MaLop") %>'></asp:HyperLink>
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaHK" HeaderText="Mã học kỳ" Visible="False" />
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
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

</div>