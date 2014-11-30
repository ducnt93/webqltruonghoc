using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class LOAINGUOIDUNGDA
	{

		#region ***** Init Methods ***** 
		public LOAINGUOIDUNGDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public LOAINGUOIDUNG Populate(IDataReader myReader)
		{
			LOAINGUOIDUNG obj = new LOAINGUOIDUNG();
			obj.MaLoaiND = (string) myReader["MaLoaiND"];
			obj.MaND = (int) myReader["MaND"];
			obj.MaGiaoVien = (string) myReader["MaGiaoVien"];
			obj.TenLoaiND = (string) myReader["TenLoaiND"];
			return obj;
		}

		/// <summary>
		/// Get LOAINGUOIDUNG by mand
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns>LOAINGUOIDUNG</returns>
		public LOAINGUOIDUNG GetByMaND(int mand)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_LOAINGUOIDUNG_GetByMaND", Data.CreateParameter("MaND", mand)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of LOAINGUOIDUNG
		/// </summary>
		/// <returns>List<<LOAINGUOIDUNG>></returns>
		public List<LOAINGUOIDUNG> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_LOAINGUOIDUNG_Get"))
			{
				List<LOAINGUOIDUNG> list = new List<LOAINGUOIDUNG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of LOAINGUOIDUNG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_Get");
		}


		/// <summary>
		/// Get all of LOAINGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<LOAINGUOIDUNG>></returns>
		public List<LOAINGUOIDUNG> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_LOAINGUOIDUNG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<LOAINGUOIDUNG> list = new List<LOAINGUOIDUNG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of LOAINGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new LOAINGUOIDUNG within LOAINGUOIDUNG database table
		/// </summary>
		/// <param name="obj">LOAINGUOIDUNG</param>
		/// <returns>key of table</returns>
		public int Add(LOAINGUOIDUNG obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaND", obj.MaND);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_Add"
							,Data.CreateParameter("MaLoaiND", obj.MaLoaiND)
							,parameterItemID
							,Data.CreateParameter("MaGiaoVien", obj.MaGiaoVien)
							,Data.CreateParameter("TenLoaiND", obj.TenLoaiND)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified LOAINGUOIDUNG
		/// </summary>
		/// <param name="obj">LOAINGUOIDUNG</param>
		/// <returns></returns>
		public void Update(LOAINGUOIDUNG obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_Update"
							,Data.CreateParameter("MaLoaiND", obj.MaLoaiND)
							,Data.CreateParameter("MaND", obj.MaND)
							,Data.CreateParameter("MaGiaoVien", obj.MaGiaoVien)
							,Data.CreateParameter("TenLoaiND", obj.TenLoaiND)
			);
		}

		/// <summary>
		/// Delete the specified LOAINGUOIDUNG
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns></returns>
		public void Delete(int mand)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_Delete", Data.CreateParameter("MaND", mand));
		}
		#endregion
	}
}
