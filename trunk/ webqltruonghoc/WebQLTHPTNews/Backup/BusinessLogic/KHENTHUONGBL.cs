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
	public class KHENTHUONGBL
	{

		#region ***** Init Methods ***** 
		KHENTHUONGDA objKHENTHUONGDA;
		public KHENTHUONGBL()
		{
			objKHENTHUONGDA = new KHENTHUONGDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get KHENTHUONG by khoihoc
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns>KHENTHUONG</returns>
		public KHENTHUONG GetByKhoiHoc(int khoihoc)
		{
			return objKHENTHUONGDA.GetByKhoiHoc(khoihoc);
		}

		/// <summary>
		/// Get all of KHENTHUONG
		/// </summary>
		/// <returns>List<<KHENTHUONG>></returns>
		public List<KHENTHUONG> GetList()
		{
			string cacheName = "lstKHENTHUONG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objKHENTHUONGDA.GetList(), "KHENTHUONG");
			}
			return (List<KHENTHUONG>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of KHENTHUONG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsKHENTHUONG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objKHENTHUONGDA.GetDataSet(), "KHENTHUONG");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of KHENTHUONG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<KHENTHUONG>></returns>
		public List<KHENTHUONG> GetListPaged(int recperpage, int pageindex)
		{
			return objKHENTHUONGDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of KHENTHUONG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objKHENTHUONGDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new KHENTHUONG within KHENTHUONG database table
		/// </summary>
		/// <param name="obj_khenthuong">KHENTHUONG</param>
		/// <returns>key of table</returns>
		public int Add(KHENTHUONG obj_khenthuong)
		{
			ServerCache.Remove("KHENTHUONG", true);
			return objKHENTHUONGDA.Add(obj_khenthuong);
		}

		/// <summary>
		/// updates the specified KHENTHUONG
		/// </summary>
		/// <param name="obj_khenthuong">KHENTHUONG</param>
		/// <returns></returns>
		public void Update(KHENTHUONG obj_khenthuong)
		{
			ServerCache.Remove("KHENTHUONG", true);
			objKHENTHUONGDA.Update(obj_khenthuong);
		}

		/// <summary>
		/// Delete the specified KHENTHUONG
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns></returns>
		public void Delete(int khoihoc)
		{
			ServerCache.Remove("KHENTHUONG", true);
			objKHENTHUONGDA.Delete(khoihoc);
		}
		#endregion
	}
}
