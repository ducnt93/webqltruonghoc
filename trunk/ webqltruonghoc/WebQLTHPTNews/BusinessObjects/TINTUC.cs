using System;

namespace QLTHPT1.BusinessObjects
{
	public class TINTUC
	{
		#region ***** Fields & Properties ***** 
		private int _MaTinTuc;
		public int MaTinTuc
		{ 
			get 
			{ 
				return _MaTinTuc;
			}
			set 
			{ 
				_MaTinTuc = value;
			}
		}
		private string _TieuDeTin;
		public string TieuDeTin
		{ 
			get 
			{ 
				return _TieuDeTin;
			}
			set 
			{ 
				_TieuDeTin = value;
			}
		}
		private string _NoiDungTin;
		public string NoiDungTin
		{ 
			get 
			{ 
				return _NoiDungTin;
			}
			set 
			{ 
				_NoiDungTin = value;
			}
		}
		private string _MotaNgan;
		public string MotaNgan
		{ 
			get 
			{ 
				return _MotaNgan;
			}
			set 
			{ 
				_MotaNgan = value;
			}
		}
		private DateTime _NgayDangTin;
		public DateTime NgayDangTin
		{ 
			get 
			{ 
				return _NgayDangTin;
			}
			set 
			{ 
				_NgayDangTin = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public TINTUC()
		{
		}
		public TINTUC(int matintuc)
		{
			this.MaTinTuc = matintuc;
		}
		public TINTUC(int matintuc, string tieudetin, string noidungtin, string motangan, DateTime ngaydangtin)
		{
			this.MaTinTuc = matintuc;
			this.TieuDeTin = tieudetin;
			this.NoiDungTin = noidungtin;
			this.MotaNgan = motangan;
			this.NgayDangTin = ngaydangtin;
		}
		#endregion
	}
}
