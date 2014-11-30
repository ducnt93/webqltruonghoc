using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
namespace QLTHPT.UcControl.IndexControls
{
    public partial class tintuctomtat : System.Web.UI.UserControl
    {
        TINTUCBL ttBus = new TINTUCBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTinTuc();
                LoadTinKhac();
            }
        }

        private void LoadTinKhac()
        {
            rptTinLienQuan.DataSource = ttBus.GetList();
            rptTinLienQuan.DataBind();
        }

        private void LoadTinTuc()
        {
            Repeater1.DataSource = ttBus.GetList();
            Repeater1.DataBind();
        }
    }
}