using System;

namespace QLTHPT1.BusinessObjects
{
	public class NAMHOC
	{
		#region ***** Fields & Properties ***** 
		private int _MaNamHoc;
		public int MaNamHoc
		{ 
			get 
			{ 
				return _MaNamHoc;
			}
			set 
			{ 
				_MaNamHoc = value;
			}
		}
		private string _TenNamHoc;
		public string TenNamHoc
		{ 
			get 
			{ 
				return _TenNamHoc;
			}
			set 
			{ 
				_TenNamHoc = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public NAMHOC()
		{
		}
		public NAMHOC(int manamhoc)
		{
			this.MaNamHoc = manamhoc;
		}
		public NAMHOC(int manamhoc, string tennamhoc)
		{
			this.MaNamHoc = manamhoc;
			this.TenNamHoc = tennamhoc;
		}
		#endregion
	}
}
