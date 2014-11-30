using System;

namespace QLTHPT1.BusinessObjects
{
	public class PHANCONG
	{
		#region ***** Fields & Properties ***** 
		private int _STT;
		public int STT
		{ 
			get 
			{ 
				return _STT;
			}
			set 
			{ 
				_STT = value;
			}
		}
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
		#endregion

		#region ***** Init Methods ***** 
		public PHANCONG()
		{
		}
		public PHANCONG(int stt)
		{
			this.STT = stt;
		}
		public PHANCONG(int stt, int mamonhoc, int malop, string magiaovien)
		{
			this.STT = stt;
			this.MaMonHoc = mamonhoc;
			this.MaLop = malop;
			this.MaGiaoVien = magiaovien;
		}
		#endregion
	}
}
