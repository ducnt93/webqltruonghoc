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
	public class CHUYENLOPBL
	{

		#region ***** Init Methods ***** 
		CHUYENLOPDA objCHUYENLOPDA;
		public CHUYENLOPBL()
		{
			objCHUYENLOPDA = new CHUYENLOPDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get CHUYENLOP by tulop
		/// </summary>
		/// <param name="tulop">TuLop</param>
		/// <returns>CHUYENLOP</returns>
		public CHUYENLOP GetByTuLop(string tulop)
		{
			return objCHUYENLOPDA.GetByTuLop(tulop);
		}

		/// <summary>
		/// Get all of CHUYENLOP
		/// </summary>
		/// <returns>List<<CHUYENLOP>></returns>
		public List<CHUYENLOP> GetList()
		{
			string cacheName = "lstCHUYENLOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objCHUYENLOPDA.GetList(), "CHUYENLOP");
			}
			return (List<CHUYENLOP>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of CHUYENLOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsCHUYENLOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objCHUYENLOPDA.GetDataSet(), "CHUYENLOP");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of CHUYENLOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<CHUYENLOP>></returns>
		public List<CHUYENLOP> GetListPaged(int recperpage, int pageindex)
		{
			return objCHUYENLOPDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of CHUYENLOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objCHUYENLOPDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new CHUYENLOP within CHUYENLOP database table
		/// </summary>
		/// <param name="obj_chuyenlop">CHUYENLOP</param>
		/// <returns>key of table</returns>
		public int Add(CHUYENLOP obj_chuyenlop)
		{
			ServerCache.Remove("CHUYENLOP", true);
			return objCHUYENLOPDA.Add(obj_chuyenlop);
		}

		/// <summary>
		/// updates the specified CHUYENLOP
		/// </summary>
		/// <param name="obj_chuyenlop">CHUYENLOP</param>
		/// <returns></returns>
		public void Update(CHUYENLOP obj_chuyenlop)
		{
			ServerCache.Remove("CHUYENLOP", true);
			objCHUYENLOPDA.Update(obj_chuyenlop);
		}

		/// <summary>
		/// Delete the specified CHUYENLOP
		/// </summary>
		/// <param name="tulop">TuLop</param>
		/// <returns></returns>
		public void Delete(string tulop)
		{
			ServerCache.Remove("CHUYENLOP", true);
			objCHUYENLOPDA.Delete(tulop);
		}
		#endregion
	}
}
