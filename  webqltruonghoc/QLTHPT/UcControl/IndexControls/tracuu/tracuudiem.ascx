<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tracuudiem.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuudiem" %>
<style type="text/css">

    .auto-style1 {
        width: 100%;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style3 {
    }
    .auto-style6 {
    }
    .auto-style7 {
        width: 305px;
        height: 30px;
    }
    .auto-style8 {
        width: 305px;
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

    .auto-style9 {
        width: 381px;
    }
    .auto-style11 {
        width: 87px;
        height: 30px;
    }
    .auto-style12 {
        width: 87px;
    }
    .auto-style13 {
        height: 23px;
    }
    .auto-style14 {
        height: 23px;
        width: 205px;
    }
    .auto-style15 {
        width: 205px;
    }
    .auto-style16 {
        height: 23px;
        width: 141px;
    }
    .auto-style17 {
        width: 141px;
    }
    .auto-style18 {
        height: 23px;
        width: 103px;
    }
    .auto-style19 {
        width: 103px;
    }
    .auto-style29 {
        width: 154px;
    }
    .auto-style30 {
        width: 235px;
    }
    .auto-style31 {
        width: 161px;
    }
    .auto-style32 {
        width: 206px;
    }
    </style>
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<br />
    <br />
    <br />
    <hr />
            <h2>Tra cứu điểm:</h2>

            <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>

    <br />
                 <table class="auto-style1">
                     <tr>
                         <td class="auto-style7" colspan="2">Tra cứu điểm theo lớp:</td>
                         <td class="auto-style5" colspan="2">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style11">Chọn năm:</td>
                         <td class="auto-style7">
                             <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style5">Chọn kỳ:</td>
                         <td class="auto-style5">
                             <asp:DropDownList ID="drKyHoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drKyHoc0_SelectedIndexChanged" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style12">Chọn khối:
                             </td>
                         <td class="auto-style8">
                             <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td>Chọn lớp:</td>
                         <td>
                             <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drLop_SelectedIndexChanged1" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style12">Môn: </td>
                         <td class="auto-style8">
                             <asp:DropDownList ID="drMonHoc" runat="server" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td>Học sinh:
                             </td>
                         <td>
                             <asp:DropDownList ID="drHocSinh" runat="server" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3" colspan="4">
                             &nbsp;</td>
                     </tr>
            </table>
    <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">Tra cứu điểm theo mã học sinh:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">Mã học sinh: </td>
                    <td>
                        <asp:TextBox ID="txtMaHS" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Button ID="btnXemDiemHS" runat="server" Height="32px" OnClick="btnXemDiemHS_Click" Text="Xem điểm theo học sinh" Width="157px" />
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="btnXemtheolop" runat="server" OnClick="btnXemtheolop_Click" Text="Xem điểm theo lớp" ToolTip="Bạn chỉ cần chọn lớp, không cần chọn học sinh cụ thể" Height="29px" />
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Panel2" runat="server" Width="801px">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style29">&nbsp;</td>
                        <td class="auto-style30">
                            &nbsp;</td>
                        <td class="auto-style31" rowspan="2">&nbsp;</td>
                        <td rowspan="2">
                            <asp:Button ID="btnXuat1" runat="server" Height="33px" OnClick="btnXuat1_Click" Text="Xuất danh sách" Width="106px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29">Bảng điểm của: </td>
                        <td class="auto-style30">
                            <asp:Label ID="lblTenHS" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29">Học kỳ:</td>
                        <td class="auto-style30">
                            <asp:Label ID="lblHocKy" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style31">Lớp: </td>
                        <td>
                            <asp:Label ID="lblLopTraCuu" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnDataBound="gvDiem_DataBound" Width="660px">
                    <Columns>
                        <asp:BoundField DataField="TenMonHoc" HeaderText="Tên môn" />
                        <asp:BoundField DataField="HeSo" HeaderText="Hệ số" />
                        <asp:BoundField DataField="DM_1" HeaderText="M1" />
                        <asp:BoundField DataField="DM_2" HeaderText="M2" />
                        <asp:BoundField DataField="D15_1" HeaderText="15P 1" />
                        <asp:BoundField DataField="D15_2" HeaderText="15P 2" />
                        <asp:BoundField DataField="D15_3" HeaderText="15P 3" />
                        <asp:BoundField DataField="D1T_1" HeaderText="1T 1" />
                        <asp:BoundField DataField="D1T_2" HeaderText="1T 2" />
                        <asp:BoundField DataField="DThi" HeaderText="DTHI" />
                        <asp:TemplateField HeaderText="ĐTB">
                            <ItemTemplate>
                                <asp:Label ID="lblDiemTong" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style14">&nbsp;</td>
                        <td class="auto-style16">
                            &nbsp;</td>
                        <td class="auto-style18">Thứ hạng:</td>
                        <td class="auto-style13">
                            <asp:Label ID="lblThuHangKy" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style15">Tổng điểm trung bình: </td>
                        <td class="auto-style17">
                            <asp:Label ID="lblDiemTb" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style19">Học lực:</td>
                        <td>
                            <asp:Label ID="lblHocLucKy" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style15">
                            <asp:Label ID="lblCanam" runat="server" Text="Cả năm:"></asp:Label>
                        </td>
                        <td class="auto-style17">&nbsp;</td>
                        <td class="auto-style19">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style15">
                            <asp:Label ID="lblDTbCaNam" runat="server" Text="Trung bình cả năm:"></asp:Label>
                        </td>
                        <td class="auto-style17">
                            <asp:Label ID="lblDTBNam" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="lblThuHangNam" runat="server" Text="Thứ hạng:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHangNam" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />

            </asp:Panel>
    <br />
            <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style9">Học kỳ:
                            <asp:Label ID="lblHocKy0" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style32">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnXuat2" runat="server" Height="33px" OnClick="btnXuat2_Click" Text="Xuất danh sách" Width="106px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Bảng điểm của:
                            <asp:Label ID="lblLop" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td colspan="2">Môn:
                            <asp:Label ID="lblMon" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvDiemByLop" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="690px" AutoGenerateColumns="False" Height="162px" OnDataBound="gvDiemByLop_DataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaHocSinh" HeaderText="Mã HS" Visible="False" />
                        <asp:BoundField DataField="TenHocSinh" HeaderText="Học sinh" />
                        <asp:BoundField DataField="DM_1" HeaderText="M1" />
                        <asp:BoundField DataField="DM_2" HeaderText="M2" />
                        <asp:BoundField DataField="D15_1" HeaderText="D15P1" />
                        <asp:BoundField DataField="D15_2" HeaderText="D15P2" />
                        <asp:BoundField DataField="D15_3" HeaderText="D15P3" />
                        <asp:BoundField DataField="D1T_1" HeaderText="1T1" />
                        <asp:BoundField DataField="D1T_2" HeaderText="D1T2" />
                        <asp:BoundField DataField="DThi" HeaderText="DThi" />
                        <asp:TemplateField HeaderText="Điểm TB">
                            <ItemTemplate>
                                <asp:Label ID="lblDTB" runat="server" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </asp:Panel>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
           
</div>