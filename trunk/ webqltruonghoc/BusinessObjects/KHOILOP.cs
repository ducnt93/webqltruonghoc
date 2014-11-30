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
		private int _MaHocKy;
		public int MaHocKy
		{ 
			get 
			{ 
				return _MaHocKy;
			}
			set 
			{ 
				_MaHocKy = value;
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
		public KHOILOP(int makhoi, string tenkhoi, int mahocky)
		{
			this.MaKhoi = makhoi;
			this.TenKhoi = tenkhoi;
			this.MaHocKy = mahocky;
		}
		#endregion
	}
}
