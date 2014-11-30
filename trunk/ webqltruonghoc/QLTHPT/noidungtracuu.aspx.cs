using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch(Request.QueryString["uc"])
            {
                case "hanhkiem":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/IndexControls/tracuu/tracuuhanhkiem.ascx"));
                    break;
                case "thoikhoabieu":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/IndexControls/tracuu/tracuutkb.ascx"));
                    break;
                case "tracuudiem":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/IndexControls/tracuu/tracuudiem.ascx"));
                    break;
                case "tracuutths":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/IndexControls/tracuu/tracuutths.ascx"));
                    break;
            }
        }
    }
}