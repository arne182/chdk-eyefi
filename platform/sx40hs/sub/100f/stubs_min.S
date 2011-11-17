#include "stubs_asm.h"


DEF(focus_busy								,0x8D00 + 8)    //FF1BBCF8 SX40HS
DEF(zoom_busy								,0x2E10 + 0x1C) //FF071C70 + FF071CA8 SX40
DEF(canon_menu_active                       ,0x34EC+4) 	    //FF091B6C + FF091B70 SX40
DEF(recreview_hold							,0x947C + 0xF0) // UNKNOWN ???
DEF(playrec_mode                            ,0x00003214)
DEF(some_flag_for_af_scan                   ,0x9970+0x8) 	//NOT SURE SX40 FF1D63F8
DEF(led_table								,0x2614 + 0x04) //FF056E5C SX40
DEF(movie_status                            ,0x2ED8+0x44)   //FF07774C +  FF07775C
DEF(focus_len_table							,0xFFF4A3DC)	// UNKOWN !!search for 70000 (longest focus length in micrometers) & 5000 (shortest length)
DEF(enabled_refresh_physical_screen			,0x47F0 +0x14) 	// FF0B138C + FF0B13B0 SX40

// Values below go in 'stubs_min.S':
DEF(physw_status                            ,0x00037548) // Found @0xff024dd8,          stubs_min = 0x00037548 (0x37548)
DEF(physw_run                               ,0x00001c10) // Found @0xff024968,          stubs_min = 0x00001c10 (0x1C10)
DEF(levent_table                            ,0xff593a0c) // Found @0xff593a0c,          stubs_min = 0xff593a0c (0xFF593A0C)
DEF(FlashParamsTable                        ,0xff607f74) // Found @0xff607f74,          stubs_min = 0xff607f74 (0xFF607F74)
DEF(full_screen_refresh                     ,0x0000c2d8) // Found @0xff2917e4,          stubs_min = 0x0000c2d8 (0xC2D8)
DEF(canon_shoot_menu_active                 ,0x0000ab6d) // Found @0xff22a708, ** != ** stubs_min = 0x00009995 (0x00009995)
DEF(zoom_status                             ,0x000111f8) // Found @0xff36e6dc, ** != ** stubs_min = 0x000111d8 (0x111D8)


DEF(rear_dial_position, 0xC0240106)
DEF(active_bitmap_buffer, 0xC314)					
DEF(bitmap_buffer, 0xC31C)
DEF(palette_control, 0xC2D8)
DEF(active_palette_buffer, 0xC2E0)
DEF(palette_buffer, 0xDF7F0)