<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="hocsinh.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.hócinh" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<style type="text/css">
    .abc {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
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
    .auto-style11 {
        height: 56px;
    }
    .auto-style13 {
        width: 100px;
        height: 56px;
    }
    .auto-style14 {
        width: 82px;
        height: 56px;
    }
    .auto-style19 {
        width: 100px;
    }
    .auto-style20 {
        height: 56px;
        width: 268px;
    }
    .auto-style21 {
        width: 268px;
    }
    .auto-style22 {
        width: 239px;
    }
    </style>

<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
    <h2>Danh sách học sinh:</h2>
                 <table class="auto-style1">
                     <tr>
                         <td class="auto-style22">Năm học:</td>
                         <td>
                             <asp:DropDownList ID="drNamHoc" runat="server" CssClass="drop" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" AutoPostBack="True">
                             </asp:DropDownList>
                         </td>
                     </tr>
                 </table>
   
    <br />

    <br />
    <hr />
                 <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                 <br />
                 <asp:Panel ID="Panel2" runat="server" ForeColor="Red">
                     <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="ImageButton5_Click" />
                     <br />
                     <asp:HyperLink ID="hpFileMau" runat="server" NavigateUrl="&quot;~/uploads/HocsinhMau.xlsx&quot;">File mẫu</asp:HyperLink>
                     &nbsp;: dùng cho việc nạp danh sách học sinh.<br />
                     <asp:FileUpload ID="fUploadDL" runat="server" Height="31px" Width="334px" />
                     <br />
                     <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                     <br />
                     *Lưu ý: bạn nên thêm vào file mẫu sau đó mới nạp danh sách để tránh có lỗi xảy ra.<br />
                     <br />
                     <table class="auto-style1">
                         <tr>
                             <td class="auto-style14"></td>
                             <td class="auto-style13">Tìm học sinh:</td>
                             <td class="auto-style20">
                                 <asp:TextBox ID="txtTK" runat="server" CssClass="textbox"></asp:TextBox>
                             </td>
                             <td class="auto-style11">
                                 <asp:Button ID="btnTim" runat="server" Height="32px" OnClick="btnTim_Click" Text="Tìm" Width="101px" />
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Button ID="btnNapDL" runat="server" Height="36px" Text="Nạp dữ liệu" Width="105px" />
                             </td>
                             <td class="auto-style19">&nbsp;</td>
                             <td class="auto-style21">&nbsp;</td>
                             <td>
                                 &nbsp;</td>
                         </tr>
                     </table>
                     <br />
                     <asp:GridView ID="gvHS" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaHocSinh" Height="129px" OnRowDeleting="gvHS_RowDeleting" ShowFooter="True" Width="885px" EnableTheming="True" PageSize="5" AllowPaging="True" EnableSortingAndPagingCallbacks="True" OnPageIndexChanging="gvHS_PageIndexChanging">
                         <Columns>
                             <asp:TemplateField>
                                 <FooterTemplate>
                                     <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="ImageButton1_Click" OnClientClick="javascript: return confirm('Bạn có muốn xóa các mục đã chọn không?')" ToolTip="Xóa các mục đã chọn" />
                                     <asp:ImageButton ID="ImageButton2" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="ImageButton2_Click" ToolTip="Làm mới" />
                                 </FooterTemplate>
                                 <HeaderTemplate>
                                     <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                                 </HeaderTemplate>
                                 <ItemTemplate>
                                     <asp:CheckBox ID="ckitem" runat="server" OnCheckedChanged="ckAll_CheckedChanged" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:BoundField DataField="MaHocSinh" HeaderText="Mã học sinh" />
                             <asp:BoundField DataField="TenHocSinh" HeaderText="Tên học sinh" />
                             <asp:BoundField DataField="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh" />
                             <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                             <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                             <asp:TemplateField HeaderText="Thao tác" ItemStyle-Height="50px">
                                 <ItemTemplate>
                                     <asp:ImageButton ID="ImageButton4" runat="server" CommandName="delete" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
                                 </ItemTemplate>
                                 <ItemStyle Height="50px" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Chi tiết">
                                 <ItemTemplate>
                                     <asp:HyperLink ID="hpXem" runat="server" NavigateUrl='<%# "~/chitiethocsinh.aspx?id=" + Eval("MaHocSinh") %>' ToolTip="Xem chi tiết thông tin học sinh">Xem</asp:HyperLink>
                                     &nbsp;|
                                     <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/themsuahocsinh.aspx?hs="+Eval("MaHocSinh")+"&namhoc="+ Eval("MaNamHoc") %>'>Sửa</asp:HyperLink>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         <EditRowStyle HorizontalAlign="Center" />
                         <EmptyDataRowStyle HorizontalAlign="Center" />
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
    <br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
  </ContentTemplate>
         </asp:UpdatePanel>
</div>
   