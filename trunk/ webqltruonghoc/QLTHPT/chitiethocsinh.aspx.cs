using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        HOCSINH obj = new HOCSINH();
        HOCSINHBL hsBus = new HOCSINHBL();
        DSLOPBL dslopBus = new DSLOPBL();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
           {
               LoadTTHS();
           }
        }

        private void LoadTTHS()
        {
            string id= Request.QueryString["id"];
            fvChitietHS.DataSource = hsBus.GetByMaHocSinh(id);
            fvChitietHS.DataBind();
        }

        protected void fvChitietHS_DataBound(object sender, EventArgs e)
        {
            Label lblLop = ((Label)fvChitietHS.FindControl("lblLop"));
            List<DSLOP> list = new List<DSLOP>();
            list = dslopBus.GetByMaLop1(Convert.ToInt32(lblLop.Text));
            foreach (var item in list)
            {
              lblLop.Text =   item.TenLop;
            }
          
        }
    }
}