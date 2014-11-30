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
using System.Data;
using System.IO;
namespace QLTHPT.UcControl.AdminControls.QLHocSinh
{
    public partial class khenthuong : System.Web.UI.UserControl
    {
        KHENTHUONG obj = new KHENTHUONG();
        KHENTHUONGBL ktBus = new KHENTHUONGBL();
        protected void Page_Load(object sender, EventArgs e)
        {

            lblErr.Text = "";
            Ktra(false);
            if(!IsPostBack )
            {
                Panel2.Visible = false;
                Panel1.Visible = false;
                imgThemMoi.Visible = false;
                btnXuat1.Visible = false;      
                //LoadDS();
                LoadNamHoc();
            }
        }
        public void Ktra(bool p )
        {
            if(txtHinhThuc.Text=="")
            {
                lblErrHThuc.Visible = p;
            }
            if(txtNgayKhen.Text=="")
            {
                lblErrNgayKhen.Visible = p;
            }
            if(txtND.Text=="")
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
        private void LoadKhoi()
        {
            try
            {
                KHOILOPBL kl = new KHOILOPBL();
                drKhoi.DataSource = kl.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
                drKhoi.DataTextField = "TenKhoi";
                drKhoi.DataValueField = "MaKhoi";
                drKhoi.DataBind();
                drKhoi.Items.Insert(0, "--Chọn khối--");
            }
            catch (Exception )
            {
                
                lblErr.Text = "Bạn phải chọn 1 năm cụ thể";
            }
         
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
            CheckBox ChkBoxHeader = (CheckBox)gvKhenThuong.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow row in gvKhenThuong.Rows)
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
            gvKhenThuong.EditIndex = -1;
            LoadDS();
        }

        private void LoadDS()
        {
            gvKhenThuong.DataSource = ktBus.GetList();
            gvKhenThuong.DataBind();
        }

        protected void imgDelAll_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < gvKhenThuong.Rows.Count; i++)
            {
                GridViewRow row = gvKhenThuong.Rows[i];
                CheckBox ck = ((CheckBox)row.FindControl("ckitem"));
                if (ck.Checked == true)
                {
                    string mamh = gvKhenThuong.Rows[i].Cells[1].Text;
                    ktBus.Delete(mamh);
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
            Panel2.Visible = true;
            imgThemMoi.Visible = true;
            btnXuat1.Visible = true;
            lblKhoi.Text = drKhoi.SelectedItem.ToString();
            lblLop.Text = drLop.SelectedItem.ToString();
            LoadDSKTByLop();
        }

        private void LoadDSKTByLop()
        {
            gvKhenThuong.DataSource = ktBus.GetByLop(int.Parse(drLop.SelectedValue));
            gvKhenThuong.DataBind();
            if (gvKhenThuong.PageCount == 0)
            {
                lblErr.Text = "Lớp này không có học sinh nào.";
            }
        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {
            List<KHENTHUONG> emList = ktBus.GetByLop(int.Parse(drLop.SelectedValue));
            StringBuilder sb = new StringBuilder();

            if (emList.Count > 0)
            {
                string fileName = Path.Combine(Server.MapPath("~/"), "Danh sách học sinh khen thưởng " + drLop.SelectedItem +  ".xlsx");
                string conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'";
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    string strCreateTab = "Create table HSKhenThuong (" +
                        " [KhoiHoc] nvarchar(3), " +
                        " [HocSinh] nvarchar(10), " +
                        " [Lop] nvarchar(2), " +
                        " [HinhThucKhen] nvarchar(30), " +
                        " [NgayKhen] nvarchar(2) ," +
                        " [NoiDungKhen] nvarchar(200)) ";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    OleDbCommand cmd = new OleDbCommand(strCreateTab, con);
                    cmd.ExecuteNonQuery();

                    string strInsert = "Insert into HSKhenThuong([KhoiHoc],[HocSinh]," +
                        " [Lop],[HinhThucKhen],[NgayKhen],[NoiDungKhen]) values(?,?,?,?,?,?)";
                    OleDbCommand cmdIns = new OleDbCommand(strInsert, con);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 3);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 10);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 30);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 2);
                    cmdIns.Parameters.Add("?", OleDbType.VarChar, 200);

                    foreach (var i in emList)
                    {
                        cmdIns.Parameters[0].Value = i.KhoiHoc.ToString();
                        cmdIns.Parameters[1].Value = i.Lop.ToString();
                        cmdIns.Parameters[2].Value = i.HocSinh;
                        cmdIns.Parameters[3].Value = i.HinhThucKhen;
                        cmdIns.Parameters[4].Value = i.NgayKhen.ToString();
                        cmdIns.Parameters[5].Value = i.NoiDungKhen;
                       
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

        protected void imgThemMoi_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
            imgLuuSua.Visible = false;
            imgLuu.Visible = true;
            lblMaHS.Visible = false;
            drHS.Visible = true;
            LoadKhoi1();
        }

        private void LoadKhoi1()
        {
            try
            {
                KHOILOPBL kl = new KHOILOPBL();
                drKhoi1.DataSource = kl.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
                drKhoi1.DataTextField = "TenKhoi";
                drKhoi1.DataValueField = "MaKhoi";
                drKhoi1.DataBind();
                drKhoi1.Items.Insert(0, "--Chọn khối--");
            }
            catch (Exception)
            {
                
               lblErr.Text="Bạn phải chọn năm học";
            }
            
        }

        protected void imgLuu_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
              
                if((drHS.SelectedIndex==0) || (drKhoi1.SelectedIndex==0) || (drLop1.SelectedIndex==0))
                {
                    lblErr.Text = "Bạn chưa chọn ";
                }
                else
                {
                    Ktra(true);
                    obj.HinhThucKhen = txtHinhThuc.Text;
                    obj.HocSinh = drHS.SelectedValue;
                    obj.KhoiHoc = int.Parse(drKhoi1.SelectedValue);
                    obj.Lop = int.Parse(drLop1.SelectedValue);
                    obj.NgayKhen = DateTime.Parse(txtNgayKhen.Text);
                    obj.NoiDungKhen = txtND.Text;
                    ktBus.Add(obj);
                    LoadDS();
                    Panel1.Visible = false;
                }
             
            }
            catch (Exception ex)
            {
                
                lblErr.Text = "Lỗi. Vui lòng xem lại dữ liệu nhập vào!";
            }
           
        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            txtHinhThuc.Text = "";
            txtND.Text = "";
            txtNgayKhen.Text = "";
            Panel1.Visible = false;
            //LoadDS();
        }

        protected void imgLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Ktra(true);
                obj.HinhThucKhen = txtHinhThuc.Text;
                obj.HocSinh = lblMaHS.Text ;
                obj.KhoiHoc = int.Parse(drKhoi1.SelectedValue);
                obj.Lop = int.Parse(drLop1.SelectedValue);
                obj.NgayKhen = DateTime.Parse( txtNgayKhen.Text);
                obj.NoiDungKhen = txtND.Text;
                ktBus.Update(obj);
                LoadDSKTByLop();
                Panel1.Visible = false;
            }
            catch (Exception ex)
            {
                
                lblErr.Text = "Lỗi" + ex.Message;
            }
           

        }

        protected void drKhoi1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLop1();
        }

        private void LoadLop1()
        {
            try
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
            catch 
            {
                
                lblErr.Text ="Bạn phải chọn 1 khối cụ thể";
            }
           
        }
     
        protected void drLop1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PHANLOPBL plBus = new PHANLOPBL();
                HOCSINHBL hsBus = new HOCSINHBL();
                drHS.DataSource = plBus.GetTTByMaLop(int.Parse(drLop1.SelectedValue));
                drHS.DataTextField = "TenHocSinh";
                drHS.DataValueField = "MaHocSinh";
                drHS.DataBind();
            }
            catch (Exception)
            {
                
                lblErr.Text ="Bạn phải chọn 1 lớp học cụ thể";
            }
           
        }

        protected void gvKhenThuong_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mahs = gvKhenThuong.DataKeys[e.RowIndex].Value.ToString();
            ktBus.Delete(mahs);
            LoadDSKTByLop();
        }

        protected void gvKhenThuong_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Panel1.Visible = true;
            imgLuu.Visible = false;
            imgLuuSua.Visible = true;
            drKhoi1.SelectedValue = drKhoi.SelectedValue;
            LoadKhoi1();
            drLop1.SelectedValue = drLop.SelectedValue;
            drHS.Visible = false;
            lblMaHS.Visible = true;
            lblMaHS.Text = gvKhenThuong.Rows[e.RowIndex].Cells[1].Text.ToString();
            txtHinhThuc.Text = gvKhenThuong.Rows[e.RowIndex].Cells[3].Text.ToString();
            txtND.Text = gvKhenThuong.Rows[e.RowIndex].Cells[5].Text.ToString() ;
            txtNgayKhen.Text = gvKhenThuong.Rows[e.RowIndex].Cells[4].Text.ToString();  
            gvKhenThuong.EditIndex = -1;
        }
    }
}