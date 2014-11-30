using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //PlaceHolder1.Controls.Add(LoadControl("UcControl/AdminControls/index.ascx"));
            
            try
            {
                //string chuoi = Session["Loai_nguoi_dung"].ToString();
                //switch (chuoi)
                //{
                //    case "Admin":
                //        PlaceHolder1.Controls.Add(LoadControl("UcControl/AdminControls/index.ascx"));
                //        break;
                //    case "GV":
                //        PlaceHolder1.Controls.Add(LoadControl("UcControl/AdminControls/index.ascx"));
                //        break;
                //}
                if (Session["Loai_nguoi_dung"] != null)
                {
                    PlaceHolder1.Controls.Add(LoadControl("UcControl/AdminControls/index.ascx"));
                }
                else
                {
                    PlaceHolder1.Controls.Add(LoadControl("UcControl/AdminControls/login.ascx"));
                }
            }
            catch (Exception ex)
            {

                Response.Write("Lỗi"+ ex.Message);
            }
         
        }
    }
}