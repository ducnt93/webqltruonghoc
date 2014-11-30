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
			obj.MaHS = (string) myReader["MaHS"];
			obj.MaLop = (int) myReader["MaLop"];
			obj.MaHK = (int) myReader["MaHK"];
			obj.NgayNghiCoPhep = (int) myReader["NgayNghiCoPhep"];
			obj.NgayNghiKoPhep = (int) myReader["NgayNghiKoPhep"];
			obj.SoLanKyLuat = (int) myReader["SoLanKyLuat"];
			obj.HanhKiem = (string) myReader["HanhKiem"];
			return obj;
		}

		/// <summary>
		/// Get HANHKIEM by mahs
		/// </summary>
		/// <param name="mahs">MaHS</param>
		/// <returns>HANHKIEM</returns>
		public HANHKIEM GetByMaHS(string mahs)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_GetByMaHS", Data.CreateParameter("MaHS", mahs)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
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
			DbParameter parameterItemID = Data.CreateParameter("MaHS", obj.MaHS);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Add"
							,parameterItemID
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHK", obj.MaHK)
							,Data.CreateParameter("NgayNghiCoPhep", obj.NgayNghiCoPhep)
							,Data.CreateParameter("NgayNghiKoPhep", obj.NgayNghiKoPhep)
							,Data.CreateParameter("SoLanKyLuat", obj.SoLanKyLuat)
							,Data.CreateParameter("HanhKiem", obj.HanhKiem)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified HANHKIEM
		/// </summary>
		/// <param name="obj">HANHKIEM</param>
		/// <returns></returns>
		public void Update(HANHKIEM obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Update"
							,Data.CreateParameter("MaHS", obj.MaHS)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHK", obj.MaHK)
							,Data.CreateParameter("NgayNghiCoPhep", obj.NgayNghiCoPhep)
							,Data.CreateParameter("NgayNghiKoPhep", obj.NgayNghiKoPhep)
							,Data.CreateParameter("SoLanKyLuat", obj.SoLanKyLuat)
							,Data.CreateParameter("HanhKiem", obj.HanhKiem)
			);
		}

		/// <summary>
		/// Delete the specified HANHKIEM
		/// </summary>
		/// <param name="mahs">MaHS</param>
		/// <returns></returns>
		public void Delete(string mahs)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Delete", Data.CreateParameter("MaHS", mahs));
		}
		#endregion
	}
}
