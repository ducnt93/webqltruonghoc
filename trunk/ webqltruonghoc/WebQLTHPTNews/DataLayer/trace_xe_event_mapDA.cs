using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class trace_xe_event_mapDA
	{

		#region ***** Init Methods ***** 
		public trace_xe_event_mapDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public trace_xe_event_map Populate(IDataReader myReader)
		{
			trace_xe_event_map obj = new trace_xe_event_map();
			obj.trace_event_id = (int) myReader["trace_event_id"];
			obj.package_name = (string) myReader["package_name"];
			obj.xe_event_name = (string) myReader["xe_event_name"];
			return obj;
		}


		/// <summary>
		/// Get all of trace_xe_event_map
		/// </summary>
		/// <returns>List<<trace_xe_event_map>></returns>
		public List<trace_xe_event_map> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_trace_xe_event_map_Get"))
			{
				List<trace_xe_event_map> list = new List<trace_xe_event_map>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of trace_xe_event_map
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_trace_xe_event_map_Get");
		}


		/// <summary>
		/// Get all of trace_xe_event_map paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<trace_xe_event_map>></returns>
		public List<trace_xe_event_map> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_trace_xe_event_map_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<trace_xe_event_map> list = new List<trace_xe_event_map>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of trace_xe_event_map paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_trace_xe_event_map_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new trace_xe_event_map within trace_xe_event_map database table
		/// </summary>
		/// <param name="obj">trace_xe_event_map</param>
		/// <returns>key of table</returns>
		public int Add(trace_xe_event_map obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_trace_xe_event_map_Add"
							,Data.CreateParameter("trace_event_id", obj.trace_event_id)
							,Data.CreateParameter("package_name", obj.package_name)
							,Data.CreateParameter("xe_event_name", obj.xe_event_name)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
