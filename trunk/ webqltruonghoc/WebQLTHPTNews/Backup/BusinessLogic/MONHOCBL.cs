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
	public class MONHOCBL
	{

		#region ***** Init Methods ***** 
		MONHOCDA objMONHOCDA;
		public MONHOCBL()
		{
			objMONHOCDA = new MONHOCDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get MONHOC by mamonhoc
		/// </summary>
		/// <param name="mamonhoc">MaMonHoc</param>
		/// <returns>MONHOC</returns>
		public MONHOC GetByMaMonHoc(int mamonhoc)
		{
			return objMONHOCDA.GetByMaMonHoc(mamonhoc);
		}

		/// <summary>
		/// Get all of MONHOC
		/// </summary>
		/// <returns>List<<MONHOC>></returns>
		public List<MONHOC> GetList()
		{
			string cacheName = "lstMONHOC";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objMONHOCDA.GetList(), "MONHOC");
			}
			return (List<MONHOC>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of MONHOC
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsMONHOC";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objMONHOCDA.GetDataSet(), "MONHOC");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of MONHOC paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<MONHOC>></returns>
		public List<MONHOC> GetListPaged(int recperpage, int pageindex)
		{
			return objMONHOCDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of MONHOC paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objMONHOCDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new MONHOC within MONHOC database table
		/// </summary>
		/// <param name="obj_monhoc">MONHOC</param>
		/// <returns>key of table</returns>
		public int Add(MONHOC obj_monhoc)
		{
			ServerCache.Remove("MONHOC", true);
			return objMONHOCDA.Add(obj_monhoc);
		}

		/// <summary>
		/// updates the specified MONHOC
		/// </summary>
		/// <param name="obj_monhoc">MONHOC</param>
		/// <returns></returns>
		public void Update(MONHOC obj_monhoc)
		{
			ServerCache.Remove("MONHOC", true);
			objMONHOCDA.Update(obj_monhoc);
		}

		/// <summary>
		/// Delete the specified MONHOC
		/// </summary>
		/// <param name="mamonhoc">MaMonHoc</param>
		/// <returns></returns>
		public void Delete(int mamonhoc)
		{
			ServerCache.Remove("MONHOC", true);
			objMONHOCDA.Delete(mamonhoc);
		}
		#endregion
	}
}
