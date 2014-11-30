using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.IndexControls
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        TINTUCBL ttBus = new TINTUCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Repeater1.DataSource = ttBus.GetList();
                Repeater1.DataBind();
            }
        }
    }
}