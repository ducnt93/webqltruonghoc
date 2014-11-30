using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class PHANCONGDA
	{

		#region ***** Init Methods ***** 
		public PHANCONGDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public PHANCONG Populate(IDataReader myReader)
		{
			PHANCONG obj = new PHANCONG();
			obj.STT = (int) myReader["STT"];
			obj.MaMonHoc = (int) myReader["MaMonHoc"];
			obj.MaLop = (int) myReader["MaLop"];
			obj.MaGiaoVien = (string) myReader["MaGiaoVien"];
			return obj;
		}
        public PHANCONG Populate1(IDataReader myReader)
        {
            PHANCONG obj = new PHANCONG();
            obj.STT = (int)myReader["STT"];
            obj.TenGiaoVien = (string)myReader["TenGiaoVien"];
            obj.TenLop = (string)myReader["TenLop"];
            obj.TenMonHoc = (string)myReader["TenMonHoc"];
            return obj;
        }
		/// <summary>
		/// Get PHANCONG by stt
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns>PHANCONG</returns>
		public List<PHANCONG> GetBySTT(int stt)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANCONG_GetBySTT", Data.CreateParameter("STT", stt)))
			{
                List<PHANCONG> list = new List<PHANCONG>();
				while (reader.Read())
				{
					list.Add( Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get all of PHANCONG
		/// </summary>
		/// <returns>List<<PHANCONG>></returns>
		public List<PHANCONG> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANCONG_Get"))
			{
				List<PHANCONG> list = new List<PHANCONG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}
        public List<PHANCONG> GetByMaLop(int malop)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANCONG_GetByMaLop",Data.CreateParameter("MaLop",malop)))
            {
                List<PHANCONG> list = new List<PHANCONG>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
        }

        public List<PHANCONG> GetXem(int malop)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_PHANCONG_GetXem]",Data.CreateParameter("MaLop",malop)))
            {
                List<PHANCONG> list = new List<PHANCONG>();
                while (reader.Read())
                {
                    list.Add(Populate1(reader));
                }
                return list;
            }
        }
		/// <summary>
		/// Get DataSet of PHANCONG
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANCONG_Get");
		}


		/// <summary>
		/// Get all of PHANCONG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<PHANCONG>></returns>
		public List<PHANCONG> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_PHANCONG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<PHANCONG> list = new List<PHANCONG>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of PHANCONG paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANCONG_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new PHANCONG within PHANCONG database table
		/// </summary>
		/// <param name="obj">PHANCONG</param>
		/// <returns>key of table</returns>
		public int Add(PHANCONG obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("STT", obj.STT);
			parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANCONG_Add"
							,parameterItemID
							,Data.CreateParameter("MaMonHoc", obj.MaMonHoc)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaGiaoVien", obj.MaGiaoVien)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified PHANCONG
		/// </summary>
		/// <param name="obj">PHANCONG</param>
		/// <returns></returns>
		public void Update(PHANCONG obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANCONG_Update"
							,Data.CreateParameter("STT", obj.STT)
							,Data.CreateParameter("MaMonHoc", obj.MaMonHoc)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaGiaoVien", obj.MaGiaoVien)
			);
		}

		/// <summary>
		/// Delete the specified PHANCONG
		/// </summary>
		/// <param name="stt">STT</param>
		/// <returns></returns>
		public void Delete(int stt)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_PHANCONG_Delete", Data.CreateParameter("STT", stt));
		}
		#endregion
	}
}
