<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="giaovien.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLGiaoVien.giaovien" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
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
        width: 100%;
    }
    .auto-style2 {
        height: 23px;
    }
    .auto-style3 {
        height: 23px;
        width: 251px;
    }
    .auto-style4 {
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
     .text {
         width:100px;
     }
    .auto-style5 {
        height: 23px;
        width: 122px;
    }
    .auto-style6 {
        width: 122px;
    }
    .auto-style7 {
        width: 251px;
    }
    .auto-style8 {
        width: 354px;
    }
    </style>
<div>
    <h2>Danh sách giáo viên: </h2>
    <br />
    <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
        <br />
          <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" ToolTip="Thêm mới" Width="32px" OnClick="ImageButton1_Click" />
        &nbsp;<asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td colspan="4" class="auto-style2">Thêm mới giáo viên:</td>
                            </tr>
                            <tr>
                                <td class="auto-style5">Mã giáo viên:
                                    </td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="txtMaGV" runat="server" CssClass="textbox"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lblErrMaGV" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                                </td>
                                <td class="auto-style2">Tổ:
                                    </td>
                                <td class="auto-style2">
                                    <asp:DropDownList ID="drTo" runat="server" CssClass="textbox">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Tên tên giáo viên:
                                    </td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtTenGV" runat="server" CssClass="textbox"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lblErrTenGV" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                                </td>
                                <td>Ngày sinh:
                                    </td>
                                <td>
                                    <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtNgaySinh_CalendarExtender" runat="server" TargetControlID="txtNgaySinh">
                                    </asp:CalendarExtender>
                                    <br />
                                    <asp:Label ID="lblErrNgaySinh" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Địa chỉ:
                                    </td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="textbox"></asp:TextBox>
                                </td>
                                <td>Số điện thoại:
                                    </td>
                                <td>
                                    <asp:TextBox ID="txtSDT" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="txtSDT_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtSDT">
                                    </asp:FilteredTextBoxExtender>
                                    <br />
                                    <asp:Label ID="lblErrSDT" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Chủ nhiêm:
                                    </td>
                                <td class="auto-style7">
                                    <asp:CheckBox ID="ckChuNhiem" runat="server" />
                                </td>
                                <td>Giới tính:
                                    </td>
                                <td>
                                    <asp:DropDownList ID="drGioiTinh" runat="server" CssClass="textbox">
                                        <asp:ListItem>--Chọn--</asp:ListItem>
                                        <asp:ListItem>Nam</asp:ListItem>
                                        <asp:ListItem>Nữ</asp:ListItem>
                                        <asp:ListItem>Khác</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4" colspan="4">
                                    <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                                    <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                  <asp:Panel ID="Panel3" runat="server">
                      <table class="auto-style1">
                          <tr>
                              <td class="auto-style2" colspan="4">Sửa giáo viên:</td>
                          </tr>
                          <tr>
                              <td class="auto-style5">Mã giáo viên: </td>
                              <td class="auto-style3">
                                  <asp:TextBox ID="txtMaGV0" runat="server" CssClass="textbox"></asp:TextBox>
                                  <br />
                                  <asp:Label ID="lblErrMaGV0" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                              </td>
                              <td class="auto-style2">Tổ: </td>
                              <td class="auto-style2">
                                  <asp:DropDownList ID="drToSua" runat="server" CssClass="textbox">
                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style6">Tên tên giáo viên: </td>
                              <td class="auto-style7">
                                  <asp:TextBox ID="txtTenGV0" runat="server" CssClass="textbox"></asp:TextBox>
                                  <br />
                                  <asp:Label ID="lblErrTenGV0" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                              </td>
                              <td>Ngày sinh: </td>
                              <td>
                                  <asp:TextBox ID="txtNgaySinh0" runat="server" CssClass="textbox"></asp:TextBox>
                                  <asp:CalendarExtender ID="txtNgaySinh0_CalendarExtender" runat="server" TargetControlID="txtNgaySinh0">
                                  </asp:CalendarExtender>
                                  <br />
                                  <asp:Label ID="lblErrNgaySinh0" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style6">Địa chỉ: </td>
                              <td class="auto-style7">
                                  <asp:TextBox ID="txtDiaChi0" runat="server" CssClass="textbox"></asp:TextBox>
                              </td>
                              <td>Số điện thoại: </td>
                              <td>
                                  <asp:TextBox ID="txtSDT0" runat="server" CssClass="textbox"></asp:TextBox>
                                  <asp:FilteredTextBoxExtender ID="txtSDT0_FilteredTextBoxExtender" runat="server" FilterType="Numbers" TargetControlID="txtSDT0">
                                  </asp:FilteredTextBoxExtender>
                                  <br />
                                  <asp:Label ID="lblErrSDT0" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style6">Chủ nhiêm: </td>
                              <td class="auto-style7">
                                  <asp:CheckBox ID="ckChuNhiemSua" runat="server" />
                              </td>
                              <td>Giới tính: </td>
                              <td>
                                  <asp:DropDownList ID="drGioiTinhSua" runat="server" CssClass="textbox">
                                      <asp:ListItem>--Chọn--</asp:ListItem>
                                      <asp:ListItem>Nam</asp:ListItem>
                                      <asp:ListItem>Nữ</asp:ListItem>
                                      <asp:ListItem>Khác</asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style4" colspan="4">
                                  <asp:ImageButton ID="imgSaveSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSaveSua_Click" ToolTip="Lưu lại" />
                                  <asp:ImageButton ID="imgCancelSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                              </td>
                          </tr>
                      </table>
                  </asp:Panel>
        <br />
                  <asp:Panel ID="Panel2" runat="server">
                      <table class="auto-style1">
                          <tr>
                              <td class="auto-style8">&nbsp;</td>
                              <td>Môn:
                                  <asp:Label ID="lblMon" runat="server"></asp:Label>
                                  <br />
                              </td>
                          </tr>
                      </table>
                      <asp:GridView ID="gvGiaoVien" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaGiaoVien" ForeColor="#333333" GridLines="None" Height="208px" OnRowCancelingEdit="gvGiaoVien_RowCancelingEdit" OnRowDeleting="gvGiaoVien_RowDeleting" OnRowUpdating="gvGiaoVien_RowUpdating" PageSize="5" ShowFooter="True" Width="850px">
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                          <Columns>
                              <asp:TemplateField>
                                  <FooterTemplate>
                                      <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn?')" ToolTip="Xóa các mục đã chọn" />
                                      <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                                  </FooterTemplate>
                                  <HeaderTemplate>
                                      <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                                  </HeaderTemplate>
                                  <ItemTemplate>
                                      <asp:CheckBox ID="ckitem" runat="server" />
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:BoundField ControlStyle-CssClass="text" DataField="MaGiaoVien" HeaderText="Mã giáo viên">
                              <ControlStyle CssClass="text" />
                              </asp:BoundField>
                              <asp:BoundField ControlStyle-CssClass="text" DataField="TenGiaoVien" HeaderText="Tên giáo viên">
                              <ControlStyle CssClass="text" />
                              </asp:BoundField>
                              <asp:BoundField DataField="NgaySinh" DataFormatString="{0:dd/mm/yyyy}" HeaderText="Ngày sinh" />
                              <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                              <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                              <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" />
                              <asp:BoundField DataField="MaMon" HeaderText="Mã môn" Visible="False" />
                              <asp:TemplateField HeaderText="Chủ nhiệm">
                                  <ItemTemplate>
                                      <asp:CheckBox ID="ckChuNhiem0" runat="server" Checked='<%# Eval("ChuNhiem") %>' />
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Thao tác">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="imgEdit" runat="server" CommandName="update" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" />
                                      <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không? ')" />
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

                  </asp:Panel>
    <br />

    <br />
    <br />

              </ContentTemplate>
    </asp:UpdatePanel>
        
</div>