using System;

namespace QLTHPT1.BusinessObjects
{
	public class MENU_HS
	{
		#region ***** Fields & Properties ***** 
		private int _ID;
		public int ID
		{ 
			get 
			{ 
				return _ID;
			}
			set 
			{ 
				_ID = value;
			}
		}
		private string _Ten;
		public string Ten
		{ 
			get 
			{ 
				return _Ten;
			}
			set 
			{ 
				_Ten = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public MENU_HS()
		{
		}
		public MENU_HS(int id)
		{
			this.ID = id;
		}
		public MENU_HS(int id, string ten)
		{
			this.ID = id;
			this.Ten = ten;
		}
		#endregion
	}
}
