using System;

namespace QLTHPT1.BusinessObjects
{
	public class MONHOC
	{
		#region ***** Fields & Properties ***** 
		private int _MaMonHoc;
		public int MaMonHoc
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
		#endregion

		#region ***** Init Methods ***** 
		public MONHOC()
		{
		}
		public MONHOC(int mamonhoc)
		{
			this.MaMonHoc = mamonhoc;
		}
		public MONHOC(int mamonhoc, int mato, string tenmonhoc, int sotiet, int heso)
		{
			this.MaMonHoc = mamonhoc;
			this.MaTo = mato;
			this.TenMonHoc = tenmonhoc;
			this.SoTiet = sotiet;
			this.HeSo = heso;
		}
		#endregion
	}
}
