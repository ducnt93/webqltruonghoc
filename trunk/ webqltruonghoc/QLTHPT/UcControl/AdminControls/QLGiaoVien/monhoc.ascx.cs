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
    public partial class monhoc : System.Web.UI.UserControl
    {
        MONHOC obj = new MONHOC();
        MONHOCBL mhBus = new MONHOCBL();
        TOBOMONBL tmBus = new TOBOMONBL();
        THOIKHOABIEUBL tkbBus = new THOIKHOABIEUBL();
        protected void Page_Load(object sender, EventArgs e)
        {

            lblErr.Text = "";
            KtraThem(false);
            KtraSua(false);
            if (!IsPostBack)
            {  
                Panel1.Visible = false;
                Panel2.Visible = false;
                LoadAllDSMon();
                LoadTo();
            }
        }

        private void KtraSua(bool p)
        {
            if(txtTenMon0.Text=="")
            {
                lblErrTenMSua.Visible = p;
            }
            if (txtSoTiet0.Text == "")
            {
               lblErrSoTSua.Visible = p;
            }
            if (txtHeSo0.Text == "")
            {
               lblErrHSSua.Visible = p;
            }
        }

        private void LoadDSTo()
        {
            drTo.DataSource = tmBus.GetList() ;
            drTo.DataTextField = "TenToBoMon";
            drTo.DataValueField = "MaTo";
            drTo.DataBind();
        }

        private void LoadAllDSMon()
        {
            gvMH.DataSource = mhBus.GetList();
            gvMH.DataBind();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvMH.Rows.Count; i++)
            {
                GridViewRow row = gvMH.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    string mamh = gvMH.Rows[i].Cells[1].Text;
                    mhBus.Delete(mamh);
                }
                else
                {
                    lblErr.Text = "Không có môn học này";
                }
            }
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            gvMH.EditIndex = -1;
            LoadAllDSMon();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ckHeader = ((CheckBox)gvMH.HeaderRow.FindControl("ckAll"));
            foreach (GridViewRow row in gvMH.Rows)
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
        public void KtraThem(bool p)
        {
            if(txtHeSo.Text=="")
            {
                lblErrHeSo.Visible = p;
            }
          
            if (txtSoTiet.Text == "")
            {
                lblErrSoT.Visible = p;
            }
            if (txtTenMon.Text == "")
            {
                lblErrTenM.Visible = p;
            }
        }
        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                KtraThem(true);
                obj.MaTo = int.Parse(drTo.SelectedValue);
                obj.SoTiet = int.Parse(txtSoTiet.Text);
                obj.HeSo = int.Parse(txtHeSo.Text);
                obj.TenMonHoc = txtTenMon.Text;
                mhBus.Add(obj);
                LoadAllDSMon();
                Panel1.Visible = false;
            }
            catch (Exception ex)
            {

                lblErr.Text = "Lỗi" + ex.Message ;
            }


        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtHeSo.Text = "";
            
            txtSoTiet.Text = "";
            txtTenMon.Text="";  
            Panel1.Visible = false;
            LoadAllDSMon();
        }

        protected void imgSaveSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                KtraSua(true);

                obj.MaTo = int.Parse(drToSua.SelectedValue);
                obj.MaMonHoc = int.Parse(lblMaMon.Text);
                obj.SoTiet = int.Parse(txtSoTiet0.Text);
                obj.HeSo = int.Parse(txtHeSo0.Text);
                obj.TenMonHoc = txtTenMon0.Text;
                mhBus.Update(obj);
                //gvMH.EditIndex = -1;
                LoadAllDSMon();
                Panel2.Visible = false;
            }
            catch (Exception)
            {
                
                lblErr.Text ="Lỗi";
            }
           
        }

        protected void imgCancelSua_Click(object sender, ImageClickEventArgs e)
        {
            txtTenMon0.Text="";
            txtSoTiet0.Text = "";
            lblMaMon.Text = "";
            txtHeSo0.Text = "";
            Panel2.Visible = false;
            //gvMH.EditIndex = -1;
            LoadAllDSMon();
        }

        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
           Panel1.Visible = true;
            LoadDSTo();
        }

        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {
            Panel2.Visible = true;
            LoadDSGV1();
        }

        private void LoadDSGV1()
        {
            drToSua.DataSource = tmBus.GetList();
            drToSua.DataTextField = "TenToBoMon";
            drToSua.DataValueField = "MaTo";
            drToSua.DataBind();
        }

        protected void gvMH_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string matkb = (gvMH.DataKeys[e.RowIndex].Value.ToString());
                mhBus.Delete(matkb);
                LoadAllDSMon();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvMH_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Panel2.Visible = true;     
            lblMaMon.Text = gvMH.Rows[e.RowIndex].Cells[1].Text;
            txtTenMon0.Text = gvMH.Rows[e.RowIndex].Cells[2].Text;
            txtSoTiet0.Text = gvMH.Rows[e.RowIndex].Cells[3].Text;
            txtHeSo0.Text = gvMH.Rows[e.RowIndex].Cells[4].Text;
            LoadDSGV1();
            gvMH.EditIndex = -1;
            
        }

        protected void drToGiaoVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drToGiaoVien.SelectedIndex == 0)
            {
                lblErr.Text = "Chọn tổ môn cụ thể";
            }
            else
            {
                gvMH.DataSource = mhBus.GetByMaTo(int.Parse(drToGiaoVien.SelectedValue));
                gvMH.DataBind();
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
  

     

     
    }
}