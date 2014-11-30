using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class HANHKIEMDA
	{

		#region ***** Init Methods ***** 
		public HANHKIEMDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public HANHKIEM Populate(IDataReader myReader)
		{
			HANHKIEM obj = new HANHKIEM();
			obj.TenHocSinh = (string) myReader["TenHocSinh"];
			obj.MaLop = (int) myReader["MaLop"];
			obj.MaHK = (string) myReader["MaHK"];
			obj.NgayNghiCoPhep = (Byte) myReader["NgayNghiCoPhep"];
			obj.NgayNghiKoPhep = (Byte) myReader["NgayNghiKoPhep"];
			obj.SoLanKyLuat = (Byte) myReader["SoLanKyLuat"];
			obj.HanhKiem = (string) myReader["HanhKiem"];
			return obj;
		}


		/// <summary>
		/// Get all of HANHKIEM
		/// </summary>
		/// <returns>List<<HANHKIEM>></returns>
		public List<HANHKIEM> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_Get"))
			{
				List<HANHKIEM> list = new List<HANHKIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HANHKIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Get");
		}


		/// <summary>
		/// Get all of HANHKIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<HANHKIEM>></returns>
		public List<HANHKIEM> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<HANHKIEM> list = new List<HANHKIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HANHKIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HANHKIEM within HANHKIEM database table
		/// </summary>
		/// <param name="obj">HANHKIEM</param>
		/// <returns>key of table</returns>
		public int Add(HANHKIEM obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Add"
							,Data.CreateParameter("TenHocSinh", obj.TenHocSinh)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHK", obj.MaHK)
							,Data.CreateParameter("NgayNghiCoPhep", obj.NgayNghiCoPhep)
							,Data.CreateParameter("NgayNghiKoPhep", obj.NgayNghiKoPhep)
							,Data.CreateParameter("SoLanKyLuat", obj.SoLanKyLuat)
							,Data.CreateParameter("HanhKiem", obj.HanhKiem)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
