using System;

namespace QLTHPT1.BusinessObjects
{
	public class MONHOC
	{
		#region ***** Fields & Properties ***** 
		private string _MaMonHoc;
		public string MaMonHoc
		{ 
			get 
			{ 
				return _MaMonHoc;
			}
			set 
			{ 
				_MaMonHoc = value;
			}
		}
		private string _MaGiaoVien;
		public string MaGiaoVien
		{ 
			get 
			{ 
				return _MaGiaoVien;
			}
			set 
			{ 
				_MaGiaoVien = value;
			}
		}
		private string _TenMonHoc;
		public string TenMonHoc
		{ 
			get 
			{ 
				return _TenMonHoc;
			}
			set 
			{ 
				_TenMonHoc = value;
			}
		}
		private int _SoTiet;
		public int SoTiet
		{ 
			get 
			{ 
				return _SoTiet;
			}
			set 
			{ 
				_SoTiet = value;
			}
		}
		private int _HeSo;
		public int HeSo
		{ 
			get 
			{ 
				return _HeSo;
			}
			set 
			{ 
				_HeSo = value;
			}
		}
		private int _TrangThai;
		public int TrangThai
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
		public MONHOC()
		{
		}
		public MONHOC(string mamonhoc)
		{
			this.MaMonHoc = mamonhoc;
		}
		public MONHOC(string mamonhoc, string magiaovien, string tenmonhoc, int sotiet, int heso, int trangthai)
		{
			this.MaMonHoc = mamonhoc;
			this.MaGiaoVien = magiaovien;
			this.TenMonHoc = tenmonhoc;
			this.SoTiet = sotiet;
			this.HeSo = heso;
			this.TrangThai = trangthai;
		}
		#endregion
	}
}
