<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tracuu.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuu" %>
<style type="text/css">

    .auto-style1 {
        width: 100%;
    }
    .auto-style4 {
        width: 405px;
        height: 30px;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style3 {
    }
    .auto-style6 {
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

    <br />
                 <table class="auto-style1">
                     <tr>
                         <td class="auto-style4">Tra cứu điểm theo lớp:</td>
                         <td class="auto-style5">&nbsp;</td>
                     </tr>
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
                             <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" Height="41px" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1" Width="194px">
                             </asp:DropDownList>
                         </td>
                         <td>Chọn lớp:<asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" Height="36px" OnSelectedIndexChanged="drLop_SelectedIndexChanged1" Width="203px">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">&nbsp;</td>
                         <td>Học sinh:
                             <asp:DropDownList ID="drHocSinh" runat="server" Height="16px" Width="200px">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3" colspan="2">
                             <asp:Button ID="btnXemDiem" runat="server" Height="23px" OnClick="btnXemDiem_Click" Text="Xem điểm" Width="144px" />
                         </td>
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
                        <asp:TextBox ID="txtMaHS" runat="server" Height="25px" Width="218px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <asp:Button ID="btnXemDiemHS" runat="server" Height="28px" OnClick="btnXemDiemHS_Click" Text="Xem điểm" Width="153px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
    <br />
            Bảng điểm của:
            <asp:Label ID="lblTenHS" runat="server"></asp:Label>
    <br />
            <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="753px">
                <Columns>
                    <asp:BoundField DataField="TenMon" HeaderText="Tên môn" />
                    <asp:TemplateField HeaderText="Điểm trung bình"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Chi tiết"></asp:TemplateField>
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
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
           
</div>