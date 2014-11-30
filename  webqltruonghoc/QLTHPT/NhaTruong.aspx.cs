using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request.QueryString["uc"])
            {
                case "khoihoc":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/khoihoc.ascx"));
                    break;
                case "hocsinh":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/hocsinh.ascx"));
                    break;
                case "phanlop":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/phanlop.ascx"));
                    break;
                case "kyhoc":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/kyhoc.ascx"));
                    break;
                case "namhoc":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/namhoc.ascx"));
                    break;
                case "banner":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/banner.ascx"));
                    break;
                case "tintuc":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/tintuc.ascx"));
                    break;
                case "ttnhatruong":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/ttnhatruong.ascx"));
                    break;
                case "dslop":
                    PlaceHolder1.Controls.Add(LoadControl("~/UcControl/AdminControls/NhaTruong/dslop.ascx"));
                    break;
              
            }
        }
    }
}