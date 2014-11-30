using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using QLTHPT1.BusinessObjects;

namespace QLTHPT1.DataAccess
{
	public class HOCKYDA
	{

		#region ***** Init Methods ***** 
		public HOCKYDA()
		{
		}
		#endregion

		#region ***** Get Methods ***** 
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public HOCKY Populate(IDataReader myReader)
		{
			HOCKY obj = new HOCKY();
			obj.MaHK = (int) myReader["MaHK"];
			obj.TenHK = (string) myReader["TenHK"];
		
			obj.TuNgay = (DateTime) myReader["TuNgay"];
			obj.DenNgay = (DateTime) myReader["DenNgay"];
            
			return obj;
		}

		/// <summary>
		/// Get HOCKY by mahk
		/// </summary>
		/// <param name="mahk">MaHK</param>
		/// <returns>HOCKY</returns>
		public HOCKY GetByMaHK(int mahk)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCKY_GetByMaHK", Data.CreateParameter("MaHK", mahk)))
			{
				if (reader.Read())
				{
					return Populate(reader);
				}
				return null;
			}
		}

		/// <summary>
		/// Get all of HOCKY
		/// </summary>
		/// <returns>List<<HOCKY>></returns>
		public List<HOCKY> GetList()
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCKY_Get"))
			{
				List<HOCKY> list = new List<HOCKY>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HOCKY
		/// </summary>
		/// <returns>DataSet</returns>
		public DataSet GetDataSet()
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCKY_Get");
		}


		/// <summary>
		/// Get all of HOCKY paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>List<<HOCKY>></returns>
		public List<HOCKY> GetListPaged(int recperpage, int pageindex)
		{
			using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCKY_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex)))
			{
				List<HOCKY> list = new List<HOCKY>();
				while (reader.Read())
				{
				list.Add(Populate(reader));
				}
				return list;
			}
		}

		/// <summary>
		/// Get DataSet of HOCKY paged
		/// </summary>
		/// <param name="recperpage">record per page</param>
		/// <param name="pageindex">page index</param>
		/// <returns>DataSet</returns>
		public DataSet GetDataSetPaged(int recperpage, int pageindex)
		{
			return SqlHelper.ExecuteDataSet(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCKY_GetPaged"
							,Data.CreateParameter("recperpage", recperpage)
							,Data.CreateParameter("pageindex", pageindex));
		}





		#endregion

		#region ***** Add Update Delete Methods ***** 
		/// <summary>
		/// Add a new HOCKY within HOCKY database table
		/// </summary>
		/// <param name="obj">HOCKY</param>
		/// <returns>key of table</returns>
		public int Add(HOCKY obj)
		{
			DbParameter parameterItemID = Data.CreateParameter("MaHK", obj.MaHK);
			//parameterItemID.Direction = ParameterDirection.Output;
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCKY_Add"
							,parameterItemID
							,Data.CreateParameter("TenHK", obj.TenHK)
							
							,Data.CreateParameter("TuNgay", obj.TuNgay)
							,Data.CreateParameter("DenNgay", obj.DenNgay)
			);
			return (int)parameterItemID.Value;
		}

		/// <summary>
		/// updates the specified HOCKY
		/// </summary>
		/// <param name="obj">HOCKY</param>
		/// <returns></returns>
		public void Update(HOCKY obj)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCKY_Update"
							,Data.CreateParameter("MaHK", obj.MaHK)
							,Data.CreateParameter("TenHK", obj.TenHK)
							//,Data.CreateParameter("MaNamHoc", obj.MaNamHoc)
							,Data.CreateParameter("TuNgay", obj.TuNgay)
							,Data.CreateParameter("DenNgay", obj.DenNgay)
			);
		}

		/// <summary>
		/// Delete the specified HOCKY
		/// </summary>
		/// <param name="mahk">MaHK</param>
		/// <returns></returns>
		public void Delete(int mahk)
		{
			SqlHelper.ExecuteNonQuery(Data.ConnectionString, CommandType.StoredProcedure,"sproc_HOCKY_Delete", Data.CreateParameter("MaHK", mahk));
		}
		#endregion

        public List<HOCKY> GetByMaNamHoc(int manh)
        {
            using (IDataReader reader = SqlHelper.ExecuteReader(Data.ConnectionString, CommandType.StoredProcedure, "sproc_HOCKY_GetByMaNamHoc", Data.CreateParameter("MaNamHoc", manh)))
            {
                List<HOCKY> list = new List<HOCKY>();
                while (reader.Read())
                {
                    list.Add( Populate(reader));
                }
                return list;
            }
        }
    }
}
