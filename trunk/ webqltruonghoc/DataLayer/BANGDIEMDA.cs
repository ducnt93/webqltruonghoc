using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class BANGDIEMDA
	{

		#region ***** Init Methods ***** 
		public BANGDIEMDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public BANGDIEM Populate(IDataReader myReader)
		{
			BANGDIEM obj = new BANGDIEM();
			obj.MaHocSinh = (string) myReader["MaHocSinh"];
			obj.MaMonHoc = (string) myReader["MaMonHoc"];
			obj.DM_1 = (Single) myReader["DM_1"];
			obj.DM_2 = (Single) myReader["DM_2"];
			obj.D15_1 = (Single) myReader["D15_1"];
			obj.D15_2 = (Single) myReader["D15_2"];
			obj.D15_3 = (Single) myReader["D15_3"];
			obj.D1T_1 = (Single) myReader["D1T_1"];
			obj.D1T_2 = (Single) myReader["D1T_2"];
			obj.DThi = (Single) myReader["DThi"];
			return obj;
		}


		/// <summary>
		/// Get all of BANGDIEM
		/// </summary>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_Get"))
			{
				List<BANGDIEM> list = new List<BANGDIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

        public List<BANGDIEM> GetByMaMon(int mamon)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetByMaMon", Data.CreateParameter("MaMonHoc", mamon)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
        }

        public List<BANGDIEM> GetByMaHocSinh(int mahs)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetByMaHocSinh", Data.CreateParameter("MaHocSinh", mahs)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
        }
		/// <summary>
		/// Get DataSet of BANGDIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_BANGDIEM_Get");
		}


		/// <summary>
		/// Get all of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<BANGDIEM> list = new List<BANGDIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_BANGDIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new BANGDIEM within BANGDIEM database table
		/// </summary>
		/// <param name="obj">BANGDIEM</param>
		/// <returns>key of table</returns>
		public int Add(BANGDIEM obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_BANGDIEM_Add"
							,Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
							,Data.CreateParameter("MaMonHoc", obj.MaMonHoc)
							,Data.CreateParameter("DM_1", obj.DM_1)
							,Data.CreateParameter("DM_2", obj.DM_2)
							,Data.CreateParameter("D15_1", obj.D15_1)
							,Data.CreateParameter("D15_2", obj.D15_2)
							,Data.CreateParameter("D15_3", obj.D15_3)
							,Data.CreateParameter("D1T_1", obj.D1T_1)
							,Data.CreateParameter("D1T_2", obj.D1T_2)
							,Data.CreateParameter("DThi", obj.DThi)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
