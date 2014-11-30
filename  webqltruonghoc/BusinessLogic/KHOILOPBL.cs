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
	public class KHOILOPBL
	{

		#region ***** Init Methods ***** 
		KHOILOPDA objKHOILOPDA;
		public KHOILOPBL()
		{
			objKHOILOPDA = new KHOILOPDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get KHOILOP by makhoi
		/// </summary>
		/// <param name="makhoi">MaKhoi</param>
		/// <returns>KHOILOP</returns>
		public KHOILOP GetByMaKhoi(int makhoi)
		{
			return objKHOILOPDA.GetByMaKhoi(makhoi);
		}

        public List<KHOILOP> GetByMaNam(int manh)
        {
            return objKHOILOPDA.GetByMaNam(manh);
        }

        //public List<KHOILOP> GetByMaNH(int manh)
        //{
        //    return objKHOILOPDA.GetByMaNH(manh);
        //}
		/// <summary>
		/// Get all of KHOILOP
		/// </summary>
		/// <returns>List<<KHOILOP>></returns>
		public List<KHOILOP> GetList()
		{
			string cacheName = "lstKHOILOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objKHOILOPDA.GetList(), "KHOILOP");
			}
			return (List<KHOILOP>) ServerCache.Get(cacheName);
		}
        public List<KHOILOP> GetList1()
        {
            return objKHOILOPDA.GetList();
        }
		/// <summary>
		/// Get DataSet of KHOILOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsKHOILOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objKHOILOPDA.GetDataSet(), "KHOILOP");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of KHOILOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<KHOILOP>></returns>
		public List<KHOILOP> GetListPaged(int recperpage, int pageindex)
		{
			return objKHOILOPDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of KHOILOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objKHOILOPDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new KHOILOP within KHOILOP database table
		/// </summary>
		/// <param name="obj_khoilop">KHOILOP</param>
		/// <returns>key of table</returns>
		public int Add(KHOILOP obj_khoilop)
		{
			ServerCache.Remove("KHOILOP", true);
			return objKHOILOPDA.Add(obj_khoilop);
		}

		/// <summary>
		/// updates the specified KHOILOP
		/// </summary>
		/// <param name="obj_khoilop">KHOILOP</param>
		/// <returns></returns>
		public void Update(KHOILOP obj_khoilop)
		{
			ServerCache.Remove("KHOILOP", true);
			objKHOILOPDA.Update(obj_khoilop);
		}

		/// <summary>
		/// Delete the specified KHOILOP
		/// </summary>
		/// <param name="makhoi">MaKhoi</param>
		/// <returns></returns>
		public void Delete(int makhoi)
		{
			ServerCache.Remove("KHOILOP", true);
			objKHOILOPDA.Delete(makhoi);
		}
		#endregion
	}
}
