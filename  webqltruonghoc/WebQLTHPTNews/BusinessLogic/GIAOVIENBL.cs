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
	public class GIAOVIENBL
	{

		#region ***** Init Methods ***** 
		GIAOVIENDA objGIAOVIENDA;
		public GIAOVIENBL()
		{
			objGIAOVIENDA = new GIAOVIENDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get GIAOVIEN by magiaovien
		/// </summary>
		/// <param name="magiaovien">MaGiaoVien</param>
		/// <returns>GIAOVIEN</returns>
		public GIAOVIEN GetByMaGiaoVien(string magiaovien)
		{
			return objGIAOVIENDA.GetByMaGiaoVien(magiaovien);
		}

		/// <summary>
		/// Get all of GIAOVIEN
		/// </summary>
		/// <returns>List<<GIAOVIEN>></returns>
		public List<GIAOVIEN> GetList()
		{
			string cacheName = "lstGIAOVIEN";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objGIAOVIENDA.GetList(), "GIAOVIEN");
			}
			return (List<GIAOVIEN>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of GIAOVIEN
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsGIAOVIEN";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objGIAOVIENDA.GetDataSet(), "GIAOVIEN");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of GIAOVIEN paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<GIAOVIEN>></returns>
		public List<GIAOVIEN> GetListPaged(int recperpage, int pageindex)
		{
			return objGIAOVIENDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of GIAOVIEN paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objGIAOVIENDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new GIAOVIEN within GIAOVIEN database table
		/// </summary>
		/// <param name="obj_giaovien">GIAOVIEN</param>
		/// <returns>key of table</returns>
		public int Add(GIAOVIEN obj_giaovien)
		{
			ServerCache.Remove("GIAOVIEN", true);
			return objGIAOVIENDA.Add(obj_giaovien);
		}

		/// <summary>
		/// updates the specified GIAOVIEN
		/// </summary>
		/// <param name="obj_giaovien">GIAOVIEN</param>
		/// <returns></returns>
		public void Update(GIAOVIEN obj_giaovien)
		{
			ServerCache.Remove("GIAOVIEN", true);
			objGIAOVIENDA.Update(obj_giaovien);
		}

		/// <summary>
		/// Delete the specified GIAOVIEN
		/// </summary>
		/// <param name="magiaovien">MaGiaoVien</param>
		/// <returns></returns>
		public void Delete(string magiaovien)
		{
			ServerCache.Remove("GIAOVIEN", true);
			objGIAOVIENDA.Delete(magiaovien);
		}
		#endregion
	}
}
