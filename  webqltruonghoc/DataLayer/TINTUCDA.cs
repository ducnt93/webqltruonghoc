using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class TINTUCDA
	{

		#region ***** Init Methods ***** 
		public TINTUCDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public TINTUC Populate(IDataReader myReader)
		{
			TINTUC obj = new TINTUC();
			obj.TieuDeTin = (string) myReader["TieuDeTin"];
			obj.NoiDungTin = (string) myReader["NoiDungTin"];
			obj.MotaNgan = (string) myReader["MotaNgan"];
			obj.NgayDangTin = (DateTime) myReader["NgayDangTin"];
			return obj;
		}


		/// <summary>
		/// Get all of TINTUC
		/// </summary>
		/// <returns>List<<TINTUC>></returns>
		public List<TINTUC> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_TINTUC_Get"))
			{
				List<TINTUC> list = new List<TINTUC>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of TINTUC
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TINTUC_Get");
		}


		/// <summary>
		/// Get all of TINTUC paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<TINTUC>></returns>
		public List<TINTUC> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_TINTUC_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<TINTUC> list = new List<TINTUC>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of TINTUC paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TINTUC_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new TINTUC within TINTUC database table
		/// </summary>
		/// <param name="obj">TINTUC</param>
		/// <returns>key of table</returns>
		public int Add(TINTUC obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_TINTUC_Add"
							,Data.CreateParameter("TieuDeTin", obj.TieuDeTin)
							,Data.CreateParameter("NoiDungTin", obj.NoiDungTin)
							,Data.CreateParameter("MotaNgan", obj.MotaNgan)
							,Data.CreateParameter("NgayDangTin", obj.NgayDangTin)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
