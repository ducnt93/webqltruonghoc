using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
using System.Text;
using System.IO;
using System.Data.OleDb;
using System.Data;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class dslop : System.Web.UI.UserControl
    {
        DSLOPBL dsBus = new DSLOPBL();
        DSLOP obj = new DSLOP();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErr.Text = "";
            lblErr1.Text = "";
            lblErrTenLop.Visible = false;
            lblErrSiSo.Visible = false;

            if (!IsPostBack)
            {
                imgLuu.Visible = false;
                imgLuuSua.Visible = false;
                Panel1.Visible = false;
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
            CheckBox ChkBoxHeader = (CheckBox)gvLop.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvLop.Rows)
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

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadDSLop();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                for (int i = 0; i < gvLop.Rows.Count; i++)
                {

                    GridViewRow row = gvLop.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        int id = int.Parse(gvLop.Rows[i].Cells[1].Text);
                        dsBus.Delete(id);
                    }
                }
                LoadNamHoc();

            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int count = 0;
                if ((drKhoiLop.SelectedIndex == 0))
                {
                    lblErr.Text = "Bạn chưa chọn khối học hoặc chủ nhiệm lớp";
                }
                if (txtSiso.Text == "")
                {
                    lblErrSiSo.Visible = true;
                }
                if (txtTenLop.Text == "")
                {
                    lblErrTenLop.Visible = true;
                }
                else
                {
                    DSLOP obj = new DSLOP();
                    DSLOPBL dsBus = new DSLOPBL();
                    obj.MaKhoi = int.Parse(drKhoiLop.SelectedValue);
                    obj.MoTaKhac = txtMoTa.Text;
                    obj.SiSo = int.Parse(txtSiso.Text);
                    obj.TenLop = txtTenLop.Text;
                    List<DSLOP> list = new List<DSLOP>();
                    list = dsBus.GetByMaKhoiKtra(int.Parse(drKhoi.SelectedValue),txtTenLop.Text);
                    foreach (var item in list)
                    {
                        if(item.TenLop == txtTenLop.Text)
                        {
                            count = 1;
                            break;
                        }
                        else
                        {
                            count = 0;
                        }
                    }
                    if(count ==1)
                    {
                        lblErr1.Text = "Đã có lớp này";
                    }
                    else
                    {
                        dsBus.Add(obj);
                    }
                   
                    LoadDSLop();
                    Panel1.Visible = false;
                }

            }
            catch (Exception ex)
            {
                lblErr.Text = "Lỗi xảy ra trong quá trình thêm mới" + ex.Message;
            }

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtTenLop.Text = "";
            txtSiso.Text = "";
            txtMoTa.Text = "";
            Panel1.Visible = false;
            LoadDSLop();
        }

        private void LoadDSLop()
        {
            if (drKhoi.SelectedIndex == 0)
            {
                lblErr.Text = "Chọn khối cụ thể!";
            }
            else
            {
                DSLOPBL lopBus = new DSLOPBL();
                gvLop.DataSource = lopBus.GetByMaKhoiXem(int.Parse(drKhoi.SelectedValue));
                gvLop.DataBind();
            }

        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            imgLuu.Visible = true;
            LoadKhoiLop();
           // LoadChuNhiem();
        }

        //private void LoadChuNhiem()
        //{
        //    GIAOVIENBL gvbus = new GIAOVIENBL();
        //    drChuNhiem.DataSource = gvbus.GetList();
        //    drChuNhiem.DataTextField = "TenGiaoVien";
        //    drChuNhiem.DataValueField = "MaGiaoVien";
        //    drChuNhiem.DataBind();
        //    drChuNhiem.Items.Insert(0, "--Chọn giáo viên--");
        //}

        private void LoadKhoiLop()
        {
            KHOILOPBL khoiBus = new KHOILOPBL();
            drKhoiLop.DataSource = khoiBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoiLop.DataTextField = "TenKhoi";
            drKhoiLop.DataValueField = "MaKhoi";
            drKhoiLop.DataBind();
            drKhoiLop.Items.Insert(0, "--Chọn khối--");
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            // LoadHocKy();
            LoadKhoi();
        }





        protected void drHocKy_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void drKhoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDSLop();
            Panel1.Visible = false;
        }

        protected void gvLop_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Panel1.Visible = true;
                lblMaLop.Visible=true;
                imgLuuSua.Visible = true;
                LoadKhoiLop();
                int ma = int.Parse(gvLop.DataKeys[e.RowIndex].Value.ToString());
                List<DSLOP> list = new List<DSLOP>();
                list = dsBus.GetByMaLop(ma);
                foreach (var item in list)
                {
                    lblMaLop.Text = item.MaLop.ToString();
                    txtSiso.Text = item.SiSo.ToString();
                    txtMoTa.Text = item.MoTaKhac;
                    txtTenLop.Text = item.TenLop;
                    drKhoiLop.SelectedValue = item.MaKhoi.ToString() ;
                }

                //gvLop.EditIndex = -1;
                LoadDSLop();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvLop_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DSLOPBL lopBus = new DSLOPBL();
            imgLuuSua.Visible = true;
            int malop = int.Parse(gvLop.DataKeys[e.RowIndex].Value.ToString());
            lopBus.Delete(malop);
            LoadDSLop();
        }

        protected void gvLop_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLop.EditIndex = -1;
            LoadDSLop();
        }

        protected void gvLop_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLop.EditIndex = e.NewEditIndex;
            LoadDSLop();
        }

        protected void drKhoiLop_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void drChuNhiem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnExxport_Click(object sender, EventArgs e)
        {


            List<DSLOP> emList = dsBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            StringBuilder sb = new StringBuilder();

            if (emList.Count > 0)
            {
                string fileName = Path.Combine(Server.MapPath("~/"), drKhoi.SelectedItem.ToString() + ".xlsx");
                string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    string strCreateTab = "Create table DSLop (" +
                        " [MaLop] nvarchar(10), " +
                        " [TenLop] nvarchar(50), " +
                        " [SiSo] nvarchar(10), " +
                          " [MaGiaoVien] nvarchar(10), " +
                        " [MoTaKhac] nvarchar(200) )";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
                    cmd.ExecuteNonQuery();

                    string strInsert = "Insert into DSLop([MaLop],[TenLop]," +
                        " [SiSo],[MaGiaoVien],[MoTaKhac]) values(?,?,?,?,?)";
                    OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 50);
                    // cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 200);

                    foreach (var i in emList)
                    {
                        cmdIns.Parameters[0].Value = (i.MaLop);
                        cmdIns.Parameters[1].Value = i.TenLop;
                        //  cmdIns.Parameters[2].Value = (i.MaKhoi);
                        cmdIns.Parameters[2].Value = (i.SiSo);
                        cmdIns.Parameters[3].Value = i.MaGiaoVien;
                        cmdIns.Parameters[4].Value = i.MoTaKhac;
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

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                //int count = 0;
                obj.MaLop = int.Parse(lblMaLop.Text);
                obj.TenLop = txtTenLop.Text;
                obj.MaKhoi = int.Parse(drKhoiLop.SelectedValue);
                obj.SiSo = int.Parse(txtSiso.Text);
                obj.MoTaKhac = txtMoTa.Text;
                List<DSLOP> list = new List<DSLOP>();
                list = dsBus.GetByMaKhoiKtra(int.Parse(drKhoi.SelectedValue), txtTenLop.Text);
                //foreach (var item in list)
                //{
                //    if (item.TenLop == txtTenLop.Text)
                //    {
                //        count = 1;
                //        break;
                //    }
                //    else
                //    {
                //        count = 0;
                //    }
                //}
                //if (count == 1)
                //{
                //    lblErr1.Text = "Đã có lớp này";
                //}
                //else
                //{
                //    dsBus.Update(obj);
                //}
                dsBus.Update(obj);
                LoadDSLop();
                Panel1.Visible = false;
            }
            catch 
            {

                lblErr.Text = "Lỗi trong quá trình update. kiểm tra lại!" ;
            }
         

        }

    }
}