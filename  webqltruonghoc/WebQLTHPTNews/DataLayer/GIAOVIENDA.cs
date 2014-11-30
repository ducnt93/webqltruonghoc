using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class GIAOVIENDA
	{

		#region ***** Init Methods ***** 
		public GIAOVIENDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public GIAOVIEN Populate(IDataReader myReader)
		{
			GIAOVIEN obj = new GIAOVIEN();
			obj.MaGiaoVien = (string) myReader["MaGiaoVien"];
			obj.TenGiaoVien = (string) myReader["TenGiaoVien"];
			obj.NgaySinh = (DateTime) myReader["NgaySinh"];
			obj.GioiTinh = (string) myReader["GioiTinh"];
			obj.DiaChi = (string) myReader["DiaChi"];
			obj.SoDienThoai = (string) myReader["SoDienThoai"];
			obj.ChuNhiem = (bool) myReader["ChuNhiem"];
			obj.MaMon = (int) myReader["MaMon"];
			return obj;
		}

		/// <summary>
		/// Get GIAOVIEN by magiaovien
		/// </summary>
		/// <param name="magiaovien">MaGiaoVien</param>
		/// <returns>GIAOVIEN</returns>
		public GIAOVIEN GetByMaGiaoVien(string magiaovien)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_GIAOVIEN_GetByMaGiaoVien", Data.CreateParameter("MaGiaoVien", magiaovien)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of GIAOVIEN
		/// </summary>
		/// <returns>List<<GIAOVIEN>></returns>
		public List<GIAOVIEN> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_GIAOVIEN_Get"))
			{
				List<GIAOVIEN> list = new List<GIAOVIEN>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of GIAOVIEN
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_GIAOVIEN_Get");
		}


		/// <summary>
		/// Get all of GIAOVIEN paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<GIAOVIEN>></returns>
		public List<GIAOVIEN> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_GIAOVIEN_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<GIAOVIEN> list = new List<GIAOVIEN>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of GIAOVIEN paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_GIAOVIEN_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new GIAOVIEN within GIAOVIEN database table
		/// </summary>
		/// <param name="obj">GIAOVIEN</param>
		/// <returns>key of table</returns>
		public int Add(GIAOVIEN obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaGiaoVien", obj.MaGiaoVien);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_GIAOVIEN_Add"
							,parameterItemID
							,Data.CreateParameter("TenGiaoVien", obj.TenGiaoVien)
							,Data.CreateParameter("NgaySinh", obj.NgaySinh)
							,Data.CreateParameter("GioiTinh", obj.GioiTinh)
							,Data.CreateParameter("DiaChi", obj.DiaChi)
							,Data.CreateParameter("SoDienThoai", obj.SoDienThoai)
							,Data.CreateParameter("ChuNhiem", obj.ChuNhiem)
							,Data.CreateParameter("MaMon", obj.MaMon)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified GIAOVIEN
		/// </summary>
		/// <param name="obj">GIAOVIEN</param>
		/// <returns></returns>
		public void Update(GIAOVIEN obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_GIAOVIEN_Update"
							,Data.CreateParameter("MaGiaoVien", obj.MaGiaoVien)
							,Data.CreateParameter("TenGiaoVien", obj.TenGiaoVien)
							,Data.CreateParameter("NgaySinh", obj.NgaySinh)
							,Data.CreateParameter("GioiTinh", obj.GioiTinh)
							,Data.CreateParameter("DiaChi", obj.DiaChi)
							,Data.CreateParameter("SoDienThoai", obj.SoDienThoai)
							,Data.CreateParameter("ChuNhiem", obj.ChuNhiem)
							,Data.CreateParameter("MaMon", obj.MaMon)
			);
		}

		/// <summary>
		/// Delete the specified GIAOVIEN
		/// </summary>
		/// <param name="magiaovien">MaGiaoVien</param>
		/// <returns></returns>
		public void Delete(string magiaovien)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_GIAOVIEN_Delete", Data.CreateParameter("MaGiaoVien", magiaovien));
		}
		#endregion
	}
}
