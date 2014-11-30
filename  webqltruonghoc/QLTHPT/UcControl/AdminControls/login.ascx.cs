using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
using QLTHPT1.DataAccess;
namespace QLTHPT.AdminControls
{
    public partial class login : System.Web.UI.UserControl
    {
        QUANTRI obj = new QUANTRI();
        QUANTRIBL bll = new QUANTRIBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtpass.Attributes.Add("onKeyPress", "doClick('" + bntLogin.ClientID + "',event)");
            }
          
        }

        protected void bntLogin_Click(object sender, EventArgs e)
        {
           
            try
            {
                List<QUANTRI> list = new List<QUANTRI>();
                list = bll.GetListTT();
                string mk = HamXuLy.EncodeTo64(txtpass.Text);
                foreach (var item in list)
                {


                    //if ((item.TenDNhap == txtuser.Text) && (item.MatKhau == HamXuLy.MaHoa(txtpass.Text)))
                    if ((item.TenDNhap == txtuser.Text) && (item.MatKhau == mk))
                    {
                        if(item.TrangThai == true)
                        {
                            Session["User"] = item.TenGiaoVien;
                            Session["MaGiaoVien"] = item.MaGiaoVien;
                            Session["Ma_loai_nd"] = item.MaLoaiND;
                            Session["Loai_nguoi_dung"] = item.MaLoaiND;
                            Session["trangthai"] = item.TrangThai;
                            Session["chunhiem"] = item.ChuNhiem;
                            Session["mamon"] = item.MaMon;//
                            Response.Redirect("~/admin.aspx");
                        }

                        else
                        {
                            Label1.Text = "Tài khoản đã bị khóa. Vui lòng liên hệ ban quản trị!";
                        }
                      
                    }
                }
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
    }
}