using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class MENU_HSDA
	{

		#region ***** Init Methods ***** 
		public MENU_HSDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public MENU_HS Populate(IDataReader myReader)
		{
			MENU_HS obj = new MENU_HS();
			obj.ID = (int) myReader["ID"];
			obj.Ten = (string) myReader["Ten"];
			return obj;
		}

		/// <summary>
		/// Get MENU_HS by id
		/// </summary>
		/// <param name="id">ID</param>
		/// <returns>MENU_HS</returns>
		public MENU_HS GetByID(int id)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MENU_HS_GetByID", Data.CreateParameter("ID", id)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of MENU_HS
		/// </summary>
		/// <returns>List<<MENU_HS>></returns>
		public List<MENU_HS> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MENU_HS_Get"))
			{
				List<MENU_HS> list = new List<MENU_HS>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of MENU_HS
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MENU_HS_Get");
		}


		/// <summary>
		/// Get all of MENU_HS paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<MENU_HS>></returns>
		public List<MENU_HS> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_MENU_HS_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<MENU_HS> list = new List<MENU_HS>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of MENU_HS paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MENU_HS_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new MENU_HS within MENU_HS database table
		/// </summary>
		/// <param name="obj">MENU_HS</param>
		/// <returns>key of table</returns>
		public int Add(MENU_HS obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("ID", obj.ID);
			
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MENU_HS_Add"
							,parameterItemID
							,Data.CreateParameter("Ten", obj.Ten)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified MENU_HS
		/// </summary>
		/// <param name="obj">MENU_HS</param>
		/// <returns></returns>
		public void Update(MENU_HS obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MENU_HS_Update"
							,Data.CreateParameter("ID", obj.ID)
							,Data.CreateParameter("Ten", obj.Ten)
			);
		}

		/// <summary>
		/// Delete the specified MENU_HS
		/// </summary>
		/// <param name="id">ID</param>
		/// <returns></returns>
		public void Delete(int id)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_MENU_HS_Delete", Data.CreateParameter("ID", id));
		}
		#endregion
	}
}
