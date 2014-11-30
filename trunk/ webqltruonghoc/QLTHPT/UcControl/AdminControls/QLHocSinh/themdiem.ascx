<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="themdiem.ascx.cs" Inherits="QLTHPT.UcControl.AdminControls.QLHocSinh.themdiem" %>
<style type="text/css">
      .tdTieuDe
    {
        font-size:22px;
        font-style:italic oblique;
        font-stretch:ultra-condensed;
        background-color:azure;

    }
    .auto-style1 {
        width: 99%;
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

    .drop
    {
        width:200px;
        height:33px;
    }
    .auto-style26 {
        width: 80px;
    }
    .auto-style12 {
        width: 206px;
    }
    .auto-style33 {
        width: 168px;
    }
    .auto-style32 {
        width: 304px;
    }
    .auto-style5 {
        width: 85px;
    }
     .auto-style13 {
        width: 234px;
    }
    .t 
    {
        width:200px;
        height:33px;
    }
     .img {
        width: 32px;
        height:32px;
        display:inline-block;
        padding:5px 40px 5px 40px;
    
    }
    .auto-style34 {
        width: 407px;
    }
    .auto-style36 {
    }
    </style>
<div>
    <h2>Thêm điểm cho học sinh:</h2>
    <p>
        <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
    </p>
            <asp:Panel ID="Panel1" runat="server" Width="992px">
                Thêm điểm cho học sinh:<br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style26">Học sinh:</td>
                        <td class="auto-style34">
                            <asp:DropDownList ID="drHocSinh" runat="server" CssClass="drop">
                            </asp:DropDownList>
                            <asp:Label ID="lblHS" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style36">&nbsp;</td>
                    </tr>
                </table>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style33">Học kỳ: </td>
                        <td class="auto-style32">
                            <asp:DropDownList ID="drHK" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style13">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style33">Thuộc lớp:</td>
                        <td class="auto-style32">
                            <asp:DropDownList ID="drLop" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style5">Môn:</td>
                        <td class="auto-style13">
                            <asp:DropDownList ID="drMaMon" runat="server" CssClass="drop">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">Điểm miệng 1:</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtDiem1" runat="server" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldDM1" runat="server" ControlToValidate="txtDiem1" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style5">Điểm 15p 1:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="txt151" runat="server" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldD15" runat="server" ControlToValidate="txt151" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">Điểm miệng 2: </td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txtMieng2" runat="server" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Điểm 15p 2:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="txt15p2" runat="server" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">Điểm 1 tiết 1:</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txt1t1" runat="server" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldD1T" runat="server" ControlToValidate="txt1t1" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style5">Điểm 15p 3:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="txt15p3" runat="server" Width="201px" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">Điểm 1 tiết 2:</td>
                        <td class="auto-style32">
                            <asp:TextBox ID="txt1t2" runat="server" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                        </td>
                        <td class="auto-style5">Điểm học kỳ:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="txtHocKy" runat="server" Width="201px" CssClass="textbox" TextMode="Number" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldDhk" runat="server" ControlToValidate="txtHocKy" Display="Dynamic" ErrorMessage="Bạn cần phải nhập " ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="4">
                            <asp:ImageButton ID="imgLuu" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuu_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgLuuSua" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/save_32x32.png" OnClick="imgLuuSua_Click" ToolTip="Lưu lại" />
                            <asp:ImageButton ID="imgCancel0" runat="server" CssClass="img" ImageUrl="~/App_Themes/admin/images/Delete_32x32.png" OnClick="imgCancel_Click" ToolTip="Hủy" />
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>

</div>