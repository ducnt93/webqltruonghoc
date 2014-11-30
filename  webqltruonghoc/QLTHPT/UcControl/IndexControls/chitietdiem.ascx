<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chitietdiem.ascx.cs" Inherits="QLTHPT.UcControl.IndexControls.chitietdiem" %>
<div>
    <h2>Điểm chi tiết của học sinh</h2>
    <br />
    Tên học sinh: <asp:Label ID="lblTenHS" runat="server" Text="Label"></asp:Label>
    <br />
    Học kỳ:
    <asp:Label ID="lblHk" runat="server"></asp:Label>
    <br />
    Bảng điểm:
    <br />
    <asp:GridView ID="gvBangDiem" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MaMonHoc" HeaderText="Môn" />
            <asp:BoundField DataField="DM_1" HeaderText="Điểm miệng 1" />
            <asp:BoundField DataField="DM_2" HeaderText="Điểm miệng 2" />
            <asp:BoundField DataField="D15_1" HeaderText="Điểm 15p 1" />
            <asp:BoundField DataField="D15_2" HeaderText="Điểm 15p 2" />
            <asp:BoundField DataField="D15_3" HeaderText="Điểm 15p 3" />
            <asp:BoundField DataField="D1T_1" HeaderText="Điển 1T 1" />
            <asp:BoundField DataField="D1T_2" HeaderText="Điểm 1T 2" />
            <asp:BoundField DataField="DThi" HeaderText="Điển thi" />
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
</div>