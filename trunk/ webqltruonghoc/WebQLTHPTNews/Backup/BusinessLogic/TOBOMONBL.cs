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
	public class TOBOMONBL
	{

		#region ***** Init Methods ***** 
		TOBOMONDA objTOBOMONDA;
		public TOBOMONBL()
		{
			objTOBOMONDA = new TOBOMONDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get TOBOMON by mato
		/// </summary>
		/// <param name="mato">MaTo</param>
		/// <returns>TOBOMON</returns>
		public TOBOMON GetByMaTo(int mato)
		{
			return objTOBOMONDA.GetByMaTo(mato);
		}

		/// <summary>
		/// Get all of TOBOMON
		/// </summary>
		/// <returns>List<<TOBOMON>></returns>
		public List<TOBOMON> GetList()
		{
			string cacheName = "lstTOBOMON";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objTOBOMONDA.GetList(), "TOBOMON");
			}
			return (List<TOBOMON>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of TOBOMON
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsTOBOMON";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objTOBOMONDA.GetDataSet(), "TOBOMON");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of TOBOMON paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<TOBOMON>></returns>
		public List<TOBOMON> GetListPaged(int recperpage, int pageindex)
		{
			return objTOBOMONDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of TOBOMON paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objTOBOMONDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new TOBOMON within TOBOMON database table
		/// </summary>
		/// <param name="obj_tobomon">TOBOMON</param>
		/// <returns>key of table</returns>
		public int Add(TOBOMON obj_tobomon)
		{
			ServerCache.Remove("TOBOMON", true);
			return objTOBOMONDA.Add(obj_tobomon);
		}

		/// <summary>
		/// updates the specified TOBOMON
		/// </summary>
		/// <param name="obj_tobomon">TOBOMON</param>
		/// <returns></returns>
		public void Update(TOBOMON obj_tobomon)
		{
			ServerCache.Remove("TOBOMON", true);
			objTOBOMONDA.Update(obj_tobomon);
		}

		/// <summary>
		/// Delete the specified TOBOMON
		/// </summary>
		/// <param name="mato">MaTo</param>
		/// <returns></returns>
		public void Delete(int mato)
		{
			ServerCache.Remove("TOBOMON", true);
			objTOBOMONDA.Delete(mato);
		}
		#endregion
	}
}
