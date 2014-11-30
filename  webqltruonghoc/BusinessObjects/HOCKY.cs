using System;

namespace QLTHPT1.BusinessObjects
{
	public class HOCKY
	{
		#region ***** Fields & Properties ***** 
		private int _MaHK;
		public int MaHK
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
        private string _TenHK, _TenNamHoc;

        public string TenNamHoc
        {
            get { return _TenNamHoc; }
            set { _TenNamHoc = value; }
        }
		public string TenHK
		{ 
			get 
			{ 
				return _TenHK;
			}
			set 
			{ 
				_TenHK = value;
			}
		}
		private int _MaNamHoc;
		public int MaNamHoc
		{ 
			get 
			{ 
				return _MaNamHoc;
			}
			set 
			{ 
				_MaNamHoc = value;
			}
		}
		private DateTime _TuNgay;
		public DateTime TuNgay
		{ 
			get 
			{ 
				return _TuNgay;
			}
			set 
			{ 
				_TuNgay = value;
			}
		}
		private DateTime _DenNgay;
		public DateTime DenNgay
		{ 
			get 
			{ 
				return _DenNgay;
			}
			set 
			{ 
				_DenNgay = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public HOCKY()
		{
		}
		public HOCKY(int mahk)
		{
			this.MaHK = mahk;
		}
		public HOCKY(int mahk, string tenhk, int manamhoc, DateTime tungay, DateTime denngay, string tennamhoc)
		{
			this.MaHK = mahk;
			this.TenHK = tenhk;
			this.MaNamHoc = manamhoc;
			this.TuNgay = tungay;
			this.DenNgay = denngay;
            this.TenNamHoc = tennamhoc;
		}
		#endregion
	}
}
