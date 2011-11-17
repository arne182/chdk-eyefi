#include "stubs_asm.h"

DEF(zoom_busy,				0x8D30+0x14)	// G10 sub_FF93E460 ZoomLensController.c match with G11 1.00L
DEF(focus_busy,				0x8C3C+0x8)		// G10 sub_FF938B4C FocusLensController.c match with G11 1.00L
DEF(recreview_hold,			0xA438+0xC0)	// G10 sub_FF973228 match with G12 1.00c and G9 1.00i
DEF(enabled_refresh_physical_screen, 0xBAA8) // G10 sub_FF9D62D4 match with G11 1.00L at FFA0EC88

DEF(focus_len_table, 0xFFFE2A8C)			// G10 search for 30500 (0x7724) (longest focus length in micrometers) & 6100 (0x17D4)(shortest length)
											// G10 35mm equivalent = 140mm to 28 mm

// autofound by finsig2

DEF(physw_status,			0x00011cb8) // Found @0xff821c28
DEF(physw_run,				0x00001c2c) // Found @0xff82189c
DEF(levent_table,			0xffb43abc) // Found @0xffb43abc
DEF(FlashParamsTable,		0xffb7524c) // Found @0xffb7524c
DEF(movie_status,			0x00005418) // Found @0xff8629c4
DEF(canon_menu_active,		0x00005868) // Found @0xff8782dc
DEF(canon_shoot_menu_active,0x0000a8ad) // Found @0xff987980
DEF(playrec_mode,			0x000055d0) // Found @0xff86b300
DEF(zoom_status,			0x0000e0b0) // Found @0xffa7c744
DEF(some_flag_for_af_scan,	0x000096f8) // Found @0xff946b64
