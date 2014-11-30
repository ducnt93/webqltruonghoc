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
	public class BANGDIEMBL
	{

		#region ***** Init Methods ***** 
		BANGDIEMDA objBANGDIEMDA;
		public BANGDIEMBL()
		{
			objBANGDIEMDA = new BANGDIEMDA();
		}
		#endregion

		#region ***** Get Methods ***** 

		/// <summary>
		/// Get all of BANGDIEM
		/// </summary>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetList()
		{
			string cacheName = "lstBANGDIEM";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objBANGDIEMDA.GetList(), "BANGDIEM");
			}
			return (List<BANGDIEM>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of BANGDIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsBANGDIEM";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objBANGDIEMDA.GetDataSet(), "BANGDIEM");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}

        public List<BANGDIEM> GetByMaMon(int mamon)
        {
            return objBANGDIEMDA.GetByMaMon(mamon);
        }
        public List<BANGDIEM> GetByMaHocSinh(int mahs)
        {
            return objBANGDIEMDA.GetByMaHocSinh(mahs);
        }
		/// <summary>
		/// Get all of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetListPaged(int recperpage, int pageindex)
		{
			return objBANGDIEMDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objBANGDIEMDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new BANGDIEM within BANGDIEM database table
		/// </summary>
		/// <param name="obj_bangdiem">BANGDIEM</param>
		/// <returns>key of table</returns>
		public int Add(BANGDIEM obj_bangdiem)
		{
			ServerCache.Remove("BANGDIEM", true);
			return objBANGDIEMDA.Add(obj_bangdiem);
		}

//No key Found
		#endregion
	}
}
