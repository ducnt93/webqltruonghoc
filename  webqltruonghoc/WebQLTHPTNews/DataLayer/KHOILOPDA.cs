using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class KHOILOPDA
	{

		#region ***** Init Methods ***** 
		public KHOILOPDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public KHOILOP Populate(IDataReader myReader)
		{
			KHOILOP obj = new KHOILOP();
			obj.MaKhoi = (int) myReader["MaKhoi"];
			obj.MaNamHoc = (int) myReader["MaNamHoc"];
			obj.TenKhoi = (string) myReader["TenKhoi"];
			return obj;
		}

		/// <summary>
		/// Get KHOILOP by makhoi
		/// </summary>
		/// <param name="makhoi">MaKhoi</param>
		/// <returns>KHOILOP</returns>
		public KHOILOP GetByMaKhoi(int makhoi)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHOILOP_GetByMaKhoi", Data.CreateParameter("MaKhoi", makhoi)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of KHOILOP
		/// </summary>
		/// <returns>List<<KHOILOP>></returns>
		public List<KHOILOP> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHOILOP_Get"))
			{
				List<KHOILOP> list = new List<KHOILOP>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of KHOILOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHOILOP_Get");
		}


		/// <summary>
		/// Get all of KHOILOP paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<KHOILOP>></returns>
		public List<KHOILOP> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHOILOP_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<KHOILOP> list = new List<KHOILOP>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of KHOILOP paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHOILOP_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new KHOILOP within KHOILOP database table
		/// </summary>
		/// <param name="obj">KHOILOP</param>
		/// <returns>key of table</returns>
		public int Add(KHOILOP obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaKhoi", obj.MaKhoi);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHOILOP_Add"
							,parameterItemID
							,Data.CreateParameter("MaNamHoc", obj.MaNamHoc)
							,Data.CreateParameter("TenKhoi", obj.TenKhoi)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified KHOILOP
		/// </summary>
		/// <param name="obj">KHOILOP</param>
		/// <returns></returns>
		public void Update(KHOILOP obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHOILOP_Update"
							,Data.CreateParameter("MaKhoi", obj.MaKhoi)
							,Data.CreateParameter("MaNamHoc", obj.MaNamHoc)
							,Data.CreateParameter("TenKhoi", obj.TenKhoi)
			);
		}

		/// <summary>
		/// Delete the specified KHOILOP
		/// </summary>
		/// <param name="makhoi">MaKhoi</param>
		/// <returns></returns>
		public void Delete(int makhoi)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHOILOP_Delete", Data.CreateParameter("MaKhoi", makhoi));
		}
		#endregion
	}
}
