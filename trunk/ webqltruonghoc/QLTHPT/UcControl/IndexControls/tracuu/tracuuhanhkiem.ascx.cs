﻿using QLTHPT1.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT.UcControl.IndexControls.tracuu
{
    public partial class tracuuhanhkiem : System.Web.UI.UserControl
    {
        NAMHOCBL nhBus = new NAMHOCBL();
        KHOILOPBL klBus = new KHOILOPBL();
        HOCKYBL hkBus = new HOCKYBL();
        DSLOPBL dslopBus = new DSLOPBL();
        MONHOCBL mhBus = new MONHOCBL();
        HOCSINHBL hsBus = new HOCSINHBL();
        BANGDIEMBL bdBus = new BANGDIEMBL();
        HANHKIEMBL hanhkiemBus = new HANHKIEMBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadNamHoc();
                LoadKyHoc();
            }
        }

        private void LoadKyHoc()
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

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void btnLocDS_Click(object sender, EventArgs e)
        {
            lblLop.Text = drLop.SelectedItem.ToString();
            lblHK.Text = drKyHoc.SelectedItem.ToString();
            gvHanhKiem.DataSource = hanhkiemBus.GetListByMaLopHK(int.Parse(drLop.SelectedValue), int.Parse(drKyHoc.SelectedValue));
            gvHanhKiem.DataBind();

        }
    }
}