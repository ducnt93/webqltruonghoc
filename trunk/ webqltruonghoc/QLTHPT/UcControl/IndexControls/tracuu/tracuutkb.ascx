<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tracuutkb.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuu.tracuutkb" %>
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

    .auto-style11 {
        width: 121px;
        height: 30px;
    }

    .auto-style9 {
        width: 239px;
        height: 30px;
    }

    .auto-style12 {
        width: 121px;
    }

    .auto-style10 {
        width: 239px;
    }

    .auto-style13 {
        width: 305px;
        height: 75px;
    }

    .auto-style14 {
        height: 75px;
    }

    .auto-style8 {
        width: 305px;
        height: 87px;
    }

    .auto-style15 {
        height: 87px;
    }
</style>
<div>
    <h3>Xem thời khóa biểu: </h3>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <table class="table">
                <tr>
                    <td class="auto-style7" colspan="2">Thời khóa biểu theo lớp:</td>
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
                    <td class="auto-style14" colspan="2">
                        <asp:Button ID="btnLocDS" runat="server" CssClass="buttom" Height="32px" OnClick="btnLocDS_Click" Text="Lọc danh sách" Width="130px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2">Thời khóa biểu :
                        <asp:Label ID="lblLop" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style15" colspan="2">&nbsp;<asp:Label ID="lblHK" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblErr" runat="server"></asp:Label>
            <br />
            <asp:GridView ID="gvTKB" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="650px">
                <Columns>
                    <asp:BoundField DataField="TenThu" HeaderText="Ngày " />
                    <asp:BoundField DataField="Tiet1" HeaderText="Tiết 1" />
                    <asp:BoundField DataField="Tiet2" HeaderText="Tiết 2" />
                    <asp:BoundField DataField="Tiet3" HeaderText="Tiết 3" />
                    <asp:BoundField DataField="Tiet4" HeaderText="Tiết 4" />
                    <asp:BoundField DataField="Tiet5" HeaderText="Tiết 5" />
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
        </ContentTemplate>
    </asp:UpdatePanel>


</div>
