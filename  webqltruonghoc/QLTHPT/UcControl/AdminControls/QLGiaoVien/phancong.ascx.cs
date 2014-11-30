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
    public partial class phancong : System.Web.UI.UserControl
    {
        PHANCONG obj = new PHANCONG();
        PHANCONGBL pcBus = new PHANCONGBL();
        MONHOCBL mhBus = new MONHOCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                LoadNamHoc();
            }
        }

        private void LoadNamHoc()
        {
            if (drNamHoc.SelectedIndex == 0)
            {
                LoadNamHoc();
            }
            else
            {
                NAMHOCBL nhBus = new NAMHOCBL();
                drNamHoc.DataSource = nhBus.GetList();
                drNamHoc.DataTextField = "TenNamHoc";
                drNamHoc.DataValueField = "MaNamHoc";
                drNamHoc.DataBind();
                drNamHoc.Items.Insert(0, "--Chọn năm học--");
            }
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvPhancong.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvPhancong.Rows)
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

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvPhancong.Rows.Count; i++)
            {
                GridViewRow row = gvPhancong.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    int mapl = int.Parse(gvPhancong.Rows[i].Cells[1].Text);
                    pcBus.Delete(mapl);
                }
                else
                {
                    lblErr.Text = "Không có mục để xóa";
                }
                LoadDSPhanCong();
            }
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            gvPhancong.EditIndex = -1;
            LoadDSPhanCong();
        }
        protected void gvPhanlop_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int mapc = int.Parse(gvPhancong.DataKeys[e.RowIndex].Value.ToString());
            pcBus.Delete(mapc);
            LoadDSPhanCong();
        }

        protected void gvPhanlop_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Panel1.Visible = true;
            imgLuuSua.Visible = true;
            imgLuu.Visible = false;
            LoadLopThem();
            LoadDSGV();
            LoadMonhoc();
            List<PHANCONG> list = new List<PHANCONG>();
            list = pcBus.GetBySTT(int.Parse(gvPhancong.DataKeys[e.RowIndex].Value.ToString()));
            foreach (var item in list)
            {
                lblMaPC.Text = item.STT.ToString();
                drGiaoVien.SelectedValue = item.MaGiaoVien.ToString();
                drLopThemSua.SelectedValue = item.MaLop.ToString();
                drMonHoc.SelectedValue = item.MaMonHoc.ToString();
            }
            
            
        }
        private void LoadDSGV()
        {
            GIAOVIENBL gvBus = new GIAOVIENBL();
            drGiaoVien.DataSource = gvBus.GetList();
            drGiaoVien.DataTextField = "TenGiaoVien";
            drGiaoVien.DataValueField = "MaGiaoVien";
            drGiaoVien.DataBind();
            drGiaoVien.Items.Insert(0,"--Chọn giáo viên--");
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            obj.MaGiaoVien = drGiaoVien.SelectedValue;
            obj.MaLop = int.Parse(drLopThemSua.SelectedValue);
            obj.MaMonHoc = int.Parse(drMonHoc.SelectedValue);
            pcBus.Add(obj);
            LoadDSPhanCong();

        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            obj.STT = int.Parse(lblMaPC.Text);
            obj.MaGiaoVien = drGiaoVien.SelectedValue;
            obj.MaLop = int.Parse(drLopThemSua.SelectedValue);
            obj.MaMonHoc = int.Parse(drMonHoc.SelectedValue);
            pcBus.Update(obj);
            Panel1.Visible = false;
            LoadDSPhanCong();
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            drLopThemSua.SelectedIndex = 0;
            drMonHoc.SelectedIndex = 0;
            drGiaoVien.SelectedIndex = 0;
            Panel1.Visible = false;
            gvPhancong.EditIndex = -1;
            LoadDSPhanCong();
        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            LoadLopThem();
            imgLuu.Visible = true;
            imgLuuSua.Visible = false;
            drLopThemSua.SelectedValue = drLop.SelectedValue;
            LoadDSGV();
            LoadMonhoc();
            
        }

        private void LoadMonhoc()
        {
            drMonHoc.DataSource = mhBus.GetList();
            drMonHoc.DataTextField = "TenMonHoc";
            drMonHoc.DataValueField = "MaMonHoc";
            drMonHoc.DataBind();
            drMonHoc.Items.Insert(0, "--Chọn môn--");
        }

        private void LoadLopThem()
        {
            if (drKhoi.SelectedIndex == 0)
            {

                lblErr.Text = "Chọn lại lớp";
            }
            else
            {
                DSLOPBL lopBus = new DSLOPBL();
                drLopThemSua.DataSource = lopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                drLopThemSua.DataTextField = "TenLop";
                drLopThemSua.DataValueField = "MaLop";
                drLopThemSua.DataBind();
                drLopThemSua.Items.Insert(0,"--Chọn lớp--");
            }
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoi();
        }

        private void LoadKhoi()
        {
            if (drNamHoc.SelectedIndex == 0)
            {
                // drHocKy.SelectedIndex = 0;
                KHOILOPBL kBus = new KHOILOPBL();
                drKhoi.DataSource = kBus.GetList();
                drKhoi.DataTextField = "TenKhoi";
                drKhoi.DataValueField = "MaKhoi";
                drKhoi.DataBind();
                drKhoi.Items.Insert(0, "--Chọn khối--");

            }
            else
            {
                KHOILOPBL kBus = new KHOILOPBL();
                drKhoi.DataSource = kBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
                drKhoi.DataTextField = "TenKhoi";
                drKhoi.DataValueField = "MaKhoi";
                drKhoi.DataBind();
                drKhoi.Items.Insert(0, "--Chọn khối--");
            }
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadLop();
        }

        private void LoadLop()
        {
            if (drKhoi.SelectedIndex == 0)
            {

                lblErr.Text = "Chọn lại lớp";
            }
            else
            {
                DSLOPBL lopBus = new DSLOPBL();
                drLop.DataSource = lopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                drLop.DataTextField = "TenLop";
                drLop.DataValueField = "MaLop";
                drLop.DataBind();
                drLop.Items.Insert(0, "--Chọn lớp--");
            }
        }

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            LoadDSPhanCong();
        }

        private void LoadDSPhanCong()
        {
            PHANCONGBL pcBus = new PHANCONGBL();
            gvPhancong.DataSource = pcBus.GetXem(int.Parse(drLop.SelectedValue));
            gvPhancong.DataBind();
        }

       
    }
}