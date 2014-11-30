using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class NAMHOCDA
	{

		#region ***** Init Methods ***** 
		public NAMHOCDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public NAMHOC Populate(IDataReader myReader)
		{
			NAMHOC obj = new NAMHOC();
			obj.MaNamHoc = (int) myReader["MaNamHoc"];
			obj.TenNamHoc = (string) myReader["TenNamHoc"];
			return obj;
		}

		/// <summary>
		/// Get NAMHOC by manamhoc
		/// </summary>
		/// <param name="manamhoc">MaNamHoc</param>
		/// <returns>NAMHOC</returns>
		public NAMHOC GetByMaNamHoc(int manamhoc)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NAMHOC_GetByMaNamHoc", Data.CreateParameter("MaNamHoc", manamhoc)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of NAMHOC
		/// </summary>
		/// <returns>List<<NAMHOC>></returns>
		public List<NAMHOC> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NAMHOC_Get"))
			{
				List<NAMHOC> list = new List<NAMHOC>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of NAMHOC
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NAMHOC_Get");
		}


		/// <summary>
		/// Get all of NAMHOC paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<NAMHOC>></returns>
		public List<NAMHOC> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NAMHOC_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<NAMHOC> list = new List<NAMHOC>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of NAMHOC paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NAMHOC_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new NAMHOC within NAMHOC database table
		/// </summary>
		/// <param name="obj">NAMHOC</param>
		/// <returns>key of table</returns>
		public int Add(NAMHOC obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaNamHoc", obj.MaNamHoc);
			//parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NAMHOC_Add"
							,parameterItemID
							,Data.CreateParameter("TenNamHoc", obj.TenNamHoc)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified NAMHOC
		/// </summary>
		/// <param name="obj">NAMHOC</param>
		/// <returns></returns>
		public void Update(NAMHOC obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NAMHOC_Update"
							,Data.CreateParameter("MaNamHoc", obj.MaNamHoc)
							,Data.CreateParameter("TenNamHoc", obj.TenNamHoc)
			);
		}

		/// <summary>
		/// Delete the specified NAMHOC
		/// </summary>
		/// <param name="manamhoc">MaNamHoc</param>
		/// <returns></returns>
		public void Delete(int manamhoc)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NAMHOC_Delete", Data.CreateParameter("MaNamHoc", manamhoc));
		}
		#endregion
	}
}
