using System;

namespace QLTHPT1.BusinessObjects
{
	public class QUANTRI
	{
		#region ***** Fields & Properties ***** 
		private int _MaND;
		public int MaND
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
		public QUANTRI()
		{
		}
		public QUANTRI(int mand)
		{
			this.MaND = mand;
		}
		public QUANTRI(int mand, string tendnhap, string matkhau, bool trangthai)
		{
			this.MaND = mand;
			this.TenDNhap = tendnhap;
			this.MatKhau = matkhau;
			this.TrangThai = trangthai;
		}
		#endregion
	}
}
