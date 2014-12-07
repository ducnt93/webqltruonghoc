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
	public class THOIKHOABIEUBL
	{

		#region ***** Init Methods ***** 
		THOIKHOABIEUDA objTHOIKHOABIEUDA;
		public THOIKHOABIEUBL()
		{
			objTHOIKHOABIEUDA = new THOIKHOABIEUDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get THOIKHOABIEU by matkb
		/// </summary>
		/// <param name="matkb">MaTKB</param>
		/// <returns>THOIKHOABIEU</returns>
		public THOIKHOABIEU GetByMaTKB(int matkb)
		{
			return objTHOIKHOABIEUDA.GetByMaTKB(matkb);
		}

		/// <summary>
		/// Get all of THOIKHOABIEU
		/// </summary>
		/// <returns>List<<THOIKHOABIEU>></returns>
		public List<THOIKHOABIEU> GetList()
		{
			string cacheName = "lstTHOIKHOABIEU";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objTHOIKHOABIEUDA.GetList(), "THOIKHOABIEU");
			}
			return (List<THOIKHOABIEU>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of THOIKHOABIEU
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsTHOIKHOABIEU";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objTHOIKHOABIEUDA.GetDataSet(), "THOIKHOABIEU");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of THOIKHOABIEU paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<THOIKHOABIEU>></returns>
		public List<THOIKHOABIEU> GetListPaged(int recperpage, int pageindex)
		{
			return objTHOIKHOABIEUDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of THOIKHOABIEU paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objTHOIKHOABIEUDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new THOIKHOABIEU within THOIKHOABIEU database table
		/// </summary>
		/// <param name="obj_thoikhoabieu">THOIKHOABIEU</param>
		/// <returns>key of table</returns>
		public int Add(THOIKHOABIEU obj_thoikhoabieu)
		{
			ServerCache.Remove("THOIKHOABIEU", true);
			return objTHOIKHOABIEUDA.Add(obj_thoikhoabieu);
		}

		/// <summary>
		/// updates the specified THOIKHOABIEU
		/// </summary>
		/// <param name="obj_thoikhoabieu">THOIKHOABIEU</param>
		/// <returns></returns>
		public void Update(THOIKHOABIEU obj_thoikhoabieu)
		{
			ServerCache.Remove("THOIKHOABIEU", true);
			objTHOIKHOABIEUDA.Update(obj_thoikhoabieu);
		}

		/// <summary>
		/// Delete the specified THOIKHOABIEU
		/// </summary>
		/// <param name="matkb">MaTKB</param>
		/// <returns></returns>
		public void Delete(int matkb)
		{
			ServerCache.Remove("THOIKHOABIEU", true);
			objTHOIKHOABIEUDA.Delete(matkb);
		}
		#endregion
	}
}
