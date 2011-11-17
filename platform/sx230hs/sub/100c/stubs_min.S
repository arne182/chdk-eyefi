#include "stubs_asm.h"

DEF(physw_status                            ,0x000358e8) 	
DEF(physw_run                               ,0x00001c44) 	
DEF(focus_busy								,0x83BC + 8)    
DEF(zoom_busy								,0x852C + 0x1C) 
DEF(canon_menu_active                       ,0x000042d4) 	
DEF(recreview_hold							,0x947C + 0xF0) 
DEF(zoom_status                             ,0x0000f69c) 	
DEF(playrec_mode                            ,0x00004008) 	
DEF(levent_table                            ,0xff42121c) 	
DEF(full_screen_refresh                     ,0x0000b440) 	
DEF(FlashParamsTable                        ,0xff4956ec) 	
DEF(some_flag_for_af_scan                   ,0x00008a28) 	
DEF(led_table								,0x25D0 + 0x04) 
DEF(canon_shoot_menu_active                 ,0x00009995) 	
DEF(movie_status                            ,0x00008624) 	
DEF(focus_len_table							,0xFFF4A3DC)	// search for 70000 (longest focus length in micrometers) & 5000 (shortest length)
DEF(enabled_refresh_physical_screen			,0x544C +0x14) 	// found at FF0ABA04

//DEF(enabled_refresh_physical_screen		,0x544C +0x20) 	
