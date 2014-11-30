using System;

namespace QLTHPT1.BusinessObjects
{
	public class GIAOVIEN
	{
		#region ***** Fields & Properties ***** 
		private string _MaGiaoVien;
		public string MaGiaoVien
		{ 
			get 
			{ 
				return _MaGiaoVien;
			}
			set 
			{ 
				_MaGiaoVien = value;
			}
		}
		private string _TenGiaoVien;
		public string TenGiaoVien
		{ 
			get 
			{ 
				return _TenGiaoVien;
			}
			set 
			{ 
				_TenGiaoVien = value;
			}
		}
		private DateTime _NgaySinh;
		public DateTime NgaySinh
		{ 
			get 
			{ 
				return _NgaySinh;
			}
			set 
			{ 
				_NgaySinh = value;
			}
		}
		private string _GioiTinh;
		public string GioiTinh
		{ 
			get 
			{ 
				return _GioiTinh;
			}
			set 
			{ 
				_GioiTinh = value;
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
		private string _SoDienThoai;
		public string SoDienThoai
		{ 
			get 
			{ 
				return _SoDienThoai;
			}
			set 
			{ 
				_SoDienThoai = value;
			}
		}
		private bool _ChuNhiem;
		public bool ChuNhiem
		{ 
			get 
			{ 
				return _ChuNhiem;
			}
			set 
			{ 
				_ChuNhiem = value;
			}
		}
		private int _MaMon;
		public int MaMon
		{ 
			get 
			{ 
				return _MaMon;
			}
			set 
			{ 
				_MaMon = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public GIAOVIEN()
		{
		}
		public GIAOVIEN(string magiaovien)
		{
			this.MaGiaoVien = magiaovien;
		}
		public GIAOVIEN(string magiaovien, string tengiaovien, DateTime ngaysinh, string gioitinh, string diachi, string sodienthoai, bool chunhiem, int mato)
		{
			this.MaGiaoVien = magiaovien;
			this.TenGiaoVien = tengiaovien;
			this.NgaySinh = ngaysinh;
			this.GioiTinh = gioitinh;
			this.DiaChi = diachi;
			this.SoDienThoai = sodienthoai;
			this.ChuNhiem = chunhiem;
			this.MaMon = mato;
		}
		#endregion
	}
}
