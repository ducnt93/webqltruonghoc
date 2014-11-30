using System;

namespace QLTHPT1.BusinessObjects
{
	public class KYLUAT
	{
		#region ***** Fields & Properties ***** 
		private int _KhoiHoc;
		public int KhoiHoc
		{ 
			get 
			{ 
				return _KhoiHoc;
			}
			set 
			{ 
				_KhoiHoc = value;
			}
		}
		private int _Lop;
		public int Lop
		{ 
			get 
			{ 
				return _Lop;
			}
			set 
			{ 
				_Lop = value;
			}
		}
		private string _HocSinh;
		public string HocSinh
		{ 
			get 
			{ 
				return _HocSinh;
			}
			set 
			{ 
				_HocSinh = value;
			}
		}
		private string _HinhThucKyLuat;
		public string HinhThucKyLuat
		{ 
			get 
			{ 
				return _HinhThucKyLuat;
			}
			set 
			{ 
				_HinhThucKyLuat = value;
			}
		}
		private DateTime _NgayKyLuat;
		public DateTime NgayKyLuat
		{ 
			get 
			{ 
				return _NgayKyLuat;
			}
			set 
			{ 
				_NgayKyLuat = value;
			}
		}
		private string _NoiDung;
		public string NoiDung
		{ 
			get 
			{ 
				return _NoiDung;
			}
			set 
			{ 
				_NoiDung = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public KYLUAT()
		{
		}
		public KYLUAT(int khoihoc)
		{
			this.KhoiHoc = khoihoc;
		}
		public KYLUAT(int khoihoc, int lop, string hocsinh, string hinhthuckyluat, DateTime ngaykyluat, string noidung)
		{
			this.KhoiHoc = khoihoc;
			this.Lop = lop;
			this.HocSinh = hocsinh;
			this.HinhThucKyLuat = hinhthuckyluat;
			this.NgayKyLuat = ngaykyluat;
			this.NoiDung = noidung;
		}
		#endregion
	}
}
