#include "stubs_asm.h"
DEF(zoom_busy, 0x5634+0x14) 			// @FFD0F788       
DEF(focus_busy, 0x54E4 + 8) 			// @FFD0B1B4         
DEF(zoom_status, 0x9CD8) 				// @0xFFE181E8                 
DEF(physw_status, 0x2EED4)   			// @FFC23CD4               
DEF(physw_run, 0x1BE4 + 0x0C)   		// @0xFFC23938         
DEF(FlashParamsTable,0xFFEDDCD0) 		// @FFE16198      
DEF(canon_menu_active, 0x2B78 + 4) 		// @FFC6D20C         
DEF(canon_shoot_menu_active, 0x68B0 + 1) // @0xFFD47FD4
DEF(recreview_hold, 0x64CC+0xCC)  		// @FFD38410
DEF(movie_status, 0x56C0 + 0x38)  		// @FFD133E4       
DEF(playrec_mode, 0x28D4+0x4)   		// @FF880530  0x4@FFC6093C      
DEF(some_flag_for_af_scan, 0x5AA0)  	// @FFD16004 
DEF(led_table, 0x219C + 0x04)  			// @FFC438FC           
DEF(levent_table,0xFFEAFD74) 			// @FFEAFD74

/*
ROM:FFD86FA4 ScreenLock 
ROM:FFD86FA4                 STMFD   SP!, {R4,LR}
ROM:FFD86FA8                 LDR     R4, =0x7708
ROM:FFD86FAC                 LDR     R0, [R4,#0x20]
ROM:FFD86FB0                 CMP     R0, #0
ROM:FFD86FB4                 BNE     loc_FFD86FC8
ROM:FFD86FB8                 ADR     R1, aScreenlock
ROM:FFD86FBC                 MOV     R0, #0x60
ROM:FFD86FC0                 BL      CameraLog
ROM:FFD86FC4                 BL      sub_FFC7FD64
*/
DEF(enabled_refresh_physical_screen, 0x7728) //A3000 @FFD86FA8

/*
ROM:FFD851E8                 LDR     R0, =0x76CC
ROM:FFD851EC                 LDRB    R0, [R0]
ROM:FFD851F0                 AND     R0, R0, #1
ROM:FFD851F4                 BX      LR
*/

DEF(full_screen_refresh, 0x76CC)
