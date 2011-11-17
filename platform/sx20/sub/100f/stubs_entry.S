// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.00F
//   Canon PowerShot SX20 IS

// Values for makefile.inc
//   PLATFORMID = 12772 (0x31e4) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff35a0
//   NEED_ENCODED_DISKBOOT = 3   // Found @ 0xffff35b0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DoAFLock                              ,0xff836a9c) //102        *** != 0xff8796b4
//NSTUB(SetFileTimeStamp                      ,0xff835508) //  3        *** != 0x00000000
//NSTUB(TurnOffBackLight                      ,0xff8a5ae0) //104        *** != 0xff89b6a4
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff9799e8) //105        *** != 0xdeadc0de
//NSTUB(UnlockAF                              ,0xff836b38) //102        *** != 0xff8796c4
//NSTUB(VbattGet                              ,0xff831cec) //103        *** != 0xff95d0ec
//NSTUB(kbd_pwr_off                           ,0xff85f2c4) //  2 60%    *** != 0x00000000
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000
//NSTUB(openfastdir                           ,0xffa7d358) //  3        *** != 0xdeadc0de

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff89aa40 -> ff897290 -> ff98f050 -> ffaac6cc -> ffbe856c
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00032444) // Found @0xff83341c,          stubs_min = 0x00032444 (0x32444)
//DEF(physw_run                               ,0x00001c44) // Found @0xff83308c,          stubs_min = 0x00001c44 (0x1C38+0x0C)
//DEF(levent_table                            ,0xffba3160) // Found @0xffba3160, ** != ** stubs_min = 0xff98ceac (0xFF98CEAC)
//DEF(FlashParamsTable                        ,0xffbe8754) // Found @0xffbe8754, ** != ** stubs_min = 0xffb7454c (0xFFB7454C)
//DEF(movie_status                            ,0x00002c30) // Found @0xff878db0,          stubs_min = 0x00002c30 (0x2BF8+0x38)
//DEF(full_screen_refresh                     ,0x00009cec) // Found @0xffa025cc,          stubs_min = 0x00009cec (0x9CEC)
//DEF(canon_menu_active                       ,0x0000312c) // Found @0xff88fe90,          stubs_min = 0x0000312c (0x3128+4)
//DEF(canon_shoot_menu_active                 ,0x00008839) // Found @0xff9aa038,          stubs_min = 0x00008839 (0x8838+1)
//DEF(playrec_mode                            ,0x00002e58) // Found @0xff882228,          stubs_min = 0x00002e58 (0x2E54+0x4)
//DEF(zoom_status                             ,0x0000c6b8) // Found @0xffaaf400,          stubs_min = 0x0000c6b8 (0xC6B8)
//DEF(some_flag_for_af_scan                   ,0x0000792c) // Found @0xff95fb70

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xff859684
//void *vid_get_viewport_fb()      { return (void*)0x41020120; } // Found @0xffb03200
//char *camera_jpeg_count_str()    { return (char*)0x00072db0; } // Found @0xff9f71bc
//long hook_raw_size()             { return 0x011ca240; }        // Found @0xffb05964
//int get_flash_params_count(void) { return 0x84; }              // Found @0xff990650

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb44b3c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb44b48, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb449d4, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb449d4, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb449c8, levent 0x00
//    { 1, KEY_SET             ,0x00000100 }, // Found @0xffb44a64, levent 0x08
//    { 1, KEY_DISPLAY         ,0x00000200 }, // Found @0xffb44a70, levent 0x0a
//    { 1, KEY_UP              ,0x00000400 }, // Found @0xffb44a7c, levent 0x04
//    { 1, KEY_DOWN            ,0x00000800 }, // Found @0xffb44a88, levent 0x05
//    { 1, KEY_RIGHT           ,0x00001000 }, // Found @0xffb44a94, levent 0x07
//    { 1, KEY_LEFT            ,0x00002000 }, // Found @0xffb44aa0, levent 0x06
//    { 1, KEY_MENU            ,0x00004000 }, // Found @0xffb44aac, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    4080 // Found @0xff92b700
//#define CAM_RAW_ROWS      3048 // Found @0xff92b708
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff838e2c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa9b5e0) //101
NSTUB(AllocateUncacheableMemory               ,0xff838de8) //112
NSTUB(Close                                   ,0xff83527c) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff834c08) //112
NSTUB(EnterToCompensationEVF                  ,0xff836d84) //104
NSTUB(ExecuteEventProcedure                   ,0xff88b548) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff836dc8) //104
NSTUB(ExitTask                                ,0xff81e844) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff84465c) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff844734) //104
NSTUB(Fclose_Fut                              ,0xff834d84) //101
NSTUB(Feof_Fut                                ,0xff834f70) //  1
NSTUB(Fflush_Fut                              ,0xff834fac) //  1
NSTUB(Fgets_Fut                               ,0xff834ed8) //  1
NSTUB(Fopen_Fut                               ,0xff834d44) //101
NSTUB(Fread_Fut                               ,0xff834e30) //101
NSTUB(FreeMemory                              ,0xffa9b5d8) //101
NSTUB(FreeUncacheableMemory                   ,0xff838e28) //112
NSTUB(Fseek_Fut                               ,0xff834f24) //101
NSTUB(Fwrite_Fut                              ,0xff834e84) //101
NSTUB(GetBatteryTemperature                   ,0xff862744) //102
NSTUB(GetCCDTemperature                       ,0xff8626d0) //102
NSTUB(GetCurrentAvValue                       ,0xff952548) //102
NSTUB(GetDrive_ClusterSize                    ,0xff86f1c8) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff86f228) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff86f1fc) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff950a3c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff950e70) //  3
NSTUB(GetImageFolder                          ,0xff933544) //106
NSTUB(GetKbdState                             ,0xff85f11c) //109
NSTUB(GetMemInfo                              ,0xff81a070) //  3
NSTUB(GetOpticalTemperature                   ,0xff8627b8) //102
NSTUB(GetParameterData                        ,0xff990610) //101
NSTUB(GetPropertyCase                         ,0xff88f2dc) //102
NSTUB(GetSystemTime                           ,0xffa9b638) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff9566d4) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa8eac4) //102
NSTUB(GiveSemaphore                           ,0xff838804) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8ce3ac) //102
NSTUB(LEDDrive                                ,0xff85e338) //103
NSTUB(LocalTime                               ,0xff888ebc) //  1
NSTUB(LockMainPower                           ,0xff896eac) //103
NSTUB(Lseek                                   ,0xff835398) //101
NSTUB(MakeDirectory_Fut                       ,0xff834c7c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffaff4c8) //102
NSTUB(MoveIrisWithAv                          ,0xffa96f60) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa97688) //102
NSTUB(NewTaskShell                            ,0xff88eda0) //103
NSTUB(Open                                    ,0xff835224) //101
NSTUB(PB2Rec                                  ,0xff899de8) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff879664) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff87963c) //102
NSTUB(PT_PlaySound                            ,0xff884058) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xff894da8) //103
NSTUB(PostLogicalEventToUI                    ,0xff894df4) //103
NSTUB(PutInNdFilter                           ,0xffa9750c) //102
NSTUB(PutOutNdFilter                          ,0xffa97530) //102
NSTUB(Read                                    ,0xff81ab78) //101
NSTUB(ReadFastDir                             ,0xffa7d48c) //  3
NSTUB(Rec2PB                                  ,0xff898854) //104
NSTUB(RefreshPhysicalScreen                   ,0xffa0492c) //104
NSTUB(Remove                                  ,0xff8352b0) //  4
NSTUB(RenameFile_Fut                          ,0xff834b74) //  4
NSTUB(Restart                                 ,0xff83a53c) //106
NSTUB(ScreenLock                              ,0xffa048f8) //  8
NSTUB(ScreenUnlock                            ,0xffa0499c) //  8
NSTUB(SetAE_ShutterSpeed                      ,0xffb02378) //102
NSTUB(SetAutoShutdownTime                     ,0xff896f20) //103
NSTUB(SetCurrentCaptureModeType               ,0xff89eb28) //101
NSTUB(SetLogicalEventActive                   ,0xff896bfc) //101
NSTUB(SetParameterData                        ,0xff9904ec) //101
NSTUB(SetPropertyCase                         ,0xff88f1e0) //102
NSTUB(SetScriptMode                           ,0xff896c4c) //101
NSTUB(SleepTask                               ,0xff838a6c) //101
NSTUB(TakeSemaphore                           ,0xff838734) //101
NSTUB(TurnOnBackLight                         ,0xff8a5ac8) //104
NSTUB(UnlockMainPower                         ,0xff896e00) //103
NSTUB(UpdateMBROnFlash                        ,0xff86f048) //  3
NSTUB(Write                                   ,0xff83530c) //101
NSTUB(WriteSDCard                             ,0xff940bac) //108
NSTUB(_log                                    ,0xffb37c90) //111
NSTUB(_log10                                  ,0xffb36bd4) //112
NSTUB(_pow                                    ,0xffb36d44) //114
NSTUB(_sqrt                                   ,0xffb38ff8) //  1
NSTUB(add_ptp_handler                         ,0xffa49168) //  3
NSTUB(apex2us                                 ,0xffa080b8) //  4
NSTUB(close                                   ,0xff81a990) //  1
NSTUB(closedir                                ,0xffa7d314) //  3
NSTUB(err_init_task                           ,0xff815f28) //  4
NSTUB(exmem_alloc                             ,0xff889d7c) //103
NSTUB(free                                    ,0xff814138) //112
NSTUB(kbd_p1_f                                ,0xff833498) //109
NSTUB(kbd_p1_f_cont                           ,0xff8334a4) //109
NSTUB(kbd_p2_f                                ,0xff832d58) //109
NSTUB(kbd_read_keys                           ,0xff83341c) //109
NSTUB(kbd_read_keys_r2                        ,0xff85e850) //109
NSTUB(lseek                                   ,0xff835398) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203d8) //101
NSTUB(memcpy                                  ,0xff83e458) //101
NSTUB(memset                                  ,0xffa07108) //101
NSTUB(mkdir                                   ,0xff8356f0) //  3
NSTUB(mktime_ext                              ,0xff8ad0d0) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
NSTUB(opendir                                 ,0xffa7d358) //  3
NSTUB(qsort                                   ,0xffaeb414) //  1
NSTUB(rand                                    ,0xff8204e0) //  1
NSTUB(read                                    ,0xff81ab78) //101
NSTUB(readfastdir                             ,0xffa7d48c) //  3
NSTUB(reboot_fw_update                        ,0xffa8299c) //  1
NSTUB(rename                                  ,0xff834b74) //  4
NSTUB(set_control_event                       ,0xff896850) //111
NSTUB(srand                                   ,0xff8204d4) //  1
NSTUB(stat                                    ,0xff8353d4) //  3
// ALT: NSTUB(stat, 0xff86c60c) // 3 31/0
NSTUB(strcat                                  ,0xff8ac88c) //  1
NSTUB(strchr                                  ,0xff813fc0) //  1
NSTUB(strcmp                                  ,0xff820394) //101
NSTUB(strcpy                                  ,0xff82037c) //101
NSTUB(strftime                                ,0xff8acad8) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
NSTUB(strncpy                                 ,0xff813f38) //  1
NSTUB(strrchr                                 ,0xff813fe4) //  1
NSTUB(strtol                                  ,0xff83e738) //101
NSTUB(strtolx                                 ,0xff83e53c) //109
  DEF(task_CaptSeq                            ,0xff87cd40) //107
  DEF(task_ExpDrv                             ,0xff8c1440) //110
  DEF(task_InitFileModules                    ,0xff89a8cc) //107
  DEF(task_MovieRecord                        ,0xff879034) //107
  DEF(task_PhySw                              ,0xff833088) //107
  DEF(task_RotaryEncoder                      ,0xff85f3cc) //107
NSTUB(time                                    ,0xff889434) //  2
NSTUB(vsprintf                                ,0xff820340) //  1
NSTUB(write                                   ,0xff83530c) //101
