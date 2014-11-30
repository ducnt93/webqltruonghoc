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

        }

        protected void bntLogin_Click(object sender, EventArgs e)
        {
            try
            {
                List<QUANTRI> list = new List<QUANTRI>();
                list = bll.GetList();
                foreach (var item in list)
                {
                    if(item.TenDNhap == txtuser.Text && item.MatKhau==txtpass.Text)
                    {
                        Session["User"] = item.TenNguoiDung;
                        Session["Ma_loai_nd"] = item.MaLoaiND;
                        Session["Loai_nguoi_dung"] = item.MaLoaiND;
                        Response.Redirect("~/admin.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }

        //protected void bntLogin_Click(object sender, EventArgs e)
        //{
        //    if (txtuser.Text.Trim().Equals(""))
        //    {
        //        Label1.Text = "Tên đăng nhập không thể bỏ trống";
        //        txtuser.Focus();
        //        return;
        //    }
        //    if (txtpass.Text.Trim().Equals(""))
        //    {
        //        Label1.Text = "Mật khẩu không thể bỏ trống";
        //        txtpass.Focus();
        //        return;
        //    }
        //    users_info us;
        //    us = users_info.Checkuser(txtuser.Text.Trim());
        //    if (us!=null)
        //    {
        //        if (HamXuLy.MaHoa(txtpass.Text).Equals(us.password))
        //        {
        //            if (us.status==true)
        //            {
        //                Session["admin"] = us.id;
        //                Session["username"] = us.username;
        //                Session["name"] = us.fullname;
        //                Session["role"] = us.rolecode;
                        
        //                Response.Redirect("admin.aspx");
        //            }
        //            else
        //            {
        //                Label1.Text = "Tài khoản của bạn đã bị khóa";
        //            }
        //        }
        //        else
        //        {
        //            Label1.Text = "Mật khẩu không chính xác";
        //        }
        //    }
        //    else
        //    {
        //        Label1.Text = "Tên đăng nhập này không tồn tại";
        //    }
        //}
    }
}