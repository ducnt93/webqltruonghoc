<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tracuudanhsahhocsinh.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.tracuu.tracuudanhsahhocsinh" %>
<style type="text/css">
    .table {
        width: 721px;
    }
        .drop
     {
         width:200px;
         height:32px;
     }
     .auto-style1 {
        width: 233px;
    }
    .auto-style2 {
        height: 36px;
    }
</style>
<div>
    <h2>Tra cứu danh sách học sinh</h2>

             <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>

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
                    <td>
                        Chọn lớp:</td>
                    <td class="auto-style1"><asp:DropDownList ID="drLop" runat="server" AutoPostBack="True" CssClass="drop">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Chọn khối: </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="drKhoi" runat="server" AutoPostBack="True" CssClass="drop" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2"></td>
                    <td colspan="2" class="auto-style2">
                        <asp:Button ID="btnLocDS" runat="server" CssClass="buttom" Height="32px" Text="Lọc danh sách" Width="130px" OnClick="btnLocDS_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style15">&nbsp;</td>
                </tr>
            </table>


</div>