using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class HANHKIEMDA
	{

		#region ***** Init Methods ***** 
		public HANHKIEMDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public HANHKIEM Populate(IDataReader myReader)
		{
			HANHKIEM obj = new HANHKIEM();
            obj.MaHS = (string)myReader["MaHS"];
			obj.MaLop = (int) myReader["MaLop"];
			obj.MaHK = (int) myReader["MaHK"];
			obj.NgayNghiCoPhep = (int) myReader["NgayNghiCoPhep"];
            obj.NgayNghiKoPhep = (int)myReader["NgayNghiKoPhep"];
            obj.SoLanKyLuat = (int)myReader["SoLanKyLuat"];
			obj.HanhKiem = (string) myReader["HanhKiem"];
			return obj;
		}
        public HANHKIEM Populate1(IDataReader myReader)
        {
            HANHKIEM obj = new HANHKIEM();
            obj.MaHS = (string)myReader["MaHS"];
           // obj.MaLop = (int)myReader["MaLop"];
            obj.TenHocSinh = (string)myReader["TenHocSinh"];
            obj.NgayNghiCoPhep = (int)myReader["NgayNghiCoPhep"];
            obj.NgayNghiKoPhep = (int)myReader["NgayNghiKoPhep"];
            obj.SoLanKyLuat = (int)myReader["SoLanKyLuat"];
            obj.HanhKiem = (string)myReader["HanhKiem"];
            return obj;
        }


        public HANHKIEM Populate2(IDataReader myReader)
        {
            HANHKIEM obj = new HANHKIEM();
            obj.MaHS = (string)myReader["MaHS"];
            return obj;
        }

        public List<HANHKIEM> GetListByMaHSHK(string mahs, int mahk)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_HANHKIEM_GetByMaLopVaHK]", Data.CreateParameter("MaLop", mahs), Data.CreateParameter("MaHK", mahk)))
            {
                List<HANHKIEM> list = new List<HANHKIEM>();
                while (reader.Read())
                {
                    list.Add(Populate2(reader));
                }
                return list;
            }
        }
		public List<HANHKIEM> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_Get"))
			{
				List<HANHKIEM> list = new List<HANHKIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

        public List<HANHKIEM> GetListByMaLopHK(int malop, int mahk)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_HANHKIEM_GetByMaLopVaHK]", Data.CreateParameter("MaLop", malop), Data.CreateParameter("MaHK", mahk)))
            {
                List<HANHKIEM> list = new List<HANHKIEM>();
                while (reader.Read())
                {
                    list.Add(Populate1(reader));
                }
                return list;
            }
        }
		/// <summary>
		/// Get DataSet of HANHKIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Get");
		}


		/// <summary>
		/// Get all of HANHKIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<HANHKIEM>></returns>
		public List<HANHKIEM> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<HANHKIEM> list = new List<HANHKIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HANHKIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HANHKIEM within HANHKIEM database table
		/// </summary>
		/// <param name="obj">HANHKIEM</param>
		/// <returns>key of table</returns>
		public int Add(HANHKIEM obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HANHKIEM_Add"
                            , Data.CreateParameter("MaHS", obj.MaHS)
							,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHK", obj.MaHK)
							,Data.CreateParameter("NgayNghiCoPhep", obj.NgayNghiCoPhep)
							,Data.CreateParameter("NgayNghiKoPhep", obj.NgayNghiKoPhep)
							,Data.CreateParameter("SoLanKyLuat", obj.SoLanKyLuat)
							,Data.CreateParameter("HanhKiem", obj.HanhKiem)
			);
			return 0;
		}

public int Update(HANHKIEM obj )
        {
            SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_Update"
                            , Data.CreateParameter("MaHS", obj.MaHS)
			    		    ,Data.CreateParameter("MaLop", obj.MaLop)
							,Data.CreateParameter("MaHK", obj.MaHK)
							,Data.CreateParameter("NgayNghiCoPhep", obj.NgayNghiCoPhep)
							,Data.CreateParameter("NgayNghiKoPhep", obj.NgayNghiKoPhep)
							,Data.CreateParameter("SoLanKyLuat", obj.SoLanKyLuat)
							,Data.CreateParameter("HanhKiem", obj.HanhKiem)
                );
            return 0;
        }

        public void Delete(string mahs)
{
    SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HANHKIEM_Delete", Data.CreateParameter("MaHS", mahs));
}
		#endregion
	}
}
