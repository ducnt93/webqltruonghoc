using System;

namespace QLTHPT1.BusinessObjects
{
	public class CHUYENLOP
	{
		#region ***** Fields & Properties ***** 
		private string _TuLop;
		public string TuLop
		{ 
			get 
			{ 
				return _TuLop;
			}
			set 
			{ 
				_TuLop = value;
			}
		}
		private string _DenLop;
		public string DenLop
		{ 
			get 
			{ 
				return _DenLop;
			}
			set 
			{ 
				_DenLop = value;
			}
		}
		private DateTime _NgayChuyen;
		public DateTime NgayChuyen
		{ 
			get 
			{ 
				return _NgayChuyen;
			}
			set 
			{ 
				_NgayChuyen = value;
			}
		}
		private string _LyDoChuyen;
		public string LyDoChuyen
		{ 
			get 
			{ 
				return _LyDoChuyen;
			}
			set 
			{ 
				_LyDoChuyen = value;
			}
		}
		private bool _ChuyenBangDiem;
		public bool ChuyenBangDiem
		{ 
			get 
			{ 
				return _ChuyenBangDiem;
			}
			set 
			{ 
				_ChuyenBangDiem = value;
			}
		}
		private string _MaHocSinh;
		public string MaHocSinh
		{ 
			get 
			{ 
				return _MaHocSinh;
			}
			set 
			{ 
				_MaHocSinh = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public CHUYENLOP()
		{
		}
		public CHUYENLOP(string tulop)
		{
			this.TuLop = tulop;
		}
		public CHUYENLOP(string tulop, string denlop, DateTime ngaychuyen, string lydochuyen, bool chuyenbangdiem, string mahocsinh)
		{
			this.TuLop = tulop;
			this.DenLop = denlop;
			this.NgayChuyen = ngaychuyen;
			this.LyDoChuyen = lydochuyen;
			this.ChuyenBangDiem = chuyenbangdiem;
			this.MaHocSinh = mahocsinh;
		}
		#endregion
	}
}
