using System;

namespace QLTHPT1.BusinessObjects
{
	public class HANHKIEM
	{
		#region ***** Fields & Properties ***** 
		private string _MaHS;
		public string MaHS
		{ 
			get 
			{ 
				return _MaHS;
			}
			set 
			{ 
				_MaHS = value;
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
		private int _NgayNghiCoPhep;
		public int NgayNghiCoPhep
		{ 
			get 
			{ 
				return _NgayNghiCoPhep;
			}
			set 
			{ 
				_NgayNghiCoPhep = value;
			}
		}
		private int _NgayNghiKoPhep;
		public int NgayNghiKoPhep
		{ 
			get 
			{ 
				return _NgayNghiKoPhep;
			}
			set 
			{ 
				_NgayNghiKoPhep = value;
			}
		}
		private int _SoLanKyLuat;
		public int SoLanKyLuat
		{ 
			get 
			{ 
				return _SoLanKyLuat;
			}
			set 
			{ 
				_SoLanKyLuat = value;
			}
		}
		private string _HanhKiem;
		public string HanhKiem
		{ 
			get 
			{ 
				return _HanhKiem;
			}
			set 
			{ 
				_HanhKiem = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public HANHKIEM()
		{
		}
		public HANHKIEM(string mahs)
		{
			this.MaHS = mahs;
		}
		public HANHKIEM(string mahs, int malop, int mahk, int ngaynghicophep, int ngaynghikophep, int solankyluat, string hanhkiem)
		{
			this.MaHS = mahs;
			this.MaLop = malop;
			this.MaHK = mahk;
			this.NgayNghiCoPhep = ngaynghicophep;
			this.NgayNghiKoPhep = ngaynghikophep;
			this.SoLanKyLuat = solankyluat;
			this.HanhKiem = hanhkiem;
		}
		#endregion
	}
}
