using System;

namespace QLTHPT1.BusinessObjects
{
	public class NHATRUONG
	{
		#region ***** Fields & Properties ***** 
		private string _MaTruong;
		public string MaTruong
		{ 
			get 
			{ 
				return _MaTruong;
			}
			set 
			{ 
				_MaTruong = value;
			}
		}
		private string _TenTruong;
		public string TenTruong
		{ 
			get 
			{ 
				return _TenTruong;
			}
			set 
			{ 
				_TenTruong = value;
			}
		}
		private string _DienThoai;
		public string DienThoai
		{ 
			get 
			{ 
				return _DienThoai;
			}
			set 
			{ 
				_DienThoai = value;
			}
		}
		private string _Email;
		public string Email
		{ 
			get 
			{ 
				return _Email;
			}
			set 
			{ 
				_Email = value;
			}
		}
		private string _DiaChi;
		public string DiaChi
		{ 
			get 
			{ 
				return _DiaChi;
			}
			set 
			{ 
				_DiaChi = value;
			}
		}
		private DateTime _NgayLap;
		public DateTime NgayLap
		{ 
			get 
			{ 
				return _NgayLap;
			}
			set 
			{ 
				_NgayLap = value;
			}
		}
		private string _AnhDaiDien;
		public string AnhDaiDien
		{ 
			get 
			{ 
				return _AnhDaiDien;
			}
			set 
			{ 
				_AnhDaiDien = value;
			}
		}
		private string _HieuTruong;
		public string HieuTruong
		{ 
			get 
			{ 
				return _HieuTruong;
			}
			set 
			{ 
				_HieuTruong = value;
			}
		}
		private string _Website;
		public string Website
		{ 
			get 
			{ 
				return _Website;
			}
			set 
			{ 
				_Website = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public NHATRUONG()
		{
		}
		public NHATRUONG(string matruong, string tentruong, string dienthoai, string email, string diachi, DateTime ngaylap, string anhdaidien, string hieutruong, string website)
		{
			this.MaTruong = matruong;
			this.TenTruong = tentruong;
			this.DienThoai = dienthoai;
			this.Email = email;
			this.DiaChi = diachi;
			this.NgayLap = ngaylap;
			this.AnhDaiDien = anhdaidien;
			this.HieuTruong = hieutruong;
			this.Website = website;
		}
		#endregion
	}
}
