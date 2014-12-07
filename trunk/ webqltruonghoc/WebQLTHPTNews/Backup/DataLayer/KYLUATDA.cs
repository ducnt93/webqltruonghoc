using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class KYLUATDA
	{

		#region ***** Init Methods ***** 
		public KYLUATDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public KYLUAT Populate(IDataReader myReader)
		{
			KYLUAT obj = new KYLUAT();
			obj.KhoiHoc = (int) myReader["KhoiHoc"];
			obj.Lop = (int) myReader["Lop"];
			obj.HocSinh = (string) myReader["HocSinh"];
			obj.HinhThucKyLuat = (string) myReader["HinhThucKyLuat"];
			obj.NgayKyLuat = (DateTime) myReader["NgayKyLuat"];
			obj.NoiDung = (string) myReader["NoiDung"];
			return obj;
		}

		/// <summary>
		/// Get KYLUAT by khoihoc
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns>KYLUAT</returns>
		public KYLUAT GetByKhoiHoc(int khoihoc)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KYLUAT_GetByKhoiHoc", Data.CreateParameter("KhoiHoc", khoihoc)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of KYLUAT
		/// </summary>
		/// <returns>List<<KYLUAT>></returns>
		public List<KYLUAT> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KYLUAT_Get"))
			{
				List<KYLUAT> list = new List<KYLUAT>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of KYLUAT
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KYLUAT_Get");
		}


		/// <summary>
		/// Get all of KYLUAT paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<KYLUAT>></returns>
		public List<KYLUAT> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KYLUAT_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<KYLUAT> list = new List<KYLUAT>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of KYLUAT paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KYLUAT_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new KYLUAT within KYLUAT database table
		/// </summary>
		/// <param name="obj">KYLUAT</param>
		/// <returns>key of table</returns>
		public int Add(KYLUAT obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("KhoiHoc", obj.KhoiHoc);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KYLUAT_Add"
							,parameterItemID
							,Data.CreateParameter("Lop", obj.Lop)
							,Data.CreateParameter("HocSinh", obj.HocSinh)
							,Data.CreateParameter("HinhThucKyLuat", obj.HinhThucKyLuat)
							,Data.CreateParameter("NgayKyLuat", obj.NgayKyLuat)
							,Data.CreateParameter("NoiDung", obj.NoiDung)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified KYLUAT
		/// </summary>
		/// <param name="obj">KYLUAT</param>
		/// <returns></returns>
		public void Update(KYLUAT obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KYLUAT_Update"
							,Data.CreateParameter("KhoiHoc", obj.KhoiHoc)
							,Data.CreateParameter("Lop", obj.Lop)
							,Data.CreateParameter("HocSinh", obj.HocSinh)
							,Data.CreateParameter("HinhThucKyLuat", obj.HinhThucKyLuat)
							,Data.CreateParameter("NgayKyLuat", obj.NgayKyLuat)
							,Data.CreateParameter("NoiDung", obj.NoiDung)
			);
		}

		/// <summary>
		/// Delete the specified KYLUAT
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns></returns>
		public void Delete(int khoihoc)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KYLUAT_Delete", Data.CreateParameter("KhoiHoc", khoihoc));
		}
		#endregion
	}
}
