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
    public partial class tomon : System.Web.UI.UserControl
    {
        TOBOMON obj = new TOBOMON();
        TOBOMONBL tmBus = new TOBOMONBL();
        LOAINGUOIDUNGBL loaindBus = new LOAINGUOIDUNGBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            pnAdd.Visible = false;
            if (!IsPostBack)
            {
                LoadToMon();
                LoadNguoiDung();
            }
        }

        private void LoadNguoiDung()
        {
            drLoaiND.DataSource = loaindBus.GetList();
            drLoaiND.DataTextField = "TenLoaiND";
            drLoaiND.DataValueField = "MaLoaiND";
            drLoaiND.DataBind();

        }

        private void LoadToMon()
        {
            gvToMon.DataSource = tmBus.GetList();
            gvToMon.DataBind();
        }

        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
            pnAdd.Visible = true;
        }

        protected void gvToMon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int mato =int.Parse( gvToMon.DataKeys[e.RowIndex].Value.ToString());
                tmBus.Delete(mato);
                LoadToMon();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvToMon_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvToMon.EditIndex = e.NewEditIndex;
            LoadToMon();

        }

        protected void gvToMon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = gvToMon.Rows[e.RowIndex];
                int mato = int.Parse(gvToMon.DataKeys[e.RowIndex].Value.ToString());
                obj.MaTo = mato;
                obj.MaLoaiND = ((TextBox)(row.Cells[3].Controls[0])).Text;
                obj.TenToBoMon = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.MoTa = ((TextBox)(row.Cells[4].Controls[0])).Text;
                tmBus.Update(obj);
                //Reset the edit index.
                gvToMon.EditIndex = -1;

                //Bind data to the GridView control.
                LoadToMon();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void gvgvToMon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvToMon.EditIndex = -1;
            LoadToMon();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvToMon.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvToMon.Rows)
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

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            pnAdd.Visible = false;
            LoadToMon();
        }

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                obj.MaLoaiND = drLoaiND.SelectedValue;
               // obj.MaTo = int.Parse(txtMaTo.Text.Trim());
                obj.MoTa = txtMoTa.Text.Trim();
                obj.TenToBoMon = txtTenTo.Text;
                tmBus.Add(obj);
                LoadToMon();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }

        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvToMon.Rows.Count; i++)
            {
                // int id = Convert.ToInt32(dt.Rows[a]["id"].ToString());
                GridViewRow row = gvToMon.Rows[i];
                bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                if (isChecked)
                {
                    // Column 2 is the name column
                    int id = int.Parse(gvToMon.Rows[i].Cells[1].Text);
                    tmBus.Delete(id); //truyền tham số vào để xóa 
                }
            }
            LoadToMon();
        }
        

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            pnAdd.Visible = false;
            LoadToMon();
               
        }
    }
}