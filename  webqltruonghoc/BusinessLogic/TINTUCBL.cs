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
	public class TINTUCBL
	{

		#region ***** Init Methods ***** 
		TINTUCDA objTINTUCDA;
		public TINTUCBL()
		{
			objTINTUCDA = new TINTUCDA();
		}
		#endregion

		#region ***** Get Methods ***** 

		/// <summary>
		/// Get all of TINTUC
		/// </summary>
		/// <returns>List<<TINTUC>></returns>
		public List<TINTUC> GetList()
		{
			string cacheName = "lstTINTUC";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objTINTUCDA.GetList(), "TINTUC");
			}
			return (List<TINTUC>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of TINTUC
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsTINTUC";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objTINTUCDA.GetDataSet(), "TINTUC");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of TINTUC paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<TINTUC>></returns>
		public List<TINTUC> GetListPaged(int recperpage, int pageindex)
		{
			return objTINTUCDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of TINTUC paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objTINTUCDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new TINTUC within TINTUC database table
		/// </summary>
		/// <param name="obj_tintuc">TINTUC</param>
		/// <returns>key of table</returns>
		public int Add(TINTUC obj_tintuc)
		{
			ServerCache.Remove("TINTUC", true);
			return objTINTUCDA.Add(obj_tintuc);
		}

//No key Found
		#endregion
	}
}
