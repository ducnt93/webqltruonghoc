using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT.UcControl.IndexControls.tracuu
{
    public partial class tracuutths : System.Web.UI.UserControl
    {
        NAMHOCBL nhBus = new NAMHOCBL();
        KHOILOPBL klBus = new KHOILOPBL();
        HOCKYBL hkBus = new HOCKYBL();
        DSLOPBL dslopBus = new DSLOPBL();
        HOCSINHBL hsBus = new HOCSINHBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadNamHoc();
            }
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
            drKhoi.Items.Insert(0, "--Chọn học kỳ--");
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

        protected void btnLocDS_Click(object sender, EventArgs e)
        {
            fvChitietHS.DataSource = hsBus.GetByMaHocSinh(drHocSinh.SelectedValue);
            fvChitietHS.DataBind();
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

        protected void fvChitietHS_DataBound(object sender, EventArgs e)
        {
            Label lblLop = ((Label)fvChitietHS.FindControl("lblLop"));
            List<DSLOP> list = new List<DSLOP>();
            list = dslopBus.GetByMaLop1(Convert.ToInt32(lblLop.Text));
            foreach (var item in list)
            {
                lblLop.Text = item.TenLop;
            }
        }

     
    }
}