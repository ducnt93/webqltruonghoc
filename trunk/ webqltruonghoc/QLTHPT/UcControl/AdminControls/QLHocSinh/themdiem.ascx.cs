using QLTHPT1.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class themdiem : System.Web.UI.UserControl
    {
        KHOILOPBL klBus = new KHOILOPBL();
        NAMHOCBL nhBus = new NAMHOCBL();
        DSLOPBL dslopBus = new DSLOPBL();
        BANGDIEMBL bdBus = new BANGDIEMBL();
        HOCSINHBL hsBus = new HOCSINHBL();
        BANGDIEM obj = new BANGDIEM();
        HOCKYBL khBus = new HOCKYBL();
        MONHOCBL mhBus = new MONHOCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            status(false);
            LoadLopByKhoi();
            LoadHocKy();
            LoadMon();
            LoadHS();
            lblErr.Text = "";
            if (!IsPostBack)
            {


            }
            if (Request.QueryString["id"] == "them")
            {
                imgLuu.Visible = true;
                imgLuuSua.Visible = false;
                lblHS.Visible = false;

            }
            else
            {
                imgLuu.Visible = false;
                imgLuuSua.Visible = true;
                lblHS.Visible = true;
                drHocSinh.Visible = false;
                lblHS.Text = Request.QueryString["id"].ToString();
                drLop.SelectedValue = Session["malopdiem"].ToString();
                drMaMon.SelectedValue = Session["mon"].ToString();
                drHK.SelectedValue = Session["diemHK"].ToString();
                LoadTTDiem();
            }
        }

        private void LoadTTDiem()
        {
            try
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                int mahk = int.Parse(Session["diemHK"].ToString());
                int mamon = int.Parse(Session["mon"].ToString());
                int malop = int.Parse( Session["malopdiem"].ToString());
                list = bdBus.GetByMaMonHKMaHS3(mahk, malop, Request.QueryString["id"].ToString(), mamon);
                foreach (var item in list)
                {
                    txt151.Text = item.D15_1.ToString();
                    txt15p2.Text = item.D15_2.ToString();
                    txt15p3.Text = item.D15_3.ToString();
                    txt1t1.Text = item.D1T_1.ToString();
                    txt1t2.Text = item.D1T_2.ToString();
                    txtDiem1.Text = item.DM_1.ToString();
                    txtMieng2.Text = item.DM_2.ToString();
                    txtHocKy.Text = item.DThi.ToString();
                }
            }
            catch (Exception ex)
            {
                
                lblErr.Text = ex.Message;
            }
            
        }
        public void status(bool a)
        {
            vldD15.EnableClientScript = a;
            vldD1T.EnableClientScript = a;
            vldDhk.EnableClientScript = a;
            vldDM1.EnableClientScript = a;
        }
        PHANLOPBL plBus = new PHANLOPBL();
        private void LoadHS()
        {
            int malop = int.Parse(Session["malopdiem"].ToString());
            drHocSinh.DataSource = plBus.GetTTByMaLop(malop);
            drHocSinh.DataTextField = "TenHocSinh";
            drHocSinh.DataValueField = "MaHocSinh";
            drHocSinh.DataBind();
            drHocSinh.Items.Insert(0, "--Chọn học sinh--");
        }

        private void LoadHocKy()
        {
            drHK.DataSource = khBus.GetList();
            drHK.DataTextField = "TenHK";
            drHK.DataValueField = "MaHK";
            drHK.DataBind();
            drHK.Items.Insert(0, "--Chọn học kỳ--");
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (drHocSinh.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn học sinh nào đó!";
                }
                if (drHK.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn học kỳ nào ";
                }
                if (drMaMon.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn môn học nào đó!";
                }
                if (drLop.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn lớp nào đó!";
                }
                status(true);
                int count = 0;
                obj.D15_1 = int.Parse(txt151.Text);
                obj.D15_2 = int.Parse(txt15p2.Text);
                obj.D15_3 = int.Parse(txt15p3.Text);
                obj.D1T_1 = int.Parse(txt1t1.Text);
                obj.D1T_2 = int.Parse(txt1t2.Text);
                obj.DM_1 = int.Parse(txtDiem1.Text);
                obj.DM_2 = int.Parse(txtMieng2.Text);
                obj.DThi = int.Parse(txtHocKy.Text);
                obj.MaHK = int.Parse(drHK.SelectedValue);
                obj.MaHocSinh = drHocSinh.SelectedValue;
                obj.Malop = int.Parse(drLop.SelectedValue);
                obj.MaMonHoc = int.Parse(drMaMon.SelectedValue);
                if((obj.D15_1 <0 )|| (obj.D15_1 >10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
               "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D15_2 < 0) || (obj.D15_2 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                 "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D15_3 < 0) || (obj.D15_3 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D1T_1 < 0) || (obj.D1T_1 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
               "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D1T_2 < 0) || (obj.D1T_2 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                 "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.DM_1 < 0) || (obj.DM_1 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.DM_2 < 0) || (obj.DM_2 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.DThi < 0) || (obj.DThi > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                List<BANGDIEM> list = new List<BANGDIEM>();
                list = bdBus.GetByMaMonHKMaHS(int.Parse(drMaMon.SelectedValue),int.Parse(drHK.SelectedValue),drHocSinh.SelectedValue);
                foreach (var item in list)
                {
                    if (drHocSinh.SelectedValue == item.MaHocSinh)
                    {
                        count = 1;
                        break;
                    }
                    else
                    {
                        count = 0;
                    }
                }
                if (count == 1)
                {
                    lblErr.Text = "Đã có điểm cho học sinh này";
                }
                else
                {
                    bdBus.Add(obj);
                }
              
                Response.Redirect("~/QuanLyHocSinh.aspx?uc=diem");
            }
            catch (Exception)
            {

                lblErr.Text = "Xem lại thông tin thiếu hoặc không đúng định dạng";
            }
        }
        private void LoadMon()
        {
            MONHOCBL mhBus = new MONHOCBL();
              string magv = Session["MaGiaoVien"].ToString();
             int mamon = int.Parse(Session["mamon"].ToString()); 
            if(magv == "Admin")
            {
                drMaMon.DataSource = mhBus.GetList();
                drMaMon.DataTextField = "TenMonHoc";
                drMaMon.DataValueField = "MaMonHoc";
                drMaMon.DataBind();
                drMaMon.Items.Insert(0, "--Chọn môn học--");
            }
            else
            {
                drMaMon.DataSource = mhBus.GetByMaMon(mamon);
                drMaMon.DataTextField = "TenMonHoc";
                drMaMon.DataValueField = "MaMonHoc";
                drMaMon.DataBind();
                drMaMon.Items.Insert(0, "--Chọn môn học--");
            }
        }
        private void LoadLopByKhoi()
        {
            string magv = Session["MaGiaoVien"].ToString();
            int makhoi = int.Parse(Session["khoidiem"].ToString());
            if (magv == "Admin")
            {
                drLop.DataSource = dslopBus.GetByMaKhoi(makhoi);
                drLop.DataTextField = "TenLop";
                drLop.DataValueField = "MaLop";
                drLop.DataBind();
                drLop.Items.Insert(0, "--Chọn lớp--");
            }
            else
            {
                drLop.DataSource = dslopBus.GetByMaKhoiGV(makhoi, magv);
                drLop.DataTextField = "TenLop";
                drLop.DataValueField = "MaLop";
                drLop.DataBind();
                drLop.Items.Insert(0, "--Chọn lớp--");
            }
       
        }
        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("QuanLyHocSinh.aspx?uc=diem");
        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                status(true);

                //if (drHocSinh.SelectedIndex == 0)
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(),
                //"Message", "alert('Bạn chưa chọn học sinh nào đó!');", true);
                //    // lblErr.Text = "Bạn chưa chọn học sinh nào đó!";
                //}
                if (drHK.SelectedIndex == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Bạn chưa chọn học kỳ nào');", true);
                    // lblErr.Text = "Bạn chưa chọn học kỳ nào ";
                }
                if (drMaMon.SelectedIndex == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Bạn chưa chọn môn học nào đó!');", true);
                    //lblErr.Text = "Bạn chưa chọn môn học nào đó!";
                }
                if (drLop.SelectedIndex == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Bạn chưa chọn lớp nào đó!');", true);
                    //lblErr.Text = "Bạn chưa chọn lớp nào đó!";
                }
                obj.D15_1 = int.Parse(txt151.Text);
                obj.D15_2 = int.Parse(txt15p2.Text);
                obj.D15_3 = int.Parse(txt15p3.Text);
                obj.D1T_1 = int.Parse(txt1t1.Text);
                obj.D1T_2 = int.Parse(txt1t2.Text);
                obj.DM_1 = int.Parse(txtDiem1.Text);
                obj.DM_2 = int.Parse(txtMieng2.Text);
                obj.DThi = int.Parse(txtHocKy.Text);
                obj.MaHK = int.Parse(drHK.SelectedValue);
                obj.MaHocSinh = lblHS.Text;
                obj.Malop = int.Parse(drLop.SelectedValue);
                obj.MaMonHoc = int.Parse(drMaMon.SelectedValue);
                if ((obj.D15_1 < 0) || (obj.D15_1 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
               "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D15_2 < 0) || (obj.D15_2 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                 "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D15_3 < 0) || (obj.D15_3 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D1T_1 < 0) || (obj.D1T_1 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
               "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.D1T_2 < 0) || (obj.D1T_2 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                 "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.DM_1 < 0) || (obj.DM_1 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.DM_2 < 0) || (obj.DM_2 > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                if ((obj.DThi < 0) || (obj.DThi > 10))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                "Message", "alert('Nhập điểm trong khoảng 0-10');", true);
                }
                bdBus.Update(obj);
                Response.Redirect("~/QuanLyHocSinh.aspx?uc=diem");
            }


            catch(Exception ex)
            {

                lblErr.Text = "Chưa đầy đủ thông tin. Vui lòng kiểm tra lại" +ex.Message;
            }
        }




    }

}