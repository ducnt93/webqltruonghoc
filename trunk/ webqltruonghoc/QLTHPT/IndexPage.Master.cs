using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Page.ViewStateMode = ViewStateMode.Disabled;
            if(!IsPostBack)
            {
                LoadPicture();
            }
           
        }
        private void LoadPicture()
        {
            try
            {
                string[] files = Directory.GetFiles(Server.MapPath("~/App_Themes/IndexPage/imagesBanner/slides"));
                DataTable dt = new DataTable();
                DataColumn name = new DataColumn("Picture", typeof(string));
                dt.Columns.Add(name);
                foreach (var file in files)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = file.Substring(file.LastIndexOf(@"\") + 1);
                    dt.Rows.Add(dr);
                }
                rptPicture.DataSource = dt;
                rptPicture.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}