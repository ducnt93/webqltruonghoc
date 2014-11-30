using System;

namespace QLTHPT1.BusinessObjects
{
	public class THOIKHOABIEU
	{
		#region ***** Fields & Properties ***** 
		private string _MaTKB;
		public string MaTKB
		{ 
			get 
			{ 
				return _MaTKB;
			}
			set 
			{ 
				_MaTKB = value;
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
		private string _Tiet1;
		public string Tiet1
		{ 
			get 
			{ 
				return _Tiet1;
			}
			set 
			{ 
				_Tiet1 = value;
			}
		}
		private string _Tiet2;
		public string Tiet2
		{ 
			get 
			{ 
				return _Tiet2;
			}
			set 
			{ 
				_Tiet2 = value;
			}
		}
		private string _Tiet3;
		public string Tiet3
		{ 
			get 
			{ 
				return _Tiet3;
			}
			set 
			{ 
				_Tiet3 = value;
			}
		}
		private string _Tiet4;
		public string Tiet4
		{ 
			get 
			{ 
				return _Tiet4;
			}
			set 
			{ 
				_Tiet4 = value;
			}
		}
		private string _Tiet5;
		public string Tiet5
		{ 
			get 
			{ 
				return _Tiet5;
			}
			set 
			{ 
				_Tiet5 = value;
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
		public THOIKHOABIEU()
		{
		}
		public THOIKHOABIEU(string matkb)
		{
			this.MaTKB = matkb;
		}
		public THOIKHOABIEU(string matkb, int malop, string tiet1, string tiet2, string tiet3, string tiet4, string tiet5, DateTime tungay, DateTime denngay)
		{
			this.MaTKB = matkb;
			this.MaLop = malop;
			this.Tiet1 = tiet1;
			this.Tiet2 = tiet2;
			this.Tiet3 = tiet3;
			this.Tiet4 = tiet4;
			this.Tiet5 = tiet5;
			this.TuNgay = tungay;
			this.DenNgay = denngay;
		}
		#endregion
	}
}
