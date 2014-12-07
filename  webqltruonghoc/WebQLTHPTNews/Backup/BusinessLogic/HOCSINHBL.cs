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
	public class HOCSINHBL
	{

		#region ***** Init Methods ***** 
		HOCSINHDA objHOCSINHDA;
		public HOCSINHBL()
		{
			objHOCSINHDA = new HOCSINHDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get HOCSINH by mahocsinh
		/// </summary>
		/// <param name="mahocsinh">MaHocSinh</param>
		/// <returns>HOCSINH</returns>
		public HOCSINH GetByMaHocSinh(string mahocsinh)
		{
			return objHOCSINHDA.GetByMaHocSinh(mahocsinh);
		}

		/// <summary>
		/// Get all of HOCSINH
		/// </summary>
		/// <returns>List<<HOCSINH>></returns>
		public List<HOCSINH> GetList()
		{
			string cacheName = "lstHOCSINH";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objHOCSINHDA.GetList(), "HOCSINH");
			}
			return (List<HOCSINH>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of HOCSINH
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsHOCSINH";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objHOCSINHDA.GetDataSet(), "HOCSINH");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of HOCSINH paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<HOCSINH>></returns>
		public List<HOCSINH> GetListPaged(int recperpage, int pageindex)
		{
			return objHOCSINHDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of HOCSINH paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objHOCSINHDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HOCSINH within HOCSINH database table
		/// </summary>
		/// <param name="obj_hocsinh">HOCSINH</param>
		/// <returns>key of table</returns>
		public int Add(HOCSINH obj_hocsinh)
		{
			ServerCache.Remove("HOCSINH", true);
			return objHOCSINHDA.Add(obj_hocsinh);
		}

		/// <summary>
		/// updates the specified HOCSINH
		/// </summary>
		/// <param name="obj_hocsinh">HOCSINH</param>
		/// <returns></returns>
		public void Update(HOCSINH obj_hocsinh)
		{
			ServerCache.Remove("HOCSINH", true);
			objHOCSINHDA.Update(obj_hocsinh);
		}

		/// <summary>
		/// Delete the specified HOCSINH
		/// </summary>
		/// <param name="mahocsinh">MaHocSinh</param>
		/// <returns></returns>
		public void Delete(string mahocsinh)
		{
			ServerCache.Remove("HOCSINH", true);
			objHOCSINHDA.Delete(mahocsinh);
		}
		#endregion
	}
}
