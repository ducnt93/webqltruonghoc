using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class kyhoc : System.Web.UI.UserControl
    {
        HOCKY obj = new HOCKY();
        HOCKYBL khBus = new HOCKYBL();
        NAMHOCBL nhBus = new NAMHOCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblErr.Text = "";
            ktra(false);
            if (!IsPostBack)
            {
                Panel2.Visible = false;       
                LoadKyHoc();
            }

        }
        public void ktra(bool p)
        {
            if((txtDenNgay0.Text == ""))
            {
                lblErrDenNgay.Visible = p;
            }
            if(txtTenHK0.Text=="")
            {
                lblErrTenHK.Visible = p;

            }
            if(txtTuNgay0.Text=="")
            {
                lblErrTuNgay.Visible = p;
            }
        }
        private void LoadKyHoc()
        {
            gvKyHoc.DataSource = khBus.GetList();
            gvKyHoc.DataBind();


        }

        //protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (drNamHoc.SelectedIndex == 0)
        //    {
        //        LoadKyHoc();
        //    }
        //    else
        //    {
        //        LoadHocKyMaNam();
               
        //     }

        //}

        //private void LoadHocKyMaNam()
        //{
        //    if(drNamHoc.SelectedIndex == 0 )
        //    {
        //        LoadKyHoc();
        //    }
        //    else
        //    {
        //    gvKyHoc.DataSource = khBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
        //    gvKyHoc.DataBind();
        //    }
           
        //}

        protected void ckALl_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ckall = (CheckBox)gvKyHoc.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow item in gvKyHoc.Rows)
            {
                CheckBox ckitem = (CheckBox)item.FindControl("ckitem");
                if (ckall.Checked == true)
                {
                    ckitem.Checked = true;
                }
                else
                {
                    ckitem.Checked = false;
                }
            }
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ktra(true);
                obj.TenHK = txtTenHK0.Text;
                obj.TuNgay = DateTime.Parse(txtTuNgay0.Text);
                obj.DenNgay = DateTime.Parse(txtDenNgay0.Text);
                khBus.Add(obj);
                LoadKyHoc();
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;

            }

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtTuNgay0.Text = "";
            txtTenHK0.Text = "";
            txtDenNgay0.Text = "";
            Panel2.Visible = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel2.Visible = true;
            

        }

        //private void LoadMaNam()
        //{
        //    NAMHOCBL nh = new NAMHOCBL();
        //    drMaNamHoc.DataSource = nh.GetList();
        //    drMaNamHoc.DataTextField = "TenNamHoc";
        //    drMaNamHoc.DataValueField = "MaNamHoc";
        //    drMaNamHoc.DataBind();
        //}

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel2.Visible = false;
            LoadKyHoc();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                for (int i = 0; i < gvKyHoc.Rows.Count; i++)
                {

                    GridViewRow row = gvKyHoc.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        int id = int.Parse(gvKyHoc.Rows[i].Cells[1].Text);
                        khBus.Delete(id);
                    }
                }
                LoadKyHoc();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvKyHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int mahk = int.Parse(gvKyHoc.DataKeys[e.RowIndex].Value.ToString());
            khBus.Delete(mahk);
            LoadKyHoc();
        }

        protected void gvKyHoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvKyHoc.EditIndex = e.NewEditIndex;
            //LoadHocKyMaNam();
            LoadKyHoc();
        }

        protected void gvKyHoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {   
                GridViewRow row = gvKyHoc.Rows[e.RowIndex];
                int mahk = int.Parse(gvKyHoc.DataKeys[e.RowIndex].Value.ToString());
                obj.MaHK = mahk;
                obj.TenHK = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.TuNgay = DateTime.Parse(((TextBox)(row.Cells[3].Controls[0])).Text);
                obj.DenNgay = DateTime.Parse(((TextBox)(row.Cells[4].Controls[0])).Text);          
                //obj.MaNamHoc = int.Parse(((TextBox)(row.Cells[5].Controls[0])).Text);
                khBus.Update(obj);
                //Reset the edit index.
                gvKyHoc.EditIndex = -1;
                LoadKyHoc();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvKyHoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvKyHoc.EditIndex = -1;
            LoadKyHoc();
        }


    }
}