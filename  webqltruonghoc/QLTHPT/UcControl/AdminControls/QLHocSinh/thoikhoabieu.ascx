<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="thoikhoabieu.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.thoikhoabieu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">

      .tdTieuDe
    {
        font-size:22px;
        font-style:italic oblique;
        font-stretch:ultra-condensed;
        background-color:azure;

    }
    .abc {
        height: 18px;
        display: inline-block;
        padding: 5px 5px;
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
    .auto-style14 {
        width: 249px;
        height: 49px;
    }
    .auto-style11 {
        height: 49px;
    }
    .auto-style15 {
        width: 100%;
        float: left;
    }
    .auto-style17 {
    }
    .auto-style18 {
        width: 90px;
    }
    .auto-style19 {
        height: 23px;
    }
    .auto-style20 {
        width: 90px;
        height: 23px;
    }
    .auto-style22 {
        height: 23px;
        width: 113px;
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 60px 5px 60px;
    
    }
     .auto-style23 {
        width: 113px;
    }

    </style>
<div>
    <h2>Thời khóa biểu:</h2>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table class="auto-style1" style="font-family: Arial, Helvetica, sans-serif; border-color: #00FFFF; background-color: #CCFFFF;">
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
                        <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style11" colspan="2">
                        <asp:Button ID="btnLDS" runat="server" OnClick="btnLDS_Click" Text="Lọc danh sách" Height="38px" />
                    </td>
                </tr>
            </table>
             <asp:ImageButton ID="imgThemmoi" runat="server" ImageUrl="~/App_Themes/admin/images/add.png" OnClick="imgThemmoi_Click" />
            <br />
            <asp:Panel ID="Panel1" runat="server">
               
            <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            <br />
           
                <table align="center" class="auto-style15">
                    <tr>
                        <td class="tdTieuDe" colspan="4">Thông tin thời khóa biểu:</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Ngày:</td>
                        <td>
                            <asp:DropDownList ID="drNgay" runat="server" CssClass="drop">
                                <asp:ListItem Value="1">--Chọn thứ--</asp:ListItem>
                                <asp:ListItem Value="2">Thứ 2</asp:ListItem>
                                <asp:ListItem Value="3">Thứ 3</asp:ListItem>
                                <asp:ListItem Value="4">Thứ 4</asp:ListItem>
                                <asp:ListItem Value="5">Thứ 5</asp:ListItem>
                                <asp:ListItem Value="6">Thứ 6</asp:ListItem>
                                <asp:ListItem Value="7">Thứ 7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style18">&nbsp;</td>
                        <td>
                            <asp:Label ID="lblTKB" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Lớp: </td>
                        <td>
                            <asp:DropDownList ID="drLopThem" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style18">Học kỳ:</td>
                        <td>
                            <asp:DropDownList ID="drHK" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">Tiết 1:</td>
                        <td class="auto-style19">
                            <asp:TextBox ID="txtT1" runat="server" CssClass="textbox"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblErrTiet1" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                        <td class="auto-style20">Tiết 2:</td>
                        <td class="auto-style19">
                            <asp:TextBox ID="txtT2" runat="server" CssClass="textbox"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblErrTiet2" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">Tiết 3</td>
                        <td class="auto-style19">
                            <asp:TextBox ID="txtT3" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td class="auto-style20">Tiết 4</td>
                        <td class="auto-style19">
                            <asp:TextBox ID="txtT4" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Tiết 5:</td>
                        <td>
                            <asp:TextBox ID="txtT5" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td class="auto-style18">Từ ngày:</td>
                        <td>
                            <asp:TextBox ID="txtTuNgay" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:CalendarExtender ID="txtTuNgay_CalendarExtender" runat="server" TargetControlID="txtTuNgay">
                            </asp:CalendarExtender>
                            <br />
                            <asp:Label ID="lblErrTuNgay" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style18">Đến ngày:</td>
                        <td>
                            <asp:TextBox ID="txtDenNgay" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:CalendarExtender ID="txtDenNgay_CalendarExtender" runat="server" TargetControlID="txtDenNgay">
                            </asp:CalendarExtender>
                            <br />
                            <asp:Label ID="lblErrDenNgay" runat="server" ForeColor="Red" Text="*Bạn không thể bỏ trống trường này"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17" colspan="4">
                            <asp:ImageButton ID="imgSave" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSave_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgSaveSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgSaveSua_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel1" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy bỏ" />
                        </td>
                    </tr>
                </table>
            </asp:Panel> 
            <br />
            <asp:Panel ID="Panel2" runat="server">
                    <br />
                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td>Lớp:
                                <asp:Label ID="lblLop" runat="server"></asp:Label>
                            </td>
                            <td>Học kỳ:
                                <asp:Label ID="lblHocKy" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="gvTKB" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="MaTKB" ForeColor="Black" GridLines="None" Height="201px" OnRowDeleting="gvTKB_RowDeleting" ShowFooter="True" Width="858px" OnRowUpdating="gvTKB_RowUpdating">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:TemplateField>
                                <FooterTemplate>
                                    <asp:ImageButton ID="imgDelAll" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgDelAll_Click" OnClientClick="javascript: return confirm('Xóa các mục mà bạn đã chọn!')" ToolTip="Xóa các mục bạn đã chọn" />
                                    <asp:ImageButton ID="imgRefresh" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Refresh.png" OnClick="imgRefresh_Click" ToolTip="Làm mới" />
                                </FooterTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ckAll" runat="server" AutoPostBack="True" OnCheckedChanged="ckAll_CheckedChanged" Text="All" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="ckitem" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaTKB" HeaderText="Mã TKB" />
                            <asp:BoundField DataField="TenThu" HeaderText="Ngày" />
                            <asp:BoundField DataField="Tiet1" HeaderText="Tiết 1" />
                            <asp:BoundField DataField="Tiet2" HeaderText="Tiết 2" />
                            <asp:BoundField DataField="Tiet3" HeaderText="Tiet3" />
                            <asp:BoundField DataField="Tiet4" HeaderText="Tiết 4" />
                            <asp:BoundField DataField="Tiet5" HeaderText="Tiết 5" />
                            <asp:BoundField DataField="TuNgay" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Từ ngày" />
                            <asp:BoundField DataField="DenNgay" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Đến ngày" />
                            <asp:TemplateField HeaderText="Thao tác">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgSua" runat="server" CssClass="abc" ImageUrl="~/App_Themes/admin/images/edit.png" ToolTip="Sửa" CommandName="update" />
                                    <asp:ImageButton ID="imgDel" runat="server" CommandName="delete" CssClass="abc" ImageUrl="~/App_Themes/admin/images/Delete.png" OnClientClick="javascript: return confirm('Bạn có muốn xóa không?')" ToolTip="Xóa" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
            </asp:Panel>       
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
</div>