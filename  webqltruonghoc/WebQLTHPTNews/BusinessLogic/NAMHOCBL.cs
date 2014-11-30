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
	public class NAMHOCBL
	{

		#region ***** Init Methods ***** 
		NAMHOCDA objNAMHOCDA;
		public NAMHOCBL()
		{
			objNAMHOCDA = new NAMHOCDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get NAMHOC by manamhoc
		/// </summary>
		/// <param name="manamhoc">MaNamHoc</param>
		/// <returns>NAMHOC</returns>
		public NAMHOC GetByMaNamHoc(int manamhoc)
		{
			return objNAMHOCDA.GetByMaNamHoc(manamhoc);
		}

		/// <summary>
		/// Get all of NAMHOC
		/// </summary>
		/// <returns>List<<NAMHOC>></returns>
		public List<NAMHOC> GetList()
		{
			string cacheName = "lstNAMHOC";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objNAMHOCDA.GetList(), "NAMHOC");
			}
			return (List<NAMHOC>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of NAMHOC
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsNAMHOC";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objNAMHOCDA.GetDataSet(), "NAMHOC");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of NAMHOC paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<NAMHOC>></returns>
		public List<NAMHOC> GetListPaged(int recperpage, int pageindex)
		{
			return objNAMHOCDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of NAMHOC paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objNAMHOCDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new NAMHOC within NAMHOC database table
		/// </summary>
		/// <param name="obj_namhoc">NAMHOC</param>
		/// <returns>key of table</returns>
		public int Add(NAMHOC obj_namhoc)
		{
			ServerCache.Remove("NAMHOC", true);
			return objNAMHOCDA.Add(obj_namhoc);
		}

		/// <summary>
		/// updates the specified NAMHOC
		/// </summary>
		/// <param name="obj_namhoc">NAMHOC</param>
		/// <returns></returns>
		public void Update(NAMHOC obj_namhoc)
		{
			ServerCache.Remove("NAMHOC", true);
			objNAMHOCDA.Update(obj_namhoc);
		}

		/// <summary>
		/// Delete the specified NAMHOC
		/// </summary>
		/// <param name="manamhoc">MaNamHoc</param>
		/// <returns></returns>
		public void Delete(int manamhoc)
		{
			ServerCache.Remove("NAMHOC", true);
			objNAMHOCDA.Delete(manamhoc);
		}
		#endregion
	}
}
