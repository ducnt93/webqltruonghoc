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
    }
}