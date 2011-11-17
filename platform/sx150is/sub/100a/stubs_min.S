#include "stubs_asm.h"

DEF(zoom_busy, 0x6DB0+0x1C)					// @FF98138C
DEF(focus_busy, 0x6C54 + 8)					// @FF97B73C 
DEF(enabled_refresh_physical_screen, 0x9458) // @FFA29FF8
DEF(led_table, 0x2464 + 0x04)	      // @FF85EFEC
DEF(recreview_hold, 0x7DE0+0x28)        // @FF9BE9CC 

DEF(physw_status                            ,0x00033694) // Found @0xff834580
DEF(physw_run                               ,0x00001c30) // Found @0xff83412c
DEF(levent_table                            ,0xffbe99e8) // Found @0xffbe99e8
DEF(FlashParamsTable                        ,0xffc4e360) // Found @0xffc4e360
DEF(movie_status                            ,0x00006ec4) // Found @0xff985fb4
DEF(full_screen_refresh                     ,0x00009654) // Found @0xffa2a00c
DEF(canon_menu_active                       ,0x00003194) // Found @0xff8958f0
DEF(canon_shoot_menu_active                 ,0x00008109) // Found @0xff9cec20
DEF(playrec_mode                            ,0x00002eb8) // Found @0xff8877d0,          stubs_min = 0x00002eb8 (0x00002eb8)
DEF(zoom_status                             ,0x0000d520) // Found @0xffafaf48
DEF(some_flag_for_af_scan                   ,0x000072F8) // Found @0xFF98A5FC

DEF(active_bitmap_buffer, 0x9680)					// 0x9670+0x10 (1.00a sub_FFA2DE9C -> FFA2DEA0 + FFA2DEC8)
DEF(bitmap_buffer, 0x9688)							// FFA2DEC0 & FFA2DECC (1.00a)
DEF(active_palette_buffer, 0x9654)					// sub_FFA29F88 (1.00a)
DEF(palette_buffer, 0xBAA84)						// sub_FFA2A2FC (1.00a)
