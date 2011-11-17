// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.00L
//   Canon PowerShot G11

// Values for makefile.inc
//   PLATFORMID = 12767 (0x31df) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff35a8
//   NEED_ENCODED_DISKBOOT = 3   // Found @ 0xffff35b8

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(SetScriptMode                         ,0xff895134) //101        *** != 0xff810f4c
//NSTUB(TurnOffBackLight                      ,0xff8a34dc) //104        *** != 0xff8a348c
NSTUB(kbd_pwr_off                             ,0xff86043c) //  2 64%
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b04
//NSTUB(rename                                ,0xff8352a8) //  4        *** != 0xff835a8c
//NSTUB(write                                 ,0xff835a40) //101        *** != 0xff81abd8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff89914c -> ff895788 -> ff995478 -> ffab4a38 -> ffbe71cc
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00032578) // Found @0xff833584,          stubs_min = 0x00032578 (0x32578)
//DEF(physw_run                               ,0x00001c44) // Found @0xff8331f4,          stubs_min = 0x00001c44 (0x1c44)
//DEF(levent_table                            ,0xffb95fe0) // Found @0xffb95fe0,          stubs_min = 0xffb95fe0 (0xFFB95FE0)
//DEF(FlashParamsTable                        ,0xffbe73c0) // Found @0xffbe73c0,          stubs_min = 0xffbe73c0 (0xFFBE73C0)
//DEF(movie_status                            ,0x00006d90) // Found @0xff962a78,          stubs_min = 0x00006d90 (0x6D58+0x38)
//DEF(full_screen_refresh                     ,0x00009840) // Found @0xffa0ee98
//DEF(canon_menu_active                       ,0x0000303c) // Found @0xff88e2cc,          stubs_min = 0x0000303c (0x3038+0x4)
//DEF(canon_shoot_menu_active                 ,0x00008259) // Found @0xff9afaf4,          stubs_min = 0x00008259 (0x8258+0x1)
//DEF(playrec_mode                            ,0x00002d64) // Found @0xff8805a8,          stubs_min = 0x00002d64 (0x2D60+0x4)
//DEF(zoom_status                             ,0x0000c868) // Found @0xffab7924,          stubs_min = 0x0000c868 (0xC868)
//DEF(some_flag_for_af_scan                   ,0x000072b4) // Found @0xff9660f0,          stubs_min = 0x000072b4 (0x72B4)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff85a4c0
//void *vid_get_viewport_fb()      { return (void*)0x40587700; } // Found @0xffb0696c
//char *camera_jpeg_count_str()    { return (char*)0x00097234; } // Found @0xffa012ac
//long hook_raw_size()             { return 0x00ee9200; }        // Found @0xffb09c24
//int get_flash_params_count(void) { return 0x84; }              // Found @0xff996a78

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb477ac, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00100000 // Found @0xffb477d0, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffb47638, levent 0x03
//    { 0, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffb47644, levent 0x02
//    { 0, KEY_LEFT            ,0x00000400 }, // Found @0xffb4768c, levent 0x06
//    { 0, KEY_SET             ,0x00000800 }, // Found @0xffb47698, levent 0x08
//    { 0, KEY_RIGHT           ,0x00001000 }, // Found @0xffb476a4, levent 0x07
//    { 0, KEY_DOWN            ,0x00002000 }, // Found @0xffb476b0, levent 0x05
//    { 0, KEY_UP              ,0x00004000 }, // Found @0xffb476bc, levent 0x04
//    { 0, KEY_DISPLAY         ,0x00020000 }, // Found @0xffb476e0, levent 0x0a
//    { 0, KEY_MENU            ,0x00040000 }, // Found @0xffb476ec, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb47770, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb47770, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb47764, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3744 // Found @0xff935818
//#define CAM_RAW_ROWS      2784 // Found @0xff935820
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff839460

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffaa36f8) //101
NSTUB(AllocateUncacheableMemory               ,0xff83941c) //112
NSTUB(Close                                   ,0xff8359b0) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff83533c) //112
//NSTUB(DoAFLock                              ,0xff837158) //102            == 0xff837158
//NSTUB(EnterToCompensationEVF                ,0xff8373d8) //104            == 0xff8373d8
NSTUB(ExecuteEventProcedure                   ,0xff889954) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff83741c) //104            == 0xff83741c
NSTUB(ExitTask                                ,0xff81e844) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff844ce0) //104            == 0xff844ce0
//NSTUB(ExpCtrlTool_StopContiAE               ,0xff844db8) //104            == 0xff844db8
NSTUB(Fclose_Fut                              ,0xff8354b8) //101
NSTUB(Feof_Fut                                ,0xff8356a4) //  1
NSTUB(Fflush_Fut                              ,0xff8356e0) //  1
NSTUB(Fgets_Fut                               ,0xff83560c) //  1
NSTUB(Fopen_Fut                               ,0xff835478) //101
NSTUB(Fread_Fut                               ,0xff835564) //101
NSTUB(FreeMemory                              ,0xffaa36f0) //101
NSTUB(FreeUncacheableMemory                   ,0xff83945c) //112
NSTUB(Fseek_Fut                               ,0xff835658) //101
NSTUB(Fwrite_Fut                              ,0xff8355b8) //101
NSTUB(GetBatteryTemperature                   ,0xff8635d8) //102
NSTUB(GetCCDTemperature                       ,0xff863564) //102
NSTUB(GetCurrentAvValue                       ,0xff95c3ec) //102
NSTUB(GetDrive_ClusterSize                    ,0xff86fc80) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff86fce0) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff86fcb4) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff95a9c0) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff95ae08) //  3
NSTUB(GetImageFolder                          ,0xff93d6a4) //106
//NSTUB(GetKbdState                           ,0xff860424) //109            == 0xff860424
NSTUB(GetMemInfo                              ,0xff81a070) //  3
NSTUB(GetOpticalTemperature                   ,0xff86364c) //102
NSTUB(GetParameterData                        ,0xff996a38) //101
NSTUB(GetPropertyCase                         ,0xff88d700) //102
NSTUB(GetSystemTime                           ,0xffaa3750) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff95efc8) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa9695c) //102
//NSTUB(GiveSemaphore                         ,0xff838e38) //112            == 0xff838e38
NSTUB(IsStrobeChargeCompleted                 ,0xff8db440) //102
//NSTUB(LEDDrive                              ,0xff85f674) //103            == 0xff85f674
NSTUB(LocalTime                               ,0xff8872c8) //  1
NSTUB(LockMainPower                           ,0xff895394) //103
//NSTUB(Lseek                                 ,0xff835acc) //101            == 0xff835acc
NSTUB(MakeDirectory_Fut                       ,0xff8353b0) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffb03388) //102
NSTUB(MoveIrisWithAv                          ,0xffaa0604) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffaa0d1c) //102
NSTUB(NewTaskShell                            ,0xff88d1ac) //103
NSTUB(Open                                    ,0xff835958) //101
NSTUB(PB2Rec                                  ,0xff8984b0) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8781c8) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff8781a0) //102
//NSTUB(PT_PlaySound                          ,0xff882464) //102            == 0xff882464
NSTUB(PostLogicalEventForNotPowerType         ,0xff8931c0) //103
NSTUB(PostLogicalEventToUI                    ,0xff89320c) //103
//NSTUB(PutInNdFilter                         ,0xffaa0b80) //102            == 0xffaa0b80
//NSTUB(PutOutNdFilter                        ,0xffaa0ba4) //102            == 0xffaa0ba4
NSTUB(Read                                    ,0xff81ab78) //101
NSTUB(ReadFastDir                             ,0xffa8442c) //  3
NSTUB(Rec2PB                                  ,0xff8984f0) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffa10094) //104            == 0xffa10094
//NSTUB(Remove                                ,0xff8359e4) //  4            == 0xff8359e4
//NSTUB(RenameFile_Fut                        ,0xff8352a8) //  4            == 0xff8352a8
//NSTUB(Restart                               ,0xff83ab70) //106            == 0xff83ab70
//NSTUB(ScreenLock                            ,0xffa112c4) //  3            == 0xffa112c4
//NSTUB(ScreenUnlock                          ,0xffa112ec) //  3            == 0xffa112ec
NSTUB(SetAE_ShutterSpeed                      ,0xffb05b2c) //102
NSTUB(SetAutoShutdownTime                     ,0xff895408) //103
NSTUB(SetCurrentCaptureModeType               ,0xff89cb6c) //101
//NSTUB(SetFileTimeStamp                      ,0xff835c3c) //  3            == 0xff835c3c
NSTUB(SetLogicalEventActive                   ,0xff8950e4) //101
NSTUB(SetParameterData                        ,0xff996914) //101
NSTUB(SetPropertyCase                         ,0xff88d5fc) //102
NSTUB(SleepTask                               ,0xff8390a0) //101
NSTUB(TakeSemaphore                           ,0xff838d68) //101
//NSTUB(TurnOnBackLight                       ,0xff8a34c4) //104            == 0xff8a34c4
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff98071c) //105            == 0xff98071c
//NSTUB(UnlockAF                              ,0xff837190) //102            == 0xff837190
NSTUB(UnlockMainPower                         ,0xff8952e8) //103
//NSTUB(UnsetZoomForMovie                     ,0xff99cfe4) //104            == 0xff99cfe4
NSTUB(UpdateMBROnFlash                        ,0xff86fb00) //  3
NSTUB(VbattGet                                ,0xff831e08) //103
NSTUB(Write                                   ,0xff835a40) //101
//NSTUB(WriteSDCard                           ,0xff94b804) //108            == 0xff94b804
NSTUB(_log                                    ,0xffb3e048) //111
NSTUB(_log10                                  ,0xffb3cf8c) //112
NSTUB(_pow                                    ,0xffb3d0fc) //114
NSTUB(_sqrt                                   ,0xffb3f3b0) //  1
NSTUB(add_ptp_handler                         ,0xffa4e04c) //  3
//NSTUB(apex2us                               ,0xffa14a7c) //  4            == 0xffa14a7c
NSTUB(close                                   ,0xff81a990) //  1
NSTUB(closedir                                ,0xffa842b4) //  3
NSTUB(err_init_task                           ,0xff815f28) //  4
NSTUB(exmem_alloc                             ,0xff888188) //103
NSTUB(free                                    ,0xff814138) //112
NSTUB(kbd_p1_f                                ,0xff833600) //109
NSTUB(kbd_p1_f_cont                           ,0xff83360c) //109
NSTUB(kbd_p2_f                                ,0xff832ec0) //109
NSTUB(kbd_read_keys                           ,0xff833584) //109
//NSTUB(kbd_read_keys_r2                      ,0xff85fb94) //109            == 0xff85fb94
NSTUB(lseek                                   ,0xff835acc) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203ec) //101
NSTUB(memcpy                                  ,0xff83ea1c) //101
NSTUB(memset                                  ,0xffa13acc) //101
NSTUB(mkdir                                   ,0xff835e24) //  3
NSTUB(mktime_ext                              ,0xff8ab0a0) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
NSTUB(opendir                                 ,0xffa842f8) //  3
//NSTUB(openfastdir                           ,0xffa842f8) //  3            == 0xffa842f8
NSTUB(qsort                                   ,0xffaf3a98) //  1
NSTUB(rand                                    ,0xff8204f4) //  1
NSTUB(read                                    ,0xff81ab78) //101
//NSTUB(readfastdir                           ,0xffa8442c) //  3            == 0xffa8442c
NSTUB(reboot_fw_update                        ,0xffa8993c) //  1
NSTUB(set_control_event                       ,0xff894d38) //111
NSTUB(srand                                   ,0xff8204e8) //  1
NSTUB(stat                                    ,0xff835b08) //  3
// ALT: NSTUB(stat, 0xff86d0c4) // 3 31/0
//NSTUB(strcat                                ,0xff8aa85c) //  1            == 0xff8aa85c
NSTUB(strchr                                  ,0xff813fc0) //  1
NSTUB(strcmp                                  ,0xff8203a8) //101
NSTUB(strcpy                                  ,0xff820390) //101
NSTUB(strftime                                ,0xff8aaaa8) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
//NSTUB(strncpy                               ,0xff813f38) //  1            == 0xff813f38
//NSTUB(strrchr                               ,0xff813fe4) //  1            == 0xff813fe4
NSTUB(strtol                                  ,0xff83ecfc) //101
NSTUB(strtolx                                 ,0xff83eb00) //109
  DEF(task_CaptSeq                            ,0xff87b18c) //107
  DEF(task_ExpDrv                             ,0xff8bfbf8) //107
  DEF(task_InitFileModules                    ,0xff898fd8) //107
  DEF(task_MovieRecord                        ,0xff962cb0) //107
  DEF(task_PhySw                              ,0xff8331f0) //107
  DEF(task_RotaryEncoder                      ,0xff860554) //107
NSTUB(time                                    ,0xff887840) //  2
NSTUB(vsprintf                                ,0xff820354) //  1
