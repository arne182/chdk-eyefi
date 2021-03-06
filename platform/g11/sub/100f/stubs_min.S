#include "stubs_asm.h"

DEF(physw_status, 0x32578)
DEF(physw_run, 0x1c44) 
DEF(FlashParamsTable,0xFFBE7100)
DEF(playrec_mode, 0x2D60+0x4)
DEF(zoom_busy, 0x6CAC+0x14)
DEF(focus_busy, 0x6BAC+0x8)                       //                      0x9CA8+10
DEF(zoom_status, 0xC868)
DEF(led_table, 0x25B4 + 0x04) 
DEF(levent_table,0xFFB95D20) 

DEF(canon_shoot_menu_active,0x8258+0x1)
DEF(canon_menu_active,0x3038+0x4)


DEF(recreview_hold, 0x7D00 + 0xD8) 
DEF(movie_status, 0x6D58+0x38)  
DEF(some_flag_for_af_scan, 0x72B4) 

DEF(enabled_refresh_physical_screen, 0x9840)

