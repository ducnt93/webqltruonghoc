using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class CHUYENLOPDA
	{

		#region ***** Init Methods ***** 
		public CHUYENLOPDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public CHUYENLOP Populate(IDataReader myReader)
		{
			CHUYENLOP obj = new CHUYENLOP();
			obj.TuLop = (string) myReader["TuLop"];
			obj.DenLop = (string) myReader["DenLop"];
			obj.NgayChuyen = (DateTime) myReader["NgayChuyen"];
			obj.LyDoChuyen = (string) myReader["LyDoChuyen"];
			obj.ChuyenBangDiem = (bool) myReader["ChuyenBangDiem"];
			obj.MaHocSinh = (string) myReader["MaHocSinh"];
			return obj;
		}

		/// <summary>
		/// Get CHUYENLOP by tulop
		/// </summary>
		/// <param name="tulop">TuLop</param>
		/// <returns>CHUYENLOP</returns>
		public CHUYENLOP GetByTuLop(string tulop)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_CHUYENLOP_GetByTuLop", Data.CreateParameter("TuLop", tulop)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of CHUYENLOP
		/// </summary>
		/// <returns>List<<CHUYENLOP>></returns>
		public List<CHUYENLOP> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_CHUYENLOP_Get"))
			{
				List<CHUYENLOP> list = new List<CHUYENLOP>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of CHUYENLOP
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_CHUYENLOP_Get");
		}


		/// <summary>
		/// Get all of CHUYENLOP paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<CHUYENLOP>></returns>
		public List<CHUYENLOP> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_CHUYENLOP_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<CHUYENLOP> list = new List<CHUYENLOP>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of CHUYENLOP paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_CHUYENLOP_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new CHUYENLOP within CHUYENLOP database table
		/// </summary>
		/// <param name="obj">CHUYENLOP</param>
		/// <returns>key of table</returns>
		public int Add(CHUYENLOP obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("TuLop", obj.TuLop);
			//parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_CHUYENLOP_Add"
							,parameterItemID
							,Data.CreateParameter("DenLop", obj.DenLop)
							,Data.CreateParameter("NgayChuyen", obj.NgayChuyen)
							,Data.CreateParameter("LyDoChuyen", obj.LyDoChuyen)
							,Data.CreateParameter("ChuyenBangDiem", obj.ChuyenBangDiem)
							,Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified CHUYENLOP
		/// </summary>
		/// <param name="obj">CHUYENLOP</param>
		/// <returns></returns>
		public void Update(CHUYENLOP obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_CHUYENLOP_Update"
							,Data.CreateParameter("TuLop", obj.TuLop)
							,Data.CreateParameter("DenLop", obj.DenLop)
							,Data.CreateParameter("NgayChuyen", obj.NgayChuyen)
							,Data.CreateParameter("LyDoChuyen", obj.LyDoChuyen)
							,Data.CreateParameter("ChuyenBangDiem", obj.ChuyenBangDiem)
							,Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
			);
		}

		/// <summary>
		/// Delete the specified CHUYENLOP
		/// </summary>
		/// <param name="tulop">TuLop</param>
		/// <returns></returns>
		public void Delete(string tulop)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_CHUYENLOP_Delete", Data.CreateParameter("TuLop", tulop));
		}
		#endregion
	}
}
