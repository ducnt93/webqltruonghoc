using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTHPT.AdminControls
{
    public partial class tracuuindex : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string chuoi = Session["Loai_nguoi_dung"].ToString();
            //switch (chuoi)
            //{
            //    case "Admin":
            //        hpTinTuc.Visible = true;
            //        break;
            //    case "GV":
            //        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script language='javascript'>Alert('Bạn không có quyền truy cập');</script>");
            //        break;
            //}
            //hpDanhMuc.Enabled = false;
            //hpLienHe.Enabled = false;
            //Hp_DatHang.Enabled = false;
            //hpSanPham.Enabled = false;
            //hpUser.Enabled = false;
            //hpTinTuc.Enabled = false;
           //usser 1
           //danh muc 2
            //san pham 3
            //dat hang 4
            //tin tuc 5
            //lien he 6
            

   //     if (Session["role"] != null)
   //     {
   //         string[] role = Session["role"].ToString().Split('|');
   //         if (role.Length > 0)
   //         {
   //             for (int i = 0; i < role.Length; i++)
   //             {
   //                 if (role[i].Equals("1"))
   //                 {
   //                     hpUser.Enabled = true;
                       
   //                 }
   //                 if (role[i].Equals("2"))
   //                 {
   //                     hpDanhMuc.Enabled = true;
                        
   //                 }
   //                 if (role[i].Equals("3"))
   //                 {
   //                     hpSanPham.Enabled = true;
                       
   //                 }
   //                 if (role[i].Equals("4"))
   //                 {
   //                     Hp_DatHang.Enabled = true;
                        
   //                 }
   //                 if (role[i].Equals("5"))
   //                 {
   //                     hpTinTuc.Enabled = true;
   //                 }
   //                 if (role[i].Equals("6"))
   //                 {
   //                     hpLienHe.Enabled = true;
   //                 }
   //                 if (role[i].Equals("0"))
   //                 {
   //                     ScriptManager.RegisterStartupScript(
   //this, this.GetType(), "alert",
   //"alert('Bạn Không Có Quền !');location.href='Default.aspx';", true);
                        
   //                 }
   //             }
   //         }
   //     }
   //     switch (Request.QueryString["page"])
   //     {
   //         case "user":
   //             PlaceHolder1.Controls.Add(LoadControl("users.ascx"));
   //             break;
   //         case "danhmuc":
   //             PlaceHolder1.Controls.Add(LoadControl("DanhMuc.ascx"));
   //             break;
   //         case "sanpham":
   //             PlaceHolder1.Controls.Add(LoadControl("SanPham.ascx"));
   //             break;
   //         case "DatHang":
   //             PlaceHolder1.Controls.Add(LoadControl("DonDatHang.ascx"));
   //             break;
   //         case "lienhe":
   //             PlaceHolder1.Controls.Add(LoadControl("LienHe.ascx"));
   //             break;
   //         case "tintuc":
   //             PlaceHolder1.Controls.Add(LoadControl("TinTuc.ascx"));
   //             break;
   //         case "thongtin":
   //             PlaceHolder1.Controls.Add(LoadControl("gioithieu.ascx"));
   //             break;
   //         case "tongquan":
   //             PlaceHolder1.Controls.Add(LoadControl("tongquan.ascx"));
   //             break;
            
   //     }
    

        }

       

        protected void imgNhaTrung_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["Ma_loai_nd"].ToString() == "GV")
            {
                
                 ScriptManager.RegisterStartupScript(this, this.GetType(), "alert","alert('Bạn Không Có Quền !');location.href='#';", true);
                
            }
            else
            {
                Response.Redirect("~/NhaTruong.aspx");
            }
               
        }

        protected void imgTeacher_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["Ma_loai_nd"].ToString() == "GV")
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Bạn Không Có Quền !');location.href='#';", true);

            }
            else
            {
                Response.Redirect("~/GiaoVien.aspx");
            }
        }

        protected void imgNguoiDung_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["Ma_loai_nd"].ToString() == "GV")
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Bạn Không Có Quền !');location.href='#';", true);

            }
            else
            {
                Response.Redirect("~/NguoiDung.aspx");
            }
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            //bool kt = bool.Parse(Session["chunhiem"].ToString());
            //if(kt == false)
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Bạn Không Có Quền !');location.href='#';", true);
            //}
            //else
            //{
                Response.Redirect("~/QuanLyHocSinh.aspx");
            //}
          
        }

        protected void imgDiem_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/QuanLyDiem.aspx?uc=diem");
        }

       
    }
}