#include "stubs_asm.h"

DEF(zoom_busy, 0x6FE4 + 0x1C)						// sub_FF179AF8 (FF179AFC & FF179B34)
DEF(focus_busy,0x6E68 + 0x8)						// sub_FF173D0C (FF173D10 & FF173D2C)
DEF(recreview_hold, 0x8324 + 0xDC)					// in FF1B210C (comp sx220hs)
DEF(focus_len_table, 0xFFF4A30C)					// search for 18800 (longest focus length in micrometers) & 4300 (shortest length)

DEF(physw_status                            ,0x00034d4c) // Found @0xff024e2c
DEF(physw_run                               ,0x00001c3c) // Found @0xff0249cc
DEF(levent_table                            ,0xff4214e8) // Found @0xff4214e8
DEF(FlashParamsTable                        ,0xff4ce948) // Found @0xff4ce948
DEF(movie_status                            ,0x000070dc) // Found @0xff17e974
DEF(full_screen_refresh                     ,0x0000a424) // Found @0xff244a14
DEF(canon_menu_active                       ,0x000032f8) // Found @0xff0887f4
DEF(canon_shoot_menu_active                 ,0x000087c9) // Found @0xff1c867c
DEF(canon_play_menu_active                  ,0x0000e784)
DEF(playrec_mode                            ,0x00003030) // Found @0xff07abe8
DEF(zoom_status                             ,0x0000e7c0) // Found @0xff324474
DEF(some_flag_for_af_scan                   ,0x000074e0) // Found @0xff183040

DEF(touch_screen_x							,0x000028f0)
DEF(touch_screen_y							,0x000028f2)
DEF(touch_screen_active						,0x000028c4)

DEF(cds_gain_value							,0x0000abd0)

DEF(active_bitmap_buffer, 0xA45C)					// 0xA448+0x14 (1.01a sub_FF249A94 -> FF249A98 + FF249AF0)
DEF(bitmap_buffer, 0xA464)							// FF249AEC
DEF(palette_control, 0xA424)						// sub_FF244A48 (1.00a)
DEF(active_palette_buffer, 0xA42C)					// sub_FF244990 (1.00a)
DEF(palette_buffer, 0xC7DEC)						// sub_FF244E28 (1.00a)
