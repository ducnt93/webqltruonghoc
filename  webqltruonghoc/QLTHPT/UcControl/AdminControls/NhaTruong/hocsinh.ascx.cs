using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessLogic;
using QLTHPT1.BusinessObjects;
using System.Text;
using System.Data.OleDb;
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class hócinh : System.Web.UI.UserControl
    {
        HOCSINH obj = new HOCSINH();
        HOCSINHBL hsBus = new HOCSINHBL();
        NAMHOCBL nhBus = new NAMHOCBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDSHSAll();
                if (!IsPostBack)
                {
                    Panel2.Visible = true;
                    LoadNamHoc();
                }
        }

        private void LoadNamHoc()
        {
            drNamHoc.DataSource = nhBus.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }

        private void LoadDSHSAll()
        {
            gvHS.DataSource = hsBus.GetList();
            gvHS.DataBind();
        }

        private void LoadDSHS()
        {
            gvHS.DataSource = hsBus.GetList();
            gvHS.DataBind();
        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvHS.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvHS.Rows)
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



        protected void gvHS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mahs = gvHS.DataKeys[e.RowIndex].Value.ToString();
                hsBus.Delete(mahs);
                LoadDSHS();
            }
            catch
            {
              // Page.ClientScript.RegisterClientScriptBlock(this.GetType(),"onclick", "<script language='javascript'>alert('Không xóa được! Học sinh này có trong 1 bảng khác');</script>",true) ;
              lblErr.Text = "Lỗi! Học sinh này khóa ngoại của bảng khác. Kiểm tra lại";
             
            }
           
        }



        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            LoadDSHS();
        }
        PHANLOPBL plBus = new PHANLOPBL();
        private void LoadHSGetByMaLop(int malop)
        {
            HOCSINHBL hsBuss = new HOCSINHBL();
            gvHS.DataSource = plBus.GetByMaLop(malop);
            gvHS.DataBind();

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                for (int i = 0; i < gvHS.Rows.Count; i++)
                {

                    GridViewRow row = gvHS.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("ckitem")).Checked;

                    if (isChecked)
                    {

                        string id = (gvHS.Rows[i].Cells[1].Text);
                        hsBus.Delete(id);
                    }
                }
              

            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<Script language='javascript'>alert('Không xóa được! Học sinh này có trong 1 bảng khác');</Script>");
                lblErr.Text = "Lỗi";
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            gvHS.EditIndex = -1;
         
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
           
            Response.Redirect("~/themsuahocsinh.aspx?hs=themhocsinh");
        }

        protected void btnNapDL_Click(object sender, EventArgs e)
        {
            // kiem tra loai file:
            string exceltype = "application/vnd.ms-excel";
            // kiem tra so sanh voi file 2010
            string excel2010 = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            if (!fUploadDL.HasFile)
            {
                lblStatus.Text = "Ban can chon file de upload";
            }
            else
            {
                try
                {
                    if (fUploadDL.PostedFile.ContentType != exceltype && fUploadDL.PostedFile.ContentType != excel2010)
                    {
                        lblStatus.Text = "Ban can chon dung loai file .xlxs";
                    }
                    else
                    {
                        string path = string.Concat(Server.MapPath(fUploadDL.FileName));
                        fUploadDL.SaveAs(path);
                        string excelconnection = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;");
                        OleDbConnection con = new OleDbConnection();
                        con.ConnectionString = excelconnection;
                        OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", con);
                        con.Open();
                        OleDbDataReader dr = cmd.ExecuteReader();
                        string pathSql = @"Data Source=TRUNGDUC;Initial Catalog=QLTHPT1;User ID=sa;Password=123456";
                        // khoi tao doi tuong de chen du lieu vao trong database
                        SqlBulkCopy sqlInsert = new SqlBulkCopy(pathSql);
                        sqlInsert.DestinationTableName = "Parameter";
                        // thuc thi ghi du lieu vao database
                        sqlInsert.WriteToServer(dr);
                        lblStatus.Text = "Them thanh cong du lieu";

                    }
                }
                catch (Exception)
                {

                    lblStatus.Text = "Loi trong qua trinh upload";
                }
            }
        }

        protected void btnTK_Click(object sender, EventArgs e)
        {

        }

    
        protected void gvHS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadDSHSAll();
            gvHS.PageIndex = e.NewPageIndex;   //trang hien tai
            gvHS.DataBind();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            gvHS.DataSource = hsBus.GetByMaHocSinh(txtTK.Text);
            gvHS.DataBind();
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvHS.DataSource = hsBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
            gvHS.DataBind();
        }

      
    }
}