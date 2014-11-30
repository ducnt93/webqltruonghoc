using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
namespace QLTHPT.UcControl.AdminControls.NhaTruong
{

    public partial class tintuc : System.Web.UI.UserControl
    {
        TINTUC obj = new TINTUC();
        TINTUCBL ttBus = new TINTUCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTinTuc();
            }
        }

private void LoadTinTuc()
{
    dlTintuc.DataSource = ttBus.GetList();
    dlTintuc.DataBind();
}
    }
}