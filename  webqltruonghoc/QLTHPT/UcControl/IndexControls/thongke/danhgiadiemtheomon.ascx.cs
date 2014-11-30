using QLTHPT1.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT.UcControl.IndexControls.thongke
{
    public partial class danhgiadiemtheomon : System.Web.UI.UserControl
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
            if (!IsPostBack)
            {
                Panel1.Visible = false;
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

        private void LoadAllHocKy()
        {
            drKyHoc.DataSource = hkBus.GetList();
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
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

        private void LoadKhoiByIdMaNH()
        {
            drKhoi.DataSource = klBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
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

        private void LoadLopByIdMaKhoi()
        {
            drLop.DataSource = dslopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
            drLop.Items.Insert(0, "--Chọn khối--");
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
            drHocSinh.DataSource = plBus.GetByMaLop(int.Parse(drLop.SelectedValue));
            drHocSinh.DataTextField = "TenHocSinh";
            drHocSinh.DataValueField = "MaHocSinh";
            drHocSinh.DataBind();
            drHocSinh.Items.Insert(0, "--Chọn học sinh--");
        }

        protected void btnXemDS_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            lblLop.Text = drLop.SelectedItem.ToString();
            lblMonHoc.Text = drMonHoc.SelectedItem.ToString();
            lblHocKy.Text = drKyHoc.SelectedItem.ToString();
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

        protected void gvDiemByLop_DataBound(object sender, EventArgs e)
        {
            double tong = 0;
            int ss = 0, g = 0, k = 0, tb = 0, y = 0, ke = 0;
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
                float diem = float.Parse(tong.ToString());
                if ((0 <= diem) && (diem < 3.5))
                {
                    ke = ke + 1;
                }
                if ((3.5 <= diem) && (diem < 5))
                {
                    y = y + 1;
                }
                if ((5 <= diem) && (diem < 6.5))
                {
                    tb = tb + 1;
                }
                if ((6.5 <= diem) && (diem < 8))
                {
                    k = k + 1;
                }
                if ((8 <= diem) && (diem < 9))
                {
                    g = g + 1;
                }
                if ((9 <= diem) && (diem <= 10))
                {
                    ss = ss + 1;
                }

                lblSS.Text = ss.ToString();
                lblTB.Text = tb.ToString();
                lblYeu.Text = y.ToString();
                lblGioi.Text = g.ToString();
                lblKem.Text = ke.ToString();
                lblKha.Text = k.ToString();
            }
        }
    }
}