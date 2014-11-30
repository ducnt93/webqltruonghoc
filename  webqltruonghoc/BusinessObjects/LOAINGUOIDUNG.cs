using System;

namespace QLTHPT1.BusinessObjects
{
	public class LOAINGUOIDUNG
	{
		#region ***** Fields & Properties ***** 
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
		private string _TenLoaiND;
		public string TenLoaiND
		{ 
			get 
			{ 
				return _TenLoaiND;
			}
			set 
			{ 
				_TenLoaiND = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public LOAINGUOIDUNG()
		{
		}
		public LOAINGUOIDUNG(int mand)
		{
			this.MaND = mand;
		}
		public LOAINGUOIDUNG(string maloaind, int mand, string magiaovien, string tenloaind)
		{
			this.MaLoaiND = maloaind;
			this.MaND = mand;
			this.MaGiaoVien = magiaovien;
			this.TenLoaiND = tenloaind;
		}
		#endregion
	}
}
