using System;

namespace QLTHPT1.BusinessObjects
{
	public class KYLUAT
	{
		#region ***** Fields & Properties ***** 
		private string _KhoiHoc;
		public string KhoiHoc
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
		private string _Lop;
		public string Lop
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
		private string _TenHocSinh;
		public string TenHocSinh
		{ 
			get 
			{ 
				return _TenHocSinh;
			}
			set 
			{ 
				_TenHocSinh = value;
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
		private string _NgayKyLuat;
		public string NgayKyLuat
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
		public KYLUAT(string khoihoc, string lop, string tenhocsinh, string hinhthuckyluat, string ngaykyluat, string noidung)
		{
			this.KhoiHoc = khoihoc;
			this.Lop = lop;
			this.TenHocSinh = tenhocsinh;
			this.HinhThucKyLuat = hinhthuckyluat;
			this.NgayKyLuat = ngaykyluat;
			this.NoiDung = noidung;
		}
		#endregion
	}
}
