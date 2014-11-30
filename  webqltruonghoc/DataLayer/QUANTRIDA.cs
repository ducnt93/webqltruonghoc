using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class QUANTRIDA
	{

		#region ***** Init Methods ***** 
		public QUANTRIDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public QUANTRI Populate(IDataReader myReader)
		{
			QUANTRI obj = new QUANTRI();
			obj.MaND = (string) myReader["MaND"];
			obj.MaLoaiND = (string) myReader["MaLoaiND"];
			obj.TenDNhap = (string) myReader["TenDNhap"];
			obj.TenNguoiDung = (string) myReader["TenNguoiDung"];
			obj.MatKhau = (string) myReader["MatKhau"];
			obj.TrangThai = (bool) myReader["TrangThai"];
			return obj;
		}

		/// <summary>
		/// Get QUANTRI by mand
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns>QUANTRI</returns>
		public QUANTRI GetByMaND(string mand)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_QUANTRI_GetByMaND", Data.CreateParameter("MaND", mand)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of QUANTRI
		/// </summary>
		/// <returns>List<<QUANTRI>></returns>
		public List<QUANTRI> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_QUANTRI_Get"))
			{
				List<QUANTRI> list = new List<QUANTRI>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of QUANTRI
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_QUANTRI_Get");
		}


		/// <summary>
		/// Get all of QUANTRI paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<QUANTRI>></returns>
		public List<QUANTRI> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_QUANTRI_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<QUANTRI> list = new List<QUANTRI>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of QUANTRI paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_QUANTRI_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new QUANTRI within QUANTRI database table
		/// </summary>
		/// <param name="obj">QUANTRI</param>
		/// <returns>key of table</returns>
		public int Add(QUANTRI obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaND", obj.MaND);
			//parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_QUANTRI_Add"
							,parameterItemID
							,Data.CreateParameter("MaLoaiND", obj.MaLoaiND)
							,Data.CreateParameter("TenDNhap", obj.TenDNhap)
							,Data.CreateParameter("TenNguoiDung", obj.TenNguoiDung)
							,Data.CreateParameter("MatKhau", obj.MatKhau)
							,Data.CreateParameter("TrangThai", obj.TrangThai)
			);
			return 0;
		}

		/// <summary>
		/// updates the specified QUANTRI
		/// </summary>
		/// <param name="obj">QUANTRI</param>
		/// <returns></returns>
		public void Update(QUANTRI obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_QUANTRI_Update"
							,Data.CreateParameter("MaND", obj.MaND)
							,Data.CreateParameter("MaLoaiND", obj.MaLoaiND)
							,Data.CreateParameter("TenDNhap", obj.TenDNhap)
							,Data.CreateParameter("TenNguoiDung", obj.TenNguoiDung)
							,Data.CreateParameter("MatKhau", obj.MatKhau)
							,Data.CreateParameter("TrangThai", obj.TrangThai)
			);
		}

		/// <summary>
		/// Delete the specified QUANTRI
		/// </summary>
		/// <param name="mand">MaND</param>
		/// <returns></returns>
		public void Delete(string mand)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_QUANTRI_Delete", Data.CreateParameter("MaND", mand));
		}
		#endregion
	}
}
