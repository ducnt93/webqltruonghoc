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
	public class KYLUATBL
	{

		#region ***** Init Methods ***** 
		KYLUATDA objKYLUATDA;
		public KYLUATBL()
		{
			objKYLUATDA = new KYLUATDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get KYLUAT by khoihoc
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns>KYLUAT</returns>
		public KYLUAT GetByKhoiHoc(int khoihoc)
		{
			return objKYLUATDA.GetByKhoiHoc(khoihoc);
		}

		/// <summary>
		/// Get all of KYLUAT
		/// </summary>
		/// <returns>List<<KYLUAT>></returns>
		public List<KYLUAT> GetList()
		{
			string cacheName = "lstKYLUAT";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objKYLUATDA.GetList(), "KYLUAT");
			}
			return (List<KYLUAT>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of KYLUAT
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsKYLUAT";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objKYLUATDA.GetDataSet(), "KYLUAT");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of KYLUAT paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<KYLUAT>></returns>
		public List<KYLUAT> GetListPaged(int recperpage, int pageindex)
		{
			return objKYLUATDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of KYLUAT paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objKYLUATDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new KYLUAT within KYLUAT database table
		/// </summary>
		/// <param name="obj_kyluat">KYLUAT</param>
		/// <returns>key of table</returns>
		public int Add(KYLUAT obj_kyluat)
		{
			ServerCache.Remove("KYLUAT", true);
			return objKYLUATDA.Add(obj_kyluat);
		}

		/// <summary>
		/// updates the specified KYLUAT
		/// </summary>
		/// <param name="obj_kyluat">KYLUAT</param>
		/// <returns></returns>
		public void Update(KYLUAT obj_kyluat)
		{
			ServerCache.Remove("KYLUAT", true);
			objKYLUATDA.Update(obj_kyluat);
		}

		/// <summary>
		/// Delete the specified KYLUAT
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns></returns>
		public void Delete(int khoihoc)
		{
			ServerCache.Remove("KYLUAT", true);
			objKYLUATDA.Delete(khoihoc);
		}
		#endregion
	}
}
