using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;
using QLTHPT1.DataAccess;

namespace QLTHPT1.BusinessLogic
{
	public class BANGDIEMBL
	{

		#region ***** Init Methods ***** 
		BANGDIEMDA objBANGDIEMDA;
		public BANGDIEMBL()
		{
			objBANGDIEMDA = new BANGDIEMDA();
		}
		#endregion

		#region ***** Get Methods ***** 

		/// <summary>
		/// Get all of BANGDIEM
		/// </summary>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetList()
		{
			string cacheName = "lstBANGDIEM";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objBANGDIEMDA.GetList(), "BANGDIEM");
			}
			return (List<BANGDIEM>) ServerCache.Get(cacheName);
		}
   
        public List<BANGDIEM> GetByMaHocSinhTraCuu(string mahs, int mahk, int malop)
        {
            return objBANGDIEMDA.GetByMaHocSinhTraCuu(mahs, mahk, malop);
        }
        public List<BANGDIEM> GetByMaMonVaLopVaHK(int mamon, int malop, int mahk)
        {
            return objBANGDIEMDA.GetByMaMonVaLopVaHK(mamon, malop, mahk);
        }

        public List<BANGDIEM> GetByMaMonHKMaHS3(int mahk, int malop, string mahs,int mamon)
        {
            return objBANGDIEMDA.GetByMaMonHKMaHS3(mahk, malop, mahs,mahk);
        }
        public List<BANGDIEM> GetByMaMonHKMaHS(int mamon , int mahk, string mahs)
        {
            return objBANGDIEMDA.GetByMaMonHKMaHS(mamon, mahk, mahs);
        }
        public List<BANGDIEM> GetByMaMonVaLopVaHKByHS(int mamon, int malop, int mahk,string mahs)
        {
            return objBANGDIEMDA.GetByMaMonVaLopVaHKByHS(mamon, malop, mahk,mahs);
        }
		/// <summary>
		/// Get DataSet of BANGDIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsBANGDIEM";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objBANGDIEMDA.GetDataSet(), "BANGDIEM");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}

        public List<BANGDIEM> GetByMaMon(int mamon)
        {
            return objBANGDIEMDA.GetByMaMon(mamon);
        }
        public List<BANGDIEM> GetByMaHocSinh(string mahs,int mahk, int mamon)
        {
            return objBANGDIEMDA.GetByMaHocSinh(mahs, mahk, mamon);
        }
        public List<BANGDIEM> GetByHKVaLopVaMon(int mamon,int malop, int mahk)
        {
            return objBANGDIEMDA.GetByMaMonVaLopVaHK(mamon, malop, mahk);
        }
	
		public List<BANGDIEM> GetListPaged(int recperpage, int pageindex)
		{
			return objBANGDIEMDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objBANGDIEMDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new BANGDIEM within BANGDIEM database table
		/// </summary>
		/// <param name="obj_bangdiem">BANGDIEM</param>
		/// <returns>key of table</returns>
		public int Add(BANGDIEM obj_bangdiem)
		{
			ServerCache.Remove("BANGDIEM", true);
			return objBANGDIEMDA.Add(obj_bangdiem);
		}

        public void Delete(string mahs)
        {
            objBANGDIEMDA.Delete(mahs);
        }

        public void Update(BANGDIEM obj_bangdiem)
        {
            objBANGDIEMDA.Update(obj_bangdiem);
        }
		#endregion

        #region TrungPQ Add new
        public DataTable LoadHS_Nam_Ky_Khoi_Lop(string Nam, string Ky, String Khoi, string Lop)
        {
            BANGDIEMDA da = new BANGDIEMDA();
            return da.LoadHS_Nam_Ky_Khoi_Lop(Nam, Ky, Khoi, Lop);
        }
        public DataTable Get_Diem_MaHocSinh_MaMonHoc(string MaHocSinh, int MaMonHoc)
        {
            BANGDIEMDA da = new BANGDIEMDA();
            return da.Get_Diem_MaHocSinh_MaMonHoc(MaHocSinh, MaMonHoc);
        }
        public DataTable GetByMaHocSinhTraCuu_(string mahs, int mahk, int malop)
            {
                BANGDIEMDA da = new BANGDIEMDA();
                return da.GetByMaHocSinhTraCuu_(mahs,mahk, malop);
            }

        #endregion
    }
}
