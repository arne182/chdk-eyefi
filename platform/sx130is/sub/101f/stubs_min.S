#include "stubs_asm.h"

DEF(zoom_busy, 0x6A78+0x1C)					// @FF963B60
DEF(focus_busy, 0x6970 + 8)					// @FF95FD30 
DEF(enabled_refresh_physical_screen, 0x9458) // @FF8A8AD8, @FFA09440 
DEF(led_table, 0x2464 + 0x04)	      // @FF85EFEC
DEF(recreview_hold, 0x78E4+0xEC)        // @FF995494 

DEF(physw_status                            ,0x00032b34) // Found @0xff834658
DEF(physw_run                               ,0x00001c3c) // Found @0xff83424c
DEF(levent_table                            ,0xffb97a34) // Found @0xffb97a34
DEF(FlashParamsTable                        ,0xffbe82c0) // Found @0xffbe82c0
DEF(movie_status                            ,0x00006bac) // Found @0xff9698bc
DEF(full_screen_refresh                     ,0x00009458) // Found @0xffa09454
DEF(canon_menu_active                       ,0x00003038) // Found @0xff88e340
DEF(canon_shoot_menu_active                 ,0x00007d89) // Found @0xff9a95b8
DEF(playrec_mode                            ,0x00002d64) // Found @0xff880638
DEF(zoom_status                             ,0x0000ce70) // Found @0xffac4c14
DEF(some_flag_for_af_scan                   ,0x00006f68) // Found @0xff96cc44

DEF(active_bitmap_buffer, 0x9480)					// 0x9470+0x10 (1.01f sub_FFA0D54C -> FFA0D550 + FFA0D578)
DEF(bitmap_buffer, 0x9488)							// FFA0D570 & FFA0D57C (1.01f)
DEF(active_palette_buffer, 0x9460)					// sub_FFA093D0 (1.01f)
DEF(palette_buffer, 0xB3A58)						// sub_FFA09748 (1.01f)
