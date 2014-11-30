using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class BANGDIEMDA
	{

		#region ***** Init Methods ***** 
		public BANGDIEMDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public BANGDIEM Populate(IDataReader myReader)
		{
			BANGDIEM obj = new BANGDIEM();
            obj.MaHocSinh = (string)myReader["MaHocSinh"];
            obj.MaMonHoc = (int)myReader["MaMonHoc"];
            obj.DM_1 = (Single)myReader["DM_1"];
            obj.DM_2 = (Single)myReader["DM_2"];
            obj.D15_1 = (Single)myReader["D15_1"];
            obj.D15_2 = (Single)myReader["D15_2"];
            obj.D15_3 = (Single)myReader["D15_3"];
            obj.D1T_1 = (Single)myReader["D1T_1"];
            obj.D1T_2 = (Single)myReader["D1T_2"];
            obj.Malop = (int)myReader["Malop"];
            obj.MaHK = (int)myReader["MaHK"];
            obj.DThi = (Single)myReader["DThi"];
			return obj;
		}
        public BANGDIEM Populate3(IDataReader myReader)
        {
            BANGDIEM obj = new BANGDIEM();
            obj.MaHocSinh = (string)myReader["MaHocSinh"];
            obj.TenHocSinh = (string)myReader["TenHocSinh"];
            obj.MaHK = (int)myReader["MaHK"];
            obj.DM_1 = (Single)myReader["DM_1"];
            obj.DM_2 = (Single)myReader["DM_2"];
            obj.D15_1 = (Single)myReader["D15_1"];
            obj.D15_2 = (Single)myReader["D15_2"];
            obj.D15_3 = (Single)myReader["D15_3"];
            obj.D1T_1 = (Single)myReader["D1T_1"];
            obj.D1T_2 = (Single)myReader["D1T_2"];
            obj.DThi = (Single)myReader["DThi"];
            obj.Malop = (int)myReader["MaLop"];
            return obj;
        }
        public BANGDIEM Populate1(IDataReader myReader)
        {
            BANGDIEM obj = new BANGDIEM();
            obj.MaHocSinh = (string)myReader["MaHocSinh"];
            obj.MaMonHoc = (int)myReader["MaMonHoc"];
            obj.DM_1 = (Single)myReader["DM_1"];
            obj.DM_2 = (Single)myReader["DM_2"];
            obj.D15_1 = (Single)myReader["D15_1"];
            obj.D15_2 = (Single)myReader["D15_2"];
            obj.D15_3 = (Single)myReader["D15_3"];
            obj.D1T_1 = (Single)myReader["D1T_1"];
            obj.D1T_2 = (Single)myReader["D1T_2"];
            obj.DThi = (Single)myReader["DThi"];
            obj.MaHK = (int)myReader["MaHK"];    
            return obj;
        }
        public BANGDIEM Populate4(IDataReader myReader)
        {
            BANGDIEM obj = new BANGDIEM();
            obj.DM_1 = (Single)myReader["DM_1"];
            obj.DM_2 = (Single)myReader["DM_2"];
            obj.D15_1 = (Single)myReader["D15_1"];
            obj.D15_2 = (Single)myReader["D15_2"];
            obj.D15_3 = (Single)myReader["D15_3"];
            obj.D1T_1 = (Single)myReader["D1T_1"];
            obj.D1T_2 = (Single)myReader["D1T_2"];
            obj.DThi = (Single)myReader["DThi"];
            return obj;
        }
        public BANGDIEM Populate2(IDataReader myReader)
        {
            BANGDIEM obj = new BANGDIEM();
            obj.MaHocSinh = (string)myReader["MaHocSinh"];
            obj.TenHocSinh = (string)myReader["TenHocSinh"];
            obj.TenMonHoc = (string)myReader["TenMonHoc"];
            obj.NgaySinh = (DateTime)myReader["NgaySinh"];
            obj.DM_1 = (Single)myReader["DM_1"];
            obj.DM_2 = (Single)myReader["DM_2"];
            obj.D15_1 = (Single)myReader["D15_1"];
            obj.D15_2 = (Single)myReader["D15_2"];
            obj.D15_3 = (Single)myReader["D15_3"];
            obj.D1T_1 = (Single)myReader["D1T_1"];
            obj.D1T_2 = (Single)myReader["D1T_2"];
            obj.DThi = (Single)myReader["DThi"];
           // obj.DTB = (float)myReader["DTB"];
            return obj;
        }
        public BANGDIEM Populate6(IDataReader myReader)
        {
            BANGDIEM obj = new BANGDIEM();
            obj.DM_1 = (Single)myReader["DM_1"];
            obj.DM_2 = (Single)myReader["DM_2"];
            obj.D15_1 = (Single)myReader["D15_1"];
            obj.D15_2 = (Single)myReader["D15_2"];
            obj.D15_3 = (Single)myReader["D15_3"];
            obj.D1T_1 = (Single)myReader["D1T_1"];
            obj.D1T_2 = (Single)myReader["D1T_2"];
            obj.DThi = (Single)myReader["DThi"];
            return obj;
        }
        public BANGDIEM Populate5(IDataReader myReader)
        {
            BANGDIEM obj = new BANGDIEM();
            obj.MaHocSinh = (string)myReader["MaHocSinh"];
            return obj;
        }
		/// <summary>
		/// Get all of BANGDIEM
		/// </summary>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetList()
		{
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_Get"))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
           
		}
   
        public List<BANGDIEM> GetByMaMon(int mamon)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetByMaMon", Data.CreateParameter("MaMonHoc", mamon)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate(reader));
                }
                return list;
            }
        }

        public List<BANGDIEM> GetByMaMonVaLopVaHK(int mamon, int malop,int mahk)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_GetByMaMonVaLopVaHK]", Data.CreateParameter("MaMonHoc", mamon), Data.CreateParameter("MaLop", malop), Data.CreateParameter("MaHK", mahk)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate2(reader));
                }
                return list;
            }
        }
        public List<BANGDIEM> GetByMaMonHKMaHS(int mamon, int malop, string mahs)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_GetByMaMonHKByHS]", Data.CreateParameter("MaMonHoc", mamon), Data.CreateParameter("MaLop", malop), Data.CreateParameter("MaHK", mahs)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate5(reader));
                }
                return list;
            }
        }
        public List<BANGDIEM> GetByMaMonHKMaHS3(int mahk, int malop, string mahs,int mamon)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_GetByMaHocSinh3]", Data.CreateParameter("MaHK", mahk), Data.CreateParameter("MaLop", malop), Data.CreateParameter("MaHocSinh", mahs), Data.CreateParameter("MaMon", mamon)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate6(reader));
                }
                return list;
            }
        }
        public List<BANGDIEM> GetByMaMonVaLopVaHKByHS(int mamon, int malop, int mahk,string mahs)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_GetByMaMonVaLopVaHKByHS]", Data.CreateParameter("MaMonHoc", mamon), Data.CreateParameter("MaLop", malop), Data.CreateParameter("MaHK", mahk), Data.CreateParameter("MaHocSinh", mahs)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate4(reader));
                }
                return list;
            }
        }
        public List<BANGDIEM> GetByHKVaLop(int malop, int mahk)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_GetByHKVaLop]", Data.CreateParameter("MaLop", malop), Data.CreateParameter("MaHK", mahk)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate2(reader));
                }
                return list;
            }
        }
        public List<BANGDIEM> GetByMaHocSinh(string mahs,int mahk,int mamon)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetByMaHocSinh", Data.CreateParameter("MaHocSinh", mahs),Data.CreateParameter("MaHK",mahk),Data.CreateParameter("MaMonHoc",mamon)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate3(reader));
                }
                return list;
            }
        }
        public List<BANGDIEM> GetByMaHocSinhTraCuu(string mahs, int mahk, int malop)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_GetByMaHocSinhTraCuu]", Data.CreateParameter("MaHocSinh", mahs), Data.CreateParameter("MaHK", mahk), Data.CreateParameter("MaLop", malop)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate3(reader));
                }
                return list;
            }
        }
         
        public List<BANGDIEM> GetByMaHocSinh3(string mahs,int mahk)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetByMaHocSinh3", Data.CreateParameter("MaHocSinh", mahs),Data.CreateParameter("MaHK",mahk)))
            {
                List<BANGDIEM> list = new List<BANGDIEM>();
                while (reader.Read())
                {
                    list.Add(Populate3(reader));
                }
                return list;
            }
        }
		/// <summary>
		/// Get DataSet of BANGDIEM
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_BANGDIEM_Get");
		}


		/// <summary>
		/// Get all of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<BANGDIEM>></returns>
		public List<BANGDIEM> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<BANGDIEM> list = new List<BANGDIEM>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of BANGDIEM paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_BANGDIEM_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new BANGDIEM within BANGDIEM database table
		/// </summary>
		/// <param name="obj">BANGDIEM</param>
		/// <returns>key of table</returns>
		public int Add(BANGDIEM obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_BANGDIEM_Add"
                          , Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
                            , Data.CreateParameter("MaMonHoc", obj.MaMonHoc)
                            , Data.CreateParameter("MaHK", obj.MaHK)
                            , Data.CreateParameter("MaLop", obj.Malop)
                            , Data.CreateParameter("DM_1", obj.DM_1)
                            , Data.CreateParameter("DM_2", obj.DM_2)
                            , Data.CreateParameter("D15_1", obj.D15_1)
                            , Data.CreateParameter("D15_2", obj.D15_2)
                            , Data.CreateParameter("D15_3", obj.D15_3)
                            , Data.CreateParameter("D1T_1", obj.D1T_1)
                            , Data.CreateParameter("D1T_2", obj.D1T_2)
                            , Data.CreateParameter("DThi", obj.DThi)
			);
			return 0;
		}

        public void Update(BANGDIEM obj)
        {
            SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure, "sproc_BANGDIEM_Update"
                            , Data.CreateParameter("MaHocSinh", obj.MaHocSinh)
                            , Data.CreateParameter("MaMonHoc", obj.MaMonHoc)
                            , Data.CreateParameter("DM_1", obj.DM_1)
                            , Data.CreateParameter("DM_2", obj.DM_2)
                            , Data.CreateParameter("D15_1", obj.D15_1)
                            , Data.CreateParameter("D15_2", obj.D15_2)
                            , Data.CreateParameter("D15_3", obj.D15_3)
                            , Data.CreateParameter("D1T_1", obj.D1T_1)
                            , Data.CreateParameter("D1T_2", obj.D1T_2)
                            , Data.CreateParameter("Malop", obj.Malop)
                            , Data.CreateParameter("MaHK", obj.MaHK)
                            , Data.CreateParameter("DThi", obj.DThi)
            );
        }

        public void Delete(string mahs)
        {
            SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure, "[sproc_BANGDIEM_Delete]", Data.CreateParameter("MaHocSinh", mahs));
        }
		#endregion

        #region TrungPQ Add new
        public DataTable LoadHS_Nam_Ky_Khoi_Lop(string Nam, string Ky, String Khoi, string Lop)
        {
            DataTable result = null;
            QLTHPT1.DataAccess.SqlHelper.library_Parameter[] param = new QLTHPT1.DataAccess.SqlHelper.library_Parameter[4];
            param[0] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@Nam", Nam);
            param[1] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@Ky", Ky);
            param[2] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@Khoi", Khoi);
            param[3] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@Lop", Lop);
            result = SqlHelper.SelectTableSP("LoadHS_Nam_Ky_Khoi_Lop", param);
            return result;
        }
        public DataTable Get_Diem_MaHocSinh_MaMonHoc(string MaHocSinh, int MaMonHoc)
        {
            DataTable result = null;
            QLTHPT1.DataAccess.SqlHelper.library_Parameter[] param = new QLTHPT1.DataAccess.SqlHelper.library_Parameter[2];
            param[0] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@MaHocSinh", MaHocSinh);
            param[1] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@MaMonHoc", MaMonHoc);
            result = SqlHelper.SelectTableSP("Get_Diem_MaHocSinh_MaMonHoc", param);
            return result;
        }

        public DataTable GetByMaHocSinhTraCuu_(string mahs, int mahk, int malop)
        {
            DataTable result = null;
            QLTHPT1.DataAccess.SqlHelper.library_Parameter[] param = new QLTHPT1.DataAccess.SqlHelper.library_Parameter[3];
            param[0] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@MaHocSinh", mahs);
            param[1] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@MaHK", mahk);
            param[2] = new QLTHPT1.DataAccess.SqlHelper.library_Parameter("@MaLop", malop);
            result = SqlHelper.SelectTableSP("sproc_BANGDIEM_GetByMaHocSinhTraCuu", param);
            return result;
        }
        #endregion
	}
}
