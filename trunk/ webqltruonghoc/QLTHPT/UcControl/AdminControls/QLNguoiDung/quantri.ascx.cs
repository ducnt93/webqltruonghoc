using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.DataAccess;
namespace QLTHPT.UcControl.AdminControls.QLNguoiDung
{
    public partial class quantri : System.Web.UI.UserControl
    {
        QUANTRI obj = new QUANTRI();
        QUANTRIBL qtBus = new QUANTRIBL();
        LOAINGUOIDUNGBL lNDBus = new LOAINGUOIDUNGBL();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            lblErr.Text = "";
            KtraThem(false);
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                LoadQT();
            }
        }
        
        private void KtraThem(bool p)
        {
           
            if(txtMK.Text=="")
            {
                lblErrMK.Visible = p;
            }
            if(txtTenDN.Text=="")
            {
                lblErrTenDN.Visible = p;
            }
            
         }
        private void LoadQT()
        {
            gvQT.DataSource = qtBus.GetList();
            gvQT.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {
            gvQT.EditIndex = -1;
            LoadQT();
            Panel1.Visible = false;
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                for (int i = 0; i < gvQT.Rows.Count; i++)
                {

                    GridViewRow row = gvQT.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        string id = (gvQT.Rows[i].Cells[1].Text);
                        qtBus.Delete(id);

                    }
                }
                LoadQT();

            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvQT.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvQT.Rows)
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

        protected void imgSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
               if((txtTenDN.Text=="") || (txtMK.Text==""))
               {
                   KtraThem(true);
               }
                
                obj.TenDNhap = txtTenDN.Text;
                //obj.MatKhau = HamXuLy.MaHoa(txtMK.Text);
                obj.MatKhau = HamXuLy.EncodeTo64(txtMK.Text);
                // obj.MatKhau = txtMK.Text;
                if (ckTT.Checked == true)
                {
                    obj.TrangThai = true;
                }
                else
                {
                    obj.TrangThai = false;
                }

                qtBus.Add(obj);

                LoadQT();
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;
            }
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
            LoadQT();
        }

        protected void gvQT_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string mal = gvQT.DataKeys[e.RowIndex].Value.ToString();
                GridViewRow row = gvQT.Rows[e.RowIndex];
              //  TextBox tx = ((TextBox)(row.Cells[2].Controls[0]));
                // tx.Attributes["style"] = ;
                //obj.TenNguoiDung = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.TenDNhap = ((TextBox)(row.Cells[2].Controls[0])).Text;
                obj.MatKhau = ((TextBox)(row.Cells[3].Controls[0])).Text;
                //obj.MaLoaiND = ((TextBox)(row.Cells[5].Controls[0])).Text;
                //CheckBox ck = ((CheckBox)row.Cells[6].Controls[0]);
                //if (ck.Checked == true)
                //{
                //    obj.TrangThai = true;
                //}
                //else
                //{
                //    obj.TrangThai = false;
                //}
                //CheckBox ck = new CheckBox();
                foreach (GridViewRow x in gvQT.Rows)
                {
                    CheckBox ChkBoxRows = (CheckBox)x.FindControl("ckTT");
                    if (ChkBoxRows.Checked == true)
                    {
                        obj.TrangThai = true;
                    }
                    else
                    {
                        obj.TrangThai = false;
                    }
                }
                obj.MaND = int.Parse(mal);
                qtBus.Update(obj);
                gvQT.EditIndex = -1;
                LoadQT();
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;
            }
        }

        protected void gvQT_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvQT.EditIndex = e.NewEditIndex;
            LoadQT();
        }

        protected void gvQT_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string malnd = gvQT.DataKeys[e.RowIndex].Value.ToString();
                qtBus.Delete(malnd);
                LoadQT();
            }
            catch (Exception ex)
            {

                lblErr.Text = ex.Message;
            }
        }

        protected void gvQT_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvQT.EditIndex = -1;
            LoadQT();
        }
    }
}