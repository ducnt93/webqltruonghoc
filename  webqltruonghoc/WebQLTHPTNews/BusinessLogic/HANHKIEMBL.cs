﻿using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;
using QLTHPT1.DataAccess;

namespace QLTHPT1.BusinessLogic
{
	public class HANHKIEMBL
	{

		#region ***** Init Methods ***** 
		HANHKIEMDA objHANHKIEMDA;
		public HANHKIEMBL()
		{
			objHANHKIEMDA = new HANHKIEMDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get HANHKIEM by mahs
		/// </summary>
		/// <param name="mahs">MaHS</param>
		/// <returns>HANHKIEM</returns>
		public HANHKIEM GetByMaHS(string mahs)
		{
			return objHANHKIEMDA.GetByMaHS(mahs);
		}

		/// <summary>
		/// Get all of HANHKIEM
		/// </summary>
		/// <returns>List<<HANHKIEM>></returns>
		public List<HANHKIEM> GetList()
		{
			string cacheName = "lstHANHKIEM";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objHANHKIEMDA.GetList(), "HANHKIEM");
			}
			return (List<HANHKIEM>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of HANHKIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsHANHKIEM";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objHANHKIEMDA.GetDataSet(), "HANHKIEM");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of HANHKIEM paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<HANHKIEM>></returns>
		public List<HANHKIEM> GetListPaged(int recperpage, int pageindex)
		{
			return objHANHKIEMDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of HANHKIEM paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objHANHKIEMDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HANHKIEM within HANHKIEM database table
		/// </summary>
		/// <param name="obj_hanhkiem">HANHKIEM</param>
		/// <returns>key of table</returns>
		public int Add(HANHKIEM obj_hanhkiem)
		{
			ServerCache.Remove("HANHKIEM", true);
			return objHANHKIEMDA.Add(obj_hanhkiem);
		}

		/// <summary>
		/// updates the specified HANHKIEM
		/// </summary>
		/// <param name="obj_hanhkiem">HANHKIEM</param>
		/// <returns></returns>
		public void Update(HANHKIEM obj_hanhkiem)
		{
			ServerCache.Remove("HANHKIEM", true);
			objHANHKIEMDA.Update(obj_hanhkiem);
		}

		/// <summary>
		/// Delete the specified HANHKIEM
		/// </summary>
		/// <param name="mahs">MaHS</param>
		/// <returns></returns>
		public void Delete(string mahs)
		{
			ServerCache.Remove("HANHKIEM", true);
			objHANHKIEMDA.Delete(mahs);
		}
		#endregion
	}
}
