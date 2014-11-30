using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["chunhiem"] == true)
            {
                switch (Request.QueryString["uc"])
                {
                    case "chuyenlop":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/chuyenlop.ascx"));
                        break;
                    case "diem":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/diem.ascx"));
                        break;
                    case "hanhkiem":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/hanhkiem.ascx"));
                        break;
                    case "khenthuong":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/khenthuong.ascx"));
                        break;
                    case "kyluat":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/kyluat.ascx"));
                        break;
                    case "thoikhoabieu":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/thoikhoabieu.ascx"));
                        break;
                    case "themsuahocsinh":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/themsuahocsinh.ascx"));
                        break;
                    case "themdiem":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/themdiem.ascx"));
                        break;
                }
            }
            else
            {
              
                hpHanhKiem.Visible = false;
                hpKhenThuong.Visible = false;
                hpKyLuat.Visible = false;
                hpThoiKhoaBieu.Visible = false;
                hpChuyenLop.Visible = false;
                switch (Request.QueryString["uc"])
                {                    
                    case "diem":
                        PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/diem.ascx"));
                        break;
                        
                }
            }
        }


    }
}
