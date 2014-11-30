using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTHPT1.BusinessObjects;
using QLTHPT1.BusinessLogic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Data;
namespace QLTHPT
{
    public partial class diem : System.Web.UI.UserControl
    {
        NAMHOCBL nhBus = new NAMHOCBL();
        KHOILOPBL klBus = new KHOILOPBL();
        HOCKYBL hkBus = new HOCKYBL();
        DSLOPBL dslopBus = new DSLOPBL();
        MONHOCBL mhBus = new MONHOCBL();
        HOCSINHBL hsBus = new HOCSINHBL();
        BANGDIEMBL bdBus = new BANGDIEMBL();
        BANGDIEM obj = new BANGDIEM();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Panel1.Visible = false;
                lblErr.Text = "";
                LoadCacMon();
                LoadNamHoc1();
                LoadCacHocKy();

            }
        }

        private void LoadCacHocKy()
        {
            LoadAllHocKy();
        }


        private void LoadNamHoc1()
        {
            drNamHoc.DataSource = nhBus.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }
        private void LoadCacMon()
        {
            int mamon = int.Parse(Session["mamon"].ToString()); 
            MONHOCBL mhBus = new MONHOCBL();
              string magv = Session["MaGiaoVien"].ToString();

              if (magv == "Admin")
              {
                  drMon.DataSource = mhBus.GetList();
                  drMon.DataTextField = "TenMonHoc";
                  drMon.DataValueField = "MaMonHoc";
                  drMon.DataBind();
                  drMon.Items.Insert(0, "--Chọn môn học--");
              }
              else
              {
                  drMon.DataSource = mhBus.GetByMaMon(mamon);
                  drMon.DataTextField = "TenMonHoc";
                  drMon.DataValueField = "MaMonHoc";
                  drMon.DataBind();
                  drMon.Items.Insert(0, "--Chọn môn học--");
              }
          
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ckHeader = ((CheckBox)gvDiem.HeaderRow.FindControl("ckAll"));
            foreach (GridViewRow row in gvDiem.Rows)
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

        }



        protected void gvDiem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mahs = gvDiem.DataKeys[e.RowIndex].Value.ToString();
            bdBus.Delete(mahs);
            LoadDiemByBy();
        }



        private void LoadDiem()
        {
            BANGDIEMBL dbus = new BANGDIEMBL();
            gvDiem.DataSource = dbus.GetByMaMon(int.Parse(drMon.SelectedValue));
            gvDiem.DataBind();
        }

        protected void imgRefresh_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {

            LoadAllHocKy();


        }
        private void LoadAllHocKy()
        {
            drKyHoc.DataSource = hkBus.GetList();
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        }
        //private void LoadHocKyByMaNam()
        //{
        //    drKyHoc.DataSource = hkBus.GetByMaNamHoc(int.Parse(drNamHoc.SelectedValue));
        //    drKyHoc.DataTextField = "TenHK";
        //    drKyHoc.DataValueField = "MaHK";
        //    drKyHoc.DataBind();
        //    drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        //}


        protected void drHocSinh_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void drLop_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //private void LoadDiemByHS()
        //{
        //    gvDiem.DataSource = bdBus.GetByMaHocSinh((drLopLoad1.SelectedValue));
        //    gvDiem.DataBind();
        //}

        private void LoadAllHS()
        {
            gvDiem.DataSource = bdBus.GetList();
            gvDiem.DataBind();
        }
        private void LoadLopByIdMaNH1()
        {
            string magv = Session["MaGiaoVien"].ToString();

            if (magv == "Admin")
            {
                drLopLoad1.DataSource = dslopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
                drLopLoad1.DataTextField = "TenLop";
                drLopLoad1.DataValueField = "MaLop";
                drLopLoad1.DataBind();
                drLopLoad1.Items.Insert(0, "--Chọn lớp--");
            }
            else
            {
                drLopLoad1.DataSource = dslopBus.GetByMaKhoiGV(int.Parse(drKhoi.SelectedValue), magv);
                drLopLoad1.DataTextField = "TenLop";
                drLopLoad1.DataValueField = "MaLop";
                drLopLoad1.DataBind();
                drLopLoad1.Items.Insert(0, "--Chọn lớp--");
            }
        }

        private void LoadAllLop1()
        {
            drLopLoad1.DataSource = dslopBus.GetList();
            drLopLoad1.DataTextField = "TenLop";
            drLopLoad1.DataValueField = "MaLop";
            drLopLoad1.DataBind();
            drLopLoad1.Items.Insert(0, "--Chọn lớp--");
        }

        protected void btnHienthi_Click(object sender, EventArgs e)
        {
            try
            {
                if ((drKyHoc.SelectedIndex == 0) || (drLopLoad1.SelectedIndex == 0) || (drMon.SelectedIndex == 0))
                {
                    lblErr.Text = "Bạn phải chọn kỳ học, lớp học và môn học";
                }
                else
                {
                    Panel1.Visible = true;
                    lblHocKy.Text = drKyHoc.SelectedValue;
                    lblMonHoc.Text = drMon.SelectedItem.ToString();
                    lblLop.Text = drLopLoad1.SelectedItem.ToString();
                    LoadDiemByBy();
                  
                }

            }
            catch
            {
                lblErr.Text = "Lỗi trong lúc chọn thông tin. Làm mới lại trang.";
            }
        } 

        private void LoadDiemByBy()
        {
            lblHocKy.Text = drKyHoc.SelectedItem.ToString();
            lblLop.Text = drLopLoad1.SelectedItem.ToString();
            gvDiem.DataSource = bdBus.GetByMaMonVaLopVaHK(int.Parse(drMon.SelectedValue), int.Parse(drLopLoad1.SelectedValue), int.Parse(drKyHoc.SelectedValue));
            gvDiem.DataBind();
        }

        protected void drNamHoc0_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drNamHoc.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn cần phải chọn 1 năm học cụ thể";
            }
            else
            {
                LoadKhoiByNamHoc();
            }

        }

        private void LoadKhoiByNamHoc()
        {
            drKhoi.DataSource = klBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
        }

        protected void drKhoi0_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (drKhoi.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn cần chọn khối";
            }
            else
            {
                Session["khoidiem"] = drKhoi.SelectedValue;
                LoadLopByIdMaNH1();
            }
        }

        protected void drLopLoad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drLopLoad1.SelectedIndex == 0)
            {
                lblErr.Text = "Bạn phải chọn lớp cụ thể";
            }
            else
            {
                Session["malopdiem"] = drLopLoad1.SelectedValue;
            }
        }

        protected void drKyHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["diemHK"] = drKyHoc.SelectedValue;
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

        protected void btnXuat_Click(object sender, EventArgs e)
        {
            List<BANGDIEM> emList = bdBus.GetByMaMonVaLopVaHK(int.Parse(drMon.SelectedValue), int.Parse(drLopLoad1.SelectedValue),int.Parse(drKyHoc.SelectedValue));
            StringBuilder sb = new StringBuilder();

            if (emList.Count > 0)
            {
                string fileName = Path.Combine(Server.MapPath("~/"), "Danh sách điểm học sinh " + drLopLoad1.SelectedItem + " môn " + drMon.SelectedItem + ".xlsx");
                string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    string strCreateTab = "Create table DiemHS (" +
                        " [MaHocSinh] nvarchar(10), " +
                        " [DM_1] nvarchar(2), " +
                        " [DM_2] nvarchar(2), " +
                        " [D15_1] nvarchar(2), " +
                        " [D15_2] nvarchar(2) ," +
                        " [D15_3] nvarchar(2), " +
                        " [D1T_1] nvarchar(2), "+
                        " [D1T_2] nvarchar(2) ," +
                        " [DThi] nvarchar(2), " +
                        " [MaHK] nvarchar(2))";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
                    cmd.ExecuteNonQuery();

                    string strInsert = "Insert into DiemHS([MaHocSinh],[DM_1]," +
                        " [DM_2],[D15_1],[D15_2],[D15_3],[D1T_1],[D1T_2],[DThi],[MaHK]) values(?,?,?,?,?,?,?,?,?,?)";
                    OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);

                    foreach (var i in emList)
                    {
                        cmdIns.Parameters[0].Value = i.MaHocSinh;
                        cmdIns.Parameters[1].Value = i.D15_1.ToString();
                        cmdIns.Parameters[2].Value = i.D15_2.ToString();
                        cmdIns.Parameters[3].Value = i.D15_3.ToString();
                        cmdIns.Parameters[4].Value = i.D1T_1.ToString();
                        cmdIns.Parameters[5].Value = i.D1T_2.ToString();
                        cmdIns.Parameters[6].Value = i.DM_1.ToString();
                        cmdIns.Parameters[7].Value = i.DM_2.ToString();
                        cmdIns.Parameters[8].Value = i.DThi.ToString();
                        cmdIns.Parameters[9].Value = i.MaHK.ToString() ;
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

        protected void btnFileMau_Click(object sender, EventArgs e)
        {
            string filename = "DiemMau.xlsx";
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.TransmitFile(Server.MapPath("~/uploads/DiemMau.xlsx"));
            Response.End();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            gvDiem.DataSource = bdBus.GetByMaHocSinh(txtTK.Text,int.Parse(drKyHoc.SelectedValue),int.Parse(drMon.SelectedValue));
            gvDiem.DataBind();
        }

        protected void drMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["mon"] = drMon.SelectedValue;
        }
    }
}