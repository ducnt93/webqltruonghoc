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
			obj.TenLoaiND = (string) myReader["TenLoaiND"];
			return obj;
		}

		/// <summary>
		/// Get LOAINGUOIDUNG by maloaind
		/// </summary>
		/// <param name="maloaind">MaLoaiND</param>
		/// <returns>LOAINGUOIDUNG</returns>
		public LOAINGUOIDUNG GetByMaLoaiND(string maloaind)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_LOAINGUOIDUNG_GetByMaLoaiND", Data.CreateParameter("MaLoaiND", maloaind)))
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
			DbParameter parameterItemID = Data.CreateParameter("MaLoaiND", obj.MaLoaiND);
			//parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_Add"
							,parameterItemID
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
							,Data.CreateParameter("TenLoaiND", obj.TenLoaiND)
			);
		}

		/// <summary>
		/// Delete the specified LOAINGUOIDUNG
		/// </summary>
		/// <param name="maloaind">MaLoaiND</param>
		/// <returns></returns>
		public void Delete(string maloaind)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_LOAINGUOIDUNG_Delete", Data.CreateParameter("MaLoaiND", maloaind));
		}
		#endregion
	}
}
