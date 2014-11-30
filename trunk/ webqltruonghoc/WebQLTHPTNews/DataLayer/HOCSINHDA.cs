using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class HOCSINHDA
	{

		#region ***** Init Methods ***** 
		public HOCSINHDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public HOCSINH Populate(IDataReader myReader)
		{
			HOCSINH obj = new HOCSINH();
			obj.MaHocSinh = (string) myReader["MaHocSinh"];
			obj.TenHocSinh = (string) myReader["TenHocSinh"];
			obj.Email = (string) myReader["Email"];
			obj.GioiTinh = (string) myReader["GioiTinh"];
			obj.NgaySinh = (DateTime) myReader["NgaySinh"];
			obj.NoiSinh = (string) myReader["NoiSinh"];
			obj.DiaChi = (string) myReader["DiaChi"];
			obj.NgayNhapHoc = (DateTime) myReader["NgayNhapHoc"];
			obj.HoTenBo = (string) myReader["HoTenBo"];
			obj.HoTenMe = (string) myReader["HoTenMe"];
			obj.Anh = (string) myReader["Anh"];
			obj.NgheBo = (string) myReader["NgheBo"];
			obj.NgheMe = (string) myReader["NgheMe"];
			obj.NgayVaoDoan = (DateTime) myReader["NgayVaoDoan"];
			obj.TrangThai = (string) myReader["TrangThai"];
			obj.MaNamHoc = (int) myReader["MaNamHoc"];
			obj.SoDienThoaiNha = (string) myReader["SoDienThoaiNha"];
			return obj;
		}

		/// <summary>
		/// Get HOCSINH by mahocsinh
		/// </summary>
		/// <param name="mahocsinh">MaHocSinh</param>
		/// <returns>HOCSINH</returns>
		public HOCSINH GetByMaHocSinh(string mahocsinh)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCSINH_GetByMaHocSinh", Data.CreateParameter("MaHocSinh", mahocsinh)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of HOCSINH
		/// </summary>
		/// <returns>List<<HOCSINH>></returns>
		public List<HOCSINH> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCSINH_Get"))
			{
				List<HOCSINH> list = new List<HOCSINH>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HOCSINH
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCSINH_Get");
		}


		/// <summary>
		/// Get all of HOCSINH paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<HOCSINH>></returns>
		public List<HOCSINH> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCSINH_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<HOCSINH> list = new List<HOCSINH>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HOCSINH paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCSINH_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HOCSINH within HOCSINH database table
		/// </summary>
		/// <param name="obj">HOCSINH</param>
		/// <returns>key of table</returns>
		public int Add(HOCSINH obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaHocSinh", obj.MaHocSinh);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCSINH_Add"
							,parameterItemID
							,Data.CreateParameter("TenHocSinh", obj.TenHocSinh)
							,Data.CreateParameter("Email", obj.Email)
							,Data.CreateParameter("GioiTinh", obj.GioiTinh)
							,Data.CreateParameter("NgaySinh", obj.NgaySinh)
							,Data.CreateParameter("NoiSinh", obj.NoiSinh)
							,Data.CreateParameter("DiaChi", obj.DiaChi)
							,Data.CreateParameter("NgayNhapHoc", obj.NgayNhapHoc)
							,Data.CreateParameter("HoTenBo", obj.HoTenBo)
							,Data.CreateParameter("HoTenMe", obj.HoTenMe)
							,Data.CreateParameter("Anh", obj.Anh)
							,Data.CreateParameter("NgheBo", obj.NgheBo)
							,Data.CreateParameter("NgheMe", obj.NgheMe)
							,Data.CreateParameter("NgayVaoDoan", obj.NgayVaoDoan)
							,Data.CreateParameter("TrangThai", obj.TrangThai)
							,Data.CreateParameter("MaNamHoc", obj.MaNamHoc)
							,Data.CreateParameter("SoDienThoaiNha", obj.SoDienThoaiNha)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified HOCSINH
		/// </summary>
		/// <param name="obj">HOCSINH</param>
		/// <returns></returns>
		public void Update(HOCSINH obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCSINH_Update"
							,Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
							,Data.CreateParameter("TenHocSinh", obj.TenHocSinh)
							,Data.CreateParameter("Email", obj.Email)
							,Data.CreateParameter("GioiTinh", obj.GioiTinh)
							,Data.CreateParameter("NgaySinh", obj.NgaySinh)
							,Data.CreateParameter("NoiSinh", obj.NoiSinh)
							,Data.CreateParameter("DiaChi", obj.DiaChi)
							,Data.CreateParameter("NgayNhapHoc", obj.NgayNhapHoc)
							,Data.CreateParameter("HoTenBo", obj.HoTenBo)
							,Data.CreateParameter("HoTenMe", obj.HoTenMe)
							,Data.CreateParameter("Anh", obj.Anh)
							,Data.CreateParameter("NgheBo", obj.NgheBo)
							,Data.CreateParameter("NgheMe", obj.NgheMe)
							,Data.CreateParameter("NgayVaoDoan", obj.NgayVaoDoan)
							,Data.CreateParameter("TrangThai", obj.TrangThai)
							,Data.CreateParameter("MaNamHoc", obj.MaNamHoc)
							,Data.CreateParameter("SoDienThoaiNha", obj.SoDienThoaiNha)
			);
		}

		/// <summary>
		/// Delete the specified HOCSINH
		/// </summary>
		/// <param name="mahocsinh">MaHocSinh</param>
		/// <returns></returns>
		public void Delete(string mahocsinh)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCSINH_Delete", Data.CreateParameter("MaHocSinh", mahocsinh));
		}
		#endregion
	}
}
