using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class NHATRUONGDA
	{

		#region ***** Init Methods ***** 
		public NHATRUONGDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public NHATRUONG Populate(IDataReader myReader)
		{
			NHATRUONG obj = new NHATRUONG();
			obj.MaTruong = (string) myReader["MaTruong"];
			obj.TenTruong = (string) myReader["TenTruong"];
			obj.DienThoai = (string) myReader["DienThoai"];
			obj.Email = (string) myReader["Email"];
			obj.DiaChi = (string) myReader["DiaChi"];
			obj.NgayLap = (DateTime) myReader["NgayLap"];
			obj.AnhDaiDien = (string) myReader["AnhDaiDien"];
			obj.HieuTruong = (string) myReader["HieuTruong"];
			obj.Website = (string) myReader["Website"];
			return obj;
		}


		/// <summary>
		/// Get all of NHATRUONG
		/// </summary>
		/// <returns>List<<NHATRUONG>></returns>
		public List<NHATRUONG> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NHATRUONG_Get"))
			{
				List<NHATRUONG> list = new List<NHATRUONG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of NHATRUONG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NHATRUONG_Get");
		}


		/// <summary>
		/// Get all of NHATRUONG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<NHATRUONG>></returns>
		public List<NHATRUONG> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_NHATRUONG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<NHATRUONG> list = new List<NHATRUONG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of NHATRUONG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NHATRUONG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new NHATRUONG within NHATRUONG database table
		/// </summary>
		/// <param name="obj">NHATRUONG</param>
		/// <returns>key of table</returns>
		public int Add(NHATRUONG obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_NHATRUONG_Add"
							,Data.CreateParameter("MaTruong", obj.MaTruong)
							,Data.CreateParameter("TenTruong", obj.TenTruong)
							,Data.CreateParameter("DienThoai", obj.DienThoai)
							,Data.CreateParameter("Email", obj.Email)
							,Data.CreateParameter("DiaChi", obj.DiaChi)
							,Data.CreateParameter("NgayLap", obj.NgayLap)
							,Data.CreateParameter("AnhDaiDien", obj.AnhDaiDien)
							,Data.CreateParameter("HieuTruong", obj.HieuTruong)
							,Data.CreateParameter("Website", obj.Website)
			);
			return 0;
		}

//No key Found
		#endregion
	}
}
