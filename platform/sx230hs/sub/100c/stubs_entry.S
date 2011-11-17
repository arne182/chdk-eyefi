// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R47 (DRYOS version 2.3, release #0047)
//   Firmware Ver GM1.00C
//   Canon PowerShot SX230 HS

// Values for makefile.inc
//   PLATFORMID = 12840 (0x3228) // Found @ 0xfff40040
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4c                // Found @ 0xffff3610
//   NEED_ENCODED_DISKBOOT = 6   // Found @ 0xffff3620

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(Restart                               ,0xff02d4cc) //106        *** != 0xff02d3d0
//NSTUB(kbd_pwr_off                           ,0xff0577e4) //  2 60%    *** != 0x00000000
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff097164 -> ff093588 -> ff1b82c8 -> ff32314c -> ff4954a0
// Mode 16936 in firmware but not in current modemap
// Mode 16938 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_SCN_MONOCHROME       8754
// Current modemap entry not found in firmware - MODE_SCN_TOY_CAMERA       8751
// Current modemap entry not found in firmware - MODE_SCN_MINIATURE        8748
// Current modemap entry not found in firmware - MODE_SCN_FISHEYE          8747
// Current modemap entry not found in firmware - MODE_SCN_POSTER_EFFECT    8743
// Current modemap entry not found in firmware - MODE_SCN_SUPER_VIVID      8742
// Current modemap entry not found in firmware - MODE_SCN_COLOR_SWAP       8734
// Current modemap entry not found in firmware - MODE_SCN_COLOR_ACCENT     8733

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x000358e8) // Found @0xff024d10,          stubs_min = 0x000358e8 (0x000358e8)
//DEF(physw_run                               ,0x00001c44) // Found @0xff0248a4,          stubs_min = 0x00001c44 (0x00001c44)
//DEF(levent_table                            ,0xff42121c) // Found @0xff42121c,          stubs_min = 0xff42121c (0xff42121c)
//DEF(FlashParamsTable                        ,0xff4956ec) // Found @0xff4956ec,          stubs_min = 0xff4956ec (0xff4956ec)
//DEF(movie_status                            ,0x00008624) // Found @0xff18c580,          stubs_min = 0x00008624 (0x00008624)
//DEF(full_screen_refresh                     ,0x0000b440) // Found @0xff244890,          stubs_min = 0x0000b440 (0x0000b440)
//DEF(canon_menu_active                       ,0x000042d4) // Found @0xff08ca84,          stubs_min = 0x000042d4 (0x000042d4)
//DEF(canon_shoot_menu_active                 ,0x00009995) // Found @0xff1d45b4,          stubs_min = 0x00009995 (0x00009995)
//DEF(playrec_mode                            ,0x00004008) // Found @0xff07ed14,          stubs_min = 0x00004008 (0x00004008)
//DEF(zoom_status                             ,0x0000f6bc) // Found @0xff326800, ** != ** stubs_min = 0x0000f69c (0x0000f69c)
//DEF(some_flag_for_af_scan                   ,0x00008a28) // Found @0xff190c5c,          stubs_min = 0x00008a28 (0x00008a28)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff0514b4
//void *vid_get_viewport_fb()      { return (void*)0x405d7980; } // Found @0xff37c474
//char *camera_jpeg_count_str()    { return (char*)0x000ce488; } // Found @0xff239850
//long hook_raw_size()             { return 0x0123eaf0; }        // Found @0xff37f988
//int get_flash_params_count(void) { return 0xa0; }              // Found @0xff1b9300

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xff3bcf0c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x04000000 // Found @0xff3bcf44, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_DISPLAY         ,0x00000800 }, // Found @0xff3bce7c, levent 0x0a
//    { 0, KEY_UP              ,0x00001000 }, // Found @0xff3bce84, levent 0x04
//    { 0, KEY_RIGHT           ,0x00004000 }, // Found @0xff3bce94, levent 0x07
//    { 0, KEY_SET             ,0x00010000 }, // Found @0xff3bcea4, levent 0x08
//    { 0, KEY_DOWN            ,0x00020000 }, // Found @0xff3bceac, levent 0x05
//    { 0, KEY_MENU            ,0x00040000 }, // Found @0xff3bceb4, levent 0x09
//    { 2, KEY_LEFT            ,0x00000100 }, // Found @0xff3bcee4, levent 0x06
//    { 2, KEY_SHOOT_FULL      ,0x00002002 }, // Found @0xff3bced4, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00002000 }, // Found @0xff3bcef4, levent 0x00
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xff3bced4, levent 0x01
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_DRYOS_2_3_R47 1 // Defined for cameras with DryOS version R47 or higher
//#define CAM_RAW_ROWPIX    4168 // Found @0xff156314
//#define CAM_RAW_ROWS      3060 // Found @0xff156320
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff02bcb8

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xff311904) //101
NSTUB(AllocateUncacheableMemory               ,0xff02bc70) //112
NSTUB(Close                                   ,0xff027ae4) //101
NSTUB(CreateTask                              ,0xff00e9a8) //101
NSTUB(DebugAssert                             ,0xff00ec80) //111
NSTUB(DeleteFile_Fut                          ,0xff026d6c) //112
NSTUB(DoAFLock                                ,0xff029004) //102
NSTUB(EnterToCompensationEVF                  ,0xff0292a0) //104
NSTUB(ExecuteEventProcedure                   ,0xff088174) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff0292e4) //104
NSTUB(ExitTask                                ,0xff00ec38) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff03857c) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff038654) //104
NSTUB(Fclose_Fut                              ,0xff026ee8) //101
NSTUB(Feof_Fut                                ,0xff0270d4) //  1
NSTUB(Fflush_Fut                              ,0xff027110) //  1
NSTUB(Fgets_Fut                               ,0xff02703c) //  6
NSTUB(Fopen_Fut                               ,0xff026ea8) //101
NSTUB(Fread_Fut                               ,0xff026f94) //101
NSTUB(FreeMemory                              ,0xff3118fc) //101
NSTUB(FreeUncacheableMemory                   ,0xff02bcb0) //112
NSTUB(Fseek_Fut                               ,0xff027088) //101
NSTUB(Fwrite_Fut                              ,0xff026fe8) //101
NSTUB(GetBatteryTemperature                   ,0xff05e554) //102
NSTUB(GetCCDTemperature                       ,0xff05e4e0) //102
NSTUB(GetCurrentAvValue                       ,0xff184680) //102
NSTUB(GetDrive_ClusterSize                    ,0xff06c2dc) //  6
NSTUB(GetDrive_FreeClusters                   ,0xff06c334) //  6
NSTUB(GetDrive_TotalClusters                  ,0xff06c30c) //  6
NSTUB(GetFocusLensSubjectDistance             ,0xff182910) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff182d70) //  3
NSTUB(GetImageFolder                          ,0xff15d268) //  6
NSTUB(GetKbdState                             ,0xff0576ac) //109
NSTUB(GetMemInfo                              ,0xff00a29c) //  3
NSTUB(GetOpticalTemperature                   ,0xff05e5c8) //102
NSTUB(GetParameterData                        ,0xff1b92c0) //101
NSTUB(GetPropertyCase                         ,0xff08bf58) //102
NSTUB(GetSystemTime                           ,0xff31195c) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff187b80) //102
NSTUB(GetZoomLensCurrentPosition              ,0xff2fb048) //102
NSTUB(GiveSemaphore                           ,0xff02b668) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff0e2d10) //102
NSTUB(LEDDrive                                ,0xff056a24) //101
NSTUB(LocalTime                               ,0xff085a08) //  6
NSTUB(LockMainPower                           ,0xff093178) //103
NSTUB(Lseek                                   ,0xff02766c) //101
NSTUB(MakeDirectory_Fut                       ,0xff026de0) //  6
NSTUB(MakeSDCardBootable                      ,0xff06c5e8) //  6
NSTUB(MoveFocusLensToDistance                 ,0xff378764) //102
NSTUB(MoveIrisWithAv                          ,0xff30d974) //102
NSTUB(MoveZoomLensWithPoint                   ,0xff30e138) //102
NSTUB(NewTaskShell                            ,0xff08b908) //101
NSTUB(Open                                    ,0xff0273e8) //101
NSTUB(PB2Rec                                  ,0xff096484) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff075c88) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff075c60) //102
NSTUB(PT_PlaySound                            ,0xff080de4) //  6
NSTUB(PostLogicalEventForNotPowerType         ,0xff090c90) //103
NSTUB(PostLogicalEventToUI                    ,0xff090cdc) //103
NSTUB(PutInNdFilter                           ,0xff3763a8) //102
NSTUB(PutOutNdFilter                          ,0xff3763e0) //102
NSTUB(Read                                    ,0xff00ad58) //101
NSTUB(ReadFastDir                             ,0xff2e6f5c) //  6
NSTUB(Rec2PB                                  ,0xff0964c4) //104
NSTUB(RefreshPhysicalScreen                   ,0xff0abfec) //104
NSTUB(Remove                                  ,0xff0275d0) //  6
NSTUB(RenameFile_Fut                          ,0xff026cd8) //  6
NSTUB(ScreenLock                              ,0xff0ad1b4) //  4
NSTUB(ScreenUnlock                            ,0xff0ad218) //  3
NSTUB(SetAE_ShutterSpeed                      ,0xff37b5ec) //102
NSTUB(SetAutoShutdownTime                     ,0xff0931ec) //103
NSTUB(SetCurrentCaptureModeType               ,0xff09cd4c) //101
NSTUB(SetFileTimeStamp                        ,0xff0277dc) //  6
NSTUB(SetLogicalEventActive                   ,0xff092eb4) //101
NSTUB(SetParameterData                        ,0xff1b9230) //101
NSTUB(SetPropertyCase                         ,0xff08be2c) //102
NSTUB(SetScriptMode                           ,0xff092f04) //101
NSTUB(SleepTask                               ,0xff02b914) //101
NSTUB(TakeSemaphore                           ,0xff02b598) //101
NSTUB(TurnOffBackLight                        ,0xff0a4200) //104
NSTUB(TurnOnBackLight                         ,0xff0a41e8) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff1a994c) //101
NSTUB(UnlockAF                                ,0xff02903c) //102
NSTUB(UnlockMainPower                         ,0xff0930cc) //103
NSTUB(VbattGet                                ,0xff023074) //101
NSTUB(Write                                   ,0xff0274b0) //101
NSTUB(WriteSDCard                             ,0xff171d24) //108
NSTUB(_log                                    ,0xff3b6dc8) //111
NSTUB(_log10                                  ,0xff3b7290) //112
NSTUB(_pow                                    ,0xff3b73f4) //114
NSTUB(_sqrt                                   ,0xff3b915c) //  6
NSTUB(add_ptp_handler                         ,0xff291c68) //  6
NSTUB(apex2us                                 ,0xff24de4c) //  4
NSTUB(close                                   ,0xff00abb4) //  6
NSTUB(closedir                                ,0xff2e6db8) //  4
NSTUB(err_init_task                           ,0xff005fd4) //  4
NSTUB(exmem_alloc                             ,0xff0869d0) //101
NSTUB(free                                    ,0xff004244) //112
NSTUB(kbd_p1_f                                ,0xff024d8c) //109
NSTUB(kbd_p1_f_cont                           ,0xff024d98) //109
NSTUB(kbd_p2_f                                ,0xff024574) //109
NSTUB(kbd_read_keys                           ,0xff024d10) //109
NSTUB(kbd_read_keys_r2                        ,0xff056ef0) //109
NSTUB(lseek                                   ,0xff02766c) //101
NSTUB(malloc                                  ,0xff0041ec) //112
NSTUB(memcmp                                  ,0xff010928) //101
NSTUB(memcpy                                  ,0xff031584) //101
NSTUB(memset                                  ,0xff24ce4c) //101
NSTUB(mkdir                                   ,0xff0278ec) //  6
NSTUB(mktime_ext                              ,0xff0ae114) //  1
NSTUB(open                                    ,0xff00ab04) //  6
NSTUB(opendir                                 ,0xff2e6e08) //  6
NSTUB(openfastdir                             ,0xff2e6e08) //  6
NSTUB(qsort                                   ,0xff36386c) //  6
NSTUB(rand                                    ,0xff24cf8c) //  6
NSTUB(read                                    ,0xff00ad58) //101
NSTUB(readfastdir                             ,0xff2e6f5c) //  6
NSTUB(reboot_fw_update                        ,0xff2ec3f4) //  6
NSTUB(rename                                  ,0xff026cd8) //  6
NSTUB(set_control_event                       ,0xff092aac) //111
NSTUB(srand                                   ,0xff24cf80) //  6
NSTUB(stat                                    ,0xff0276b4) //  3
NSTUB(strcat                                  ,0xff0ad8cc) //  1
NSTUB(strchr                                  ,0xff0040b8) //  1
NSTUB(strcmp                                  ,0xff0108e4) //101
NSTUB(strcpy                                  ,0xff0108cc) //101
NSTUB(strftime                                ,0xff0adb14) //113
NSTUB(strlen                                  ,0xff004104) //101
NSTUB(strncmp                                 ,0xff00406c) //  1
NSTUB(strncpy                                 ,0xff004030) //  1
NSTUB(strrchr                                 ,0xff0040dc) //  1
NSTUB(strtol                                  ,0xff031884) //101
NSTUB(strtolx                                 ,0xff031688) //109
  DEF(task_CaptSeq                            ,0xff078bc8) //110
  DEF(task_ExpDrv                             ,0xff0c5e4c) //110
  DEF(task_InitFileModules                    ,0xff096fd8) //110
  DEF(task_MovieRecord                        ,0xff18d7c0) //110
  DEF(task_PhySw                              ,0xff0248a0) //110
  DEF(task_RotaryEncoder                      ,0xff057998) //110
NSTUB(time                                    ,0xff085fa4) //  6
NSTUB(vsprintf                                ,0xff01088c) //  6
NSTUB(write                                   ,0xff0274b0) //101
