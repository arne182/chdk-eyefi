#include "stubs_asm.h"

// RAM addresses

// --- already changed but unshure if 100% correct
DEF(physw_status, 0x32E94)    // ROM:FF8347D4, in ShowPhySwStatus() search "GpioStatus" or ROM:FF833F4C, finsig2

DEF(physw_run, 0x1C34)    // ROM:FF834400, in task_PhySw() 0x1C28 + 0xC = 0x1C34, finsig2

// ROM:FF860864                 LDR     R0, =0x24A4 <---
// ROM:FF860868                 STMFD   SP!, {R4,LR}
// ROM:FF86086C                 LDR     R0, [R0,#8] <---
// ROM:FF860870                 BL      sub_FF839B50
// ROM:FF860874                 TST     R0, #1
// ROM:FF860878                 LDMNEFD SP!, {R4,LR}
// ROM:FF86087C                 MOVNE   R1, #0x42
// ROM:FF860880                 ADRNE   R0, aLeddrv_c   ; "LEDDrv.c"
// ROM:FF860884                 BNE     DebugAssert
// ROM:FF860888                 LDMFD   SP!, {R4,PC}
DEF(led_table, 0x24AC)    // R0 -> 0x24A4 + 0x8

DEF(playrec_mode,0x2D78)    // ROM:FF838AE4 (ROM:FF882328) search for String "MenuIn" 0x2D74 + 4, play: 0x3, rec: 0x2, finsig2

// like SX210
// ROM:FFA1356C ScreenLock                              ; CODE XREF: sub_FFA121C0
// ROM:FFA1356C                 STMFD   SP!, {R4,LR}
// ROM:FFA13570                 LDR     R4, =0x92AC <---
// ROM:FFA13574                 LDR     R0, [R4,#0x20] <---
// ROM:FFA13578                 CMP     R0, #0
// ROM:FFA1357C                 BNE     loc_FFA13590
// ROM:FFA13580                 ADR     R1, aScreenlock ; "ScreenLock"
// ROM:FFA13584                 MOV     R0, #0x60
// ROM:FFA13588                 BL      CameraLog       ; LOCATION: CameraLog.c:237
// ROM:FFA1358C                 BL      sub_FF8ABEF8
DEF(enabled_refresh_physical_screen, 0x92CC)    // ROM:FFA1339C or ROM:FFA13570, 0x92AC + 0x20 = 0x92CC

// ROM:FFAC96B8 sub_FFAC96B8
// ROM:FFAC96B8                 LDR     R1, =FlashParamsTable
// ROM:FFAC96BC                 LDR     R0, [R1,R0,LSL#2]
// ROM:FFAC96C0                 BX      LR
DEF(FlashParamsTable, 0xFFC00624)    // referenced at ROM:FFAC96B8, finsig2

// ToDo: in playback CHDK OSD does not hide if function menu is active
// ROM:FF890234, in function StartRecModeMenu() or eventproc_StartRecModeMenu()
DEF(canon_menu_active, 0x3040)    // ROM:FF890234 0x303C + ROM:FF890238 4, finsig2

// if canon_shoot_menu_active is wrong enable CAM_SHOW_OSD_IN_SHOOT_MENU as a workaround to display CHDK OSD in record mode
DEF(canon_shoot_menu_active, 0x7B5D)    // ROM:FF9ABD94 0x7B5C + ROM:FF9ABD98 1, finsig2

// Canon Logical Event Table
// search for string "PressRightButton"
DEF(levent_table, 0xFFB9F59C)    // finsig2

// ROM:FF96B418 or ROM:FF96A780 or ROM:FF96B0F8, found in task_MovieRecord()
DEF(movie_status, 0x6A14)    // 0x69D8 + 0x3C, finsig2

// ROM:FF99D340
DEF(recreview_hold, 0x780E)    // 0x780C + 2 ?!?

// ROM:FF965978
DEF(zoom_busy, 0x6908)    // 0x68EC + 0x1C ?!?

// ROM:FF961C50
DEF(focus_busy, 0x67F0)    // 0x67E8 + 0x8 ?!?

// ROM:FFACC8B4, search for "ZoomCon_EnterCaptModeChange" ?
//DEF(zoom_status, 0x315B)    // probably wrong...
DEF(zoom_status, 0xCEA4)    // ToDo: verify, finsig2

// ROM:FFA114FC, called by RefreshPhysicalScreen()
DEF(full_screen_refresh, 0x926C)    // finsig2

// ROM:FF96F398, like SX210 and SD990
DEF(some_flag_for_af_scan, 0x6DD8)    // finsig2


// --- ToDo: required ?
DEF(some_f_for_dng, 0xDEAD)          // ToDo: required or outdated?
DEF(second_ext_for_dng, 0xDEAD)      // ToDo: required or outdated?
