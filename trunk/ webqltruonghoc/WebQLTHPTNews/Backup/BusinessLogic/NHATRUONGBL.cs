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
	public class NHATRUONGBL
	{

		#region ***** Init Methods ***** 
		NHATRUONGDA objNHATRUONGDA;
		public NHATRUONGBL()
		{
			objNHATRUONGDA = new NHATRUONGDA();
		}
		#endregion

		#region ***** Get Methods ***** 

		/// <summary>
		/// Get all of NHATRUONG
		/// </summary>
		/// <returns>List<<NHATRUONG>></returns>
		public List<NHATRUONG> GetList()
		{
			string cacheName = "lstNHATRUONG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objNHATRUONGDA.GetList(), "NHATRUONG");
			}
			return (List<NHATRUONG>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of NHATRUONG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsNHATRUONG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objNHATRUONGDA.GetDataSet(), "NHATRUONG");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of NHATRUONG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<NHATRUONG>></returns>
		public List<NHATRUONG> GetListPaged(int recperpage, int pageindex)
		{
			return objNHATRUONGDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of NHATRUONG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objNHATRUONGDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new NHATRUONG within NHATRUONG database table
		/// </summary>
		/// <param name="obj_nhatruong">NHATRUONG</param>
		/// <returns>key of table</returns>
		public int Add(NHATRUONG obj_nhatruong)
		{
			ServerCache.Remove("NHATRUONG", true);
			return objNHATRUONGDA.Add(obj_nhatruong);
		}

//No key Found
		#endregion
	}
}
