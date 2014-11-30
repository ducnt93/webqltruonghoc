using QLTHPT1.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class khoihoc : System.Web.UI.UserControl
    {
        KHOILOPBL kBus = new KHOILOPBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErr.Text = "";
            lblErrTenKhoi.Visible = false;
           
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                LoadNamHoc();
            }
        }

        private void LoadAllKhoi()
        {
            gvKhoi.DataSource = kBus.GetList();
            gvKhoi.DataBind();
        }



        private void LoadNamHoc()
        {
            NAMHOCBL nhBus = new NAMHOCBL();
            drNamHoc.DataSource = nhBus.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }
        private void LoadKhoi()
        {
            if (drNamHoc.SelectedIndex == 0)
            {

                lblErr.Text = "Chọn năm học cụ thể";
            }
            else
            {

                LoadKhoiByMaNam();
            }

        }
        private void LoadKhoiByMaNam()
        {

            gvKhoi.DataSource = kBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
           // gvKhoi.DataSource = kBus.GetByMaNam(int.Parse(Session["NamHoc"].ToString()));
            gvKhoi.DataBind();
            lblNamHoc.Text = drNamHoc.SelectedItem.ToString();
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            LoadKhoi();
        }
        KHOILOPBL khoiBus = new KHOILOPBL();
        protected void gvKhoi_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int makhoi = Convert.ToInt32(gvKhoi.DataKeys[e.RowIndex].Value.ToString());
                khoiBus.Delete(makhoi);
                LoadKhoi();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvKhoi_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvKhoi.EditIndex = e.NewEditIndex;
            LoadKhoi();
        }
        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
           
            try
            {
                if(txtTenKhoi.Text=="")
                {
                    lblErrTenKhoi.Visible = true;
                }
             
                if (drDSNamHoc.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn năm học";
                }
                else
                {
                    
                    KHOILOP obj = new KHOILOP();
                    obj.TenKhoi = txtTenKhoi.Text;
                    obj.MaNamHoc = int.Parse(drDSNamHoc.SelectedValue);
                    kBus.Add(obj);
                    LoadKhoi();
                }
            }
            catch (Exception)
            {

                lblErr.Text = "Lỗi";
            }

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtTenKhoi.Text = "";
            Panel1.Visible = false;
        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            LoadDSNamHoc();
            Panel1.Visible = true;
        }

        private void LoadDSNamHoc()
        {
            NAMHOCBL nhBus = new NAMHOCBL();
            drDSNamHoc.DataSource = nhBus.GetList();
            drDSNamHoc.DataTextField = "TenNamHoc";
            drDSNamHoc.DataValueField = "MaNamHoc";
            drDSNamHoc.DataBind();
            drDSNamHoc.Items.Insert(0, "--Chọn năm học--");
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                for (int i = 0; i < gvKhoi.Rows.Count; i++)
                {

                    GridViewRow row = gvKhoi.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        int id = int.Parse(gvKhoi.Rows[i].Cells[1].Text);
                        kBus.Delete(id);
                    }
                }
                LoadKhoi();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadAllKhoi();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvKhoi.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvKhoi.Rows)
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

        protected void gvKhoi_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            KHOILOP obj = new KHOILOP();
            GridViewRow row = gvKhoi.Rows[e.RowIndex];
            obj.TenKhoi = ((TextBox)row.Cells[2].Controls[0]).Text;
            obj.MaNamHoc = int.Parse(((TextBox)row.Cells[3].Controls[0]).Text);
            kBus.Update(obj);
            gvKhoi.EditIndex = -1;
            LoadKhoi();
        }

        protected void gvKhoi_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvKhoi.EditIndex = -1;
            LoadKhoi();
        }

        protected void drDSNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAllKhoi();
        }


    }
}