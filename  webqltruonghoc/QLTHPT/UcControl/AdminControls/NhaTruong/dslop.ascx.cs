using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class dslop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            if (!IsPostBack)
            {
                LoadNamHoc();
            }
        }

        private void LoadNamHoc()
        {
            NAMHOCBL nhBus = new NAMHOCBL();
            drNamHoc.DataSource = nhBus.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvLop.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvLop.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("ckitem");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadDSLop();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            DSLOP obj = new DSLOP();
            DSLOPBL dsBus = new DSLOPBL();          
            obj.MaKhoi = int.Parse(drKhoiLop.SelectedValue);
            obj.MaGiaoVien = drChuNhiem.SelectedValue;
            obj.MoTaKhac = txtMoTa.Text;
            obj.SiSo = int.Parse(txtSiso.Text);
            obj.TenLop = txtTenLop.Text;
            dsBus.Add(obj);
            LoadDSLop();
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadDSLop();
        }

        private void LoadDSLop()
        {
            if (drKhoi.SelectedIndex == 0)
            {
            DSLOPBL lopBus = new DSLOPBL();
            gvLop.DataSource = lopBus.GetList();
            gvLop.DataBind();
            }
            else
            {
            DSLOPBL lopBus = new DSLOPBL();
            gvLop.DataSource = lopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            gvLop.DataBind();
            }
          
        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            LoadKhoiLop();
            LoadChuNhiem();
        }

        private void LoadChuNhiem()
        {
            GIAOVIENBL gvbus = new GIAOVIENBL();
            drChuNhiem.DataSource = gvbus.GetList();
            drChuNhiem.DataTextField = "MaGiaoVien";
            drChuNhiem.DataValueField = "TenGiaoVien";
            drChuNhiem.DataBind();
            drChuNhiem.Items.Insert(0, "--Chọn giáo viên--");
        }

        private void LoadKhoiLop()
        {
            KHOILOPBL khoiBus = new KHOILOPBL();
            drKhoiLop.DataSource = khoiBus.GetList();
            drKhoiLop.DataTextField = "MaKhoi";
            drKhoiLop.DataValueField = "TenKhoi";
            drKhoiLop.DataBind();
            drKhoiLop.Items.Insert(0, "--Chọn khối--");
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadHocKy();
        }

        private void LoadHocKy()
        {
            if(drNamHoc.SelectedIndex == 0)
            {
                
                HOCKYBL hkBus = new HOCKYBL();
                drHocKy.DataSource = hkBus.GetList();
                drHocKy.DataTextField = "TenHK";
                drHocKy.DataValueField = "MaHK";
                drHocKy.DataBind();
                drHocKy.Items.Insert(0, "--Chọn học kỳ--");
                drHocKy.SelectedIndex = 0;
            }
            else
            {
                HOCKYBL hkBus = new HOCKYBL();
                drHocKy.DataSource = hkBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
                drHocKy.DataTextField = "TenHK";
                drHocKy.DataValueField = "MaHK";
                drHocKy.DataBind();
                drHocKy.Items.Insert(0, "--Chọn học kỳ--");
            }
           
        }

        protected void drHocKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        private void LoadKhoi()
        {
            if (drHocKy.SelectedIndex == 0)
            {
                drHocKy.SelectedIndex = 0;
                
            }
            else
            {
                KHOILOPBL kBus = new KHOILOPBL();
                drKhoi.DataSource = kBus.GetByMaHocKy(int.Parse(drHocKy.SelectedValue));
                drKhoi.DataTextField = "TenKhoi";
                drKhoi.DataValueField = "MaKhoi";
                drKhoi.DataBind();
                drKhoi.Items.Insert(0, "--Chọn khối--");
            }
            

        }

        protected void drKhoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDSLop();
        }

        protected void gvLop_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvLop_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DSLOPBL lopBus = new DSLOPBL();
            int malop = int.Parse(gvLop.DataKeys[e.RowIndex].Value.ToString());
            lopBus.Delete(malop);
            LoadDSLop();
        }

        protected void gvLop_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLop.EditIndex = -1;
            LoadDSLop();
        }

        protected void gvLop_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLop.EditIndex = e.NewEditIndex;
            LoadDSLop();
        }

        protected void drKhoiLop_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void drChuNhiem_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}