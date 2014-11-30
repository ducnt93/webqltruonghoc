using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request.QueryString["uc"])
            {
                case "nguoidung":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLNguoiDung/nguoidung.ascx"));
                    break;
                case "nhomnguoidung":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLNguoiDung/nhomnguoidung.ascx"));
                    break;
            }
        }
    }
}