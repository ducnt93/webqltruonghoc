using System;

namespace QLTHPT1.BusinessObjects
{
	public class KHOILOP
	{
		#region ***** Fields & Properties ***** 
		private int _MaKhoi;
		public int MaKhoi
		{ 
			get 
			{ 
				return _MaKhoi;
			}
			set 
			{ 
				_MaKhoi = value;
			}
		}
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
		private string _TenKhoi;
		public string TenKhoi
		{ 
			get 
			{ 
				return _TenKhoi;
			}
			set 
			{ 
				_TenKhoi = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public KHOILOP()
		{
		}
		public KHOILOP(int makhoi)
		{
			this.MaKhoi = makhoi;
		}
		public KHOILOP(int makhoi, int manamhoc, string tenkhoi)
		{
			this.MaKhoi = makhoi;
			this.MaNamHoc = manamhoc;
			this.TenKhoi = tenkhoi;
		}
		#endregion
	}
}
