using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace QLTHPT
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ////Kiểm tra nếu chưa tồn tại file thì tạo file Count_Visited.txt
            if (!File.Exists(Server.MapPath("uploads/demtruycap.txt")))
                File.WriteAllText(Server.MapPath("uploads/demtruycap.txt"), "0");
            Application["DaTruyCap"] = int.Parse(File.ReadAllText(Server.MapPath("uploads/demtruycap.txt")));
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["MaGiaoVien"] = "GV000";
            Session["Loai_nguoi_dung"] = null;
            Session["User"] = "";
            // Tăng số đang truy cập lên 1 nếu có khách truy cập
            if (Application["DangTruyCap"] == null)
                Application["DangTruyCap"] = 1;
            else
                Application["DangTruyCap"] = (int)Application["DangTruyCap"] + 1;
            // Tăng số đã truy cập lên 1 nếu có khách truy cập
            Application["DaTruyCap"] = (int)Application["DaTruyCap"] + 1;
            File.WriteAllText(Server.MapPath("uploads/demtruycap.txt"), Application["DaTruyCap"].ToString());
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            //Khi hết session hoặc người dùng thoát khỏi website thì giảm số người đang truy cập đi 1
            Application["DangTruyCap"] = (int)Application["DangTruyCap"] - 1;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}