#include "stubs_asm.h"

// Found by finsig_dryos.c
DEF(physw_status                            ,0x00037548) // Found @0xff024dd8
DEF(physw_run                               ,0x00001c10) // Found @0xff024968
DEF(levent_table                            ,0xff593a0c) // Found @0xff593a0c
DEF(FlashParamsTable                        ,0xff607f74) // Found @0xff607f74
DEF(movie_status                            ,0x00002f1c) // Found @0xff0772a8
DEF(full_screen_refresh                     ,0x0000c2d8) // Found @0xff2917e0
DEF(canon_menu_active                       ,0x000034f0) // Found @0xff091b6c
DEF(canon_shoot_menu_active                 ,0x0000ab6d) // Found @0xff22a704
DEF(playrec_mode                            ,0x00003214) // Found @0xff083504
DEF(zoom_status                             ,0x000111f8) // Found @0xff36e6d8

// Found manually
DEF(focus_len_table, 0xFFF4A7B4)			// Search for min & max zoom
DEF(zoom_busy, 0x2E10 + 0x1C)				// 1.00g sub_FF071C6C (FF071C70 & FF071CA8)
DEF(focus_busy,0x8D00 + 0x8)				// 1.00g sub_FF1BBCF0 (FF1BBCF4 & FF1BBD10)
DEF(recreview_hold, 0x40FC + 0xF0)			// 1.00g sub_FF0A2F98 (FF0A2F9C & FF0A2FB4)
DEF(active_bitmap_buffer, 0xC300+0x14)		// 1.00g sub_FF295414 (FF295418 & FF295470)
DEF(bitmap_buffer, 0xC31C)					// 1.00g sub_FF295414 (FF29546C)
DEF(palette_control, 0xC2D8)				// 1.00g sub_FF29175C
DEF(active_palette_buffer, 0xC2E0)			// 1.00g sub_FF29175C
DEF(palette_buffer, 0xDF7F0)				// 1.00g sub_FF291BE4 (FF291C28)

DEF(rear_dial_position, 0xC0240106)
