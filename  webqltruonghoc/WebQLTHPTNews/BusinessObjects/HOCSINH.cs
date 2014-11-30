using System;

namespace QLTHPT1.BusinessObjects
{
	public class HOCSINH
	{
		#region ***** Fields & Properties ***** 
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
		private string _TenHocSinh;
		public string TenHocSinh
		{ 
			get 
			{ 
				return _TenHocSinh;
			}
			set 
			{ 
				_TenHocSinh = value;
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
		private string _NoiSinh;
		public string NoiSinh
		{ 
			get 
			{ 
				return _NoiSinh;
			}
			set 
			{ 
				_NoiSinh = value;
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
		private DateTime _NgayNhapHoc;
		public DateTime NgayNhapHoc
		{ 
			get 
			{ 
				return _NgayNhapHoc;
			}
			set 
			{ 
				_NgayNhapHoc = value;
			}
		}
		private string _HoTenBo;
		public string HoTenBo
		{ 
			get 
			{ 
				return _HoTenBo;
			}
			set 
			{ 
				_HoTenBo = value;
			}
		}
		private string _HoTenMe;
		public string HoTenMe
		{ 
			get 
			{ 
				return _HoTenMe;
			}
			set 
			{ 
				_HoTenMe = value;
			}
		}
		private string _Anh;
		public string Anh
		{ 
			get 
			{ 
				return _Anh;
			}
			set 
			{ 
				_Anh = value;
			}
		}
		private string _NgheBo;
		public string NgheBo
		{ 
			get 
			{ 
				return _NgheBo;
			}
			set 
			{ 
				_NgheBo = value;
			}
		}
		private string _NgheMe;
		public string NgheMe
		{ 
			get 
			{ 
				return _NgheMe;
			}
			set 
			{ 
				_NgheMe = value;
			}
		}
		private DateTime _NgayVaoDoan;
		public DateTime NgayVaoDoan
		{ 
			get 
			{ 
				return _NgayVaoDoan;
			}
			set 
			{ 
				_NgayVaoDoan = value;
			}
		}
		private string _TrangThai;
		public string TrangThai
		{ 
			get 
			{ 
				return _TrangThai;
			}
			set 
			{ 
				_TrangThai = value;
			}
		}
		private int _MaNamHoc;
		public int MaNamHoc
		{ 
			get 
			{ 
				return _MaNamHoc;
			}
			set 
			{ 
				_MaNamHoc = value;
			}
		}
		private string _SoDienThoaiNha;
		public string SoDienThoaiNha
		{ 
			get 
			{ 
				return _SoDienThoaiNha;
			}
			set 
			{ 
				_SoDienThoaiNha = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public HOCSINH()
		{
		}
		public HOCSINH(string mahocsinh)
		{
			this.MaHocSinh = mahocsinh;
		}
		public HOCSINH(string mahocsinh, string tenhocsinh, string email, string gioitinh, DateTime ngaysinh, string noisinh, string diachi, DateTime ngaynhaphoc, string hotenbo, string hotenme, string anh, string nghebo, string ngheme, DateTime ngayvaodoan, string trangthai, int manamhoc, string sodienthoainha)
		{
			this.MaHocSinh = mahocsinh;
			this.TenHocSinh = tenhocsinh;
			this.Email = email;
			this.GioiTinh = gioitinh;
			this.NgaySinh = ngaysinh;
			this.NoiSinh = noisinh;
			this.DiaChi = diachi;
			this.NgayNhapHoc = ngaynhaphoc;
			this.HoTenBo = hotenbo;
			this.HoTenMe = hotenme;
			this.Anh = anh;
			this.NgheBo = nghebo;
			this.NgheMe = ngheme;
			this.NgayVaoDoan = ngayvaodoan;
			this.TrangThai = trangthai;
			this.MaNamHoc = manamhoc;
			this.SoDienThoaiNha = sodienthoainha;
		}
		#endregion
	}
}
