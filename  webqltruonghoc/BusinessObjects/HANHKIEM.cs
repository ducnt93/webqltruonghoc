using System;

namespace QLTHPT1.BusinessObjects
{
	public class HANHKIEM
	{
		#region ***** Fields & Properties ***** 
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
		private int _MaLop;
		public int MaLop
		{ 
			get 
			{ 
				return _MaLop;
			}
			set 
			{ 
				_MaLop = value;
			}
		}
		private string _MaHK;
		public string MaHK
		{ 
			get 
			{ 
				return _MaHK;
			}
			set 
			{ 
				_MaHK = value;
			}
		}
		private Byte _NgayNghiCoPhep;
		public Byte NgayNghiCoPhep
		{ 
			get 
			{ 
				return _NgayNghiCoPhep;
			}
			set 
			{ 
				_NgayNghiCoPhep = value;
			}
		}
		private Byte _NgayNghiKoPhep;
		public Byte NgayNghiKoPhep
		{ 
			get 
			{ 
				return _NgayNghiKoPhep;
			}
			set 
			{ 
				_NgayNghiKoPhep = value;
			}
		}
		private Byte _SoLanKyLuat;
		public Byte SoLanKyLuat
		{ 
			get 
			{ 
				return _SoLanKyLuat;
			}
			set 
			{ 
				_SoLanKyLuat = value;
			}
		}
		private string _HanhKiem;
		public string HanhKiem
		{ 
			get 
			{ 
				return _HanhKiem;
			}
			set 
			{ 
				_HanhKiem = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public HANHKIEM()
		{
		}
		public HANHKIEM(string tenhocsinh, int malop, string mahk, Byte ngaynghicophep, Byte ngaynghikophep, Byte solankyluat, string hanhkiem)
		{
			this.TenHocSinh = tenhocsinh;
			this.MaLop = malop;
			this.MaHK = mahk;
			this.NgayNghiCoPhep = ngaynghicophep;
			this.NgayNghiKoPhep = ngaynghikophep;
			this.SoLanKyLuat = solankyluat;
			this.HanhKiem = hanhkiem;
		}
		#endregion
	}
}
