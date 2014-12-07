using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class KHENTHUONGDA
	{

		#region ***** Init Methods ***** 
		public KHENTHUONGDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public KHENTHUONG Populate(IDataReader myReader)
		{
			KHENTHUONG obj = new KHENTHUONG();
			obj.KhoiHoc = (int) myReader["KhoiHoc"];
			obj.HocSinh = (string) myReader["HocSinh"];
			obj.Lop = (int) myReader["Lop"];
			obj.HinhThucKhen = (string) myReader["HinhThucKhen"];
			obj.NgayKhen = (DateTime) myReader["NgayKhen"];
			obj.NoiDungKhen = (string) myReader["NoiDungKhen"];
			return obj;
		}

		/// <summary>
		/// Get KHENTHUONG by khoihoc
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns>KHENTHUONG</returns>
		public KHENTHUONG GetByKhoiHoc(int khoihoc)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHENTHUONG_GetByKhoiHoc", Data.CreateParameter("KhoiHoc", khoihoc)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of KHENTHUONG
		/// </summary>
		/// <returns>List<<KHENTHUONG>></returns>
		public List<KHENTHUONG> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHENTHUONG_Get"))
			{
				List<KHENTHUONG> list = new List<KHENTHUONG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of KHENTHUONG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHENTHUONG_Get");
		}


		/// <summary>
		/// Get all of KHENTHUONG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<KHENTHUONG>></returns>
		public List<KHENTHUONG> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHENTHUONG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<KHENTHUONG> list = new List<KHENTHUONG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of KHENTHUONG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHENTHUONG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new KHENTHUONG within KHENTHUONG database table
		/// </summary>
		/// <param name="obj">KHENTHUONG</param>
		/// <returns>key of table</returns>
		public int Add(KHENTHUONG obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("KhoiHoc", obj.KhoiHoc);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHENTHUONG_Add"
							,parameterItemID
							,Data.CreateParameter("HocSinh", obj.HocSinh)
							,Data.CreateParameter("Lop", obj.Lop)
							,Data.CreateParameter("HinhThucKhen", obj.HinhThucKhen)
							,Data.CreateParameter("NgayKhen", obj.NgayKhen)
							,Data.CreateParameter("NoiDungKhen", obj.NoiDungKhen)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified KHENTHUONG
		/// </summary>
		/// <param name="obj">KHENTHUONG</param>
		/// <returns></returns>
		public void Update(KHENTHUONG obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHENTHUONG_Update"
							,Data.CreateParameter("KhoiHoc", obj.KhoiHoc)
							,Data.CreateParameter("HocSinh", obj.HocSinh)
							,Data.CreateParameter("Lop", obj.Lop)
							,Data.CreateParameter("HinhThucKhen", obj.HinhThucKhen)
							,Data.CreateParameter("NgayKhen", obj.NgayKhen)
							,Data.CreateParameter("NoiDungKhen", obj.NoiDungKhen)
			);
		}

		/// <summary>
		/// Delete the specified KHENTHUONG
		/// </summary>
		/// <param name="khoihoc">KhoiHoc</param>
		/// <returns></returns>
		public void Delete(int khoihoc)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHENTHUONG_Delete", Data.CreateParameter("KhoiHoc", khoihoc));
		}
		#endregion
	}
}
