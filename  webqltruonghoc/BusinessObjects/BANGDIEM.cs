using System;

namespace QLTHPT1.BusinessObjects
{
	public class BANGDIEM
	{
		#region ***** Fields & Properties ***** 
		private string _MaHocSinh;
        private string _TenHocSinh;

        public string TenHocSinh
        {
            get { return _TenHocSinh; }
            set { _TenHocSinh = value; }
        }
        private float _DTB;
        private DateTime _NgaySinh;
        private string _TenMonHoc;

        public string TenMonHoc
        {
            get { return _TenMonHoc; }
            set { _TenMonHoc = value; }
        }

        public DateTime NgaySinh
        {
            get { return _NgaySinh; }
            set { _NgaySinh = value; }
        }


        public float DTB
        {
            get { return _DTB; }
            set { _DTB = value; }
        }

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
		private Single _DM_1;
		public Single DM_1
		{ 
			get 
			{ 
				return _DM_1;
			}
			set 
			{ 
				_DM_1 = value;
			}
		}
		private Single _DM_2;
		public Single DM_2
		{ 
			get 
			{ 
				return _DM_2;
			}
			set 
			{ 
				_DM_2 = value;
			}
		}
		private Single _D15_1;
		public Single D15_1
		{ 
			get 
			{ 
				return _D15_1;
			}
			set 
			{ 
				_D15_1 = value;
			}
		}
		private Single _D15_2;
		public Single D15_2
		{ 
			get 
			{ 
				return _D15_2;
			}
			set 
			{ 
				_D15_2 = value;
			}
		}
		private Single _D15_3;
		public Single D15_3
		{ 
			get 
			{ 
				return _D15_3;
			}
			set 
			{ 
				_D15_3 = value;
			}
		}
		private Single _D1T_1;
		public Single D1T_1
		{ 
			get 
			{ 
				return _D1T_1;
			}
			set 
			{ 
				_D1T_1 = value;
			}
		}
		private Single _D1T_2;
		public Single D1T_2
		{ 
			get 
			{ 
				return _D1T_2;
			}
			set 
			{ 
				_D1T_2 = value;
			}
		}
		private int _Malop;
		public int Malop
		{ 
			get 
			{ 
				return _Malop;
			}
			set 
			{ 
				_Malop = value;
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
		private Single _DThi;
		public Single DThi
		{ 
			get 
			{ 
				return _DThi;
			}
			set 
			{ 
				_DThi = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public BANGDIEM()
		{
		}
		public BANGDIEM(string mahocsinh)
		{
			this.MaHocSinh = mahocsinh;
		}
		public BANGDIEM(string mahocsinh, int mamonhoc, Single dm_1, Single dm_2, Single d15_1, Single d15_2, Single d15_3, Single d1t_1, Single d1t_2, int malop, int mahk, Single dthi)
		{
			this.MaHocSinh = mahocsinh;
			this.MaMonHoc = mamonhoc;
			this.DM_1 = dm_1;
			this.DM_2 = dm_2;
			this.D15_1 = d15_1;
			this.D15_2 = d15_2;
			this.D15_3 = d15_3;
			this.D1T_1 = d1t_1;
			this.D1T_2 = d1t_2;
			this.Malop = malop;
			this.MaHK = mahk;
			this.DThi = dthi;
		}
		#endregion
	}
}
