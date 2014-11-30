using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class TOBOMONDA
	{

		#region ***** Init Methods ***** 
		public TOBOMONDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public TOBOMON Populate(IDataReader myReader)
		{
			TOBOMON obj = new TOBOMON();
			obj.MaTo = (int) myReader["MaTo"];
			obj.TenToBoMon = (string) myReader["TenToBoMon"];
			obj.MoTa = (string) myReader["MoTa"];
			return obj;
		}

		/// <summary>
		/// Get TOBOMON by mato
		/// </summary>
		/// <param name="mato">MaTo</param>
		/// <returns>TOBOMON</returns>
		public TOBOMON GetByMaTo(int mato)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_TOBOMON_GetByMaTo", Data.CreateParameter("MaTo", mato)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of TOBOMON
		/// </summary>
		/// <returns>List<<TOBOMON>></returns>
		public List<TOBOMON> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_TOBOMON_Get"))
			{
				List<TOBOMON> list = new List<TOBOMON>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of TOBOMON
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TOBOMON_Get");
		}


		/// <summary>
		/// Get all of TOBOMON paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<TOBOMON>></returns>
		public List<TOBOMON> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_TOBOMON_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<TOBOMON> list = new List<TOBOMON>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of TOBOMON paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TOBOMON_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new TOBOMON within TOBOMON database table
		/// </summary>
		/// <param name="obj">TOBOMON</param>
		/// <returns>key of table</returns>
		public int Add(TOBOMON obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaTo", obj.MaTo);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TOBOMON_Add"
							,parameterItemID
							,Data.CreateParameter("TenToBoMon", obj.TenToBoMon)
							,Data.CreateParameter("MoTa", obj.MoTa)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified TOBOMON
		/// </summary>
		/// <param name="obj">TOBOMON</param>
		/// <returns></returns>
		public void Update(TOBOMON obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TOBOMON_Update"
							,Data.CreateParameter("MaTo", obj.MaTo)
							,Data.CreateParameter("TenToBoMon", obj.TenToBoMon)
							,Data.CreateParameter("MoTa", obj.MoTa)
			);
		}

		/// <summary>
		/// Delete the specified TOBOMON
		/// </summary>
		/// <param name="mato">MaTo</param>
		/// <returns></returns>
		public void Delete(int mato)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TOBOMON_Delete", Data.CreateParameter("MaTo", mato));
		}
		#endregion
	}
}
