using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hpLogin.Text = Session["User"].ToString();
            //string chuoi = Session["Loai_nguoi_dung"].ToString();
            //if(Session["Loai_nguoi_dung"] == null)
            //{
            //    hpLogin.Text = "bạn !";
            //    imgButtomLogin.ImageUrl = "~/App_Themes/admin/images/1397257478_Login.png";
            //    imgButtomLogin.ToolTip = "Đăng nhập hệ thống";
            //}
            //else
            //{
            //    hpLogin.Text = Session["User"].ToString() ;
            //    imgButtomLogin.ImageUrl = "~/App_Themes/admin/images/logout.png";
            //    imgButtomLogin.ToolTip = "Đăng xuất hệ thống";
            //}
           
        }

        protected void imgButtomLogin_Click(object sender, ImageClickEventArgs e)
        {

            Session["Loai_nguoi_dung"] = null;
            Session["User"] = "";
            hpLogin.Text = "bạn !";
            imgButtomLogin.ImageUrl = "~/App_Themes/admin/images/1397257478_Login";
            Response.Redirect("admin.aspx");  
        }

    
    }
}