using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
using System.Data;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class namhoc : System.Web.UI.UserControl
    {
        NAMHOCBL nh = new NAMHOCBL();
        NAMHOC obj = new NAMHOC();

        protected void Page_Load(object sender, EventArgs e)
        {
       
                lblErrNamHoc.Visible = false;
                if (!IsPostBack)
                {
                    pnNamHoc.Visible = false;
                    LoadALL();
                }
        }

        private void LoadALL()
        {
            gvNamHoc.DataSource = nh.GetList();
            gvNamHoc.DataBind();
        }

        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
            
            pnNamHoc.Visible = true;
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtTenNH.Text = "";
            pnNamHoc.Visible = false;
            LoadALL(); 
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
          
            try
            {
                if(txtTenNH.Text == "")
                {
                    lblErrNamHoc.Visible = true;
                }
                else
                {
                    NAMHOC obj = new NAMHOC();
                    obj.TenNamHoc = txtTenNH.Text;
                    nh.Add(obj);
                    LoadALL();
                }
                
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox ChkBoxHeader = (CheckBox)gvNamHoc.HeaderRow.FindControl("ckAll");
                foreach (GridViewRow row in gvNamHoc.Rows)
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
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                for (int i = 0; i < gvNamHoc.Rows.Count; i++)
                {

                    GridViewRow row = gvNamHoc.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        int id = int.Parse(gvNamHoc.Rows[i].Cells[1].Text);
                        nh.Delete(id);
                    }
                }
                LoadALL();

            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }


        protected void gvNamHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int mahk = int.Parse(gvNamHoc.DataKeys[e.RowIndex].Value.ToString());
                nh.Delete(mahk);
                LoadALL();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvNamHoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvNamHoc.EditIndex = e.NewEditIndex;
                LoadALL();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvNamHoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                int maNam = int.Parse(gvNamHoc.DataKeys[e.RowIndex].Value.ToString());
                GridViewRow row = gvNamHoc.Rows[e.RowIndex];
                obj.TenNamHoc = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.MaNamHoc = maNam;
                nh.Update(obj);
                gvNamHoc.EditIndex = -1;
                LoadALL();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvNamHoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvNamHoc.EditIndex = -1;
            LoadALL();
        }

        

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            pnNamHoc.Visible = false;
            LoadALL();
        }


       

      


    }
}