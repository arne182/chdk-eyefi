#include "stubs_asm.h"

DEF(physw_status, 			0x000358E8)             // found at FF024974
DEF(physw_run, 				0x1C44)               	// found at FF0248AC 
DEF(focus_busy, 			0x83BC + 8)             // found at FF181CB4 + FF181CE0
DEF(zoom_busy, 				0x852C + 0x001C)        // found at FF1878C8 + FF187900
DEF(canon_menu_active,		0x42D0 + 4)        		// found at FF08CA7C + FF08CA80
DEF(recreview_hold, 		0x947C + 0x00F0)        // found at FF1BC74C + FF1BC754  
DEF(zoom_status, 			0xF69C)                 // found at FF326964
DEF(playrec_mode, 			0x4004 + 0x04) 	      	// found at FF07F074 
DEF(levent_table,			0xff421560) //0xFF421558)             // found at FF1B5DC4 
DEF(full_screen_refresh, 	0xB440)	      			// found at FF2449AC  
DEF(FlashParamsTable,		0xff495a2c) //0xFF495A24)          	// found at FF3232C8
DEF(some_flag_for_af_scan, 	0x8A28)	      			// found at FF190E18 
DEF(led_table, 				0x25D0 + 0x04)          // found at FF056A3C
DEF(canon_shoot_menu_active, 	0x9994 + 0x1)		// found at FF1D46FC 
DEF(movie_status, 			0x85E0 + 0x44)          // found at FF18CCB4
DEF(focus_len_table, 		0xFFF4A3DC)		 		// search for 70000 (longest focus length in micrometers) & 5000 (shortest length)
DEF(enabled_refresh_physical_screen,	0x544C + 0x14) 	// found at FF0ABA04

//TESTING NEW Autogen
//DEF(zoom_status             ,0x0000f6bc) // Found @0xff326964, ** != ** stubs_min = 0x0000f69c (0xF69C)
