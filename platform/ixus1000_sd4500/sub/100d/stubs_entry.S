// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R45 (DRYOS version 2.3, release #0045)
//   Firmware Ver GM1.00D
//   Canon IXUS 1000HS

// Values for makefile.inc
//   PLATFORMID = 12792 (0x31f8) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4b                // Found @ 0xffff3624
//   NEED_ENCODED_DISKBOOT = 5   // Found @ 0xffff3634

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
NSTUB(kbd_pwr_off                             ,0xff8634d0) //  2 60%
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b1c

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8a0328 -> ff89cab4 -> ff9b0c74 -> ffaf48dc -> ffc28d28
// Mode 32774 in firmware but not in current modemap
// Mode 33292 in firmware but not in current modemap
// Mode 33324 in firmware but not in current modemap
// Mode 33323 in firmware but not in current modemap
// Mode 33309 in firmware but not in current modemap
// Mode 33310 in firmware but not in current modemap
// Mode 33325 in firmware but not in current modemap
// Mode 32801 in firmware but not in current modemap
// Mode 33288 in firmware but not in current modemap
// Mode 33289 in firmware but not in current modemap
// Mode 32789 in firmware but not in current modemap
// Mode 33320 in firmware but not in current modemap
// Mode 33322 in firmware but not in current modemap
// Mode 33321 in firmware but not in current modemap
// Mode 33318 in firmware but not in current modemap
// Mode 33319 in firmware but not in current modemap
// Mode 32790 in firmware but not in current modemap
// Mode 32791 in firmware but not in current modemap
// Mode 32792 in firmware but not in current modemap
// Mode  2613 in firmware but not in current modemap
// Mode  2619 in firmware but not in current modemap
// Mode  2620 in firmware but not in current modemap
// Mode  2614 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_SCN_STITCH          16908
// Current modemap entry not found in firmware - MODE_SCN_COLOR_SWAP      16926
// Current modemap entry not found in firmware - MODE_SCN_COLOR_ACCENT    16925
// Current modemap entry not found in firmware - MODE_SCN_ISO_3200        16417
// Current modemap entry not found in firmware - MODE_SCN_SNOW            16406
// Current modemap entry not found in firmware - MODE_SCN_FOLIAGE         16405
// Current modemap entry not found in firmware - MODE_SCN_AQUARIUM        16939
// Current modemap entry not found in firmware - MODE_SCN_BEACH           16407
// Current modemap entry not found in firmware - MODE_SCN_FIREWORK        16408
// Current modemap entry not found in firmware - MODE_INDOOR              32787
// Current modemap entry not found in firmware - MODE_VIDEO_COLOR_SWAP     2611
// Current modemap entry not found in firmware - MODE_VIDEO_COLOR_ACCENT   2610
// Current modemap entry not found in firmware - MODE_LANDSCAPE           32782
// Current modemap entry not found in firmware - MODE_NIGHT_SNAPSHOT      32781
// Current modemap entry not found in firmware - MODE_EASY                33314
// Current modemap entry not found in firmware - MODE_M                   32769
// Current modemap entry not found in firmware - MODE_AV                  32770
// Current modemap entry not found in firmware - MODE_TV                  32771

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00034408) // Found @0xff834b8c,          stubs_min = 0x00034408 (0x34408)
//DEF(physw_run                               ,0x00001c40) // Found @0xff834758,          stubs_min = 0x00001c40 (0x1C34+0x0C)
//DEF(levent_table                            ,0xffbcdb64) // Found @0xffbcdb64,          stubs_min = 0xffbcdb64 (0xFFBCDB64)
//DEF(FlashParamsTable                        ,0xffc28f2c) // Found @0xffc28f2c,          stubs_min = 0xffc28f2c (0xFFC28F2C)
//DEF(movie_status                            ,0x000078dc) // Found @0xff985810,          stubs_min = 0x000078dc (0x7898+0x44)
//DEF(full_screen_refresh                     ,0x0000a338) // Found @0xffa2bdec,          stubs_min = 0x0000a338 (0xA338)
//DEF(canon_menu_active                       ,0x00003840) // Found @0xff896954,          stubs_min = 0x00003840 (0x383C+4)
//DEF(canon_shoot_menu_active                 ,0x00008ae5) // Found @0xff9c649c,          stubs_min = 0x00008ae5 (0x8AE4+1)
//DEF(playrec_mode                            ,0x00003574) // Found @0xff888a38,          stubs_min = 0x00003574 (0x3570+0x4)
//DEF(zoom_status                             ,0x0000e2c0) // Found @0xffaf7e60, ** != ** stubs_min = 0x0000e2a0 (0xE2A0)
//DEF(some_flag_for_af_scan                   ,0x00007cac) // Found @0xff9896e0,          stubs_min = 0x00007cac (0x7CAC)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff85d384
//void *vid_get_viewport_fb()      { return (void*)0x40587700; } // Found @0xffb4cb2c
//char *camera_jpeg_count_str()    { return (char*)0x000b7e00; } // Found @0xffa23818
//long hook_raw_size()             { return 0x00f32880; }        // Found @0xffb4fff4
//int get_flash_params_count(void) { return 0x9a; }              // Found @0xff9b1cac

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb8d548, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00080000 // Found @0xffb8d558, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_UP              ,0x00000400 }, // Found @0xffb8d4c0, levent 0x04
//    { 1, KEY_RIGHT           ,0x00000800 }, // Found @0xffb8d4c8, levent 0x07
//    { 1, KEY_SET             ,0x00001000 }, // Found @0xffb8d4d0, levent 0x08
//    { 1, KEY_LEFT            ,0x00008000 }, // Found @0xffb8d4e8, levent 0x06
//    { 1, KEY_MENU            ,0x00010000 }, // Found @0xffb8d4f0, levent 0x09
//    { 1, KEY_DOWN            ,0x00020000 }, // Found @0xffb8d4f8, levent 0x05
//    { 2, KEY_SHOOT_FULL      ,0x00002002 }, // Found @0xffb8d518, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00002000 }, // Found @0xffb8d530, levent 0x00
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb8d518, levent 0x01
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3816 // Found @0xff94b4c4
//#define CAM_RAW_ROWS      2784 // Found @0xff94b4d0
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff83b934

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffae5698) //101
NSTUB(AllocateUncacheableMemory               ,0xff83b8f0) //112
NSTUB(Close                                   ,0xff838060) //101
NSTUB(CreateTask                              ,0xff81e8a0) //101
NSTUB(DebugAssert                             ,0xff81eb78) //111
NSTUB(DeleteFile_Fut                          ,0xff8379d8) //112
NSTUB(DoAFLock                                ,0xff839670) //102
NSTUB(EnterToCompensationEVF                  ,0xff839770) //104
NSTUB(ExecuteEventProcedure                   ,0xff8920b4) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff8397b4) //104
NSTUB(ExitTask                                ,0xff81eb30) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff847d34) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff847ec0) //104
NSTUB(Fclose_Fut                              ,0xff837b54) //101
NSTUB(Feof_Fut                                ,0xff837d40) //  1
NSTUB(Fflush_Fut                              ,0xff837d7c) //  1
NSTUB(Fgets_Fut                               ,0xff837ca8) //  1
NSTUB(Fopen_Fut                               ,0xff837b14) //101
NSTUB(Fread_Fut                               ,0xff837c00) //101
NSTUB(FreeMemory                              ,0xffae5690) //101
NSTUB(FreeUncacheableMemory                   ,0xff83b930) //112
NSTUB(Fseek_Fut                               ,0xff837cf4) //101
NSTUB(Fwrite_Fut                              ,0xff837c54) //101
NSTUB(GetBatteryTemperature                   ,0xff868370) //102
NSTUB(GetCCDTemperature                       ,0xff8682fc) //102
NSTUB(GetCurrentAvValue                       ,0xff975264) //102
NSTUB(GetDrive_ClusterSize                    ,0xff8757bc) //  4
NSTUB(GetDrive_FreeClusters                   ,0xff87581c) //  4
NSTUB(GetDrive_TotalClusters                  ,0xff8757f0) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff973818) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff973c6c) //  3
NSTUB(GetImageFolder                          ,0xff952d1c) //106
NSTUB(GetKbdState                             ,0xff863398) //109
NSTUB(GetMemInfo                              ,0xff81a264) //  3
NSTUB(GetOpticalTemperature                   ,0xff8683e4) //102
NSTUB(GetParameterData                        ,0xff9b1c70) //101
NSTUB(GetPropertyCase                         ,0xff895dbc) //102
NSTUB(GetSystemTime                           ,0xffae56f0) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff97ae10) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffacd184) //102
NSTUB(GiveSemaphore                           ,0xff83b30c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8e5d08) //102
NSTUB(LEDDrive                                ,0xff86267c) //103
NSTUB(LocalTime                               ,0xff88f99c) //  1
NSTUB(LockMainPower                           ,0xff89c6b8) //103
NSTUB(Lseek                                   ,0xff83817c) //101
NSTUB(MakeDirectory_Fut                       ,0xff837a4c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffb49038) //102
NSTUB(MoveIrisWithAv                          ,0xffae04a0) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffae0d1c) //102
NSTUB(NewTaskShell                            ,0xff8957d8) //103
NSTUB(Open                                    ,0xff837ff4) //101
NSTUB(PB2Rec                                  ,0xff89f73c) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff880a80) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff880a58) //102
NSTUB(PT_PlaySound                            ,0xff88a804) //  4
NSTUB(PostLogicalEventForNotPowerType         ,0xff89a418) //103
NSTUB(PostLogicalEventToUI                    ,0xff89a464) //103
NSTUB(PutInNdFilter                           ,0xffb46438) //102
NSTUB(PutOutNdFilter                          ,0xffb46470) //102
NSTUB(Read                                    ,0xff81ad74) //101
NSTUB(ReadFastDir                             ,0xffab9128) //  4
NSTUB(Rec2PB                                  ,0xff89dfe4) //104
NSTUB(RefreshPhysicalScreen                   ,0xff8b3cfc) //104
NSTUB(Remove                                  ,0xff838094) //  4
NSTUB(RenameFile_Fut                          ,0xff837944) //  4
NSTUB(Restart                                 ,0xff83d0dc) //106
NSTUB(ScreenLock                              ,0xff8b4ec0) //  4
NSTUB(ScreenUnlock                            ,0xff8b4f24) //  9
NSTUB(SetAE_ShutterSpeed                      ,0xffb4bbd8) //102
NSTUB(SetAutoShutdownTime                     ,0xff89c72c) //103
NSTUB(SetCurrentCaptureModeType               ,0xff8a59d4) //101
NSTUB(SetFileTimeStamp                        ,0xff8382fc) //  4
NSTUB(SetLogicalEventActive                   ,0xff89c3f4) //101
NSTUB(SetParameterData                        ,0xff9b1bdc) //101
NSTUB(SetPropertyCase                         ,0xff895c94) //102
NSTUB(SetScriptMode                           ,0xff89c444) //101
NSTUB(SleepTask                               ,0xff83b574) //101
NSTUB(TakeSemaphore                           ,0xff83b23c) //101
NSTUB(TurnOffBackLight                        ,0xff8ac590) //104
NSTUB(TurnOnBackLight                         ,0xff8ac578) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff9a12d8) //103
NSTUB(UnlockAF                                ,0xff8396a8) //102
NSTUB(UnlockMainPower                         ,0xff89c60c) //103
NSTUB(UpdateMBROnFlash                        ,0xff87563c) //  3
NSTUB(VbattGet                                ,0xff833308) //103
NSTUB(Write                                   ,0xff8380f0) //101
NSTUB(WriteSDCard                             ,0xff962f28) //108
NSTUB(_log                                    ,0xffb88e78) //111
NSTUB(_log10                                  ,0xffb87b04) //112
NSTUB(_pow                                    ,0xffb87c74) //114
NSTUB(_sqrt                                   ,0xffb8aa80) //  1
NSTUB(add_ptp_handler                         ,0xffa72ad8) //  3
NSTUB(apex2us                                 ,0xffa34ebc) //  4
NSTUB(close                                   ,0xff81ab8c) //  1
NSTUB(closedir                                ,0xffab8f84) //  4
NSTUB(err_init_task                           ,0xff815fd4) //  4
NSTUB(exmem_alloc                             ,0xff8908e8) //103
NSTUB(free                                    ,0xff814244) //112
NSTUB(kbd_p1_f                                ,0xff834c04) //109
NSTUB(kbd_p1_f_cont                           ,0xff834c10) //109
NSTUB(kbd_p2_f                                ,0xff834424) //109
NSTUB(kbd_read_keys                           ,0xff834b8c) //109
NSTUB(kbd_read_keys_r2                        ,0xff862be4) //109
NSTUB(lseek                                   ,0xff83817c) //101
NSTUB(malloc                                  ,0xff8141e8) //112
NSTUB(memcmp                                  ,0xff820750) //101
NSTUB(memcpy                                  ,0xff84110c) //101
NSTUB(memset                                  ,0xffa33eb8) //101
NSTUB(mkdir                                   ,0xff8384fc) //  4
NSTUB(mktime_ext                              ,0xff8b5cc8) //  1
NSTUB(open                                    ,0xff81aadc) //  1
NSTUB(opendir                                 ,0xffab8fd4) //  4
NSTUB(openfastdir                             ,0xffab8fd4) //  4
NSTUB(qsort                                   ,0xffb2e204) //  4
NSTUB(rand                                    ,0xffa33ff8) //  4
NSTUB(read                                    ,0xff81ad74) //101
NSTUB(readfastdir                             ,0xffab9128) //  4
NSTUB(reboot_fw_update                        ,0xffabe548) //  4
NSTUB(rename                                  ,0xff837944) //  4
NSTUB(set_control_event                       ,0xff89bfe4) //111
NSTUB(srand                                   ,0xffa33fec) //  4
NSTUB(stat                                    ,0xff8381c4) //  3
NSTUB(strcat                                  ,0xff8b5484) //  1
NSTUB(strchr                                  ,0xff8140b4) //  1
NSTUB(strcmp                                  ,0xff82070c) //101
NSTUB(strcpy                                  ,0xff8206f4) //101
NSTUB(strftime                                ,0xff8b56d0) //113
NSTUB(strlen                                  ,0xff814100) //101
NSTUB(strncmp                                 ,0xff814068) //  1
NSTUB(strncpy                                 ,0xff81402c) //  1
NSTUB(strrchr                                 ,0xff8140d8) //  1
NSTUB(strtol                                  ,0xff8413ec) //101
NSTUB(strtolx                                 ,0xff8411f0) //109
  DEF(task_CaptSeq                            ,0xff883630) //107
  DEF(task_ExpDrv                             ,0xff8cca88) //110
  DEF(task_InitFileModules                    ,0xff8a01b4) //107
  DEF(task_MovieRecord                        ,0xff986650) //107
  DEF(task_PhySw                              ,0xff834754) //107
  DEF(task_RotaryEncoder                      ,0xff86363c) //107
NSTUB(time                                    ,0xff88ff7c) //  2
NSTUB(vsprintf                                ,0xff8206b8) //  4
NSTUB(write                                   ,0xff8380f0) //101
