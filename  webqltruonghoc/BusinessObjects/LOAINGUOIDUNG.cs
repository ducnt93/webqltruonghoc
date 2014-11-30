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
		public LOAINGUOIDUNG(string maloaind)
		{
			this.MaLoaiND = maloaind;
		}
		public LOAINGUOIDUNG(string maloaind, string tenloaind)
		{
			this.MaLoaiND = maloaind;
			this.TenLoaiND = tenloaind;
		}
		#endregion
	}
}
