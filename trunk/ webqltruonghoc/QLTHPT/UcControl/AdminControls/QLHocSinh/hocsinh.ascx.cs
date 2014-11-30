using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class hócinh : System.Web.UI.UserControl
    {
        HOCSINH obj = new HOCSINH();
        HOCSINHBL hsBus = new HOCSINHBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            pnEdit0.Visible =false;
            if(!IsPostBack)
            {
                LoadDSHS();
                LoadNamHoc();
            }
        }

        private void LoadDSHS()
        {
            gvHS.DataSource = hsBus.GetList();
            gvHS.DataBind();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvHS.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvHS.Rows)
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void gvHS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mahs = gvHS.DataKeys[e.RowIndex].Value.ToString();
            hsBus.Delete(mahs);
            LoadDSHS();
        }

        protected void gvHS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "cmdBind")
            {
                LinkButton lb = (LinkButton)e.CommandArgument;
                int index = Convert.ToInt32(lb.CommandArgument);
                GridViewRow row = gvHS.Rows[index];
                Label l1 = (Label)row.FindControl("MaHocSinh");
                Label l2 = (Label)row.FindControl("MaLop");
                Label l3 = (Label)row.FindControl("TenHocSinh");
                Label l4 = (Label)row.FindControl("Email");
                Label l5 = (Label)row.FindControl("GioiTinh");
                Label l6 = (Label)row.FindControl("NgaySinh");
                Label l7 = (Label)row.FindControl("NoiSinh");
                Label l9 = (Label)row.FindControl("DiaChi");
                Label l10 = (Label)row.FindControl("NgayNhapHoc");
                Label l11 = (Label)row.FindControl("HoTenBo");
                Label l12 = (Label)row.FindControl("HoTenMe");
                Label l13 = (Label)row.FindControl("NgheBo");
                Label l14 = (Label)row.FindControl("NgheMe");
                Label l15 = (Label)row.FindControl("NgayVaoDoan");
                Label l16 = (Label)row.FindControl("TrangThai");
                Label l17 = (Label)row.FindControl("SoDienThoaiNha");

               
            }
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            
            LoadDSHS();
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void lkbSua_Click(object sender, EventArgs e)
        {
          
        }


        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            LoadHocKy();
        }

        private void LoadNamHoc()
        {
            NAMHOCBL nh = new NAMHOCBL();
           drNamHoc.DataSource =  nh.GetList();
           drNamHoc.DataTextField = "TenNamHoc";
           drNamHoc.DataValueField = "MaNamHoc";
           drNamHoc.DataBind();
           drNamHoc.Items.Insert(0, "--Chọn năm học--");

        }

        private void LoadHocKy()
        {
            HOCKYBL hk = new HOCKYBL();
            drKyHoc.DataSource = hk.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
            drKyHoc.DataTextField = "MaHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn kỳ học--");
        }

        protected void drKhoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(drKhoi.SelectedIndex == 0)
            {
                LoadAllDSLop();
            }
            else
            {
                    LoadLop();
            }
           
        }

        private void LoadAllDSLop()
        {
            DSLOPBL ds = new DSLOPBL();
            drLop.DataSource = ds.GetList();
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
            drLop.Items.Insert(0, "--Chọn lớp--");
        }

        private void LoadLop()
        {
            DSLOPBL ds = new DSLOPBL();
            drLop.DataSource = ds.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
            drLop.Items.Insert(0, "--Chọn lớp--");
        }

        private void LoadKhoi()
        {
            KHOILOPBL kl = new KHOILOPBL();
            drKhoi.DataSource = kl.GetByMaHocKy(int.Parse(drKyHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
        }

        

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if(drLop.SelectedIndex==0)
            {
                LoadDSHS();
            }
            else
            {
                LoadHSGetByMaLop();
            }
           
        }

       

        private void LoadHSGetByMaLop()
        {
            HOCSINHBL hsBuss = new HOCSINHBL();
            gvHS.DataSource = hsBuss.GetByMaLop(int.Parse(drLop.SelectedValue));
            gvHS.DataBind();

        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadLop();
        }

        protected void drKyHoc0_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {

            obj.TenHocSinh =txtTenHS0.Text;
            obj.SoDienThoaiNha = txtSDT0.Text;
            obj.NoiSinh = txtNoiSinh0.Text;
            obj.NgheMe = txtNgheMe0.Text;
            obj.NgheBo = txtNgheBo0.Text;
            obj.HoTenBo = txtTenBo0.Text;
            obj.HoTenMe = txtTenMe0.Text;
            obj.MaLop = int.Parse(drMaLop0.SelectedValue);
            if(rbGioiTinh0.SelectedIndex ==0 )
            {
                 obj.GioiTinh = "Nam";
            }
            else
            {
                obj.GioiTinh = "Nữ";
            }
            obj.Email = txtEmail0.Text;
            obj.DiaChi = txtDiachi.Text;
            obj.TrangThai = drTrangThai.SelectedValue;
        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgCancel_Click1(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadDSHS();
        }

      

      

       

       
       
    }
}