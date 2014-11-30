<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="Thong_ke.aspx.cs" Inherits="QLTHPT.UcControl.IndexControls.thongke.Thong_ke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <table style="width: 100%;">
                <tr>
                    <td>Chọn năm:</td>
                    <td>Học kỳ:</td>
                    <td>Chọn khối:</td>
                    <td>Chọn lớp:</td>
                </tr>
                <tr>
                    <td> <asp:DropDownList ID="drNamHoc" runat="server" CssClass="drop_theme" AutoPostBack="True" OnSelectedIndexChanged="drNamHoc_SelectedIndexChanged"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="drKyHoc" runat="server" CssClass="drop_theme"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="drKhoi" runat="server" CssClass="drop_theme" AutoPostBack="True" OnSelectedIndexChanged="drKhoi_SelectedIndexChanged"></asp:DropDownList></td>
                    <td> <asp:DropDownList ID="drLopLoad1" runat="server" CssClass="drop_theme"></asp:DropDownList></td>
                </tr>
            </table>
    <asp:Button ID="btn_Thong_ke" runat="server" Text="Thống kê" OnClick="btn_Thong_ke_Click" CssClass="button_theme" />

    <div id="trungpq" runat="server">
        
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>
