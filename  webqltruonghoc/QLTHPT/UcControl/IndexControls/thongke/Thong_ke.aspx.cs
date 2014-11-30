using QLTHPT1.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace QLTHPT.UcControl.IndexControls.thongke
{
    public partial class Thong_ke : System.Web.UI.Page
    {
        StringBuilder sb = new StringBuilder();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        NAMHOCBL nhBus = new NAMHOCBL();
        KHOILOPBL klBus = new KHOILOPBL();
        HOCKYBL hkBus = new HOCKYBL();
        DSLOPBL dslopBus = new DSLOPBL();
        MONHOCBL bll_monhoc = new MONHOCBL();
        BANGDIEMBL bll_diem = new BANGDIEMBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNamHoc1();
                LoadHocKy();
                
              
            }
        }

        private void LoadLop()
        {
            drLopLoad1.DataSource = dslopBus.GetByMaKhoi(int.Parse(drKhoi.SelectedValue));
            drLopLoad1.DataTextField = "TenLop";
            drLopLoad1.DataValueField = "MaLop";
            drLopLoad1.DataBind();
            drLopLoad1.Items.Insert(0, "--Chọn lớp--");
        }
        private void loadKhoi()
        {
            drKhoi.DataSource = klBus.GetByMaNam(int.Parse(drNamHoc.SelectedValue));
            drKhoi.DataTextField = "TenKhoi";
            drKhoi.DataValueField = "MaKhoi";
            drKhoi.DataBind();
            drKhoi.Items.Insert(0, "--Chọn khối--");
        }
        private void LoadHocKy()
        {
            drKyHoc.DataSource = hkBus.GetList();
            drKyHoc.DataTextField = "TenHK";
            drKyHoc.DataValueField = "MaHK";
            drKyHoc.DataBind();
            drKyHoc.Items.Insert(0, "--Chọn học kỳ--");
        }
        private void LoadNamHoc1()
        {
            drNamHoc.DataSource = nhBus.GetList();
            drNamHoc.DataTextField = "TenNamHoc";
            drNamHoc.DataValueField = "MaNamHoc";
            drNamHoc.DataBind();
            drNamHoc.Items.Insert(0, "--Chọn năm học--");
        }
        protected void btn_Thong_ke_Click(object sender, EventArgs e)
        {
            try
            {
                float Tong_diem = 0;
                int Dem_he_so = 0;
                sb.Append("<table style='width: 100%;border:1px solid black;'>");
                sb.Append("<tr>");
                sb.Append("<td>Họ và tên</td>");
                dt = bll_monhoc.GetAllMonHoc();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.Append("<td>" + dt.Rows[i]["TenMonHoc"].ToString() + "</td>");
                }
                sb.Append("<td>Tổng điểm</td>");
                sb.Append("<td>Xếp loại</td>");
                sb.Append("</tr>");
                dt1 = bll_diem.LoadHS_Nam_Ky_Khoi_Lop(drNamHoc.SelectedItem.ToString(), drKyHoc.SelectedItem.ToString(), drKhoi.SelectedItem.ToString(), drLopLoad1.SelectedItem.ToString());
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    sb.Append("<tr>");
                    sb.Append("<td>" + dt1.Rows[i]["TenHocSinh"].ToString() + "</td>");
                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        dt2 = bll_diem.Get_Diem_MaHocSinh_MaMonHoc(dt1.Rows[i]["MaHocSinh"].ToString(), int.Parse(dt.Rows[j]["MaMonHoc"].ToString()));
                        if (dt2.Rows.Count < 1)
                        {
                            sb.Append("<td>0</td>");
                            Tong_diem += 0;
                        }
                        else
                        {
                            int He_so = int.Parse(dt.Rows[j]["MaMonHoc"].ToString());
                            if (He_so>1)
                            {
                                Dem_he_so += 1;
                                sb.Append("<td>" + dt2.Rows[0][0].ToString() + "</td>");
                                Tong_diem += float.Parse(dt2.Rows[0][0].ToString())*2;
                            }
                            else
                            {
                                Dem_he_so += 0;
                                sb.Append("<td>" + dt2.Rows[0][0].ToString() + "</td>");
                                Tong_diem += float.Parse(dt2.Rows[0][0].ToString());
                            }
                        }
                    }
                    sb.Append("<td>" + (Math.Round(Tong_diem / (dt.Rows.Count+Dem_he_so),2)).ToString() + "</td>");
                    //đoạn này anh chưa làm theo công thức, chỉ cộng nó vào rồi chia cho tổng số môn thôi nhé        
                    if (Tong_diem / dt.Rows.Count >= 9)
                    {
                        sb.Append("<td>Xuất sắc</td>");
                        goto Nhay;
                    }
                    else
                    {
                        if (Tong_diem / dt.Rows.Count >= 8)
                        {
                            sb.Append("<td>Giỏi</td>");
                            goto Nhay;
                        }
                        else
                        {
                            if (Tong_diem / dt.Rows.Count >= 7)
                            {
                                 sb.Append("<td>Khá</td>");
                                 goto Nhay;
                            }
                            else
                            {
                                if (Tong_diem / dt.Rows.Count >= 5)
                                {
                                    sb.Append("<td>Trung bình</td>");
                                    goto Nhay;
                                }
                                else
                                {
                                    if (Tong_diem / dt.Rows.Count >= 0)
                                    {
                                        sb.Append("<td>Kém</td>");
                                        goto Nhay;
                                    }
                                }
                            }
                        }
                    }
                Nhay:
                    sb.Append("</tr>");
                }
                sb.Append(" </table>");
                trungpq.InnerHtml = sb.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void drNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadKhoi();
        }

        protected void drKhoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLop();
        }
    }
}