using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
namespace QLTHPT
{
    public partial class diem : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadCacMon();

            }
        }

        private void LoadCacMon()
        {
            MONHOCBL mhBus = new MONHOCBL();
            drMon.DataSource = mhBus.GetList();
            drMon.DataTextField = "TenMonHoc";
            drMon.DataValueField = "MaMonHoc";
            drMon.DataBind();
            drMon.Items.Insert(0, "--Chọn môn học--");
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {

        }

     

        protected void gvDiem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            LoadMon();
        }

        private void LoadMon()
        {
            MONHOCBL mhBus = new MONHOCBL();
            drMaMon.DataSource = mhBus.GetList();
            drMaMon.DataTextField = "TenMonHoc";
            drMaMon.DataValueField = "MaMonHoc";
            drMaMon.DataBind();
            drMaMon.Items.Insert(0, "--Chọn môn học--");
        }

        protected void drMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDiem();
        }

        private void LoadDiem()
        {
            BANGDIEMBL dbus = new BANGDIEMBL();
            gvDiem.DataSource = dbus.GetByMaMon(int.Parse(drMon.SelectedValue));
            gvDiem.DataBind();
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {

        }

      
    }
}