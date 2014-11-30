using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class thoikhoabieu : System.Web.UI.UserControl
    {
        THOIKHOABIEUBL tkbBus = new THOIKHOABIEUBL();
        HOCKYBL hk = new HOCKYBL();
        THOIKHOABIEU obj = new THOIKHOABIEU();
        protected void Page_Load(object sender, EventArgs e)
        {

            lblErr.Text = "";
            Ktra(false);
            if (!IsPostBack)
            {
                Panel2.Visible = false;
                Panel1.Visible = false;
                LoadNamHoc();
                LoadHocKy();
            }
        }

        private void Ktra(bool p)
        {
           
            if (txtT1.Text == "")
            {
                lblErrTiet1.Visible = p;
            }
            if (txtT2.Text == "")
            {
                lblErrTiet2.Visible = p;
            }
            if (txtTuNgay.Text == "")
            {
                lblErrTuNgay.Visible = p;
            }
            if (txtDenNgay.Text == "")
            {
                lblErrDenNgay.Visible = p;
            }

        }

        private void LoadHocKy()
        {
            drHocKy.DataSource = hk.GetList();
            drHocKy.DataTextField = "TenHK";
            drHocKy.DataValueField = "MaHK";
            drHocKy.DataBind();
            drHocKy.Items.Insert(0, "--Chọn học kỳ--");
        }

        private void LoadNamHoc()
        {
            NAMHOCBL nh = new NAMHOCBL();
            drNamHoc.DataSource = nh.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }

        private void LoadAllDS()
        {
            gvTKB.DataSource = tkbBus.GetList();
            gvTKB.DataBind();
        }

        protected void gvTKB_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int mahs = int.Parse(gvTKB.DataKeys[e.RowIndex].Value.ToString());
            tkbBus.Delete(mahs);
            LoadDSByLopVaHK();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ckHeader = ((CheckBox)gvTKB.HeaderRow.FindControl("ckAll"));
            foreach (GridViewRow row in gvTKB.Rows)
            {
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ckHeader.Checked == true)
                {
                    ck.Checked = true;
                }
                else
                {
                    ck.Checked = false;
                }
            }
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvTKB.Rows.Count; i++)
            {
                GridViewRow row = gvTKB.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    int matkb = int.Parse(gvTKB.Rows[i].Cells[1].Text);
                    tkbBus.Delete(matkb);
                    LoadDSByLopVaHK();
                }
                else
                {
                    lblErr.Text = "Không có mục để xóa";
                }
            }
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            gvTKB.EditIndex = -1;
            LoadDSByLopVaHK();
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        private void LoadKhoi()
        {
            KHOILOPBL kl = new KHOILOPBL();
            drKhoi.DataSource = kl.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadLop();
        }

        private void LoadLop()
        {
            string magv = Session["MaGiaoVien"].ToString();
            DSLOPBL ds = new DSLOPBL();
            if (magv == "Admin")
            {
                drLop.DataSource = ds.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                drLop.DataTextField = "TenLop";
                drLop.DataValueField = "MaLop";
                drLop.DataBind();
                drLop.Items.Insert(0, "--Chọn lớp--");
            }
            else
            {
                drLop.DataSource = ds.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
                drLop.DataTextField = "TenLop";
                drLop.DataValueField = "MaLop";
                drLop.DataBind();
                drLop.Items.Insert(0, "--Chọn lớp--");
            }
        }

        protected void btnLDS_Click(object sender, EventArgs e)
        {
            try
            {
                Panel2.Visible = true;
                lblLop.Text = drLop.SelectedItem.ToString() ;
                lblHocKy.Text = drHocKy.SelectedIndex.ToString();
                LoadDSByLopVaHK();
            }
            catch (Exception ex)
            {
                
                lblErr.Text="Lỗi" + ex.Message;
            }
           
        }

        private void LoadDSByLopVaHK()
        {
            gvTKB.DataSource = tkbBus.GetByMaLopVaHK(int.Parse(drLop.SelectedValue), int.Parse(drHocKy.SelectedValue));
            gvTKB.DataBind();
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Ktra(true);
                obj.DenNgay = DateTime.Parse(txtDenNgay.Text);
                obj.TuNgay = DateTime.Parse(txtTuNgay.Text);
                obj.Tiet1 = txtT1.Text;
                obj.Tiet2 = txtT2.Text;
                obj.Tiet3 = txtT3.Text;
                obj.Tiet4 = txtT4.Text;
                obj.Tiet5 = txtT5.Text;
                obj.MaHK = int.Parse(drHK.SelectedValue);
                obj.MaLop = int.Parse(drLopThem.SelectedValue);
                obj.TenThu = drNgay.SelectedItem.ToString();
                tkbBus.Add(obj);
                Panel1.Visible = false;
                LoadDSByLopVaHK();

            }
            catch (Exception ex)
            {

                lblErr.Text = "Vui lòng chọn đầy đủ thông tin" + ex.Message ;
            }
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            
            txtT1.Text = "";
            txtT2.Text = "";
            txtT3.Text = "";
            txtT4.Text = "";
            txtT5.Text = "";
            txtDenNgay.Text = "";
            txtTuNgay.Text = "";
            Panel1.Visible = false;

        }

        protected void imgSaveSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                obj.DenNgay = Convert.ToDateTime(txtDenNgay.Text);
                obj.MaHK = int.Parse(drHK.SelectedValue);
                obj.MaLop = int.Parse(drLopThem.SelectedValue);
                obj.MaTKB = int.Parse(lblTKB.Text);
                obj.TenThu = drNgay.SelectedItem.ToString() ;
                obj.Tiet1 = txtT1.Text;
                obj.Tiet2 = txtT2.Text;
                obj.Tiet3 = txtT3.Text;
                obj.Tiet4 = txtT4.Text;
                obj.Tiet5 = txtT5.Text;
                obj.TuNgay = Convert.ToDateTime(txtTuNgay.Text);
                tkbBus.Update(obj);
                Panel1.Visible = false;
                LoadDSByLopVaHK();
            }
            catch (Exception ex)
            {

                lblErr.Text = "Lỗi" + ex.Message;
            }
        }

        protected void imgThemmoi_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Panel1.Visible = true;
                imgSaveSua.Visible = false;
                imgSave.Visible = true;
                LoadHocKyThem();
                lblTKB.Visible = false;
                LoadLopThem();
            }
            catch (Exception)
            {
                
               lblErr.Text="Lỗi";
            }
           
        }

        private void LoadHocKyThem()
        {
            try
            {
                DSLOPBL ds = new DSLOPBL();
                drLopThem.DataSource = ds.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                drLopThem.DataTextField = "TenLop";
                drLopThem.DataValueField = "MaLop";
                drLopThem.DataBind();
                drLopThem.Items.Insert(0, "--Chọn lớp--");
            }
            catch (Exception)
            {
                
                lblErr.Text="Chưa chọn khối ở trên! Vui lòng chọn";
            }
         
        }

        private void LoadLopThem()
        {
            drHK.DataSource = hk.GetList();
            drHK.DataTextField = "TenHK";
            drHK.DataValueField = "MaHK";
            drHK.DataBind();
            drHK.Items.Insert(0, "--Chọn học kỳ--");
        }
    
        protected void gvTKB_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Panel1.Visible = true;
                imgSave.Visible = false;
                imgSaveSua.Visible = true;
                LoadHocKyThem();
                LoadLopThem();
                lblTKB.Visible = true;
                txtT1.Text = gvTKB.Rows[e.RowIndex].Cells[3].Text.ToString();
                txtT2.Text = gvTKB.Rows[e.RowIndex].Cells[4].Text.ToString();
                txtT3.Text = gvTKB.Rows[e.RowIndex].Cells[5].Text.ToString();
                txtT4.Text = gvTKB.Rows[e.RowIndex].Cells[6].Text.ToString();
                txtT5.Text = gvTKB.Rows[e.RowIndex].Cells[7].Text.ToString();
                txtDenNgay.Text = gvTKB.Rows[e.RowIndex].Cells[9].Text;
                txtTuNgay.Text = gvTKB.Rows[e.RowIndex].Cells[8].Text;
                lblTKB.Text = gvTKB.Rows[e.RowIndex].Cells[1].Text;
                gvTKB.EditIndex = -1;
            }
            catch (Exception ex)
            {
                
                lblErr.Text = ex.Message;
            }
          
            
        }




    }
}