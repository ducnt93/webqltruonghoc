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
	public class DSLOPBL
	{

		#region ***** Init Methods ***** 
		DSLOPDA objDSLOPDA;
		public DSLOPBL()
		{
			objDSLOPDA = new DSLOPDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get DSLOP by malop
		/// </summary>
		/// <param name="malop">MaLop</param>
		/// <returns>DSLOP</returns>
		public List<DSLOP> GetByMaLop(int malop)
		{
			return objDSLOPDA.GetByMaLop(malop);
		}
        public List<DSLOP> GetByMaLop1(int malop)
        {
            return objDSLOPDA.GetByMaLop1(malop);
        }

        public List<DSLOP> GetByMaKhoi(int makhoi)
        {
            return objDSLOPDA.GetByMaKhoi(makhoi);
        }
        public List<DSLOP> GetByMaKhoiXem(int makhoi)
        {
            return objDSLOPDA.GetByMaKhoiXem(makhoi);
        }

        public List<DSLOP> GetByMaKhoiKtra(int makhoi,string tenlop)
        {
            return objDSLOPDA.GetByMaKhoiKtra(makhoi,tenlop);
        }
        public List<DSLOP> GetByMaKhoiGV(int makhoi,string magv)
        {
            return objDSLOPDA.GetByMaKhoiGV(makhoi, magv);
        }

		/// <summary>
		/// Get all of DSLOP
		/// </summary>
		/// <returns>List<<DSLOP>></returns>
		public List<DSLOP> GetList()
		{
			string cacheName = "lstDSLOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objDSLOPDA.GetList(), "DSLOP");
			}
			return (List<DSLOP>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of DSLOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsDSLOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objDSLOPDA.GetDataSet(), "DSLOP");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of DSLOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<DSLOP>></returns>
		public List<DSLOP> GetListPaged(int recperpage, int pageindex)
		{
			return objDSLOPDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of DSLOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objDSLOPDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new DSLOP within DSLOP database table
		/// </summary>
		/// <param name="obj_dslop">DSLOP</param>
		/// <returns>key of table</returns>
		public int Add(DSLOP obj_dslop)
		{
			ServerCache.Remove("DSLOP", true);
			return objDSLOPDA.Add(obj_dslop);
		}

		/// <summary>
		/// updates the specified DSLOP
		/// </summary>
		/// <param name="obj_dslop">DSLOP</param>
		/// <returns></returns>
		public void Update(DSLOP obj_dslop)
		{
			ServerCache.Remove("DSLOP", true);
			objDSLOPDA.Update(obj_dslop);
		}

		/// <summary>
		/// Delete the specified DSLOP
		/// </summary>
		/// <param name="malop">MaLop</param>
		/// <returns></returns>
		public void Delete(int malop)
		{
			ServerCache.Remove("DSLOP", true);
			objDSLOPDA.Delete(malop);
		}
		#endregion
	}
}
