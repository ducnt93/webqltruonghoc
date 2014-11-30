using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.IndexControls
{
    public partial class tracuu : System.Web.UI.UserControl
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
            if(!IsPostBack)
            {
                LoadNamHoc();
                
                   // LoadAllMon();    
            }
        }

        private void LoadNamHoc()
        {
            drNamHoc.DataSource = nhBus.GetList() ;
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            if(drKyHoc.SelectedIndex ==0 )
            {
                LoadAllHocKy();
            }
            else
            {
                LoadHocKyByMaNam();
            }
        }

        private void LoadHocKyByMaNam()
        {
            drKyHoc.DataSource = hkBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
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
            drKyHoc.DataSource = klBus.GetByMaHocKy(int.Parse(drKyHoc.SelectedValue));
            drKyHoc.DataTextField = "TenKhoi";
            drKyHoc.DataValueField = "MaKhoi";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        }

        private void LoadAllKhoi()
        {
            drKyHoc.DataSource = klBus.GetList();
            drKyHoc.DataTextField = "TenKhoi";
            drKyHoc.DataValueField = "MaKhoi";
            drKyHoc.DataBind();
           
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            drKhoi.Items.Insert(0, "--Chọn học kỳ--");
            if (drKhoi.SelectedIndex == 0)
            {
                LoadAllLop();
            }
            else
            {
                LoadLopByIdMaNH();
            }
        }

        private void LoadAllLop()
        {
            drLop.DataSource = dslopBus.GetList();
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
        }

        private void LoadLopByIdMaNH()
        {
            drLop.DataSource = dslopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            drLop.DataTextField = "TenLop";
            drLop.DataValueField = "MaLop";
            drLop.DataBind();
        }

        protected void drMonHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        //private void LoadAllMon()
        //{   
        //    drLop.DataSource = dslopBus.GetList();
        //    drLop.DataTextField = "TenMon";
        //    drLop.DataValueField = "MaMon";
        //    drLop.DataBind(); 
        //    drMonHoc.Items.Insert(0, "--Chọn môn học--");
        //}

        protected void btnXemDiem_Click(object sender, EventArgs e)
        {
            lblTenHS.Text = drHocSinh.SelectedValue;
            gvDiem.DataSource = bdBus.GetByMaHocSinh(int.Parse(drHocSinh.SelectedValue));
            gvDiem.DataBind();
        }

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {
            drHocSinh.Items.Insert(0, "--Chọn học sinh--");
            if(drHocSinh.SelectedIndex ==0)
            {
                LoadAllHS();
            }
            else
            {
                LoadHSByMaLop();
            }
        }

        private void LoadHSByMaLop()
        {
            drHocSinh.DataSource = hsBus.GetByMaLop(int.Parse(drLop.SelectedValue));
            drHocSinh.DataTextField = "TenHocSinh";
            drHocSinh.DataValueField = "MaHocSinh";
            drHocSinh.DataBind();
        }

        private void LoadAllHS()
        {
            drHocSinh.DataSource = hsBus.GetList();
            drHocSinh.DataTextField = "TenHocSinh";
            drHocSinh.DataValueField = "MaHocSinh";
            drHocSinh.DataBind();
        }

        protected void btnXemDiemHS_Click(object sender, EventArgs e)
        {
            lblTenHS.Text = drHocSinh.SelectedValue;
            
            //gvDiem.DataSource = ;
            //gvDiem.DataBind();

        }

        protected void drKyHoc0_SelectedIndexChanged(object sender, EventArgs e)
        {
            //drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
            //if(drKyHoc.SelectedIndex == 0)
            //{
            //    LoadAllKhoi();
            //}
            //else
            //{
            //    LoadHocKyByMaNam();
            //}
        }

       
    }
}