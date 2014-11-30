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
            
            lblErr.Text = "";
            KtraThem(false); 
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel3.Visible = false;
                Panel2.Visible = true;
                LoadGV();
            }
        }

      

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            Panel3.Visible = false;
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
            Panel2.Visible = false;
            Panel3.Visible = false;
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
            Panel3.Visible = true;
            Panel2.Visible = true;
            Panel1.Visible = false;
            txtMaGV0.Text = gvGiaoVien.Rows[e.RowIndex].Cells[1].Text;
            txtNgaySinh0.Text = gvGiaoVien.Rows[e.RowIndex].Cells[3].Text;
            txtSDT0.Text = gvGiaoVien.Rows[e.RowIndex].Cells[6].Text;
            txtTenGV0.Text = gvGiaoVien.Rows[e.RowIndex].Cells[2].Text;
            txtDiaChi0.Text = gvGiaoVien.Rows[e.RowIndex].Cells[5].Text;
         //(  (bool) (gvGiaoVien.Rows[e.RowIndex].Cells[7]));
         //   if(ktra == true)
         //   {
         //         ckChuNhiemSua.Checked = true;
         //   }
         //   else
         //   {
         //       ckChuNhiemSua.Checked =false;
         //   }
          
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
                if ((txtMaGV.Text == "") || (txtSDT.Text == "") || (txtTenGV.Text == "") || (txtNgaySinh.Text == ""))
                {
                    KtraThem(true);
                }

                if ((drGioiTinh.SelectedIndex == 0) || (drTo.SelectedIndex == 0))
                {
                    lblErr.Text = "Bạn không được để trống!";
                }
                else
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
                    obj.MaMon = int.Parse(drTo.SelectedValue);
                    gvBus.Add(obj);
                    LoadGV();
                }

            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;

            }

        }

        private void KtraThem(bool p)
        {
            if(txtNgaySinh.Text=="")
            {
                lblErrNgaySinh.Visible = p;
            }
            if(txtMaGV.Text=="")
            {
                lblErrMaGV.Visible = p;
            }
            if(txtSDT.Text=="")
            {
                lblErrSDT.Visible = p;
            }
            if(txtTenGV.Text=="")
            {
                lblErrTenGV.Visible = p;
            }
        }

        protected void imgSaveSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if ((txtMaGV0.Text == "") || (txtSDT0.Text == "") || (txtTenGV0.Text == "") || (txtNgaySinh0.Text == ""))
                {
                    KtraThem(true);
                }

                if ((drGioiTinhSua.SelectedIndex == 0) || (drToSua.SelectedIndex == 0))
                {
                    lblErr.Text = "Bạn không được để trống!";
                }
                else
                {
                    obj.MaGiaoVien = txtMaGV0.Text;
                    obj.TenGiaoVien = txtTenGV0.Text;
                    obj.DiaChi = txtDiaChi0.Text;
                    if (ckChuNhiemSua.Checked == true)
                    {
                        obj.ChuNhiem = true;
                    }
                    else
                    {
                        obj.ChuNhiem = false;
                    }

                    obj.NgaySinh = DateTime.Parse(txtNgaySinh0.Text);
                    obj.SoDienThoai = txtSDT0.Text.Trim();
                    obj.GioiTinh = drGioiTinhSua.SelectedValue;
                    obj.MaMon = int.Parse(drToSua.SelectedValue);
                    gvBus.Add(obj);
                    LoadGV();
                }
            }
            catch
            {
                lblErr.Text = "Quá trình sửa gặp lỗi. Vui lòng xem lại";
            }
        }

     
    }
}