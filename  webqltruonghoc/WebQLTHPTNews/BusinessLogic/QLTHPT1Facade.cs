using System;
using QLTHPT1.BusinessLogic;

namespace QLTHPT1.BusinessLogic
{
	public class QLTHPT1Facade
	{
		#region ***** Static Methods ***** 
		public static BANGDIEMBL GetBANGDIEMBL()
		{ 
			return new BANGDIEMBL();
		}
		public static BANNERBL GetBANNERBL()
		{ 
			return new BANNERBL();
		}
		public static CHUYENLOPBL GetCHUYENLOPBL()
		{ 
			return new CHUYENLOPBL();
		}
		public static DSLOPBL GetDSLOPBL()
		{ 
			return new DSLOPBL();
		}
		public static GIAOVIENBL GetGIAOVIENBL()
		{ 
			return new GIAOVIENBL();
		}
		public static HANHKIEMBL GetHANHKIEMBL()
		{ 
			return new HANHKIEMBL();
		}
		public static HOCKYBL GetHOCKYBL()
		{ 
			return new HOCKYBL();
		}
		public static HOCSINHBL GetHOCSINHBL()
		{ 
			return new HOCSINHBL();
		}
		public static KHENTHUONGBL GetKHENTHUONGBL()
		{ 
			return new KHENTHUONGBL();
		}
		public static KHOILOPBL GetKHOILOPBL()
		{ 
			return new KHOILOPBL();
		}
		public static KYLUATBL GetKYLUATBL()
		{ 
			return new KYLUATBL();
		}
		public static LOAINGUOIDUNGBL GetLOAINGUOIDUNGBL()
		{ 
			return new LOAINGUOIDUNGBL();
		}
		public static MONHOCBL GetMONHOCBL()
		{ 
			return new MONHOCBL();
		}
		public static NAMHOCBL GetNAMHOCBL()
		{ 
			return new NAMHOCBL();
		}
		public static NHATRUONGBL GetNHATRUONGBL()
		{ 
			return new NHATRUONGBL();
		}
		public static PHANCONGBL GetPHANCONGBL()
		{ 
			return new PHANCONGBL();
		}
		public static PHANLOPBL GetPHANLOPBL()
		{ 
			return new PHANLOPBL();
		}
		public static QUANTRIBL GetQUANTRIBL()
		{ 
			return new QUANTRIBL();
		}
		public static THOIKHOABIEUBL GetTHOIKHOABIEUBL()
		{ 
			return new THOIKHOABIEUBL();
		}
		public static TINTUCBL GetTINTUCBL()
		{ 
			return new TINTUCBL();
		}
		public static TOBOMONBL GetTOBOMONBL()
		{ 
			return new TOBOMONBL();
		}
		public static trace_xe_action_mapBL Gettrace_xe_action_mapBL()
		{ 
			return new trace_xe_action_mapBL();
		}
		public static trace_xe_event_mapBL Gettrace_xe_event_mapBL()
		{ 
			return new trace_xe_event_mapBL();
		}
		#endregion
	}
}
