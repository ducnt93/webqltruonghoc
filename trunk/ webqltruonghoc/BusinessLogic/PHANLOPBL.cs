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
	public class PHANLOPBL
	{

		#region ***** Init Methods ***** 
		PHANLOPDA objPHANLOPDA;
		public PHANLOPBL()
		{
			objPHANLOPDA = new PHANLOPDA();
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// Get PHANLOP by stt
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns>PHANLOP</returns>
		public List<PHANLOP> GetBySTT(int stt)
		{
			return objPHANLOPDA.GetBySTT(stt);
		}
        public List<PHANLOP> GetHS(string mahs)
        {
            return objPHANLOPDA.GetHS(mahs);
        }
        public List<PHANLOP> GetDSPL(int malop)
        {
            return objPHANLOPDA.GetDSPL(malop);
        }
        public List<PHANLOP> GetByMaLop(int malop)
        {
            return objPHANLOPDA.GetByMaLop(malop); 
        }
        public List<PHANLOP> GetTTByMaLop(int malop)
        {
            return objPHANLOPDA.GetTTByMaLop(malop);
        }
		/// <summary>
		/// Get all of PHANLOP
		/// </summary>
		/// <returns>List<<PHANLOP>></returns>
		public List<PHANLOP> GetList()
		{
			string cacheName = "lstPHANLOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objPHANLOPDA.GetList(), "PHANLOP");
			}
			return (List<PHANLOP>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of PHANLOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dsPHANLOP";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objPHANLOPDA.GetDataSet(), "PHANLOP");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of PHANLOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<PHANLOP>></returns>
		public List<PHANLOP> GetListPaged(int recperpage, int pageindex)
		{
			return objPHANLOPDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of PHANLOP paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objPHANLOPDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new PHANLOP within PHANLOP database table
		/// </summary>
		/// <param name="obj_phanlop">PHANLOP</param>
		/// <returns>key of table</returns>
		public int Add(PHANLOP obj_phanlop)
		{
			ServerCache.Remove("PHANLOP", true);
			return objPHANLOPDA.Add(obj_phanlop);
		}

		/// <summary>
		/// updates the specified PHANLOP
		/// </summary>
		/// <param name="obj_phanlop">PHANLOP</param>
		/// <returns></returns>
		public void Update(PHANLOP obj_phanlop)
		{
			ServerCache.Remove("PHANLOP", true);
			objPHANLOPDA.Update(obj_phanlop);
		}

		/// <summary>
		/// Delete the specified PHANLOP
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns></returns>
		public void Delete(int stt)
		{
			ServerCache.Remove("PHANLOP", true);
			objPHANLOPDA.Delete(stt);
		}
		#endregion
	}
}
