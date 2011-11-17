#include "stubs_asm.h"
// IXUS200-SD980 fw 1.01c

DEF(zoom_status, 0x1E3D4)							// routine @ FFAADC2C
DEF(movie_status, 0x000067e0)						// routine @ FF94A89C
DEF(physw_status, 0x44558)							// routine @ FF83350C
DEF(physw_run, 0x1C38 + 0x0C)						// routine @ FF8331FC
DEF(FlashParamsTable,0xFFBDAD4C) 					// routine @ FFAAB26C
DEF(zoom_busy, 0x66F8 + 0x14)						// routine @ FF946E00
DEF(focus_busy, 0x6600 + 8)							// routine @ FF941F28 
DEF(canon_menu_active, 0x2EC4 + 4)					// routine @ FF8899D8
DEF(canon_shoot_menu_active, 0x7B08 + 1)			// routine @ FF98D73C
DEF(recreview_hold, 0x76F4 + 0xD0)					// routine @ FF97B418
DEF(some_flag_for_af_scan, 0x6CD4) 					// routine @ FF94E5FC 
DEF(levent_table,0xffb7a458) 						// routine @ FF975EA8
DEF(playrec_mode,0x2BF8+0x4) 						// routine @ FF87BBDC
DEF(enabled_refresh_physical_screen, 0x1B34C+0x20)	// routine @ FF9F8694
