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
    public partial class chuyenlop : System.Web.UI.UserControl
    {
        CHUYENLOP cl = new CHUYENLOP();
        CHUYENLOPBL clBus = new CHUYENLOPBL();
        KHOILOPBL kBus = new KHOILOPBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            CheckBox ChkBoxHeader = (CheckBox)gvChuyenlop.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvChuyenlop.Rows)
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

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadDSCL();
        }

        protected void gvChuyenLop_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mahk = gvChuyenlop.DataKeys[e.RowIndex].Value.ToString();
                clBus.Delete(mahk);
                LoadDSCL();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvChuyenLop_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvChuyenlop.EditIndex = e.NewEditIndex;
            LoadDSCL();
        }

        protected void gvChuyenLop_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvChuyenLop_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvChuyenlop.EditIndex = -1;
            LoadDSCL();
        }

        private void LoadDSCL()
        {
            gvChuyenlop.DataSource = clBus.GetList();
            gvChuyenlop.DataBind();
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadDSCL();
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Unnamed1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void drKyHoc0_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        private void LoadKhoi()
        {
            try
            {
                if (drKyHoc.SelectedIndex == 0)
                {
                    LoadAllKhoi();
                }
                else
                {
                    drKhoi.DataSource = kBus.GetByMaHocKy(Convert.ToInt32(drKyHoc.SelectedValue));
                    drKhoi.DataBind();
                }

            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
            
        }

        private void LoadAllKhoi()
        {
            drKhoi.DataSource = kBus.GetList();
            drKhoi.DataBind();
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKyHoc();
        }

        private void LoadKyHoc()
        {
         
            HOCKYBL hkBus = new HOCKYBL();
            drKyHoc.DataSource = hkBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        

        }
    }
}