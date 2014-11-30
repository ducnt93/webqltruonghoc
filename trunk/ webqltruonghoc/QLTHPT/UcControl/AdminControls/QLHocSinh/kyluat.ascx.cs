using QLTHPT1.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Text;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class kyluat : System.Web.UI.UserControl
    {
        KYLUAT obj = new KYLUAT();
        KYLUATBL klBus = new KYLUATBL();
        HOCSINHBL hsBus = new HOCSINHBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Ktra(false);
            lblErr.Text = "";

            if (!IsPostBack)
            {
                imgThemMoi.Visible = false;
                Panel2.Visible = false;
                btnXuat0.Visible = false;
                Panel1.Visible = false;
               // LoadDS();
                LoadNamHoc();
            }
        }

        private void Ktra(bool p)
        {
            if (txtHinhThuc.Text == "")
            {
                lblErrHThuc.Visible = p;
            }
            if (txtNgayKyLuat.Text == "")
            {
                lblErrNgayKhen.Visible = p;
            }
            if (txtND.Text == "")
            {
                lblErrNoiDug.Visible = p;
            }
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
        private void LoadKhoiThem()
        {
            KHOILOPBL kl = new KHOILOPBL();
            drKhoi1.DataSource = kl.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi1.DataTextField = "TenKhoi";
            drKhoi1.DataValueField = "MaKhoi";
            drKhoi1.DataBind();
            drKhoi1.Items.Insert(0, "--Chọn khối--");
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
        protected void ckAll_CheckedChanged1(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvKyLuat.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvKyLuat.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("ckItem");
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

        protected void imgSua_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            gvKyLuat.EditIndex = -1;
            LoadDS();
        }

        private void LoadDS()
        {
            gvKyLuat.DataSource = klBus.GetList();
            gvKyLuat.DataBind();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvKyLuat.Rows.Count; i++)
            {
                GridViewRow row = gvKyLuat.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    string mamh = gvKyLuat.Rows[i].Cells[1].Text;
                    klBus.Delete(mamh);
                }
                else
                {
                    lblErr.Text = "Không có mục để xóa";
                }
            }
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadLop();
        }

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                Panel2.Visible = true;
                imgThemMoi.Visible = true;
                btnXuat0.Visible = true;
                lblKhoi.Text = drKhoi.SelectedItem.ToString();
                lblLop.Text = drLop.SelectedItem.ToString();
                LoadDSKLByLop();

            }
            catch (Exception)
            {

                lblErr.Text = "Không có học sinh nào hoặc gặp lỗi khác!";
            }

        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {
            List<KYLUAT> emList = klBus.GetByLop(int.Parse(drLop.SelectedValue));
            StringBuilder sb = new StringBuilder();

            if (emList.Count > 0)
            {
                string fileName = Path.Combine(Server.MapPath("~/"), "Danh sách học sinh kỷ luật " + drLop.SelectedItem + ".xlsx");
                string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    string strCreateTab = "Create table HSKyLuat (" +
                        " [KhoiHoc] nvarchar(3), " +
                        " [HocSinh] nvarchar(10), " +
                        " [Lop] nvarchar(2), " +
                        " [HinhThucKyLuat] nvarchar(50), " +
                        " [NgayKyLuat] nvarchar(2) ," +
                        " [NoiDung] nvarchar(200)) ";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
                    cmd.ExecuteNonQuery();

                    string strInsert = "Insert into HSKyLuat([KhoiHoc],[HocSinh]," +
                        " [Lop],[HinhThucKyLuat],[NgayKyLuat],[NoiDung]) values(?,?,?,?,?,?)";
                    OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 200);

                    foreach (var i in emList)
                    {
                        cmdIns.Parameters[0].Value = i.KhoiHoc.ToString();
                        cmdIns.Parameters[1].Value = i.Lop.ToString();
                        cmdIns.Parameters[2].Value = i.HocSinh;
                        cmdIns.Parameters[3].Value = i.HinhThucKyLuat;
                        cmdIns.Parameters[4].Value = i.NgayKyLuat.ToString();
                        cmdIns.Parameters[5].Value = i.NoiDung;

                        cmdIns.ExecuteNonQuery();
                    }
                }

                // Create Downloadable file
                byte[] content = File.ReadAllBytes(fileName);
                HttpContext context = HttpContext.Current;

                context.Response.BinaryWrite(content);
                context.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                context.Response.AppendHeader("Content-Disposition", "attachment; filename=Parameter.xlsx");
                Context.Response.End();
            }
        }

        protected void gvKyLuat_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mahs = gvKyLuat.DataKeys[e.RowIndex].Value.ToString();
            klBus.Delete(mahs);
            LoadDSKLByLop();
        }

        private void LoadDSKLByLop()
        {
            gvKyLuat.DataSource = klBus.GetByLop(int.Parse(drLop.SelectedValue));
            gvKyLuat.DataBind();
            if (gvKyLuat.PageCount == 0)
            {
                lblErr.Text = "Lớp này không có học sinh nào.";
            }
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                if ((drHS.SelectedIndex == 0))
                {
                    lblErr.Text = "Bạn chưa chọn học sinh ";
                }
                if ((drKhoi1.SelectedIndex == 0))
                {
                    lblErr.Text = "Bạn chưa chọn khối lớp học ";
                }
                if (drLop1.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn lớp học";
                }
                else
                {
                    Ktra(true);
                    obj.HinhThucKyLuat = txtHinhThuc.Text;
                    obj.HocSinh = drHS.SelectedValue;
                    obj.KhoiHoc = int.Parse(drKhoi1.SelectedValue);
                    obj.Lop = int.Parse(drLop1.SelectedValue);
                    obj.NgayKyLuat = DateTime.Parse(txtNgayKyLuat.Text);
                    obj.NoiDung = txtND.Text;
                  //  List<KYLUAT> list
                    klBus.Add(obj);
                    Panel1.Visible = false;
                    LoadDSKLByLop();
                }
            }
            catch (Exception)
            {

                lblErr.Text = "Lỗi";
            }
        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Ktra(true);
                obj.NoiDung = txtND.Text;
                obj.NgayKyLuat = DateTime.Parse(txtNgayKyLuat.Text);
                obj.KhoiHoc = int.Parse(drKhoi1.SelectedValue);
                obj.Lop = int.Parse(drLop1.SelectedValue);
                obj.HocSinh = lblMaHS.Text;
                obj.HinhThucKyLuat = txtHinhThuc.Text;
                klBus.Update(obj);
                LoadDSKLByLop();
                Panel1.Visible = false;
            }
            catch (Exception ex)
            {

                lblErr.Text = "Lỗi" + ex.Message;
            }
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtNgayKyLuat.Text = "";
            txtND.Text = "";
            txtHinhThuc.Text = "";
            Panel1.Visible = false;
        }

        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            imgLuuSua.Visible = false;
            imgLuu.Visible = true;
            lblMaHS.Visible = false;
            drHS.Visible = true;
            LoadKhoiThem();
        }

        protected void drKhoi1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLopThem();
        }

        private void LoadLopThem()
        {
            string magv = Session["MaGiaoVien"].ToString();
            DSLOPBL ds = new DSLOPBL();
            if (magv == "Admin")
            {
                drLop1.DataSource = ds.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                drLop1.DataTextField = "TenLop";
                drLop1.DataValueField = "MaLop";
                drLop1.DataBind();
                drLop1.Items.Insert(0, "--Chọn lớp--");
            }
            else
            {
                drLop1.DataSource = ds.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
                drLop1.DataTextField = "TenLop";
                drLop1.DataValueField = "MaLop";
                drLop1.DataBind();
                drLop1.Items.Insert(0, "--Chọn lớp--");
            }
        }
        PHANLOPBL plBus = new PHANLOPBL();
        protected void drLop1_SelectedIndexChanged(object sender, EventArgs e)
        {
            drHS.DataSource = plBus.GetTTByMaLop(int.Parse(drLop1.SelectedValue));
            drHS.DataTextField = "TenHocSinh";
            drHS.DataValueField = "MaHocSinh";
            drHS.Items.Insert(0, "--Chọn--");
            drHS.DataBind();
        }

        protected void gvKyLuat_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Panel1.Visible = true;
            imgLuu.Visible = false;
            imgLuuSua.Visible = true;
            drLop1.SelectedValue = drLop.SelectedValue;
            LoadKhoiThem();
            drKhoi1.SelectedValue = drKhoi.SelectedValue;         
            drHS.Visible = false;
            lblMaHS.Visible = true;
            lblMaHS.Text = gvKyLuat.Rows[e.RowIndex].Cells[1].Text.ToString();
            txtHinhThuc.Text = gvKyLuat.Rows[e.RowIndex].Cells[3].Text.ToString();
            txtND.Text = gvKyLuat.Rows[e.RowIndex].Cells[5].Text.ToString();
            txtNgayKyLuat.Text = gvKyLuat.Rows[e.RowIndex].Cells[4].Text.ToString();                 
            gvKyLuat.EditIndex = -1;
        }
    }
}