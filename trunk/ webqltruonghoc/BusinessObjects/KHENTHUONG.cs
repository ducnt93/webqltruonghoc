using System;

namespace QLTHPT1.BusinessObjects
{
	public class KHENTHUONG
	{
		#region ***** Fields & Properties ***** 
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
		private string _HinhThucKhen;
		public string HinhThucKhen
		{ 
			get 
			{ 
				return _HinhThucKhen;
			}
			set 
			{ 
				_HinhThucKhen = value;
			}
		}
		private string _NoiKhenThuong;
		public string NoiKhenThuong
		{ 
			get 
			{ 
				return _NoiKhenThuong;
			}
			set 
			{ 
				_NoiKhenThuong = value;
			}
		}
		private DateTime _NgayKhen;
		public DateTime NgayKhen
		{ 
			get 
			{ 
				return _NgayKhen;
			}
			set 
			{ 
				_NgayKhen = value;
			}
		}
		private string _NoiDungKhen;
		public string NoiDungKhen
		{ 
			get 
			{ 
				return _NoiDungKhen;
			}
			set 
			{ 
				_NoiDungKhen = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public KHENTHUONG()
		{
		}
		public KHENTHUONG(string tenkhoi, string tenhocsinh, string lop, string hinhthuckhen, string noikhenthuong, DateTime ngaykhen, string noidungkhen)
		{
			this.TenKhoi = tenkhoi;
			this.TenHocSinh = tenhocsinh;
			this.Lop = lop;
			this.HinhThucKhen = hinhthuckhen;
			this.NoiKhenThuong = noikhenthuong;
			this.NgayKhen = ngaykhen;
			this.NoiDungKhen = noidungkhen;
		}
		#endregion
	}
}
