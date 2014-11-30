using System;

namespace QLTHPT1.BusinessObjects
{
	public class NGUOIDUNG
	{
		#region ***** Fields & Properties ***** 
		private string _MaND;
		public string MaND
		{ 
			get 
			{ 
				return _MaND;
			}
			set 
			{ 
				_MaND = value;
			}
		}
		private string _MaLoaiND;
		public string MaLoaiND
		{ 
			get 
			{ 
				return _MaLoaiND;
			}
			set 
			{ 
				_MaLoaiND = value;
			}
		}
		private string _TenDNhap;
		public string TenDNhap
		{ 
			get 
			{ 
				return _TenDNhap;
			}
			set 
			{ 
				_TenDNhap = value;
			}
		}
		private string _MatKhau;
		public string MatKhau
		{ 
			get 
			{ 
				return _MatKhau;
			}
			set 
			{ 
				_MatKhau = value;
			}
		}
		private bool _TrangThai;
		public bool TrangThai
		{ 
			get 
			{ 
				return _TrangThai;
			}
			set 
			{ 
				_TrangThai = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public NGUOIDUNG()
		{
		}
		public NGUOIDUNG(string mand)
		{
			this.MaND = mand;
		}
		public NGUOIDUNG(string mand, string maloaind, string tendnhap, string matkhau, bool trangthai)
		{
			this.MaND = mand;
			this.MaLoaiND = maloaind;
			this.TenDNhap = tendnhap;
			this.MatKhau = matkhau;
			this.TrangThai = trangthai;
		}
		#endregion
	}
}
