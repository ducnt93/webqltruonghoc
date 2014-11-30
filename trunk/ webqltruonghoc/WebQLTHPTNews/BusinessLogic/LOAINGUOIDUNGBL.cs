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
	public class LOAINGUOIDUNGBL
	{

		#region ***** Init Methods ***** 
		LOAINGUOIDUNGDA objLOAINGUOIDUNGDA;
		public LOAINGUOIDUNGBL()
		{
			objLOAINGUOIDUNGDA = new LOAINGUOIDUNGDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get LOAINGUOIDUNG by mand
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns>LOAINGUOIDUNG</returns>
		public LOAINGUOIDUNG GetByMaND(int mand)
		{
			return objLOAINGUOIDUNGDA.GetByMaND(mand);
		}

		/// <summary>
		/// Get all of LOAINGUOIDUNG
		/// </summary>
		/// <returns>List<<LOAINGUOIDUNG>></returns>
		public List<LOAINGUOIDUNG> GetList()
		{
			string cacheName = "lstLOAINGUOIDUNG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objLOAINGUOIDUNGDA.GetList(), "LOAINGUOIDUNG");
			}
			return (List<LOAINGUOIDUNG>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of LOAINGUOIDUNG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsLOAINGUOIDUNG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objLOAINGUOIDUNGDA.GetDataSet(), "LOAINGUOIDUNG");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of LOAINGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<LOAINGUOIDUNG>></returns>
		public List<LOAINGUOIDUNG> GetListPaged(int recperpage, int pageindex)
		{
			return objLOAINGUOIDUNGDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of LOAINGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objLOAINGUOIDUNGDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new LOAINGUOIDUNG within LOAINGUOIDUNG database table
		/// </summary>
		/// <param name="obj_loainguoidung">LOAINGUOIDUNG</param>
		/// <returns>key of table</returns>
		public int Add(LOAINGUOIDUNG obj_loainguoidung)
		{
			ServerCache.Remove("LOAINGUOIDUNG", true);
			return objLOAINGUOIDUNGDA.Add(obj_loainguoidung);
		}

		/// <summary>
		/// updates the specified LOAINGUOIDUNG
		/// </summary>
		/// <param name="obj_loainguoidung">LOAINGUOIDUNG</param>
		/// <returns></returns>
		public void Update(LOAINGUOIDUNG obj_loainguoidung)
		{
			ServerCache.Remove("LOAINGUOIDUNG", true);
			objLOAINGUOIDUNGDA.Update(obj_loainguoidung);
		}

		/// <summary>
		/// Delete the specified LOAINGUOIDUNG
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns></returns>
		public void Delete(int mand)
		{
			ServerCache.Remove("LOAINGUOIDUNG", true);
			objLOAINGUOIDUNGDA.Delete(mand);
		}
		#endregion
	}
}
