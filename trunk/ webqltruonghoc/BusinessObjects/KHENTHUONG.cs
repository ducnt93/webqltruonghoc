using System;

namespace QLTHPT1.BusinessObjects
{
	public class KHENTHUONG
	{
		#region ***** Fields & Properties ***** 
		private int _KhoiHoc;
        private string _tenHocSinh;

        public string TenHocSinh
        {
            get { return _tenHocSinh; }
            set { _tenHocSinh = value; }
        }
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
		public KHENTHUONG(int khoihoc, string hocsinh, int lop, string hinhthuckhen, DateTime ngaykhen, string noidungkhen)
		{
			this.KhoiHoc = khoihoc;
			this.HocSinh = hocsinh;
			this.Lop = lop;
			this.HinhThucKhen = hinhthuckhen;
			this.NgayKhen = ngaykhen;
			this.NoiDungKhen = noidungkhen;
		}
		#endregion
	}
}
