<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tracuuhanhkiem.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuu.tracuuhanhkiem" %>
<style type="text/css">


    .table {
        width: 100%;
        padding: 10px 10px 10px 10px;
    }
    .auto-style7 {
        width: 305px;
        height: 30px;
    }
    .auto-style5 {
        height: 30px;
    }
    .auto-style8 {
        width: 305px;
        height: 87px;
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
        width: 239px;
        height: 30px;
    }
    .auto-style10 {
        width: 239px;
    }
    .auto-style11 {
        width: 121px;
        height: 30px;
    }
    .auto-style12 {
        width: 121px;
    }
    .auto-style13 {
        width: 305px;
        height: 75px;
    }
    .auto-style14 {
        height: 75px;
    }
    .auto-style15 {
        height: 87px;
    }
</style>
<div>
    <h3>Xem hạnh kiểm:</h3>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblErr" runat="server" Text=""></asp:Label>
            <br />
            <table class="table">
                <tr>
                    <td class="auto-style7" colspan="2">Hạnh kiểm theo lớp:</td>
                    <td class="auto-style5" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">Chọn năm:</td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="drNamHoc" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">Chọn kỳ:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="drKyHoc" runat="server" AutoPostBack="True" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Chọn khối: </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                    <td>Chọn lớp:</td>
                    <td>
                        <asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drLop_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13" colspan="2"></td>
                    <td colspan="2" class="auto-style14">
                        <asp:Button ID="btnLocDS" runat="server" CssClass="buttom" Height="32px" Text="Lọc danh sách" Width="130px" OnClick="btnLocDS_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2">Danh sách hạnh kiểm :
                        <asp:Label ID="lblLop" runat="server"></asp:Label>
                    </td>
                    <td colspan="2" class="auto-style15">Học kỳ:
                        <asp:Label ID="lblHK" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvHanhKiem" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Width="680px">
                <Columns>
                    <asp:BoundField DataField="MaHS" HeaderText="Mã học sinh" />
                    <asp:BoundField DataField="TenHocSinh" HeaderText="Tên học sinh" />
                    <asp:BoundField DataField="NgayNghiCoPhep" HeaderText="Nghỉ có phép" />
                    <asp:BoundField DataField="NgayNghiKoPhep" HeaderText="Nghỉ không phép" />
                    <asp:BoundField DataField="SoLanKyLuat" HeaderText="Lần kỷ luật" />
                    <asp:BoundField DataField="HanhKiem" HeaderText="Hạnh kiểm" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <br />

        </ContentTemplate>
    </asp:UpdatePanel>
</div>