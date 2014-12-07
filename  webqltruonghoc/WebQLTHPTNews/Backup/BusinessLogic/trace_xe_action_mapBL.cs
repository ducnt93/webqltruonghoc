using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;
using QLTHPT1.DataAccess;

namespace QLTHPT1.BusinessLogic
{
	public class trace_xe_action_mapBL
	{

		#region ***** Init Methods ***** 
		trace_xe_action_mapDA objtrace_xe_action_mapDA;
		public trace_xe_action_mapBL()
		{
			objtrace_xe_action_mapDA = new trace_xe_action_mapDA();
		}
		#endregion

		#region ***** Get Methods ***** 

		/// <summary>
		/// Get all of trace_xe_action_map
		/// </summary>
		/// <returns>List<<trace_xe_action_map>></returns>
		public List<trace_xe_action_map> GetList()
		{
			string cacheName = "lsttrace_xe_action_map";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objtrace_xe_action_mapDA.GetList(), "trace_xe_action_map");
			}
			return (List<trace_xe_action_map>) ServerCache.Get(cacheName);
		}

		/// <summary>
		/// Get DataSet of trace_xe_action_map
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			string cacheName = "dstrace_xe_action_map";
			if( ServerCache.Get(cacheName) == null )
			{
				ServerCache.Insert(cacheName, objtrace_xe_action_mapDA.GetDataSet(), "trace_xe_action_map");
			}
			return (DataSet) ServerCache.Get(cacheName);
		}


		/// <summary>
		/// Get all of trace_xe_action_map paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>List<<trace_xe_action_map>></returns>
		public List<trace_xe_action_map> GetListPaged(int recperpage, int pageindex)
		{
			return objtrace_xe_action_mapDA.GetListPaged(recperpage, pageindex);
		}

		/// <summary>
		/// Get DataSet of trace_xe_action_map paged
		/// </summary>
		/// <param name="recperpage">recperpage</param>
		/// <param name="pageindex">pageindex</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return objtrace_xe_action_mapDA.GetDataSetPaged(recperpage, pageindex);
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new trace_xe_action_map within trace_xe_action_map database table
		/// </summary>
		/// <param name="obj_trace_xe_action_map">trace_xe_action_map</param>
		/// <returns>key of table</returns>
		public int Add(trace_xe_action_map obj_trace_xe_action_map)
		{
			ServerCache.Remove("trace_xe_action_map", true);
			return objtrace_xe_action_mapDA.Add(obj_trace_xe_action_map);
		}

//No key Found
		#endregion
	}
}
