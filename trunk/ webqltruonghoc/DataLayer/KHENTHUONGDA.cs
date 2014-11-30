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
			obj.TenKhoi = (string) myReader["TenKhoi"];
			obj.TenHocSinh = (string) myReader["TenHocSinh"];
			obj.Lop = (string) myReader["Lop"];
			obj.HinhThucKhen = (string) myReader["HinhThucKhen"];
			obj.NoiKhenThuong = (string) myReader["NoiKhenThuong"];
			obj.NgayKhen = (DateTime) myReader["NgayKhen"];
			obj.NoiDungKhen = (string) myReader["NoiDungKhen"];
			return obj;
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
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_KHENTHUONG_Add"
							,Data.CreateParameter("TenKhoi", obj.TenKhoi)
							,Data.CreateParameter("TenHocSinh", obj.TenHocSinh)
							,Data.CreateParameter("Lop", obj.Lop)
							,Data.CreateParameter("HinhThucKhen", obj.HinhThucKhen)
							,Data.CreateParameter("NoiKhenThuong", obj.NoiKhenThuong)
							,Data.CreateParameter("NgayKhen", obj.NgayKhen)
							,Data.CreateParameter("NoiDungKhen", obj.NoiDungKhen)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
