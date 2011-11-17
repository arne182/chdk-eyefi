#include "stubs_asm.h"

DEF(physw_status, 0x34474)
DEF(full_screen_refresh, 0xA5DC)
DEF(physw_run, 0x1C30 + 0xC)
DEF(canon_menu_active, 0x3210 + 4)
DEF(canon_shoot_menu_active, 0x8AFC + 1)
DEF(FlashParamsTable,0xffc898ec)
DEF(levent_table, 0xffc0c01c)
DEF(playrec_mode, 0x2F34 + 0x4)
DEF(focus_len_table, 0xFFFE2A80)
DEF(zoom_busy, 0x71d4 + 0x14)
DEF(focus_busy,0x70B8 + 0x8)
DEF(movie_status, 0x7290 + 0x44)
DEF(recreview_hold, 0x84C0 + 0xE0)
DEF(some_flag_for_af_scan, 0x76B4)
DEF(zoom_status, 0xE590)

DEF(rear_dial_position, 0xC0240106)
DEF(front_dial_position, 0xC0240306)

DEF(active_bitmap_buffer, 0xA610)					// 0xA5FC+0x14 (1.00g sub_FFA57B70 -> FFA57B74 + FFA57BC4)
DEF(bitmap_buffer, 0xA618)							// FFA57BC0
DEF(palette_control, 0xA5DC)						// sub_FFA53CDC (1.00c)
DEF(active_palette_buffer, 0xA5E4)					// sub_FFA53C24 (1.00c)
DEF(palette_buffer, 0xBBF5C)						// sub_FFA54118 (1.00c)
