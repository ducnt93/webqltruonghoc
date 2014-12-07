using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class PHANLOPDA
	{

		#region ***** Init Methods ***** 
		public PHANLOPDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public PHANLOP Populate(IDataReader myReader)
		{
			PHANLOP obj = new PHANLOP();
			obj.STT = (int) myReader["STT"];
			obj.MaLop = (int) myReader["MaLop"];
			obj.MaHocSinh = (string) myReader["MaHocSinh"];
			return obj;
		}

		/// <summary>
		/// Get PHANLOP by stt
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns>PHANLOP</returns>
		public PHANLOP GetBySTT(int stt)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANLOP_GetBySTT", Data.CreateParameter("STT", stt)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of PHANLOP
		/// </summary>
		/// <returns>List<<PHANLOP>></returns>
		public List<PHANLOP> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANLOP_Get"))
			{
				List<PHANLOP> list = new List<PHANLOP>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of PHANLOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANLOP_Get");
		}


		/// <summary>
		/// Get all of PHANLOP paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<PHANLOP>></returns>
		public List<PHANLOP> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANLOP_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<PHANLOP> list = new List<PHANLOP>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of PHANLOP paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANLOP_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new PHANLOP within PHANLOP database table
		/// </summary>
		/// <param name="obj">PHANLOP</param>
		/// <returns>key of table</returns>
		public int Add(PHANLOP obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("STT", obj.STT);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANLOP_Add"
							,parameterItemID
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified PHANLOP
		/// </summary>
		/// <param name="obj">PHANLOP</param>
		/// <returns></returns>
		public void Update(PHANLOP obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANLOP_Update"
							,Data.CreateParameter("STT", obj.STT)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
			);
		}

		/// <summary>
		/// Delete the specified PHANLOP
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns></returns>
		public void Delete(int stt)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANLOP_Delete", Data.CreateParameter("STT", stt));
		}
		#endregion
	}
}
