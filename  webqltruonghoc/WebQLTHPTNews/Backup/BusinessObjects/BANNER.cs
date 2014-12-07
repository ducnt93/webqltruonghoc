using System;

namespace QLTHPT1.BusinessObjects
{
	public class BANNER
	{
		#region ***** Fields & Properties ***** 
		private string _TenBanner;
		public string TenBanner
		{ 
			get 
			{ 
				return _TenBanner;
			}
			set 
			{ 
				_TenBanner = value;
			}
		}
		private string _Link;
		public string Link
		{ 
			get 
			{ 
				return _Link;
			}
			set 
			{ 
				_Link = value;
			}
		}
		private string _MoTa;
		public string MoTa
		{ 
			get 
			{ 
				return _MoTa;
			}
			set 
			{ 
				_MoTa = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public BANNER()
		{
		}
		public BANNER(string tenbanner, string link, string mota)
		{
			this.TenBanner = tenbanner;
			this.Link = link;
			this.MoTa = mota;
		}
		#endregion
	}
}
