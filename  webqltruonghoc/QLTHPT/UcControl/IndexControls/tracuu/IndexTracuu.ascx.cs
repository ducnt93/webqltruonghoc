using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT.UcControl.IndexControls.tracuu
{
    public partial class IndexTracuu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgtths_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/noidungtracuu.aspx?uc=tracuutths");
        }

        protected void imgdiemhs_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/noidungtracuu.aspx?uc=tracuudiem");
        }

        protected void imgHanhKiem_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/noidungtracuu.aspx?uc=hanhkiem");
        }

        protected void imgThoiKhoaBieu_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/noidungtracuu.aspx?uc=thoikhoabieu");
        }
    }
}