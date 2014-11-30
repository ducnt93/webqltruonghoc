using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System.Text;
using System.IO;
using System.Data.OleDb;
using System.Data;
namespace QLTHPT
{
    public partial class hanhkiem : System.Web.UI.UserControl
    {
        HANHKIEM obj = new HANHKIEM();
        HANHKIEMBL hkBus = new HANHKIEMBL();
        HOCKYBL hk = new HOCKYBL();
        HOCSINHBL hsBus = new HOCSINHBL();

        protected void Page_Load(object sender, EventArgs e)
        {

            lblErr.Text = "";
            Ktra(false);
            if (!IsPostBack)
            {
                btnXuat1.Visible = false;
                Panel1.Visible = false;
                Panel2.Visible = false;
                imgThemmoi.Visible = false;
                LoadNamHoc();
                LoadHocKy();
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
        private void LoadKhoi()
        {
            KHOILOPBL kl = new KHOILOPBL();
            drKhoi.DataSource = kl.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
        }
        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvHanhKiem.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvHanhKiem.Rows)
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

        protected void gvHanhKiem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mahs = gvHanhKiem.DataKeys[e.RowIndex].Value.ToString();
                hkBus.Delete(mahs);
                LoadDSHK();
            }
            catch
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<Script language='javascript'>alert('Không xóa được! Học sinh này có trong 1 bảng khác');</Script>");
                lblErr.Text = "Lỗi không xóa được";
            }

        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadLop();
            LoadLopThem();
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


        private void LoadDSHK()
        {
            if ((drHocKy.SelectedIndex == 0) || (drLop.SelectedIndex == 0))
            {
                lblErr.Text = "Bạn cần phải chọn lớp và học kỳ";
            }
            else
            {
                gvHanhKiem.DataSource = hkBus.GetListByMaLopHK(int.Parse(drLop.SelectedValue), int.Parse(drHocKy.SelectedValue));
                gvHanhKiem.DataBind();
            }

        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvHanhKiem.Rows.Count; i++)
            {
                GridViewRow row = gvHanhKiem.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    string mahs = gvHanhKiem.Rows[i].Cells[1].Text;
                    hkBus.Delete(mahs);
                }
                else
                {
                    lblErr.Text = "Không có mục để xóa";
                }
            }
        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {
            List<HANHKIEM> emList = hkBus.GetListByMaLopHK(int.Parse(drLop.SelectedValue), int.Parse(drHocKy.SelectedValue));
            StringBuilder sb = new StringBuilder();

            if (emList.Count > 0)
            {
                string fileName = Path.Combine(Server.MapPath("~/"), "Danh sách hạnh kiểm học sinh " + drLop.SelectedItem + ".xlsx");
                string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    string strCreateTab = "Create table HanhKiemHS (" +
                        " [MaHS] nvarchar(10), " +
                        " [MaLop] nvarchar(3), " +
                        " [MaHK] nvarchar(3), " +
                        " [NgayNghiCoPhep] nvarchar(2), " +
                        " [NgayNghiKoPhep] nvarchar(2) ," +
                        " [SoLanKyLuat] nvarchar(2), " +
                        " [HanhKiem] nvarchar(30)) ";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
                    cmd.ExecuteNonQuery();

                    string strInsert = "Insert into HanhKiemHS([MaHS],[MaLop]," +
                        " [MaHK],[NgayNghiCoPhep],[NgayNghiKoPhep],[SoLanKyLuat],[HanhKiem]) values(?,?,?,?,?,?,?)";
                    OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 30);


                    foreach (var i in emList)
                    {
                        cmdIns.Parameters[0].Value = i.MaHS;
                        cmdIns.Parameters[1].Value = i.MaLop.ToString();
                        cmdIns.Parameters[2].Value = i.MaHK.ToString();
                        cmdIns.Parameters[3].Value = i.NgayNghiCoPhep.ToString();
                        cmdIns.Parameters[4].Value = i.NgayNghiKoPhep.ToString();
                        cmdIns.Parameters[5].Value = i.SoLanKyLuat.ToString();
                        cmdIns.Parameters[6].Value = i.HanhKiem;

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

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            gvHanhKiem.EditIndex = -1;
            LoadDSHK();
        }

        protected void imgThemmoi_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            imgSaveSua.Visible = false;
            imgSave.Visible = true;
            drHsThem.Visible = true;
            lblMaHS.Visible = false;
            LoadHK();
        }

        private void LoadLopThem()
        {
            try
            {
                string magv = Session["MaGiaoVien"].ToString();
                DSLOPBL ds = new DSLOPBL();
                if (magv == "Admin")
                {
                    drLopThem.DataSource = ds.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                    drLopThem.DataTextField = "TenLop";
                    drLopThem.DataValueField = "MaLop";
                    drLopThem.DataBind();
                    drLopThem.Items.Insert(0, "--Chọn lớp--");
                }
                else
                {
                    drLopThem.DataSource = ds.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
                    drLopThem.DataTextField = "TenLop";
                    drLopThem.DataValueField = "MaLop";
                    drLopThem.DataBind();
                    drLopThem.Items.Insert(0, "--Chọn lớp--");
                }
            }
            catch (Exception)
            {

                lblErr.Text = "Chưa chọn khối học!";
            }

        }

        private void LoadHK()
        {
            drHK.DataSource = hk.GetList();
            drHK.DataTextField = "TenHK";
            drHK.DataValueField = "MaHK";
            drHK.DataBind();
            drHK.Items.Insert(0, "--Chọn học kỳ--");
        }
        PHANLOPBL plBus = new PHANLOPBL();

        protected void drLopThem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drLopThem.SelectedIndex == 0)
            {
                lblErr.Text = "Chọn lại lớp để thêm";
            }
            else
            {
                drHsThem.DataSource = plBus.GetTTByMaLop(int.Parse(drLopThem.SelectedValue));
                drHsThem.DataTextField = "TenHocSinh";
                drHsThem.DataValueField = "MaHocSinh";
                drHsThem.DataBind();
                drHsThem.Items.Insert(0, "--Chọn học sinh--");
            }

        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {

            try
            {
                if (drKhoi.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn khối học ở trên!!";
                }
                if (drLopThem.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa chọn lớp";
                }

                if (drHsThem.SelectedIndex == 0)
                {
                    lblErr.Text = "Bạn chưa học sinh";
                }
                if (drHK.SelectedIndex == 0)
                {
                    lblErr.Text = "Chưa chọn học kỳ";
                }
                if (drHanhKiem.SelectedIndex == 0)
                {
                    lblErr.Text = "Vui lòng chọn hạnh kiểm cho học sinh";
                }
                else
                {
                    int count = 0;
                    Ktra(true);
                    obj.HanhKiem = drHanhKiem.SelectedValue;
                    obj.MaHS = (drHsThem.SelectedValue);
                    obj.MaLop = int.Parse(drLopThem.SelectedValue);
                    obj.NgayNghiCoPhep = Convert.ToInt32(txtNghiCoPhep.Text);
                    obj.NgayNghiKoPhep = Convert.ToInt32(txtNghiKoPhep.Text);
                    obj.SoLanKyLuat = Convert.ToInt32(txtLanKyLuat.Text);
                    obj.MaHK = int.Parse(drHK.SelectedValue);
                    List<HANHKIEM> list = new List<HANHKIEM>();
                    list = hkBus.GetListByMaHSHK(drHsThem.SelectedValue, int.Parse(drHK.SelectedValue));
                    foreach (var item in list)
                    {
                        if (drHsThem.SelectedValue == item.MaHS)
                        {
                            count = 1;
                            break;
                        }
                        else
                        {
                            count = 0;
                        }
                    }
                    if (count == 1)
                    {
                        lblErr.Text = "Đã có hạnh kiểm cho học sinh này";
                    }
                    else
                    {
                        hkBus.Add(obj);
                    }
                    Panel1.Visible = false;
                    LoadHSThemSua();
                }


            }
            catch (Exception)
            {

                lblErr.Text = "Lỗi. Vui lòng xem lại!";
            }
        }

        private void Ktra(bool p)
        {
            if (txtLanKyLuat.Text == "")
            {
                lblErrLanKL.Visible = p;
            }
            if (txtNghiCoPhep.Text == "")
            {
                lblErrNghiCoPhep.Visible = p;
            }
            if (txtNghiKoPhep.Text == "")
            {
                lblErrNghiKoPhep.Visible = p;
            }
        }

        private void LoadHSThemSua()
        {
            gvHanhKiem.DataSource = hkBus.GetListByMaLopHK(int.Parse(drLopThem.SelectedValue), int.Parse(drHK.SelectedValue));
            gvHanhKiem.DataBind();
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {

            txtLanKyLuat.Text = "";
            txtNghiCoPhep.Text = "";
            txtNghiKoPhep.Text = "";
            Panel1.Visible = false;
        }

        protected void btnLDS_Click(object sender, EventArgs e)
        {
            try
            {
                Panel2.Visible = true;
                btnXuat1.Visible = true;
                imgThemmoi.Visible = true;
                LoadDSHK();
                lblHocKy.Text = drHocKy.SelectedItem.ToString();
                lblLop.Text = drLop.SelectedItem.ToString();
            }
            catch (Exception)
            {

                lblErr.Text = "Lỗi";
            }
        }

        protected void imgSaveSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Ktra(true);
                obj.HanhKiem = drHanhKiem.SelectedValue;
                obj.MaHK = int.Parse(drHK.SelectedValue);
                obj.MaHS = lblMaHS.Text;
                obj.MaLop = int.Parse(drLopThem.SelectedValue);
                obj.NgayNghiCoPhep = int.Parse(txtNghiCoPhep.Text);
                obj.NgayNghiKoPhep = int.Parse(txtNghiKoPhep.Text);
                obj.SoLanKyLuat = int.Parse(txtLanKyLuat.Text);
                hkBus.Update(obj);
                Panel1.Visible = false;
                LoadHSThemSua();
            }
            catch (Exception ex)
            {

                lblErr.Text = "Lỗi" + ex;
            }
        }

        protected void gvHanhKiem_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Panel1.Visible = true;
            imgSave.Visible = false;
            drHsThem.Visible = false;
            lblMaHS.Visible = true;
            imgSaveSua.Visible = true;
            LoadHK();
            LoadLopThem();
            lblMaHS.Text = gvHanhKiem.Rows[e.RowIndex].Cells[1].Text;
            txtLanKyLuat.Text = gvHanhKiem.Rows[e.RowIndex].Cells[7].Text;
            txtNghiCoPhep.Text = gvHanhKiem.Rows[e.RowIndex].Cells[5].Text;
            txtNghiKoPhep.Text = gvHanhKiem.Rows[e.RowIndex].Cells[6].Text;
            drLopThem.SelectedValue = drLop.SelectedValue;
            drHK.SelectedValue = drHocKy.SelectedValue;
            gvHanhKiem.EditIndex = -1;

        }

        protected void drLop_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}