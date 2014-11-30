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
	public class NGUOIDUNGBL
	{

		#region ***** Init Methods ***** 
		NGUOIDUNGDA objNGUOIDUNGDA;
		public NGUOIDUNGBL()
		{
			objNGUOIDUNGDA = new NGUOIDUNGDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get NGUOIDUNG by mand
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns>NGUOIDUNG</returns>
		public NGUOIDUNG GetByMaND(string mand)
		{
			return objNGUOIDUNGDA.GetByMaND(mand);
		}

		/// <summary>
		/// Get all of NGUOIDUNG
		/// </summary>
		/// <returns>List<<NGUOIDUNG>></returns>
		public List<NGUOIDUNG> GetList()
		{
			string cacheName = "lstNGUOIDUNG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objNGUOIDUNGDA.GetList(), "NGUOIDUNG");
			}
			return (List<NGUOIDUNG>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of NGUOIDUNG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsNGUOIDUNG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objNGUOIDUNGDA.GetDataSet(), "NGUOIDUNG");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of NGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<NGUOIDUNG>></returns>
		public List<NGUOIDUNG> GetListPaged(int recperpage, int pageindex)
		{
			return objNGUOIDUNGDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of NGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objNGUOIDUNGDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new NGUOIDUNG within NGUOIDUNG database table
		/// </summary>
		/// <param name="obj_nguoidung">NGUOIDUNG</param>
		/// <returns>key of table</returns>
		public int Add(NGUOIDUNG obj_nguoidung)
		{
			ServerCache.Remove("NGUOIDUNG", true);
			return objNGUOIDUNGDA.Add(obj_nguoidung);
		}

		/// <summary>
		/// updates the specified NGUOIDUNG
		/// </summary>
		/// <param name="obj_nguoidung">NGUOIDUNG</param>
		/// <returns></returns>
		public void Update(NGUOIDUNG obj_nguoidung)
		{
			ServerCache.Remove("NGUOIDUNG", true);
			objNGUOIDUNGDA.Update(obj_nguoidung);
		}

		/// <summary>
		/// Delete the specified NGUOIDUNG
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns></returns>
		public void Delete(string mand)
		{
			ServerCache.Remove("NGUOIDUNG", true);
			objNGUOIDUNGDA.Delete(mand);
		}
		#endregion
	}
}
