#include "stubs_asm.h"

DEF(physw_status, 0x34594)
DEF(full_screen_refresh, 0xB198)
DEF(physw_run, 0x1C30 + 0xC)
DEF(canon_menu_active, 0x3A28 + 4)
DEF(canon_shoot_menu_active, 0x9900 + 1)
DEF(FlashParamsTable,0xffc67d54)
DEF(levent_table, 0xffc0ea88)
DEF(playrec_mode, 0x3754 + 0x4)
DEF(focus_len_table, 0xFFFEA5CC)
DEF(zoom_busy, 0x342c + 0x1c)
DEF(focus_busy,0x7A6C + 0x8)
DEF(movie_status, 0x34E0 + 0x44)
DEF(recreview_hold, 0x933C + 0xF0)
DEF(zoom_status, 0xE7C4)

DEF(rear_dial_position, 0xC0240106)

DEF(active_bitmap_buffer, 0xB1CC)					// 0xB1B8+0x14 (1.00p sub_FFA4AA40 -> FFA4AA44 + FFA4AA94)
DEF(bitmap_buffer, 0xB1D4)							// FFA4AA90
DEF(palette_control, 0xB198)						// sub_FFA4698C (1.00h)
DEF(active_palette_buffer, 0xB1A0)					// sub_FFA468D4 (1.00h)
DEF(palette_buffer, 0xCF9B4)						// sub_FFA46DC8 (1.00h)
