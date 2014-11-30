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
    public partial class chitietdiem : System.Web.UI.UserControl
    {
        BANGDIEMBL bdBus = new BANGDIEMBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTenHS.Text = Session["tenhs"].ToString();
            lblHk.Text = Session["hk"].ToString();
            if(!IsPostBack)
            {
                LoadDiem();
            }
        }

        private void LoadDiem()
        {
            string mahs = Request.QueryString["mahs"];
            int hk = int.Parse(Request.QueryString["hk"].ToString());
            //gvBangDiem.DataSource = bdBus.GetByMaHocSinh(mahs,hk);
            //gvBangDiem.DataBind();
        }

        
    }
}