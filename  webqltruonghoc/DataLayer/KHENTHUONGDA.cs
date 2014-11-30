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

        public KHENTHUONG Populate1(IDataReader myReader)
        {
            KHENTHUONG obj = new KHENTHUONG();
            obj.HocSinh = (string)myReader["HocSinh"];
            obj.TenHocSinh = (string)myReader["TenHocSinh"];
            obj.HinhThucKhen = (string)myReader["HinhThucKhen"];
            obj.NgayKhen = (DateTime)myReader["NgayKhen"];
            obj.NoiDungKhen = (string)myReader["NoiDungKhen"];
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

        public List<KHENTHUONG> GetByLop(int lop)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_KHENTHUONG_GetByLop]",Data.CreateParameter("Lop",lop)))
            {
                List<KHENTHUONG> list = new List<KHENTHUONG>();
                while (reader.Read())
                {
                    list.Add(Populate1(reader));
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
							,Data.CreateParameter("KhoiHoc", obj.KhoiHoc)
							,Data.CreateParameter("HocSinh", obj.HocSinh)
							,Data.CreateParameter("Lop", obj.Lop)
							,Data.CreateParameter("HinhThucKhen", obj.HinhThucKhen)
							,Data.CreateParameter("NgayKhen", obj.NgayKhen)
							,Data.CreateParameter("NoiDungKhen", obj.NoiDungKhen)
			);
			return 0;
		}

        public void Update(KHENTHUONG obj)
        {
            SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure, "sproc_KHENTHUONG_Update"
                            , Data.CreateParameter("KhoiHoc", obj.KhoiHoc)
                            , Data.CreateParameter("HocSinh", obj.HocSinh)
                            , Data.CreateParameter("Lop", obj.Lop)
                            , Data.CreateParameter("HinhThucKhen", obj.HinhThucKhen)  
                            , Data.CreateParameter("NgayKhen", obj.NgayKhen)
                            , Data.CreateParameter("NoiDungKhen", obj.NoiDungKhen)
            );
            
        }

        public void Delete(string hocsinh)
        {
            SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_KHENTHUONG_Delete]", Data.CreateParameter("HocSinh", hocsinh));
        }
//No key Found
		#endregion
	}
}
