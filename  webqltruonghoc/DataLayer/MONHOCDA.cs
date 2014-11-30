using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class MONHOCDA
	{

		#region ***** Init Methods ***** 
		public MONHOCDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public MONHOC Populate(IDataReader myReader)
		{
			MONHOC obj = new MONHOC();
			obj.MaMonHoc = (int) myReader["MaMonHoc"];
			obj.MaTo = (int) myReader["MaTo"];
			obj.TenMonHoc = (string) myReader["TenMonHoc"];
			obj.SoTiet = (int) myReader["SoTiet"];
			obj.HeSo = (int) myReader["HeSo"];
			
			return obj;
		}
        public List<MONHOC> GetByMaTo(int maTo)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MONHOC_GetByMaTo", Data.CreateParameter("MaTo", maTo)))
            {
                List<MONHOC> list = new List<MONHOC>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
        }
		/// <summary>
		/// Get MONHOC by mamonhoc
		/// </summary>
		/// <param name="mamonhoc">MaMonHoc</param>
		/// <returns>MONHOC</returns>
		public MONHOC GetByMaMonHoc(string mamonhoc)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MONHOC_GetByMaMonHoc", Data.CreateParameter("MaMonHoc", mamonhoc)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of MONHOC
		/// </summary>
		/// <returns>List<<MONHOC>></returns>
		public List<MONHOC> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MONHOC_Get"))
			{
				List<MONHOC> list = new List<MONHOC>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

        public List<MONHOC> GetListByMaMon(int mamon)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_MONHOC_GetListByMaMon]", Data.CreateParameter("MaMon", mamon)))
            {
                List<MONHOC> list = new List<MONHOC>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
        }

		/// <summary>
		/// Get DataSet of MONHOC
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MONHOC_Get");
		}


		/// <summary>
		/// Get all of MONHOC paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<MONHOC>></returns>
		public List<MONHOC> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MONHOC_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<MONHOC> list = new List<MONHOC>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of MONHOC paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MONHOC_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new MONHOC within MONHOC database table
		/// </summary>
		/// <param name="obj">MONHOC</param>
		/// <returns>key of table</returns>
		public int Add(MONHOC obj)
		{		
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MONHOC_Add"
							,Data.CreateParameter("MaTo", obj.MaTo)
							,Data.CreateParameter("TenMonHoc", obj.TenMonHoc)
							,Data.CreateParameter("SoTiet", obj.SoTiet)
							,Data.CreateParameter("HeSo", obj.HeSo)
							//,Data.CreateParameter("TrangThai", obj.TrangThai)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified MONHOC
		/// </summary>
		/// <param name="obj">MONHOC</param>
		/// <returns></returns>
		public void Update(MONHOC obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MONHOC_Update"
							,Data.CreateParameter("MaMonHoc", obj.MaMonHoc)
							,Data.CreateParameter("MaTo", obj.MaTo)
							,Data.CreateParameter("TenMonHoc", obj.TenMonHoc)
							,Data.CreateParameter("SoTiet", obj.SoTiet)
							,Data.CreateParameter("HeSo", obj.HeSo)
							//,Data.CreateParameter("TrangThai", obj.TrangThai)
			);
		}

		/// <summary>
		/// Delete the specified MONHOC
		/// </summary>
		/// <param name="mamonhoc">MaMonHoc</param>
		/// <returns></returns>
		public void Delete(string mamonhoc)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MONHOC_Delete", Data.CreateParameter("MaMonHoc", mamonhoc));
		}
		#endregion

        public DataTable GetAllMonHoc()
        {
            DataTable result = null;
            result = SqlHelper.SelectTableSP("sproc_MONHOC_Get");
            return result;
        }
    }
}
