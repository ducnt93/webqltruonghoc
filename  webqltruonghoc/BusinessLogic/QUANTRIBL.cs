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
	public class QUANTRIBL
	{

		#region ***** Init Methods ***** 
		QUANTRIDA objQUANTRIDA;
		public QUANTRIBL()
		{
			objQUANTRIDA = new QUANTRIDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get QUANTRI by mand
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns>QUANTRI</returns>
        //public QUANTRI GetByMaND(string mand)
        //{
        //    return objQUANTRIDA.GetByMaND(mand);
        //}

		/// <summary>
		/// Get all of QUANTRI
		/// </summary>
		/// <returns>List<<QUANTRI>></returns>
		public List<QUANTRI> GetList()
		{
			string cacheName = "lstQUANTRI";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objQUANTRIDA.GetList(), "QUANTRI");
			}
			return (List<QUANTRI>) ServerCache.Get(cacheName);
		}
        public List<QUANTRI> GetListTT()
        {
            return objQUANTRIDA.GetList1();
        }
		/// <summary>
		/// Get DataSet of QUANTRI
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsQUANTRI";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objQUANTRIDA.GetDataSet(), "QUANTRI");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of QUANTRI paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<QUANTRI>></returns>
		public List<QUANTRI> GetListPaged(int recperpage, int pageindex)
		{
			return objQUANTRIDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of QUANTRI paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objQUANTRIDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new QUANTRI within QUANTRI database table
		/// </summary>
		/// <param name="obj_quantri">QUANTRI</param>
		/// <returns>key of table</returns>
		public int Add(QUANTRI obj_quantri)
		{
			ServerCache.Remove("QUANTRI", true);
			return objQUANTRIDA.Add(obj_quantri);
		}

		/// <summary>
		/// updates the specified QUANTRI
		/// </summary>
		/// <param name="obj_quantri">QUANTRI</param>
		/// <returns></returns>
		public void Update(QUANTRI obj_quantri)
		{
			ServerCache.Remove("QUANTRI", true);
			objQUANTRIDA.Update(obj_quantri);
		}

		/// <summary>
		/// Delete the specified QUANTRI
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns></returns>
		public void Delete(string mand)
		{
			ServerCache.Remove("QUANTRI", true);
			objQUANTRIDA.Delete(mand);
		}
		#endregion
	}
}
