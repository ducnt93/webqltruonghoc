using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.QLNguoiDung
{
    public partial class nhomnguoidung : System.Web.UI.UserControl
    {
        LOAINGUOIDUNGBL lndBus = new LOAINGUOIDUNGBL();
        LOAINGUOIDUNG lnd = new LOAINGUOIDUNG();
        GIAOVIENBL gvBus = new GIAOVIENBL();
        QUANTRIBL qtBus = new QUANTRIBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;

            if(!IsPostBack)
            {
                lblErr.Text = "";
                vldten.EnableClientScript = false;
                LoadAllND();
            }
        }

        private void LoadAllND()
        {
            gvLoaiND.DataSource = lndBus.GetList();
            gvLoaiND.DataBind();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvLoaiND.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvLoaiND.Rows)
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

        protected void gvLoaiND_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLoaiND.EditIndex = -1;
            LoadAllND();
        }

        protected void gvLoaiND_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int malnd = int.Parse(gvLoaiND.DataKeys[e.RowIndex].Value.ToString());
                lndBus.Delete(malnd);
                LoadAllND();
            }
            catch
            {

                lblErr.Text = "Lỗi. Không xóa được do tồn tài khóa ngoại";
            }
        }

        protected void gvLoaiND_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvLoaiND.EditIndex = e.NewEditIndex;
                LoadAllND();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvLoaiND_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string mal = gvLoaiND.DataKeys[e.RowIndex].Value.ToString();
                GridViewRow row = gvLoaiND.Rows[e.RowIndex];
                lnd.TenLoaiND = ((TextBox)row.Cells[4].Controls[0]).Text;
                DropDownList dr = ((DropDownList)(row.Cells[3].Controls[0]));              
                dr.Items.Insert(0,"Admin");
                dr.Items.Insert(1, "GV");
                lnd.MaLoaiND = dr.SelectedValue;
                lnd.MaGiaoVien = ((TextBox)(row.Cells[2].Controls[0])).Text.Trim() ;
                lnd.MaND = int.Parse(mal);
                lndBus.Update(lnd);
                gvLoaiND.EditIndex = -1;
                LoadAllND();
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
                for (int i = 0; i < gvLoaiND.Rows.Count; i++)
                {

                    GridViewRow row = gvLoaiND.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        int id = int.Parse(gvLoaiND.Rows[i].Cells[1].Text);
                        lndBus.Delete(id);
                    }
                }
                LoadAllND();
            }
            catch (Exception)
            {
                
                lblErr.Text = "Không xóa được! Tài khoản này đã được sử dụng. Xóa quyền trong mục quản trị trước khi xóa";
            }
            
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadAllND();
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            if((drGV.SelectedIndex==0)  || (drND.SelectedIndex==0))
            {
                lblErr.Text = "Bạn phải chọn đầy đủ thông tin!";
            }
            else
            {
                try
                {
                    vldten.EnableClientScript = true;
                    lnd.MaLoaiND = drLoai.SelectedValue;
                    lnd.TenLoaiND = txtTenLoai.Text;
                    lnd.MaND = int.Parse(drND.SelectedValue);
                    lnd.MaGiaoVien = drGV.SelectedValue;
                    lndBus.Add(lnd);
                    LoadAllND();
                }
                catch (Exception)
                {

                    lblErr.Text = "Lỗi";
                }
              
            }
        
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadAllND();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            LoadND();
            LoadGV();
        }

        private void LoadND()
        {
            drND.DataSource = qtBus.GetList();
            drND.DataTextField = "TenDNhap";
            drND.DataValueField = "MaND";
            drND.DataBind();
            drND.Items.Insert(0, "--Chọn theo tên đăng nhập--");
            
        }

        private void LoadGV()
        {
            drGV.DataSource = gvBus.GetList();
            drGV.DataTextField = "TenGiaoVien";
            drGV.DataValueField = "MaGiaoVien";
            drGV.DataBind();
            drGV.Items.Insert(0, "--Chọn giáo viên--");
        }
    }
}