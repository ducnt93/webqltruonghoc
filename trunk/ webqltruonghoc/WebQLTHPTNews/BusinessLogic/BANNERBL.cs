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
	public class BANNERBL
	{

		#region ***** Init Methods ***** 
		BANNERDA objBANNERDA;
		public BANNERBL()
		{
			objBANNERDA = new BANNERDA();
		}
		#endregion

		#region ***** Get Methods ***** 

		/// <summary>
		/// Get all of BANNER
		/// </summary>
		/// <returns>List<<BANNER>></returns>
		public List<BANNER> GetList()
		{
			string cacheName = "lstBANNER";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objBANNERDA.GetList(), "BANNER");
			}
			return (List<BANNER>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of BANNER
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsBANNER";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objBANNERDA.GetDataSet(), "BANNER");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of BANNER paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<BANNER>></returns>
		public List<BANNER> GetListPaged(int recperpage, int pageindex)
		{
			return objBANNERDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of BANNER paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objBANNERDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new BANNER within BANNER database table
		/// </summary>
		/// <param name="obj_banner">BANNER</param>
		/// <returns>key of table</returns>
		public int Add(BANNER obj_banner)
		{
			ServerCache.Remove("BANNER", true);
			return objBANNERDA.Add(obj_banner);
		}

//No key Found
		#endregion
	}
}
