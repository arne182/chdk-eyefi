#include "stubs_asm.h"

DEF(physw_status, 0xC624)//--->fixed
DEF(physw_run, 0x1C24)//-----fixed----0x1C18 + 0x0C
DEF(FlashParamsTable,0xFFEBBEE0)//---fixed               FFEBBEE0
DEF(zoom_busy, 0x554C + 0x14)//----fixed
DEF(focus_busy, 0x5470 + 8)//---->fixed
DEF(canon_menu_active, 0x2B7C)//----fixed 0x2B78 + 4
DEF(canon_shoot_menu_active, 0x68c9)
DEF(recreview_hold, 0xFFC00414) // not found
DEF(zoom_status, 0x98D0) // "ZoomState"------->fixed
DEF(movie_status, 0x55F8 + 0x38)//----fixed
DEF(enabled_refresh_physical_screen, 0x7610+0x30) //RefreshPhysicalScreen---->fixed
//DEF(enabled_refresh_physical_screen, 0x7610+0x28) //RefreshPhysicalScreen---->fixed
DEF(playrec_mode, 0x28EC+0x4)//---fixed
DEF(levent_table,0xFFE93CDC)//-->fixed
DEF(some_flag_for_af_scan, 0x5AF4)//-----fixed
