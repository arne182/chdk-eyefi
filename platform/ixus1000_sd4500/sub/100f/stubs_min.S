#include "stubs_asm.h"

// -> ASM1989 10.11.2010
//DEF(physw_status, 0x34414)                 // found at FF8347CC  , same as 100D  -> SX210: FF834360  
// -> ASM1989 2011
DEF(physw_status, 0x34408)                 // Found at: FF834B8C   kbd_read_keys 

DEF(physw_run, 0x1C34 + 0x0C)             // found at FF834758   , same as 100D  ->SX210: FF8342C4  and FF8342E0 
DEF(focus_busy, 0x738C + 8)               // found at FF972B34  , same as 100D     -> SX210: FF9639D4 -> looks like 8 at FF963A30 , same as sx20 FF94FED4
DEF(zoom_busy, 0x75FC + 0x1C)             // found at FF97B1B4 , same as 100D ->  -> SX210 FF969464  ### pixeldoc: ROM:FF9693D0 0x7124 + 0x1C ### and FF96A0BC like in sx20
DEF(canon_menu_active, 0x383C + 4)        //  found at FF896954 , same as 100D  -> SX210: StarRecModeMenu @FF891C4C -> ASM1989 08.21.2010 ?guesswork found at FF891B4C  -> ASM1989 08.21.2010 ?guesswork, and FF892194 like in sx20
DEF(movie_status, 0x7898 + 0x44)          // found at FF985A00 , same as 100D at FF9859E8 -> Diferent call than the sx210 or others   !!!!! MEYBE OF HELP TO FUTURE CAMS !!!!
DEF(playrec_mode, 0x3570+0x4)              // found at FF888A38 , same as 100D  -> SX210: FF883E64
DEF(FlashParamsTable,0xFFC28F30)          // found at FFAF48FC 100D was 0xFFC28F2C at FFAF48F8  -> SX210:  FFAD195C 
DEF(led_table, 0x2538 + 0x04)              // found at FF862574 , Same as 100D sx210: FF860EF0 & FF860EEC  
DEF(enabled_refresh_physical_screen, 0x48C0 ) //found at FF8B4F24 , same as 100D  not sure at all needs confirm , sx210: at FFA1EE18 and FFA1EFB4 and FFA1EE5C -> FFA1EDDC  -> `0x20  , but maybe 24???

//Change from 100D
DEF(canon_shoot_menu_active, 0x8AEC + 1)  //  found at FF9C63E4   100D  0x8AE4 at:FF9C63E0   -> SX210: sub_FF9B57E4 -> ASM1989 08.21.2010 ?guesswork  why +1 ??   -> OK 09.19.10 FF9B59B0  Like in sx20
DEF(recreview_hold, 0x86FC + 0xEC)        // found at FF9B60B0  100D 0x86F4 at FF9B60A8 -> SX210:  FF9A0B38  , FF9A1684 like in sx20 
DEF(zoom_status, 0xE2A8)                 // found at  FFAF7DFC 100D 0xE2A0 at FFAF7DF8  -> sx210:  FFAD4E40  Like in sx20 at FFAAF3EC search for "TerminateDeliverToZoomController"
DEF(levent_table,0xFFBCDB68)               // found at FF9AE940  D100 was 0xFFBCDB64 at FF9AE93C -> SX210: FF99A818
DEF(some_flag_for_af_scan, 0x7CB4)	   //found at FF98A0A4 100D was 0x7CAC at  FF98A0A0 needs check  -> SX210:  FF971750  & FF970D5C 
DEF(full_screen_refresh, 0xA340)	// found at FFA2BDCC 100D was 0xA338  at FFA2BDC8 Looks like needs confirm -> SX210:  FFA1CF40  in sx20: FFA02598, based on work found in the sd980 port





