<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hocsinh.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.hócinh" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .abc {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
    .img
    {
         width: 20px;
        height:20px;
        display:inline-block;
         padding:5px 5px;
    }
    .auto-style1 {
        width: 100%;
    }
    .auto-style3 {
        width: 405px;
    }
    .auto-style4 {
        width: 405px;
        height: 30px;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style6 {
        height: 88px;
    }
    .auto-style7 {
    }
    .auto-style8 {
    }
    .auto-style9 {
        height: 28px;
    }
    </style>
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
    <h2>Danh sách học sinh:</h2>
      <br />
    <hr />
    <br />
    <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm học sinh" OnClick="imgAdd_Click" />
&nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
    <br />

    <br />
    <div>
         
                 <br />
                 <table class="auto-style1">
                     <tr>
                         <td class="auto-style4">Chọn năm:<asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" Width="202px">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style5">Chọn kỳ:<asp:DropDownList ID="drKyHoc" runat="server" AutoPostBack="True" Height="35px" OnSelectedIndexChanged="drKyHoc0_SelectedIndexChanged" Width="209px">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">Chọn khối:
                             <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" Height="41px" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1" Width="193px">
                             </asp:DropDownList>
                         </td>
                         <td>Chọn lớp:<asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" Height="36px" OnSelectedIndexChanged="drLop_SelectedIndexChanged1" Width="200px">
                             </asp:DropDownList>
                         </td>
                     </tr>
                 </table>

           
    </div>
   
    <br />
                 <asp:Panel ID="pnEdit0" runat="server">
                     <table class="auto-style1">
                         <tr>
                             <td colspan="2">Thông tin thêm mới</td>
                         </tr>
                         <tr>
                             <td class="auto-style6" colspan="2">Thông tin chung:<br />
                                 <asp:Image ID="Image2" runat="server" />
                                 <br />
                                 (Ảnh đại diện)<br />
                                 <asp:FileUpload ID="FileUpload2" runat="server" />
                                 &nbsp;<asp:Button ID="btnUpAnh0" runat="server" Text="Upload" />
                                 <br />
                                 <br />
                                 Mã học sinh:
                                 <asp:TextBox ID="txtMaHS" runat="server" Height="26px" Width="166px"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Thuộc lớp:
                                 <asp:DropDownList ID="drMaLop0" runat="server" Height="30px" Width="186px">
                                 </asp:DropDownList>
                             </td>
                             <td>Tên học sinh:
                                 <asp:TextBox ID="txtTenHS0" runat="server"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Ngày sinh:<asp:TextBox ID="txtNgaySinh0" runat="server"></asp:TextBox>
                                 <asp:CalendarExtender ID="txtNgaySinh0_CalendarExtender" runat="server" TargetControlID="txtNgaySinh0">
                                 </asp:CalendarExtender>
                             </td>
                             <td rowspan="2">Giới tính:
                                 <asp:RadioButtonList ID="rbGioiTinh0" runat="server">
                                     <asp:ListItem Value="True">Nam</asp:ListItem>
                                     <asp:ListItem Value="False">Nữ</asp:ListItem>
                                 </asp:RadioButtonList>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Địa chỉ:<asp:TextBox ID="txtDiachi" runat="server"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8" colspan="2">Thông tin gia đình:</td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Họ tên bố:<asp:TextBox ID="txtTenBo0" runat="server"></asp:TextBox>
                             </td>
                             <td>Nghề bố:<asp:TextBox ID="txtNgheBo0" runat="server"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style9">Họ tên mẹ:<asp:TextBox ID="txtTenMe0" runat="server"></asp:TextBox>
                             </td>
                             <td class="auto-style9">Nghề mẹ:<asp:TextBox ID="txtNgheMe0" runat="server"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8" colspan="2">Thông tin khác:</td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Nơi sinh:<asp:TextBox ID="txtNoiSinh0" runat="server"></asp:TextBox>
                             </td>
                             <td>Ngày nhập học:<asp:TextBox ID="txtNgayNhapHoc0" runat="server"></asp:TextBox>
                                 <asp:CalendarExtender ID="txtNgayNhapHoc0_CalendarExtender" runat="server" TargetControlID="txtNgayNhapHoc0">
                                 </asp:CalendarExtender>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Ngày vào đoàn:<asp:TextBox ID="txtNgayVaoDoan0" runat="server"></asp:TextBox>
                                 <asp:CalendarExtender ID="txtNgayVaoDoan0_CalendarExtender" runat="server" TargetControlID="txtNgayVaoDoan0">
                                 </asp:CalendarExtender>
                             </td>
                             <td>Email:<asp:TextBox ID="txtEmail0" runat="server"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8">Trạng thái:
                                 <asp:DropDownList ID="drTrangThai" runat="server" Height="32px" Width="154px">
                                     <asp:ListItem>Đang học</asp:ListItem>
                                     <asp:ListItem>Nghỉ học</asp:ListItem>
                                     <asp:ListItem>Bảo lưu</asp:ListItem>
                                 </asp:DropDownList>
                             </td>
                             <td>Số điện thoại:&nbsp;
                                 <asp:TextBox ID="txtSDT0" runat="server"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style7" colspan="2">
                                 <asp:ImageButton ID="imgLuu0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                                                 <asp:ImageButton ID="imgLuuSua0" CssClass="abc" runat="server" ImageUrl="~/App_Themes/admin/images/save_32x32.png" ToolTip="Lưu lại" OnClick="imgLuuSua_Click" />
                
                                 <asp:ImageButton ID="imgCancel0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click1" ToolTip="Hủy" />
                             </td>
                         </tr>
                     </table>
                 </asp:Panel>
    <br />

    <br />
    <hr />
    <br />
    <asp:GridView ID="gvHS" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaHocSinh" OnRowDeleting="gvHS_RowDeleting" ShowFooter="True" OnRowCommand="gvHS_RowCommand" Width="885px" Height="129px">
        <Columns>
            <asp:TemplateField>
                <FooterTemplate>
                    <asp:ImageButton ID="ImageButton1" CssClass="img" runat="server" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="ImageButton1_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn không?')" ToolTip="Xóa các mục đã chọn" />
                    <asp:ImageButton ID="ImageButton2" CssClass="img" runat="server" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="ImageButton2_Click" ToolTip="Làm mới" />
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckitem" runat="server" OnCheckedChanged="ckAll_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MaHocSinh" HeaderText="Mã học sinh" />
            <asp:BoundField DataField="MaLop" HeaderText="Mã lớp " />
            <asp:BoundField DataField="TenHocSinh" HeaderText="Tên học sinh" />
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />
            <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
            <asp:TemplateField HeaderText="Thao tác" ItemStyle-Height="50px">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return cofirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
                </ItemTemplate>

<ItemStyle Height="50px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Chi tiết">
                <ItemTemplate>
                    <asp:HyperLink ID="hpXem" runat="server" NavigateUrl='<%# "~/chitiethocsinh.aspx?id=" + Eval("MaHocSinh") %>' ToolTip="Xem chi tiết thông tin học sinh">Xem</asp:HyperLink>
                    &nbsp;|
                    <asp:LinkButton ID="lkbSua" runat="server" OnClick="lkbSua_Click">Sửa</asp:LinkButton>
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
    <br />
    <br />
    <hr />
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
  </ContentTemplate>
         </asp:UpdatePanel>
</div>