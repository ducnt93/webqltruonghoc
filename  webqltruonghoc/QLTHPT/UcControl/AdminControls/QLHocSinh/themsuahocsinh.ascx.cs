using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System.IO;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class themsuahocsinh : System.Web.UI.UserControl
    {
        HOCSINH obj = new HOCSINH();
        HOCSINHBL hsBus = new HOCSINHBL();
        NAMHOCBL nhBus = new NAMHOCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                vldMaHS.EnableClientScript = false;
                vldTenHS.EnableClientScript = false;
                vldTenBo.EnableClientScript = false;
                vldTenMe.EnableClientScript = false;
                vldDiaChi.EnableClientScript = false;
                vldGioiTinh.EnableClientScript = false;
                vldNgaySinh.EnableClientScript = false;

                if (Request.QueryString["hs"] == "themhocsinh")
                {
                    imgLuuSua0.Visible = false;
                    imgLuu0.Visible = true;
                    LoadTTHS();
                    LoadNamHocThem();
                   
                }
                else
                {
                    imgLuu0.Visible = false;
                    imgLuuSua0.Visible = true;
                    txtMaHS.ReadOnly = true;
                    LoadTTHS();
                    LoadNamHocThem();
                   
                }
             
               // drNamHocThem.SelectedValue = Request.QueryString["namhoc"].ToString();
            }


        }
        private void LoadTTHS()
        {
            List<HOCSINH> list = new List<HOCSINH>();
            list = hsBus.GetByMaHocSinh(Request.QueryString["hs"]);
            foreach (var item in list)
            {
                txtMaHS.Text = item.MaHocSinh;
                txtDiachi.Text = item.DiaChi;
                txtEmail0.Text = item.Email;
                txtNgayNhapHoc0.Text = item.NgayNhapHoc.ToString();
                txtSDT0.Text = item.SoDienThoaiNha;
                txtTenBo0.Text = item.HoTenBo;
                txtTenHS0.Text = item.TenHocSinh;
                txtTenMe0.Text = item.HoTenMe;
                txtNgaySinh0.Text = item.NgaySinh.ToString();
                txtNoiSinh0.Text = item.NoiSinh;
                txtNgheBo0.Text = item.NgheBo;
                txtNgheMe0.Text = item.NgheMe;
                txtNgayVaoDoan0.Text = item.NgayVaoDoan.ToString();
                Image2.ImageUrl = "~/uploads/hocsinh/images/" + item.Anh;
                drTrangThai.SelectedValue = item.TrangThai;
                if (item.GioiTinh == "Nam")
                {
                    rbGioiTinh0.SelectedIndex = 0;
                }
                else
                {
                    rbGioiTinh0.SelectedIndex = 1;
                }

            }

        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (drNamHocThem.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn cần chọn lớp và năm học nào đó!";
                }

                vldMaHS.EnableClientScript = true;
                vldTenHS.EnableClientScript = true;
                vldTenBo.EnableClientScript = true;
                vldTenMe.EnableClientScript = true;
                vldDiaChi.EnableClientScript = true;
                vldGioiTinh.EnableClientScript = true;
                vldNgaySinh.EnableClientScript = true;
                obj.MaHocSinh = txtMaHS.Text;
                obj.TenHocSinh = txtTenHS0.Text;
                obj.SoDienThoaiNha = txtSDT0.Text;
                obj.NoiSinh = txtNoiSinh0.Text;
                obj.NgheMe = txtNgheMe0.Text;
                obj.NgheBo = txtNgheBo0.Text;
                obj.HoTenBo = txtTenBo0.Text;
                obj.HoTenMe = txtTenMe0.Text;
               
                if (rbGioiTinh0.SelectedIndex == 0)
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
                obj.MaNamHoc = int.Parse(drNamHocThem.SelectedValue);
                obj.NgayNhapHoc = DateTime.Parse(txtNgayNhapHoc0.Text);
                obj.NgayVaoDoan = DateTime.Parse(txtNgayVaoDoan0.Text);
                obj.NgaySinh = DateTime.Parse(txtNgaySinh0.Text);
                obj.Anh = txtMaHS.Text +".jpg";
                hsBus.Add(obj);
                upanh(txtMaHS.Text);
               
                Response.Redirect("~/QuanLyHocSinh.aspx?uc=hocsinh");
            }
            catch (Exception ex)
            {

                lblErr.Text = "Đã có mã học sinh này hoặc lỗi khác " + ex.Message;
            }

        }
        private void LoadNamHocThem()
        {
            NAMHOCBL nh = new NAMHOCBL();
            drNamHocThem.DataSource = nh.GetList();
            drNamHocThem.DataTextField = "TenNamHoc";
            drNamHocThem.DataValueField = "MaNamHoc";
            drNamHocThem.DataBind();
            drNamHocThem.Items.Insert(0, "--Chọn năm học--");
        }
      
      
        public void upanh(string _ID_HS)
        {
            try
            {
                if (FileUploadControl_.HasFile)
                {
                    try
                    {
                        if (FileUploadControl_.PostedFile.ContentType == "image/jpeg")
                        {
                            if (FileUploadControl_.PostedFile.ContentLength < 102400)
                            {
                                string filename = Path.GetFileName(FileUploadControl_.FileName);
                                FileUploadControl_.SaveAs(Server.MapPath("~/uploads/hocsinh/images/") + _ID_HS + ".jpg");
                                lblErr.Text = "Trạng thái : File đã được update!";
                            }
                            else
                                lblErr.Text = "Trạng thái: kích thước file quá lớn!";
                        }
                        else
                            lblErr.Text = "Trạng thái: không đúng định dạng file!";
                    }
                    catch (Exception ex)
                    {
                        lblErr.Text = "Trạng thái: Không thể upload được file này. Vui lòng kiểm tra lại! Lỗi: " + ex.Message;
                    }
                }
            }
            catch (Exception)
            {
                
                lblErr.Text = "Lỗi up ảnh";
            }
          
        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (drNamHocThem.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn cần chọn năm học nào đó!";
                }

                vldMaHS.EnableClientScript = true;
                vldTenHS.EnableClientScript = true;
                vldTenBo.EnableClientScript = true;
                vldTenMe.EnableClientScript = true;
                vldDiaChi.EnableClientScript = true;
                vldGioiTinh.EnableClientScript = true;
                vldNgaySinh.EnableClientScript = true;
                obj.Anh = txtMaHS.Text + ".jpg";
                obj.DiaChi = txtDiachi.Text;
                obj.Email = txtEmail0.Text;
                if (rbGioiTinh0.SelectedIndex == 0)
                {
                    obj.GioiTinh = "Nam";
                }
                else
                {
                    obj.GioiTinh = "Nữ";
                }
                obj.HoTenBo = txtTenBo0.Text;
                obj.HoTenMe = txtTenMe0.Text;
                obj.MaHocSinh = txtMaHS.Text;
            
                obj.MaNamHoc = int.Parse(drNamHocThem.SelectedValue);
                obj.NgayNhapHoc = DateTime.Parse(txtNgayNhapHoc0.Text);
                obj.NgaySinh = DateTime.Parse(txtNgaySinh0.Text);
                obj.NgayVaoDoan = DateTime.Parse(txtNgayVaoDoan0.Text);
                obj.NgheBo = txtNgheBo0.Text;
                obj.NgheMe = txtNgheMe0.Text;
                obj.NoiSinh = txtNoiSinh0.Text;
                obj.SoDienThoaiNha = txtSDT0.Text;
                obj.TenHocSinh = txtTenHS0.Text;
                obj.TrangThai = drTrangThai.SelectedValue;
                hsBus.Update(obj);
                upanh(txtMaHS.Text);

                //  imgLuuSua0.OnClientClick = "javascript: return confirm('Sửa thành công!');";
                Response.Redirect("~/QuanLyHocSinh.aspx?uc=hocsinh");
            }
            catch (Exception)
            {

                lblErr.Text = "Lỗi không update được dữ liệu. Kiểm tra lại dữ liệu!";
            }
        }

        protected void imgCancel_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/QuanLyHocSinh.aspx?uc=hocsinh");
        }

        protected void btnUpAnh0_Click(object sender, EventArgs e)
        {
            
        }
    }
}