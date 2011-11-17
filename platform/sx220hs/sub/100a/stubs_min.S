#include "stubs_asm.h"

//beta5
DEF(enabled_refresh_physical_screen,0x53C4+0x14) //changed to fix error when displaying menu, was 0x20 FF0A99C0 

//added beta2
DEF(focus_len_table, 0xFFF4A3DC)		  // search for 70000 (longest focus length in micrometers) & 5000 (shortest length)

//not touched
DEF(physw_status, 0x357A8)                // FF0245BC
DEF(physw_run, 0x1C40)                    // FF0244F4
DEF(focus_busy, 0x8330 + 8)               // FF17C5DC+FF17C604
DEF(zoom_busy, 0x84A0 + 0x1C)             // FF1821EC+FF182224
DEF(canon_menu_active, 0x4270 + 4)        // FF08B3F4
DEF(recreview_hold, 0x93D4 + 0xF0)        // FF1B6640
DEF(playrec_mode, 0x3FA4 + 0x4)           // FF07DAA8
DEF(levent_table,0xFF41646C)              // FF1AFE64
DEF(full_screen_refresh, 0xB35C)	      // FF23D5C8
DEF(FlashParamsTable,0xFF48A69C)          // FF318D50
DEF(some_flag_for_af_scan, 0x8998)	      // FF18B738
DEF(led_table, 0x258C + 0x04)             // FF0557C4
DEF(canon_shoot_menu_active, 0x98E8 + 1)  // FF1CE4B0
DEF(movie_status, 0x8550 + 0x44)          // FF1875D8
DEF(zoom_status, 0xF5C4)				  // FF31C3EC

