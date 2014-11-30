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
	public class MENU_HSBL
	{

		#region ***** Init Methods ***** 
		MENU_HSDA objMENU_HSDA;
		public MENU_HSBL()
		{
			objMENU_HSDA = new MENU_HSDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get MENU_HS by id
		/// </summary>
		/// <param name="id">ID</param>
		/// <returns>MENU_HS</returns>
		public MENU_HS GetByID(int id)
		{
			return objMENU_HSDA.GetByID(id);
		}

		/// <summary>
		/// Get all of MENU_HS
		/// </summary>
		/// <returns>List<<MENU_HS>></returns>
		public List<MENU_HS> GetList()
		{
			string cacheName = "lstMENU_HS";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objMENU_HSDA.GetList(), "MENU_HS");
			}
			return (List<MENU_HS>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of MENU_HS
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsMENU_HS";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objMENU_HSDA.GetDataSet(), "MENU_HS");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of MENU_HS paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<MENU_HS>></returns>
		public List<MENU_HS> GetListPaged(int recperpage, int pageindex)
		{
			return objMENU_HSDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of MENU_HS paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objMENU_HSDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new MENU_HS within MENU_HS database table
		/// </summary>
		/// <param name="obj_menu_hs">MENU_HS</param>
		/// <returns>key of table</returns>
		public int Add(MENU_HS obj_menu_hs)
		{
			ServerCache.Remove("MENU_HS", true);
			return objMENU_HSDA.Add(obj_menu_hs);
		}

		/// <summary>
		/// updates the specified MENU_HS
		/// </summary>
		/// <param name="obj_menu_hs">MENU_HS</param>
		/// <returns></returns>
		public void Update(MENU_HS obj_menu_hs)
		{
			ServerCache.Remove("MENU_HS", true);
			objMENU_HSDA.Update(obj_menu_hs);
		}

		/// <summary>
		/// Delete the specified MENU_HS
		/// </summary>
		/// <param name="id">ID</param>
		/// <returns></returns>
		public void Delete(int id)
		{
			ServerCache.Remove("MENU_HS", true);
			objMENU_HSDA.Delete(id);
		}
		#endregion
	}
}
