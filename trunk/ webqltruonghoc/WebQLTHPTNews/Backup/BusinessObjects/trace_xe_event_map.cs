using System;

namespace QLTHPT1.BusinessObjects
{
	public class trace_xe_event_map
	{
		#region ***** Fields & Properties ***** 
		private int _trace_event_id;
		public int trace_event_id
		{ 
			get 
			{ 
				return _trace_event_id;
			}
			set 
			{ 
				_trace_event_id = value;
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
		private string _xe_event_name;
		public string xe_event_name
		{ 
			get 
			{ 
				return _xe_event_name;
			}
			set 
			{ 
				_xe_event_name = value;
			}
		}
		#endregion

		#region ***** Init Methods ***** 
		public trace_xe_event_map()
		{
		}
		public trace_xe_event_map(int trace_event_id, string package_name, string xe_event_name)
		{
			this.trace_event_id = trace_event_id;
			this.package_name = package_name;
			this.xe_event_name = xe_event_name;
		}
		#endregion
	}
}
