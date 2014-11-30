using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           switch (Request.QueryString["id"])
           {
               case "giaovien":
                   PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLGiaoVien/giaovien.ascx"));
                   break;
               case "tomon":
                   PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/QLGiaoVien/tomon.ascx"));
                   break;
           }
        }
    }
}