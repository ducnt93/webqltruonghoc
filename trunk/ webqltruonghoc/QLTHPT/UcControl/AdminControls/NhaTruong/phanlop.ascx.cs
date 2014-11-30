using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT.UcControl.AdminControls.NhaTruong
{
    public partial class phanlop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblErr.Text = "";
            lblErr1.Text = "";
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                imgLuuSua.Visible = false;
                imgLuu.Visible = false;
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
            CheckBox ChkBoxHeader = (CheckBox)gvPhanlop.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvPhanlop.Rows)
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

        protected void gvPhanlop_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int malop = 0 ;
            Panel1.Visible = true;
            imgLuuSua.Visible = true;
            imgLuu.Visible = false;
            LoadDSLopThem();
            List<PHANLOP> list = new List<PHANLOP>();
            list = plBus.GetBySTT(int.Parse(gvPhanlop.DataKeys[e.RowIndex].Value.ToString()));
            txtMaPL.Text = gvPhanlop.DataKeys[e.RowIndex].Value.ToString();
            foreach (var item in list)
            {
                malop = item.MaLop;
                txtMaHS.Text = item.MaHocSinh;
            }
            drLopThemSua.SelectedValue = malop.ToString();
     

        }

        protected void gvPhanlop_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            PHANLOPBL plBus = new PHANLOPBL();
            int mapl = int.Parse(gvPhanlop.DataKeys[e.RowIndex].Value.ToString());
            plBus.Delete(mapl);
            LoadDSPhanLop();
        }

        private void LoadDSPhanLop()
        {
            PHANLOPBL plBus = new PHANLOPBL();
            gvPhanlop.DataSource = plBus.GetDSPL(int.Parse(drLop.SelectedValue));
            gvPhanlop.DataBind();
        }

        protected void drKhoi_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadDSLop();
        }

        private void LoadDSLop()
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

        protected void drLop_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            LoadDSPhanLop();
        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            imgLuu.Visible = true;
            imgLuuSua.Visible = false;
            LoadDSLopThem();
            drLopThemSua.SelectedValue = drLop.SelectedValue;
           
        }

        private void LoadDSLopThem()
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
                drLopThemSua.Items.Insert(0, "--Chọn lớp--");
            }
        }
        PHANLOP obj = new PHANLOP();
        PHANLOPBL plBus = new PHANLOPBL();
        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (txtMaHS.Text == "")
                {
                    lblErrMaHS.Text = "Bạn chưa nhập mã học sinh";
                }
                else
                {
                    obj.MaLop = int.Parse(drLop.SelectedValue);
                    obj.MaHocSinh = txtMaHS.Text;
                    List<PHANLOP> list = new List<PHANLOP>();
                    list = plBus.GetHS(txtMaHS.Text);
                    foreach (var item in list)
                    {
                        if(item.MaHocSinh == txtMaHS.Text)
                        {
                            lblErr1.Text = "Đã có học sinh này!";
                          
                        }
                        else
                        {
                            plBus.Add(obj);
                        }
                    }    
                    LoadDSPhanLop();
                }

            }
            catch
            {

                lblErr.Text += "Lỗi";
            }

        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            if (txtMaHS.Text == "")
            {
                lblErrMaHS.Text = "Bạn chưa nhập mã học sinh";
            }
            else
            {
                obj.MaHocSinh = txtMaHS.Text;
                obj.MaLop = int.Parse(drLopThemSua.SelectedValue);
                obj.STT = int.Parse(txtMaPL.Text);
                List<PHANLOP> list = new List<PHANLOP>();
                list = plBus.GetHS(txtMaHS.Text);
                //foreach (var item in list)
                //{
                //    if (item.MaHocSinh == txtMaHS.Text)
                //    {
                //        lblErr1.Text = "Đã có học sinh này!";
                //    }
                //    else
                //    {
                //        plBus.Update(obj);
                //    }
                //}    
                plBus.Update(obj);
                LoadDSPhanLop();
            }
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtMaHS.Text = "";
            lblErrMaHS.Text = "";
            Panel1.Visible = false;
            gvPhanlop.EditIndex = -1;
            LoadDSPhanLop();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvPhanlop.Rows.Count; i++)
            {
                GridViewRow row = gvPhanlop.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    int mapl = int.Parse(gvPhanlop.Rows[i].Cells[1].Text);
                    plBus.Delete(mapl);
                }
                else
                {
                    lblErr.Text = "Không có mục để xóa";
                }
            }
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            gvPhanlop.EditIndex = -1;
            LoadDSPhanLop();
        }
    }
}