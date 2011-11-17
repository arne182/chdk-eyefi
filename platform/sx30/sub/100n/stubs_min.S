#include "stubs_asm.h"

DEF(physw_status, 0x34594)							// ok (comp 1.00h)
DEF(full_screen_refresh, 0xB198)					// ok (comp 1.00h)
DEF(physw_run, 0x1C30 + 0xC)						// ok (comp 1.00h)
DEF(canon_menu_active, 0x3A28 + 4)					// ok (comp 1.00h)
DEF(canon_shoot_menu_active, 0x9900 + 1)			// ok (comp 1.00h)
DEF(FlashParamsTable,0xFFC67D74)					// ok (comp 1.00h) [changed in 1.00n]
DEF(levent_table, 0xFFC0EAA8)						// ok (comp 1.00h) [changed in 1.00n]
DEF(playrec_mode, 0x3754 + 0x4)						// ok (comp 1.00h)
DEF(focus_len_table, 0xFFFEA5CC)					// ok (comp 1.00h)
DEF(zoom_busy, 0x342c + 0x1c)						// ok (comp 1.00h)
DEF(focus_busy,0x7A6C + 0x8)						// ok (comp 1.00h)
DEF(movie_status, 0x34E0 + 0x44)					// ok (comp 1.00h)
DEF(recreview_hold, 0x933C + 0xF0)					// ok (comp 1.00h)
DEF(zoom_status, 0xE7C4)							// sub_FFB03798 (comp g12)

DEF(rear_dial_position, 0xC0240106)

DEF(active_bitmap_buffer, 0xB1CC)					// 0xB1B8+0x14 (1.00n sub_FFA4AA40 -> FFA4AA44 + FFA4AA94)
DEF(bitmap_buffer, 0xB1D4)							// FFA4AA90
DEF(palette_control, 0xB198)						// sub_FFA4698C (1.00h)
DEF(active_palette_buffer, 0xB1A0)					// sub_FFA468D4 (1.00h)
DEF(palette_buffer, 0xCF9B4)						// sub_FFA46DC8 (1.00h)
