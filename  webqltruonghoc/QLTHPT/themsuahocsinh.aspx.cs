using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLHocSinh/themsuahocsinh.ascx"));
        }
    }
}