using System;
using System.Collections.Generic;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Drawing;
using System.Data.OleDb;
namespace QLTHPT.UcControl.IndexControls
{
    public partial class tracuudiem : System.Web.UI.UserControl
    {
        NAMHOCBL nhBus = new NAMHOCBL();
        KHOILOPBL klBus = new KHOILOPBL();
        HOCKYBL hkBus = new HOCKYBL();
        DSLOPBL dslopBus = new DSLOPBL();
        MONHOCBL mhBus = new MONHOCBL();
        HOCSINHBL hsBus = new HOCSINHBL();
        BANGDIEMBL bdBus = new BANGDIEMBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErr.Text = "";
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                LoadNamHoc();
                LoadAllHocKy();
                LoadAllMon();

            }
        }

        private void LoadAllMon()
        {
            drMonHoc.DataSource = mhBus.GetList();
            drMonHoc.DataTextField = "TenMonHoc";
            drMonHoc.DataValueField = "MaMonHoc";
            drMonHoc.DataBind();
            drMonHoc.Items.Insert(0, "--Chọn môn học--");
        }

        private void LoadNamHoc()
        {
            drNamHoc.DataSource = nhBus.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (drNamHoc.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn cần chọn khối";
            }
            else
            {
                LoadKhoiByIdMaNH();
            }
        }

        private void LoadHocKyByMaNam()
        {
            drKyHoc.DataSource = hkBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        }

        private void LoadAllHocKy()
        {
            drKyHoc.DataSource = hkBus.GetList();
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        }

        private void LoadKhoiByIdMaNH()
        {
            drKhoi.DataSource = klBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
        }

        private void LoadAllKhoi()
        {
            drKhoi.DataSource = klBus.GetList();
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();

        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {

            if (drKhoi.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn cần chọn khối học cụ thể";
            }
            else
            {
                LoadLopByIdMaKhoi();
            }
        }

        //private void LoadAllLop()
        //{
        //    drLop.DataSource = dslopBus.GetList();
        //    drLop.DataTextField = "TenLop";
        //    drLop.DataValueField = "MaLop";
        //    drLop.DataBind();
        //    drLop.Items.Insert(0, "--Chọn khối--");
        //}

        private void LoadLopByIdMaKhoi()
        {
            drLop.DataSource = dslopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
            drLop.Items.Insert(0, "--Chọn khối--");
        }

        protected void drMonHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {

            if (drLop.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn cần chọn lớp cụ thể";
            }
            else
            {
                LoadHSByMaLop();
            }
        }
        PHANLOPBL plBus = new PHANLOPBL();
        private void LoadHSByMaLop()
        {
            drHocSinh.DataSource = plBus.GetTTByMaLop(int.Parse(drLop.SelectedValue));
            drHocSinh.DataTextField = "TenHocSinh";
            drHocSinh.DataValueField = "MaHocSinh";
            drHocSinh.DataBind();
            drHocSinh.Items.Insert(0, "--Chọn học sinh--");
        }

        private void LoadAllHS()
        {
            drHocSinh.DataSource = hsBus.GetList();
            drHocSinh.DataTextField = "TenHocSinh";
            drHocSinh.DataValueField = "MaHocSinh";
            drHocSinh.DataBind();
            drHocSinh.Items.Insert(0, "--Chọn học sinh--");
        }

        protected void btnXemDiemHS_Click(object sender, EventArgs e)
        {
            try
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                Session["tenhs"] = drHocSinh.SelectedValue;
                lblTenHS.Text = Session["tenhs"].ToString();
                if (drHocSinh.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn học sinh cụ thể";
                }
                else
                {
                    DataTable dt = bdBus.GetByMaHocSinhTraCuu_(drHocSinh.SelectedValue, int.Parse(drKyHoc.SelectedValue), int.Parse(drLop.SelectedValue));
                    gvDiem.DataSource = dt;
                    gvDiem.DataBind();
                }

                if (txtMaHS.Text == "")
                {
                    if (drKyHoc.SelectedIndex == 1)
                    {
                        lblCanam.Visible = false;
                        lblDTbCaNam.Visible = false;
                        lblDTBNam.Visible = false;
                        lblHangNam.Visible = false;
                        lblDiemTb.Visible = true;
                        lblThuHangNam.Visible = false;
                        lblHocKy.Text = drKyHoc.SelectedValue;
                        lblLopTraCuu.Text = drLop.SelectedItem.ToString();
                        double diem = double.Parse(lblDiemTb.Text);
                        if ((diem > 0) && (diem < 3))
                        {
                            lblHocLucKy.Text = "Học lại";
                        }
                        if ((diem > 3) && (diem < 5))
                        {
                            lblHocLucKy.Text = "Yếu";
                        }
                        if ((diem > 5) && (diem < 6.5))
                        {
                            lblHocLucKy.Text = "Trung bình";
                        }
                        if ((diem > 6.5) && (diem < 8))
                        {
                            lblHocLucKy.Text = "Khá";
                        }
                        if ((diem > 8) && (diem < 10))
                        {
                            lblHocLucKy.Text = "Giỏi";
                        }

                    }
                }
                else
                {

                    //lblTenHS.Text = txtMaHS.Text;
                    gvDiem.DataSource = bdBus.GetByMaHocSinhTraCuu_(lblTenHS.Text, int.Parse(drKyHoc.SelectedValue), int.Parse(drLop.SelectedValue));
                    gvDiem.DataBind();
                }
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }


        }
        protected void gvDiem_DataBound(object sender, EventArgs e)
        {
            double tong = 0;
            double diemtb = 0;
            int dem = 0;
            foreach (GridViewRow row in gvDiem.Rows)
            {
                double m1 = Double.Parse(row.Cells[2].Text);
                double m2 = Double.Parse(row.Cells[3].Text);
                double d15p1 = Double.Parse(row.Cells[4].Text);
                double d15p2 = Double.Parse(row.Cells[5].Text);
                double d15p3 = Double.Parse(row.Cells[6].Text);
                double d1t1 = Double.Parse(row.Cells[7].Text);
                double d1t2 = Double.Parse(row.Cells[8].Text);
                double dt = Double.Parse(row.Cells[9].Text);
                double hs = Double.Parse(row.Cells[1].Text);
                //cho thêm thằng hệ số vào đi
                if (hs > 1)
                {
                    dem += 1;
                    tong = Math.Round((((m1 + m2 + d15p1 + d15p2 + d15p3 + d1t1 * 2 + d1t2 * 2 + dt * 3) / 12)), 2);
                    ((Label)row.Cells[9].FindControl("lblDiemTong")).Text = tong.ToString();
                    diemtb += (tong*hs);
                }
                else
                {
                    dem += 0;
                    tong = Math.Round((((m1 + m2 + d15p1 + d15p2 + d15p3 + d1t1 * 2 + d1t2 * 2 + dt * 3) / 12)), 2);
                    ((Label)row.Cells[9].FindControl("lblDiemTong")).Text = tong.ToString();
                    diemtb += tong;
                }
            }
            double diem = (Math.Round((diemtb / (gvDiem.Rows.Count + dem)), 2));
            lblDiemTb.Text = diem.ToString();

        }

        protected void drKyHoc0_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["hk"] = drKyHoc.SelectedValue;
        }

        protected void btnXemtheolop_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            lblHocKy0.Visible = true;
            lblHocKy0.Text = drKyHoc.SelectedItem.ToString();
            lblMon.Text = drMonHoc.SelectedItem.ToString();
            lblLop.Text = drLop.SelectedItem.ToString();
            if (drLop.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn cần chọn lớp cụ thể";
            }
            else
            {
                if (drKyHoc.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn phải chọn kỳ học";
                }
                else
                {
                    if (drMonHoc.SelectedIndex == 0)
                    {
                        lblErr.Text = "Bạn cần chọn môn học";
                    }
                    else
                    {
                        gvDiemByLop.DataSource = bdBus.GetByMaMonVaLopVaHK(int.Parse(drMonHoc.SelectedValue), int.Parse(drLop.SelectedValue), int.Parse(drKyHoc.SelectedValue));
                        gvDiemByLop.DataBind();

                    }

                }
            }

        }
        protected void btnXuatDSTheoHS_Click(object sender, EventArgs e)
        {

        }

        protected void gvDiemByLop_DataBound(object sender, EventArgs e)
        {

            double tong = 0;

            foreach (GridViewRow row in gvDiemByLop.Rows)
            {
                double m1 = Double.Parse(row.Cells[2].Text);
                double m2 = Double.Parse(row.Cells[3].Text);
                double d15p1 = Double.Parse(row.Cells[4].Text);
                double d15p2 = Double.Parse(row.Cells[5].Text);
                double d15p3 = Double.Parse(row.Cells[6].Text);
                double d1t1 = Double.Parse(row.Cells[7].Text);
                double d1t2 = Double.Parse(row.Cells[8].Text);
                double dt = Double.Parse(row.Cells[9].Text);
                tong = Math.Round(((m1 + m2 + d15p1 + d15p2 + d15p3 + d1t1 * 2 + d1t2 * 2 + dt * 3) / 12), 2);
                ((Label)row.Cells[10].FindControl("lblDTB")).Text = tong.ToString();

            }

            //List<BANGDIEM> list = new List<BANGDIEM>();
            //list = bdBus.GetByMaMonVaLopVaHK(drMonHoc.SelectedValue, int.Parse(drLop.SelectedValue), int.Parse(drKyHoc.SelectedValue));


            //foreach (BANGDIEM item in list)
            //{
            //    double tongtb = 0;
            //    float dm1 = 0, dm2 = 0, d1t1 = 0, d1t2 = 0, d151 = 0, d152 = 0, d153 = 0, dthi = 0;
            //    dm1 = item.DM_1;
            //    dm2 = item.DM_2;
            //    d151 = item.D15_1;
            //    d152 = item.D15_2;
            //    d153 = item.D15_3;
            //    d1t1 = item.D1T_1;
            //    d1t2 = item.D1T_2;
            //    dthi = item.DThi;
            //    foreach (GridViewRow row in gvDiemByLop.Rows)
            //    {
            //        for (int i = 0; i < gvDiem.Rows.Count; )
            //        {
            //            tongtb = Math.Round(((dm1 + dm2 + d1t2 * 2 + d1t2 * 2 + d153 + d152 + d151 + dthi * 3) / 12), 2);
            //            ((Label)gvDiemByLop.Rows[i].Cells[4].FindControl("lblDTB")).Text = tongtb.ToString();
            //            i++;
            //            break;
            //        }

            //    }
            //}
        }

        protected void btnXuat1_Click(object sender, EventArgs e)
        {
            //List<BANGDIEM> emList = bdBus.GetByMaHocSinh3(txtMaHS.Text, int.Parse(drKyHoc.SelectedValue));
            //StringBuilder sb = new StringBuilder();

            //if (emList.Count > 0)
            //{
            //    string fileName = Path.Combine(Server.MapPath("~/"), "Danh sách điểm học sinh " + drLop.SelectedItem + " môn " + drMonHoc.SelectedItem + ".xlsx");
            //    string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
            //    using (OleDbConnection con = new OleDbConnection(conString))
            //    {
            //        string strCreateTab = "Create table DiemHS (" +
            //            " [MaHocSinh] nvarchar(10), " +
            //            " [DM_1] nvarchar(2), " +
            //            " [DM_2] nvarchar(2), " +
            //            " [D15_1] nvarchar(2), " +
            //            " [D15_2] nvarchar(2) ," +
            //            " [D15_3] nvarchar(2), " +
            //            " [D1T_1] nvarchar(2), " +
            //            " [D1T_2] nvarchar(2) ," +
            //            " [DThi] nvarchar(2), " +
            //            " [MaHK] nvarchar(2))";

            //        if (con.State == ConnectionState.Closed)
            //        {
            //            con.Open();
            //        }

            //        OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
            //        cmd.ExecuteNonQuery();

            //        string strInsert = "Insert into DiemHS([MaHocSinh],[DM_1]," +
            //            " [DM_2],[D15_1],[D15_2],[D15_3],[D1T_1],[D1T_2],[DThi],[MaHK]) values(?,?,?,?,?,?,?,?,?,?)";
            //        OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);

            //        foreach (var i in emList)
            //        {
            //            cmdIns.Parameters[0].Value = i.MaHocSinh;
            //            cmdIns.Parameters[1].Value = i.D15_1.ToString();
            //            cmdIns.Parameters[2].Value = i.D15_2.ToString();
            //            cmdIns.Parameters[3].Value = i.D15_3.ToString();
            //            cmdIns.Parameters[4].Value = i.D1T_1.ToString();
            //            cmdIns.Parameters[5].Value = i.D1T_2.ToString();
            //            cmdIns.Parameters[6].Value = i.DM_1.ToString();
            //            cmdIns.Parameters[7].Value = i.DM_2.ToString();
            //            cmdIns.Parameters[8].Value = i.DThi.ToString();
            //            cmdIns.Parameters[9].Value = i.MaHK.ToString();
            //            cmdIns.ExecuteNonQuery();
            //        }
            //    }

            //    // Create Downloadable file
            //    byte[] content = File.ReadAllBytes(fileName);
            //    HttpContext context = HttpContext.Current;

            //    context.Response.BinaryWrite(content);
            //    context.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            //    context.Response.AppendHeader("Content-Disposition", "attachment; filename=Parameter.xlsx");
            //    Context.Response.End();
            //}
        }

        protected void btnXuat2_Click(object sender, EventArgs e)
        {
            //List<BANGDIEM> emList = bdBus.GetByMaMonVaLopVaHK(int.Parse(drMon.SelectedValue), int.Parse(drLopLoad1.SelectedValue), int.Parse(drKyHoc.SelectedValue));
            //StringBuilder sb = new StringBuilder();

            //if (emList.Count > 0)
            //{
            //    string fileName = Path.Combine(Server.MapPath("~/"), "Danh sách điểm học sinh " + drLopLoad1.SelectedItem + " môn " + drMon.SelectedItem + ".xlsx");
            //    string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
            //    using (OleDbConnection con = new OleDbConnection(conString))
            //    {
            //        string strCreateTab = "Create table DiemHS (" +
            //            " [MaHocSinh] nvarchar(10), " +
            //            " [DM_1] nvarchar(2), " +
            //            " [DM_2] nvarchar(2), " +
            //            " [D15_1] nvarchar(2), " +
            //            " [D15_2] nvarchar(2) ," +
            //            " [D15_3] nvarchar(2), " +
            //            " [D1T_1] nvarchar(2), " +
            //            " [D1T_2] nvarchar(2) ," +
            //            " [DThi] nvarchar(2), " +
            //            " [MaHK] nvarchar(2))";

            //        if (con.State == ConnectionState.Closed)
            //        {
            //            con.Open();
            //        }

            //        OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
            //        cmd.ExecuteNonQuery();

            //        string strInsert = "Insert into DiemHS([MaHocSinh],[DM_1]," +
            //            " [DM_2],[D15_1],[D15_2],[D15_3],[D1T_1],[D1T_2],[DThi],[MaHK]) values(?,?,?,?,?,?,?,?,?,?)";
            //        OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
            //        cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);

            //        foreach (var i in emList)
            //        {
            //            cmdIns.Parameters[0].Value = i.MaHocSinh;
            //            cmdIns.Parameters[1].Value = i.D15_1.ToString();
            //            cmdIns.Parameters[2].Value = i.D15_2.ToString();
            //            cmdIns.Parameters[3].Value = i.D15_3.ToString();
            //            cmdIns.Parameters[4].Value = i.D1T_1.ToString();
            //            cmdIns.Parameters[5].Value = i.D1T_2.ToString();
            //            cmdIns.Parameters[6].Value = i.DM_1.ToString();
            //            cmdIns.Parameters[7].Value = i.DM_2.ToString();
            //            cmdIns.Parameters[8].Value = i.DThi.ToString();
            //            cmdIns.Parameters[9].Value = i.MaHK.ToString();
            //            cmdIns.ExecuteNonQuery();
            //        }
            //    }

            //    // Create Downloadable file
            //    byte[] content = File.ReadAllBytes(fileName);
            //    HttpContext context = HttpContext.Current;

            //    context.Response.BinaryWrite(content);
            //    context.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            //    context.Response.AppendHeader("Content-Disposition", "attachment; filename=Parameter.xlsx");
            //    Context.Response.End();
            //}
        }
    }
}