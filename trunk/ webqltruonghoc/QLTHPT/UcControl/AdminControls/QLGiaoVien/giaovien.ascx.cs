using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.QLGiaoVien
{
    public partial class giaovien : System.Web.UI.UserControl
    {
        GIAOVIEN obj = new GIAOVIEN();
        GIAOVIENBL gvBus = new GIAOVIENBL();
        TOBOMONBL tmBus = new TOBOMONBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            lblErr.Text = "";
            if (!IsPostBack)
            {
                LoadGV();
                LoadTo();

            }
        }

        private void LoadTo()
        {
            try
            {
                drToGiaoVien.DataSource = tmBus.GetList();
                drToGiaoVien.DataTextField = "TenToBoMon";
                drToGiaoVien.DataValueField = "MaTo";
                drToGiaoVien.DataBind();
                drToGiaoVien.Items.Insert(0, "--Chọn tổ bộ môn--");

            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            gvGiaoVien.EditIndex = -1;
            LoadGV();
        }

        private void LoadGV()
        {
            gvGiaoVien.DataSource = gvBus.GetList();
            gvGiaoVien.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            LoadToMon();
        }

        private void LoadToMon()
        {
            try
            {
                drTo.DataSource = tmBus.GetList();
                drTo.DataTextField = "TenToBoMon";
                drTo.DataValueField = "MaTo";
                drTo.DataBind();
                drTo.Items.Insert(0, "[- Chọn tổ - ]");
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvGiaoVien.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvGiaoVien.Rows)
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

        protected void gvGiaoVien_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string magv = gvGiaoVien.DataKeys[e.RowIndex].Value.ToString();
                gvBus.Delete(magv);
                LoadGV();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvGiaoVien_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvGiaoVien.EditIndex = e.NewEditIndex;
            LoadGV();

        }

        protected void gvGiaoVien_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = gvGiaoVien.Rows[e.RowIndex];
                string magv = gvGiaoVien.DataKeys[e.RowIndex].Value.ToString();
                obj.MaGiaoVien = magv;
                // obj.MaGiaoVien = ((TextBox)(row.Cells[1].Controls[0])).Text;
                obj.TenGiaoVien = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.GioiTinh = ((TextBox)row.Cells[4].Controls[0]).Text;
                obj.NgaySinh = DateTime.Parse(((TextBox)(row.Cells[3].Controls[0])).Text);
                obj.DiaChi = ((TextBox)(row.Cells[5].Controls[0])).Text;
                obj.SoDienThoai = ((TextBox)(row.Cells[6].Controls[0])).Text;
                obj.MaTo = int.Parse(((TextBox)(row.Cells[7].Controls[0])).Text);
               bool ck = ((CheckBox)(row.Cells[8].Controls[0])).Checked;
               
                if(ck == true)
                {
                    obj.ChuNhiem = true;
                }
                else
                {
                    obj.ChuNhiem = false;
                }
                gvBus.Update(obj);
                //Reset the edit index.
                gvGiaoVien.EditIndex = -1;

                //Bind data to the GridView control.
                LoadGV();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvGiaoVien_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvGiaoVien.EditIndex = -1;
            LoadGV();
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadGV();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvGiaoVien.Rows.Count; i++)
            {
                
                GridViewRow row = gvGiaoVien.Rows[i];
                bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                if (isChecked)
                {
                   
                    string id = (gvGiaoVien.Rows[i].Cells[1].Text);
                    gvBus.Delete(id);
                }
            }
            LoadGV();
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                obj.MaGiaoVien = txtMaGV.Text;
                obj.TenGiaoVien = txtTenGV.Text;
                obj.DiaChi = txtDiaChi.Text;
                if (ckChuNhiem.Checked == true)
                {
                    obj.ChuNhiem = true;
                }
                else
                {
                    obj.ChuNhiem = false;
                }

                obj.NgaySinh = DateTime.Parse(txtNgaySinh.Text);
                obj.SoDienThoai = txtSDT.Text.Trim();
                obj.GioiTinh = drGioiTinh.SelectedValue;
                obj.MaTo = int.Parse(drTo.SelectedValue);
                gvBus.Add(obj);
                LoadGV();
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;

            }

        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drToGiaoVien.SelectedIndex == 0)
            {
                LoadGV();
            }
            else
            {
                gvGiaoVien.DataSource = gvBus.GetByMaTo(int.Parse(drToGiaoVien.SelectedValue));
                gvGiaoVien.DataBind();
            }


        }
    }
}