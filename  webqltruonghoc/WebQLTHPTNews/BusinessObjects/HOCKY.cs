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
		private string _TenHK;
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
		public HOCKY(int mahk, string tenhk, DateTime tungay, DateTime denngay)
		{
			this.MaHK = mahk;
			this.TenHK = tenhk;
			this.TuNgay = tungay;
			this.DenNgay = denngay;
		}
		#endregion
	}
}
