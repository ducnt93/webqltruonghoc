using System;

namespace QLTHPT1.BusinessObjects
{
	public class trace_xe_action_map
	{
		#region ***** Fields & Properties ***** 
		private int _trace_column_id;
		public int trace_column_id
		{ 
			get 
			{ 
				return _trace_column_id;
			}
			set 
			{ 
				_trace_column_id = value;
			}
		}
		private string _package_name;
		public string package_name
		{ 
			get 
			{ 
				return _package_name;
			}
			set 
			{ 
				_package_name = value;
			}
		}
		private string _xe_action_name;
		public string xe_action_name
		{ 
			get 
			{ 
				return _xe_action_name;
			}
			set 
			{ 
				_xe_action_name = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public trace_xe_action_map()
		{
		}
		public trace_xe_action_map(int trace_column_id, string package_name, string xe_action_name)
		{
			this.trace_column_id = trace_column_id;
			this.package_name = package_name;
			this.xe_action_name = xe_action_name;
		}
		#endregion
	}
}
