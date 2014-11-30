using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class THOIKHOABIEUDA
	{

		#region ***** Init Methods ***** 
		public THOIKHOABIEUDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public THOIKHOABIEU Populate(IDataReader myReader)
		{
			THOIKHOABIEU obj = new THOIKHOABIEU();
			obj.MaTKB = (string) myReader["MaTKB"];
			obj.MaLop = (int) myReader["MaLop"];
			obj.Tiet1 = (string) myReader["Tiet1"];
			obj.Tiet2 = (string) myReader["Tiet2"];
			obj.Tiet3 = (string) myReader["Tiet3"];
			obj.Tiet4 = (string) myReader["Tiet4"];
			obj.Tiet5 = (string) myReader["Tiet5"];
			obj.TuNgay = (DateTime) myReader["TuNgay"];
			obj.DenNgay = (DateTime) myReader["DenNgay"];
			return obj;
		}

		/// <summary>
		/// Get THOIKHOABIEU by matkb
		/// </summary>
		/// <param name="matkb">MaTKB</param>
		/// <returns>THOIKHOABIEU</returns>
		public THOIKHOABIEU GetByMaTKB(string matkb)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_THOIKHOABIEU_GetByMaTKB", Data.CreateParameter("MaTKB", matkb)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of THOIKHOABIEU
		/// </summary>
		/// <returns>List<<THOIKHOABIEU>></returns>
		public List<THOIKHOABIEU> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_THOIKHOABIEU_Get"))
			{
				List<THOIKHOABIEU> list = new List<THOIKHOABIEU>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of THOIKHOABIEU
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_THOIKHOABIEU_Get");
		}


		/// <summary>
		/// Get all of THOIKHOABIEU paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<THOIKHOABIEU>></returns>
		public List<THOIKHOABIEU> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_THOIKHOABIEU_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<THOIKHOABIEU> list = new List<THOIKHOABIEU>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of THOIKHOABIEU paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_THOIKHOABIEU_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new THOIKHOABIEU within THOIKHOABIEU database table
		/// </summary>
		/// <param name="obj">THOIKHOABIEU</param>
		/// <returns>key of table</returns>
		public int Add(THOIKHOABIEU obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaTKB", obj.MaTKB);
			//parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_THOIKHOABIEU_Add"
							,parameterItemID
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("Tiet1", obj.Tiet1)
							,Data.CreateParameter("Tiet2", obj.Tiet2)
							,Data.CreateParameter("Tiet3", obj.Tiet3)
							,Data.CreateParameter("Tiet4", obj.Tiet4)
							,Data.CreateParameter("Tiet5", obj.Tiet5)
							,Data.CreateParameter("TuNgay", obj.TuNgay)
							,Data.CreateParameter("DenNgay", obj.DenNgay)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified THOIKHOABIEU
		/// </summary>
		/// <param name="obj">THOIKHOABIEU</param>
		/// <returns></returns>
		public void Update(THOIKHOABIEU obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_THOIKHOABIEU_Update"
							,Data.CreateParameter("MaTKB", obj.MaTKB)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("Tiet1", obj.Tiet1)
							,Data.CreateParameter("Tiet2", obj.Tiet2)
							,Data.CreateParameter("Tiet3", obj.Tiet3)
							,Data.CreateParameter("Tiet4", obj.Tiet4)
							,Data.CreateParameter("Tiet5", obj.Tiet5)
							,Data.CreateParameter("TuNgay", obj.TuNgay)
							,Data.CreateParameter("DenNgay", obj.DenNgay)
			);
		}

		/// <summary>
		/// Delete the specified THOIKHOABIEU
		/// </summary>
		/// <param name="matkb">MaTKB</param>
		/// <returns></returns>
		public void Delete(string matkb)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_THOIKHOABIEU_Delete", Data.CreateParameter("MaTKB", matkb));
		}
		#endregion
	}
}
