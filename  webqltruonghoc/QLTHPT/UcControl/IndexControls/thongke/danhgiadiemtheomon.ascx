<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="danhgiadiemtheomon.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.thongke.danhgiadiemtheomon" %>
<%@ Register assembly="DevExpress.Dashboard.v13.2.Web, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v13.2.Web, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<style type="text/css">


    .auto-style1 {
        width: 100%;
    }
    .auto-style7 {
        height: 30px;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style11 {
        width: 87px;
        height: 30px;
    }
    .drop
     {
         width:200px;
         }
     .auto-style12 {
        width: 87px;
    }
    .auto-style8 {
        width: 305px;
    }
    .auto-style13 {
        height: 53px;
    }
    
    .auto-style14 {
        height: 30px;
        width: 212px;
    }
    .auto-style15 {
    }
    .auto-style17 {
        width: 326px;
        height: 23px;
    }
    .auto-style18 {
        width: 208px;
        height: 23px;
        font-weight: bold;
    }
    .auto-style19 {
        height: 23px;
    }
    .auto-style20 {
        width: 208px;
        font-weight: bold;
    }
    .auto-style21 {
        width: 326px;
        font-weight: 700;
    }
    .auto-style22 {
        width: 165px;
        font-weight: 700;
        height: 56px;
    }
    .auto-style23 {
        width: 208px;
        height: 56px;
        font-weight: bold;
    }
    .auto-style24 {
        height: 56px;
    }
    .auto-style26 {
        width: 107px;
        font-weight: 700;
        height: 56px;
    }
    .auto-style28 {
        width: 107px;
        font-weight: 700;
    }
    .auto-style30 {
        width: 165px;
        font-weight: 700;
    }
    .auto-style31 {
        width: 87px;
        height: 26px;
    }
    .auto-style32 {
        width: 305px;
        height: 26px;
    }
    .auto-style33 {
        height: 26px;
    }
    </style>
<div>
    <h2>Tra cứu điểm theo lớp:</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <table class="auto-style1">
                     <tr>
                         <td class="auto-style7" colspan="4">
                             <asp:Label ID="lblErr" runat="server" ForeColor="#CC0000"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style11">Chọn năm:</td>
                         <td class="auto-style7">
                             <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style14">Chọn kỳ:</td>
                         <td class="auto-style5">
                             <asp:DropDownList ID="drKyHoc" runat="server" AutoPostBack="True" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style31">Chọn khối:
                             </td>
                         <td class="auto-style32">
                             <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style33">Chọn lớp:</td>
                         <td class="auto-style33">
                             <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drLop_SelectedIndexChanged1" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style12">Môn: </td>
                         <td class="auto-style8">
                             <asp:DropDownList ID="drMonHoc" runat="server" CssClass="drop" AutoPostBack="True">
                             </asp:DropDownList>
                         </td>
                         <td class="auto-style15">Học sinh:
                             </td>
                         <td>
                             <asp:DropDownList ID="drHocSinh" runat="server" CssClass="drop">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style13" colspan="2">
                             </td>
                         <td class="auto-style13" colspan="2">
                             <asp:Button ID="btnXemDS" runat="server" Text="Thống kê điểm theo lớp" Height="46px" Width="156px" OnClick="btnXemDS_Click" />
                         </td>
                     </tr>
                     </table>
            <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style28">Bảng điểm của:
                            </td>
                        <td class="auto-style30">
                            <asp:Label ID="lblLop" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            Số học sinh có điểm suất sắc:</td>
                        <td>
                            <asp:Label ID="lblSS" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style26">Học kỳ:</td>
                        <td class="auto-style22">
                            <asp:Label ID="lblHocKy" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style23">Số học sinh có điểm giỏi:</td>
                        <td class="auto-style24">
                            <asp:Label ID="lblGioi" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Môn học: </td>
                        <td class="auto-style30">
                            <asp:Label ID="lblMonHoc" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style20">Số học sinh có điểm khá:</td>
                        <td>
                            <asp:Label ID="lblKha" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17" colspan="2"></td>
                        <td class="auto-style18">Số học sinh có điểm trung bình:</td>
                        <td class="auto-style19">
                            <asp:Label ID="lblTB" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style21" colspan="2">&nbsp;</td>
                        <td class="auto-style20">Số học sinh có điểm yếu:</td>
                        <td>
                            <asp:Label ID="lblYeu" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style21" colspan="2">&nbsp;</td>
                        <td class="auto-style20">Số học sinh có điểm kém:</td>
                        <td>
                            <asp:Label ID="lblKem" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvDiemByLop" runat="server" CellPadding="2" ForeColor="Black" GridLines="None" Width="700px" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" Height="162px" OnDataBound="gvDiemByLop_DataBound">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="MaHocSinh" HeaderText="Mã HS" />
                        <asp:BoundField DataField="TenHocSinh" HeaderText="Tên" />
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
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <br />
            </asp:Panel>
    <br />

        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
               

</div>