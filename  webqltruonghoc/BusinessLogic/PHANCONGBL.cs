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
	public class PHANCONGBL
	{

		#region ***** Init Methods ***** 
		PHANCONGDA objPHANCONGDA;
		public PHANCONGBL()
		{
			objPHANCONGDA = new PHANCONGDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get PHANCONG by stt
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns>PHANCONG</returns>
		public List<PHANCONG> GetBySTT(int stt)
		{
			return objPHANCONGDA.GetBySTT(stt);
		}

        public List<PHANCONG> GetXem(int malop)
        {
         return   objPHANCONGDA.GetXem(malop);
        }
        public List<PHANCONG> GetByMaLop(int malop)
    {
      return  objPHANCONGDA.GetByMaLop(malop);
    }
		/// <summary>
		/// Get all of PHANCONG
		/// </summary>
		/// <returns>List<<PHANCONG>></returns>
		public List<PHANCONG> GetList()
		{
			string cacheName = "lstPHANCONG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objPHANCONGDA.GetList(), "PHANCONG");
			}
			return (List<PHANCONG>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of PHANCONG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsPHANCONG";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objPHANCONGDA.GetDataSet(), "PHANCONG");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of PHANCONG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<PHANCONG>></returns>
		public List<PHANCONG> GetListPaged(int recperpage, int pageindex)
		{
			return objPHANCONGDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of PHANCONG paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objPHANCONGDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new PHANCONG within PHANCONG database table
		/// </summary>
		/// <param name="obj_phancong">PHANCONG</param>
		/// <returns>key of table</returns>
		public int Add(PHANCONG obj_phancong)
		{
			ServerCache.Remove("PHANCONG", true);
			return objPHANCONGDA.Add(obj_phancong);
		}

		/// <summary>
		/// updates the specified PHANCONG
		/// </summary>
		/// <param name="obj_phancong">PHANCONG</param>
		/// <returns></returns>
		public void Update(PHANCONG obj_phancong)
		{
			ServerCache.Remove("PHANCONG", true);
			objPHANCONGDA.Update(obj_phancong);
		}

		/// <summary>
		/// Delete the specified PHANCONG
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns></returns>
		public void Delete(int stt)
		{
			ServerCache.Remove("PHANCONG", true);
			objPHANCONGDA.Delete(stt);
		}
		#endregion
	}
}
