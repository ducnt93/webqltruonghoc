<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="khenthuong.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.khenthuong" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .img {
        width: 32px;
        height: 32px;
        display: inline-block;
        padding: 5px 60px 5px 60px;
    }
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
    .auto-style1 {
        width: 100%;
    }
    .auto-style4 {
        width: 283px;
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
    .auto-style12 {
        width: 98px;
        height: 30px;
    }
    .auto-style14 {
    }
    .auto-style16 {
        width: 104px;
    }
    .auto-style17 {
        width: 276px;
    }
    .auto-style18 {
        width: 283px;
        height: 49px;
    }
    .auto-style19 {
        height: 93px;
    }
    .auto-style20 {
        width: 276px;
        height: 93px;
    }
    .auto-style21 {
        width: 104px;
        height: 93px;
    }
    .auto-style22 {
        height: 91px;
    }
    .auto-style23 {
        width: 276px;
        height: 91px;
    }
    .auto-style24 {
        width: 104px;
        height: 91px;
    }
    .auto-style25 {
        width: 626px;
        height: 49px;
    }
</style> 

<div>
    <h2>Danh sách học sinh được khen thưởng:</h2>

    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
  
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <h3>Lọc danh sách khen thưởng theo lớp:</h3>
                 <table class="auto-style1">
                     <tr>
                         <td class="auto-style12">Chọn năm:</td>
                         <td class="auto-style4"><asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style5" colspan="2">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style3">Chọn khối:
                             </td>
                         <td class="auto-style18">
                             <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style11">Chọn lớp:<br />
                             <br />
                         </td>
                         <td class="auto-style11"><asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drLop_SelectedIndexChanged1" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                 </table>

           
    <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
    <br />
              <asp:ImageButton ID="imgThemMoi" runat="server" Height="32px" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemMoi_Click" ToolTip="Thêm mới một năm học" Width="32px" />
              <br />
              <asp:Panel ID="Panel1" runat="server">
                  <table class="auto-style1">
                      <tr>
                          <td colspan="4" class="tdTieuDe">Thêm mới :</td>
                      </tr>
                      <tr>
                          <td class="auto-style14">Khối</td>
                          <td class="auto-style17"><asp:DropDownList ID="drKhoi1" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi1_SelectedIndexChanged">
                              </asp:DropDownList>
                          </td>
                          <td class="auto-style16">Lớp:</td>
                          <td>
                              <asp:DropDownList ID="drLop1" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLop1_SelectedIndexChanged">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style19">Học sinh:</td>
                          <td class="auto-style20">
                              <asp:DropDownList ID="drHS" runat="server" CssClass="drop">
                              </asp:DropDownList>
                              <asp:Label ID="lblMaHS" runat="server"></asp:Label>
                          </td>
                          <td class="auto-style21">Hình thức khen:</td>
                          <td class="auto-style19">
                              <asp:TextBox ID="txtHinhThuc" runat="server" CssClass="textbox"></asp:TextBox>
                              <br />
                              <asp:Label ID="lblErrHThuc" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style22">Ngày khen:</td>
                          <td class="auto-style23">
                              <asp:TextBox ID="txtNgayKhen" runat="server" CssClass="textbox"></asp:TextBox>
                              <asp:CalendarExtender ID="txtNgayKhen_CalendarExtender" runat="server" TargetControlID="txtNgayKhen">
                              </asp:CalendarExtender>
                              <br />
                              <asp:Label ID="lblErrNgayKhen" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                          </td>
                          <td class="auto-style24">Nôi dung:</td>
                          <td class="auto-style22">
                              <asp:TextBox ID="txtND" runat="server" CssClass="textbox"></asp:TextBox>
                              <br />
                              <asp:Label ID="lblErrNoiDug" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style14" colspan="4">
                              <asp:ImageButton ID="imgLuu" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                              <asp:ImageButton ID="imgLuuSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuuSua_Click" ToolTip="Lưu lại" />
                              <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                          </td>
                      </tr>
                  </table>
              </asp:Panel>
              <br />
              <table class="auto-style1">
                  <tr>
                      <td class="auto-style3">&nbsp;</td>
                      <td class="auto-style25">&nbsp;</td>
                      <td class="auto-style11">
                          <asp:Button ID="btnXuat1" runat="server" Height="32px" OnClick="btnXuat_Click" Text="Xuất danh sách" Width="115px" />
                      </td>
                  </tr>
              </table>
              <asp:Panel ID="Panel2" runat="server">
                  <table class="auto-style1">
                      <tr>
                          <td class="auto-style11">
                              <asp:Label ID="lblKhoi" runat="server"></asp:Label>
                          </td>
                          <td class="auto-style11">
                              <asp:Label ID="lblLop" runat="server"></asp:Label>
                          </td>
                      </tr>
                  </table>
                  <asp:GridView ID="gvKhenThuong" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="HocSinh" OnRowDeleting="gvKhenThuong_RowDeleting" OnRowUpdating="gvKhenThuong_RowUpdating" ShowFooter="True" Width="850px">
                      <Columns>
                          <asp:TemplateField>
                              <FooterTemplate>
                                  <asp:ImageButton ID="imgDelAll0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Xóa các mục mà bạn đã chọn!')" ToolTip="Xóa các mục bạn đã chọn" />
                                  <asp:ImageButton ID="imgRefresh0" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                              </FooterTemplate>
                              <HeaderTemplate>
                                  <asp:CheckBox ID="ckAll0" runat="server" OnCheckedChanged="ckAll_CheckedChanged1" />
                              </HeaderTemplate>
                              <ItemTemplate>
                                  <asp:CheckBox ID="ckItem0" runat="server" />
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="HocSinh" HeaderText="Mã học sinh" />
                          <asp:BoundField DataField="TenHocSinh" HeaderText="Tên học sinh" />
                          <asp:BoundField DataField="HinhThucKhen" HeaderText="Hình thức khen thưởng" />
                          <asp:BoundField DataField="NgayKhen" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Ngày khen" />
                          <asp:BoundField DataField="NoiDungKhen" HeaderText="Nội dung" />
                          <asp:TemplateField HeaderText="Thao tác">
                              <ItemTemplate>
                                  <asp:ImageButton ID="imgSua0" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" OnClick="imgSua_Click" ToolTip="Sửa" />
                                  <asp:ImageButton ID="imgDel0" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
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

              </asp:Panel>
    <br />
        </ContentTemplate>
    </asp:UpdatePanel>

</div>