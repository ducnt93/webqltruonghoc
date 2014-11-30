using System;

namespace QLTHPT1.BusinessObjects
{
	public class TOBOMON
	{
		#region ***** Fields & Properties ***** 
		private int _MaTo;
		public int MaTo
		{ 
			get 
			{ 
				return _MaTo;
			}
			set 
			{ 
				_MaTo = value;
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
		private string _TenToBoMon;
		public string TenToBoMon
		{ 
			get 
			{ 
				return _TenToBoMon;
			}
			set 
			{ 
				_TenToBoMon = value;
			}
		}
		private string _MoTa;
		public string MoTa
		{ 
			get 
			{ 
				return _MoTa;
			}
			set 
			{ 
				_MoTa = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public TOBOMON()
		{
		}
		public TOBOMON(int mato)
		{
			this.MaTo = mato;
		}
		public TOBOMON(int mato, string maloaind, string tentobomon, string mota)
		{
			this.MaTo = mato;
			this.MaLoaiND = maloaind;
			this.TenToBoMon = tentobomon;
			this.MoTa = mota;
		}
		#endregion
	}
}
