#include "stubs_asm.h"

DEF(physw_status, 0x32444)                          // in FF832B90
DEF(physw_run, 0x1C38 + 0x0C)                       // in FF832B90
DEF(zoom_busy, 0x6E9C + 0x1C)                       // in FF9568F4
DEF(focus_busy, 0x6D40 + 8)                         // in FF94FF00 99%
DEF(canon_menu_active, 0x3128 + 4)                  // in FF8903B4
DEF(recreview_hold, 0x82D8 + 0xF8)                  // in FF993220
DEF(enabled_refresh_physical_screen, 0x9D60 + 0x28) // in FFA0499C
DEF(full_screen_refresh, 0x9CEC)                    // in FFA0258C
DEF(movie_status, 0x2BF8 + 0x38)                    // in FF878924
DEF(canon_shoot_menu_active, 0x8838 + 1)            // in FF9A9F7C
DEF(playrec_mode, 0x2E54 + 0x4)                     // in FF882228
DEF(FlashParamsTable,0xFFB7454C)                    // ?
DEF(zoom_status, 0xC6B8)                            // in FFAAEEC4
DEF(levent_table, 0xFF98CEAC)                       //
DEF(enabled_refresh_physical_screen, 0x9D60 + 0x28) // in FFA0499C
