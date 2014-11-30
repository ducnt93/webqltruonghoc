using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.NhaTruong
{
    public partial class ttnhatruong : System.Web.UI.UserControl
    {
        NHATRUONGBL nhatruongBus = new NHATRUONGBL();
        NHATRUONG obj = new NHATRUONG();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTTTruong();
            }
        }

        private void LoadTTTruong()
        {
            FormView1.DataSource = nhatruongBus.GetList();
            FormView1.DataBind();
        }
    }
}