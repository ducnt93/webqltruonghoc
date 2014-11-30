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
        CHUYENLOP obj = new CHUYENLOP();
        CHUYENLOPBL clBus = new CHUYENLOPBL();
        KHOILOPBL kBus = new KHOILOPBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            if (!IsPostBack)
            {
                Status(false);
                LoadNamHoc();
            }
        }

        private void Status(bool p)
        {       
            vldNgayChuyen.EnableClientScript = p;
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
            try
            {
                Status(true);
                if (drHocSinh.SelectedIndex == 0)
                {
                    lblErr.Text = "Chưa chọn học sinh để chuyển";
                }
                else
                {
                    if(ckChuyenDiem.Checked ==true)
                    {
                        obj.ChuyenBangDiem = true;
                    }
                    else
                    {
                        obj.ChuyenBangDiem = false;
                    }
                    obj.DenLop = drDenLop.SelectedValue;
                    obj.TuLop = drTuLop.SelectedValue;
                    obj.LyDoChuyen = txtLydo.Text;
                    obj.MaHocSinh = drHocSinh.SelectedValue;
                    clBus.Add(obj);

                }
            }
            catch (Exception)
            {

                lblErr.Text = "Lỗi";
            }
        }
        private void LoadKhoi()
        {
            try
            {
                if (drNamHoc.SelectedIndex == 0)
                {
                    LoadAllKhoi();
                }
                else
                {
                    drKhoi.DataSource = kBus.GetByMaNam(Convert.ToInt32(drNamHoc.SelectedValue));
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
            LoadLop();
        }

        private void LoadLop()
        {
            string magv = Session["MaGiaoVien"].ToString();
            DSLOPBL ds = new DSLOPBL();
            drLop.DataSource = ds.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
            drLop.Items.Insert(0, "--Chọn lớp--");
        }

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }


        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            LoadHSByLop();
            LoadLopThem();
        }

        private void LoadHSByLop()
        {
           
        }

        private void LoadLopThem()
        {
            string magv = Session["MaGiaoVien"].ToString();
           //drTuLop
            DSLOPBL ds = new DSLOPBL();
            drTuLop.DataSource = ds.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
            drTuLop.DataTextField = "TenLop";
            drTuLop.DataValueField = "MaLop";
            drTuLop.DataBind();
            drTuLop.Items.Insert(0, "--Chọn lớp--");
            //drDenLop
            drDenLop.DataSource = ds.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
            drDenLop.DataTextField = "TenLop";
            drDenLop.DataValueField = "MaLop";
            drDenLop.DataBind();
            drDenLop.Items.Insert(0, "--Chọn lớp--");
        }
    }
}