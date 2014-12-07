using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class trace_xe_action_mapDA
	{

		#region ***** Init Methods ***** 
		public trace_xe_action_mapDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public trace_xe_action_map Populate(IDataReader myReader)
		{
			trace_xe_action_map obj = new trace_xe_action_map();
			obj.trace_column_id = (int) myReader["trace_column_id"];
			obj.package_name = (string) myReader["package_name"];
			obj.xe_action_name = (string) myReader["xe_action_name"];
			return obj;
		}


		/// <summary>
		/// Get all of trace_xe_action_map
		/// </summary>
		/// <returns>List<<trace_xe_action_map>></returns>
		public List<trace_xe_action_map> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_trace_xe_action_map_Get"))
			{
				List<trace_xe_action_map> list = new List<trace_xe_action_map>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of trace_xe_action_map
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_trace_xe_action_map_Get");
		}


		/// <summary>
		/// Get all of trace_xe_action_map paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<trace_xe_action_map>></returns>
		public List<trace_xe_action_map> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_trace_xe_action_map_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<trace_xe_action_map> list = new List<trace_xe_action_map>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of trace_xe_action_map paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_trace_xe_action_map_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new trace_xe_action_map within trace_xe_action_map database table
		/// </summary>
		/// <param name="obj">trace_xe_action_map</param>
		/// <returns>key of table</returns>
		public int Add(trace_xe_action_map obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_trace_xe_action_map_Add"
							,Data.CreateParameter("trace_column_id", obj.trace_column_id)
							,Data.CreateParameter("package_name", obj.package_name)
							,Data.CreateParameter("xe_action_name", obj.xe_action_name)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
