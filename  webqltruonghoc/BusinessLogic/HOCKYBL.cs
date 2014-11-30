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
	public class HOCKYBL
	{

		#region ***** Init Methods ***** 
		HOCKYDA objHOCKYDA;
		public HOCKYBL()
		{
			objHOCKYDA = new HOCKYDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get HOCKY by mahk
		/// </summary>
		/// <param name="mahk">MaHK</param>
		/// <returns>HOCKY</returns>
		public HOCKY GetByMaHK(int mahk)
		{
			return objHOCKYDA.GetByMaHK(mahk);
		}

        public List<HOCKY> GetByMaNamHoc(int manh)
        {
            return objHOCKYDA.GetByMaNamHoc(manh);
        }
		/// <summary>
		/// Get all of HOCKY
		/// </summary>
		/// <returns>List<<HOCKY>></returns>
		public List<HOCKY> GetList()
		{
			string cacheName = "lstHOCKY";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objHOCKYDA.GetList(), "HOCKY");
			}
			return (List<HOCKY>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of HOCKY
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsHOCKY";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objHOCKYDA.GetDataSet(), "HOCKY");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of HOCKY paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<HOCKY>></returns>
		public List<HOCKY> GetListPaged(int recperpage, int pageindex)
		{
			return objHOCKYDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of HOCKY paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objHOCKYDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HOCKY within HOCKY database table
		/// </summary>
		/// <param name="obj_hocky">HOCKY</param>
		/// <returns>key of table</returns>
		public int Add(HOCKY obj_hocky)
		{
			ServerCache.Remove("HOCKY", true);
			return objHOCKYDA.Add(obj_hocky);
		}

		/// <summary>
		/// updates the specified HOCKY
		/// </summary>
		/// <param name="obj_hocky">HOCKY</param>
		/// <returns></returns>
		public void Update(HOCKY obj_hocky)
		{
			ServerCache.Remove("HOCKY", true);
			objHOCKYDA.Update(obj_hocky);
		}

		/// <summary>
		/// Delete the specified HOCKY
		/// </summary>
		/// <param name="mahk">MaHK</param>
		/// <returns></returns>
		public void Delete(int mahk)
		{
			ServerCache.Remove("HOCKY", true);
			objHOCKYDA.Delete(mahk);
		}
		#endregion
	}
}
