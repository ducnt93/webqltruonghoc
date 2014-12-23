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
    public partial class banner : System.Web.UI.UserControl
    {
        BANNER obj = new BANNER();
        BANNERBL bannerBus = new BANNERBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErr.Text = "";
            KtraThem(false);
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                LoadBanner();
            }
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvBanner.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvBanner.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("ckitem");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadBanner();
        }

        protected void gvBanner_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string banner = gvBanner.DataKeys[e.RowIndex].Value.ToString();
                bannerBus.Delete(banner);
                LoadBanner();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvBanner_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBanner.EditIndex = e.NewEditIndex;
            LoadBanner();
        }

        protected void gvBanner_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = gvBanner.Rows[e.RowIndex];
                obj.TenBanner = ((TextBox)(row.Cells[1].Controls[0])).Text;
                obj.Link = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.MoTa= ((TextBox)(row.Cells[3].Controls[0])).Text;

                gvBanner.EditIndex = -1;
                bannerBus.Update(obj);
                //Bind data to the GridView control.
                LoadBanner();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvBanner_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBanner.EditIndex = -1;
            LoadBanner();
        }

        private void LoadBanner()
        {
            try
            {
            gvBanner.DataSource = bannerBus.GetList();
            gvBanner.DataBind();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if((txtTen.Text=="") || (txtDuongdan.Text==""))
                {
                    KtraThem(true);
                }
                else
                {
                    obj.TenBanner = txtTen.Text;
                    obj.MoTa = txtMoTa.Text;
                    obj.Link = txtDuongdan.Text;
                    bannerBus.Add(obj);
                    LoadBanner();
                }
               
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;
                
            }
           
        }

        private void KtraThem(bool p)
        {
            if(txtDuongdan.Text =="")
            {
                lblErrLink.Visible = p;
            }
            if(txtTen.Text=="")
            {
                lblErrTen.Visible = p;
            }

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtDuongdan.Text = "";
            txtMoTa.Text = "";
            txtTen.Text = "";
            Panel1.Visible = false;
            LoadBanner();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
           
            gvBanner.DataSource = bannerBus.GetFindBanner(txtTim.Text);
            gvBanner.DataBind();
        }
    }
}