using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class NGUOIDUNGDA
	{

		#region ***** Init Methods ***** 
		public NGUOIDUNGDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public NGUOIDUNG Populate(IDataReader myReader)
		{
			NGUOIDUNG obj = new NGUOIDUNG();
			obj.MaND = (string) myReader["MaND"];
			obj.MaLoaiND = (string) myReader["MaLoaiND"];
			obj.TenDNhap = (string) myReader["TenDNhap"];
			obj.MatKhau = (string) myReader["MatKhau"];
			obj.TrangThai = (bool) myReader["TrangThai"];
			return obj;
		}

		/// <summary>
		/// Get NGUOIDUNG by mand
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns>NGUOIDUNG</returns>
		public NGUOIDUNG GetByMaND(string mand)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NGUOIDUNG_GetByMaND", Data.CreateParameter("MaND", mand)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of NGUOIDUNG
		/// </summary>
		/// <returns>List<<NGUOIDUNG>></returns>
		public List<NGUOIDUNG> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NGUOIDUNG_Get"))
			{
				List<NGUOIDUNG> list = new List<NGUOIDUNG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of NGUOIDUNG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NGUOIDUNG_Get");
		}


		/// <summary>
		/// Get all of NGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<NGUOIDUNG>></returns>
		public List<NGUOIDUNG> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NGUOIDUNG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<NGUOIDUNG> list = new List<NGUOIDUNG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of NGUOIDUNG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NGUOIDUNG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new NGUOIDUNG within NGUOIDUNG database table
		/// </summary>
		/// <param name="obj">NGUOIDUNG</param>
		/// <returns>key of table</returns>
		public int Add(NGUOIDUNG obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaND", obj.MaND);
			
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NGUOIDUNG_Add"
							,parameterItemID
							,Data.CreateParameter("MaLoaiND", obj.MaLoaiND)
							,Data.CreateParameter("TenDNhap", obj.TenDNhap)
							,Data.CreateParameter("MatKhau", obj.MatKhau)
							,Data.CreateParameter("TrangThai", obj.TrangThai)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified NGUOIDUNG
		/// </summary>
		/// <param name="obj">NGUOIDUNG</param>
		/// <returns></returns>
		public void Update(NGUOIDUNG obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NGUOIDUNG_Update"
							,Data.CreateParameter("MaND", obj.MaND)
							,Data.CreateParameter("MaLoaiND", obj.MaLoaiND)
							,Data.CreateParameter("TenDNhap", obj.TenDNhap)
							,Data.CreateParameter("MatKhau", obj.MatKhau)
							,Data.CreateParameter("TrangThai", obj.TrangThai)
			);
		}

		/// <summary>
		/// Delete the specified NGUOIDUNG
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns></returns>
		public void Delete(string mand)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NGUOIDUNG_Delete", Data.CreateParameter("MaND", mand));
		}
		#endregion
	}
}
