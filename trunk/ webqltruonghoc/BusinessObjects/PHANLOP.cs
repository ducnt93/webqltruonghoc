using System;

namespace QLTHPT1.BusinessObjects
{
	public class PHANLOP
	{
		#region ***** Fields & Properties ***** 
		private int _STT;
        private string _tenHocSinh;
        private string _tenLop;

        public string TenLop
        {
            get { return _tenLop; }
            set { _tenLop = value; }
        }
        public string TenHocSinh
        {
            get { return _tenHocSinh; }
            set { _tenHocSinh = value; }
        }
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
		public PHANLOP()
		{
		}
		public PHANLOP(int stt)
		{
			this.STT = stt;
		}
		public PHANLOP(int stt, int malop, string mahocsinh,string tenhocsinh)
		{
			this.STT = stt;
			this.MaLop = malop;
			this.MaHocSinh = mahocsinh;
            this.TenHocSinh = tenhocsinh;
		}
		#endregion
	}
}
