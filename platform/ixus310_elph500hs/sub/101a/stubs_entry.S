// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R47 (DRYOS version 2.3, release #0047)
//   Firmware Ver GM1.01A
//   Canon IXUS 310 HS

// Values for makefile.inc
//   PLATFORMID = 12837 (0x3225) // Found @ 0xfff40040
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4c                // Found @ 0xffff3610
//   NEED_ENCODED_DISKBOOT = 6   // Found @ 0xffff3620

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
NSTUB(kbd_pwr_off                             ,0xff0560cc) //  2 60%
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff055974
//NSTUB(reboot_fw_update                      ,0xff2e99d0) //  6 83%    *** != 0xff2e99cc

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff090c3c -> ff08d864 -> ff1af368 -> ff320ad4 -> ff4ce708
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00034d4c) // Found @0xff024e2c,          stubs_min = 0x00034d4c (0x00034d4c)
//DEF(physw_run                               ,0x00001c3c) // Found @0xff0249cc,          stubs_min = 0x00001c3c (0x00001c3c)
//DEF(levent_table                            ,0xff4214e8) // Found @0xff4214e8,          stubs_min = 0xff4214e8 (0xff4214e8)
//DEF(FlashParamsTable                        ,0xff4ce948) // Found @0xff4ce948,          stubs_min = 0xff4ce948 (0xff4ce948)
//DEF(movie_status                            ,0x000070dc) // Found @0xff17e974,          stubs_min = 0x000070dc (0x000070dc)
//DEF(full_screen_refresh                     ,0x0000a424) // Found @0xff244a14,          stubs_min = 0x0000a424 (0x0000a424)
//DEF(canon_menu_active                       ,0x000032f8) // Found @0xff0887f4,          stubs_min = 0x000032f8 (0x000032f8)
//DEF(canon_shoot_menu_active                 ,0x000087c9) // Found @0xff1c867c,          stubs_min = 0x000087c9 (0x000087c9)
//DEF(playrec_mode                            ,0x00003030) // Found @0xff07abf4,          stubs_min = 0x00003030 (0x00003030)
//DEF(zoom_status                             ,0x0000e7c0) // Found @0xff32448c,          stubs_min = 0x0000e7c0 (0x0000e7c0)
//DEF(some_flag_for_af_scan                   ,0x000074e0) // Found @0xff183040,          stubs_min = 0x000074e0 (0x000074e0)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff04f54c
//void *vid_get_viewport_fb()      { return (void*)0x405d7980; } // Found @0xff38b5e0
//char *camera_jpeg_count_str()    { return (char*)0x000c75f4; } // Found @0xff236e4c
//long hook_raw_size()             { return 0x0123eaf0; }        // Found @0xff38eaf4
//int get_flash_params_count(void) { return 0xa0; }              // Found @0xff1b03a0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xff3d14ac, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x04000000 // Found @0xff3d14cc, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_ZOOM_IN         ,0x00001000 }, // Found @0xff3d1464, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00008000 }, // Found @0xff3d146c, levent 0x03
//    { 2, KEY_SHOOT_FULL      ,0x00000a00 }, // Found @0xff3d1484, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000800 }, // Found @0xff3d1484, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000200 }, // Found @0xff3d147c, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_DRYOS_2_3_R47 1 // Defined for cameras with DryOS version R47 or higher
//#define CAM_RAW_ROWPIX    4168 // Found @0xff14a154
//#define CAM_RAW_ROWS      3060 // Found @0xff14a160
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff02b914

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xff30faec) //101
NSTUB(AllocateUncacheableMemory               ,0xff02b8cc) //112
NSTUB(Close                                   ,0xff027690) //101
NSTUB(CreateTask                              ,0xff00e9b0) //101
NSTUB(DebugAssert                             ,0xff00ec88) //111
NSTUB(DeleteFile_Fut                          ,0xff026fa8) //112
NSTUB(DoAFLock                                ,0xff028edc) //102
NSTUB(EnterToCompensationEVF                  ,0xff029138) //104
NSTUB(ExecuteEventProcedure                   ,0xff083fe0) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff02917c) //104
NSTUB(ExitTask                                ,0xff00ec40) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff037f50) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff038028) //104
NSTUB(Fclose_Fut                              ,0xff027124) //101
NSTUB(Feof_Fut                                ,0xff027310) //  1
NSTUB(Fflush_Fut                              ,0xff02734c) //  1
NSTUB(Fgets_Fut                               ,0xff027278) //  6
NSTUB(Fopen_Fut                               ,0xff0270e4) //101
NSTUB(Fread_Fut                               ,0xff0271d0) //101
NSTUB(FreeMemory                              ,0xff30fae4) //101
NSTUB(FreeUncacheableMemory                   ,0xff02b90c) //112
NSTUB(Fseek_Fut                               ,0xff0272c4) //101
NSTUB(Fwrite_Fut                              ,0xff027224) //101
NSTUB(GetBatteryTemperature                   ,0xff0597d4) //102
NSTUB(GetCCDTemperature                       ,0xff059760) //102
NSTUB(GetCurrentAvValue                       ,0xff17678c) //102
NSTUB(GetDrive_ClusterSize                    ,0xff0680d8) //  6
NSTUB(GetDrive_FreeClusters                   ,0xff068130) //  6
NSTUB(GetDrive_TotalClusters                  ,0xff068108) //  6
NSTUB(GetFocusLensSubjectDistance             ,0xff174b20) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff174f80) //  3
NSTUB(GetImageFolder                          ,0xff1510ec) //  6
NSTUB(GetKbdState                             ,0xff0560b4) //109
NSTUB(GetMemInfo                              ,0xff00a29c) //  3
NSTUB(GetOpticalTemperature                   ,0xff059848) //102
NSTUB(GetParameterData                        ,0xff1b0360) //101
NSTUB(GetPropertyCase                         ,0xff087d48) //102
NSTUB(GetSystemTime                           ,0xff30fb44) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff179f70) //102
NSTUB(GetZoomLensCurrentPosition              ,0xff2f9ac8) //102
NSTUB(GiveSemaphore                           ,0xff02b2c4) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff0dabe0) //102
NSTUB(LEDDrive                                ,0xff0555f8) //101
NSTUB(LocalTime                               ,0xff081870) //  6
NSTUB(LockMainPower                           ,0xff08d454) //103
NSTUB(Lseek                                   ,0xff0278ac) //101
NSTUB(MakeDirectory_Fut                       ,0xff02701c) //  6
NSTUB(MakeSDCardBootable                      ,0xff068368) //  6
NSTUB(MoveFocusLensToDistance                 ,0xff3878dc) //102
NSTUB(MoveIrisWithAv                          ,0xff30bc38) //102
NSTUB(MoveZoomLensWithPoint                   ,0xff30c504) //102
NSTUB(NewTaskShell                            ,0xff087790) //101
NSTUB(Open                                    ,0xff0275c8) //101
NSTUB(PB2Rec                                  ,0xff090114) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff072364) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff07233c) //102
NSTUB(PT_PlaySound                            ,0xff07cc4c) //  6
NSTUB(PostLogicalEventForNotPowerType         ,0xff08cbfc) //103
NSTUB(PostLogicalEventToUI                    ,0xff08cc48) //103
NSTUB(PutInNdFilter                           ,0xff30c34c) //102
NSTUB(PutOutNdFilter                          ,0xff30c370) //102
NSTUB(Read                                    ,0xff00ad58) //101
NSTUB(ReadFastDir                             ,0xff2e4530) //  6
NSTUB(Rec2PB                                  ,0xff090154) //104
NSTUB(RefreshPhysicalScreen                   ,0xff0a3f10) //104
NSTUB(Remove                                  ,0xff027804) //  6
NSTUB(RenameFile_Fut                          ,0xff026f14) //  6
NSTUB(Restart                                 ,0xff02d0e0) //106
NSTUB(ScreenLock                              ,0xff0a5108) //  4
NSTUB(ScreenUnlock                            ,0xff0a516c) //  3
NSTUB(SetAE_ShutterSpeed                      ,0xff38a758) //102
NSTUB(SetAutoShutdownTime                     ,0xff08d4c8) //103
NSTUB(SetCurrentCaptureModeType               ,0xff095608) //101
NSTUB(SetFileTimeStamp                        ,0xff027a1c) //  6
NSTUB(SetLogicalEventActive                   ,0xff08d1bc) //101
NSTUB(SetParameterData                        ,0xff1b02d0) //101
NSTUB(SetPropertyCase                         ,0xff087c2c) //102
NSTUB(SetScriptMode                           ,0xff08d20c) //101
NSTUB(SleepTask                               ,0xff02b570) //101
NSTUB(TakeSemaphore                           ,0xff02b1f4) //101
NSTUB(TurnOffBackLight                        ,0xff09b938) //104
NSTUB(TurnOnBackLight                         ,0xff09b920) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff19e09c) //101
NSTUB(UnlockAF                                ,0xff028f14) //102
NSTUB(UnlockMainPower                         ,0xff08d3a8) //103
NSTUB(VbattGet                                ,0xff023004) //101
NSTUB(Write                                   ,0xff0276e4) //101
NSTUB(WriteSDCard                             ,0xff163f5c) //108
NSTUB(_log                                    ,0xff3cb228) //111
NSTUB(_log10                                  ,0xff3cb768) //112
NSTUB(_pow                                    ,0xff3cb8e0) //114
NSTUB(_sqrt                                   ,0xff3cd840) //  6
NSTUB(add_ptp_handler                         ,0xff28ee4c) //  6
NSTUB(apex2us                                 ,0xff24e4e4) //  4
NSTUB(close                                   ,0xff00abb4) //  6
NSTUB(closedir                                ,0xff2e438c) //  4
NSTUB(err_init_task                           ,0xff005fd4) //  4
NSTUB(exmem_alloc                             ,0xff082838) //101
NSTUB(free                                    ,0xff004244) //112
NSTUB(kbd_p1_f                                ,0xff024ea8) //109
NSTUB(kbd_p1_f_cont                           ,0xff024eb4) //109
NSTUB(kbd_p2_f                                ,0xff02469c) //109
NSTUB(kbd_read_keys                           ,0xff024e2c) //109
NSTUB(kbd_read_keys_r2                        ,0xff055ad0) //109
NSTUB(lseek                                   ,0xff0278ac) //101
NSTUB(malloc                                  ,0xff0041ec) //112
NSTUB(memcmp                                  ,0xff0108e8) //101
NSTUB(memcpy                                  ,0xff030fbc) //101
NSTUB(memset                                  ,0xff24cfd8) //101
NSTUB(mkdir                                   ,0xff027b2c) //  6
NSTUB(mktime_ext                              ,0xff0a5f80) //  1
NSTUB(open                                    ,0xff00ab04) //  6
NSTUB(opendir                                 ,0xff2e43dc) //  6
NSTUB(openfastdir                             ,0xff2e43dc) //  6
NSTUB(qsort                                   ,0xff24d5e0) //  6
NSTUB(rand                                    ,0xff24d118) //  6
NSTUB(read                                    ,0xff00ad58) //101
NSTUB(readfastdir                             ,0xff2e4530) //  6
NSTUB(rename                                  ,0xff026f14) //  6
NSTUB(set_control_event                       ,0xff08ce6c) //111
NSTUB(srand                                   ,0xff24d10c) //  6
NSTUB(stat                                    ,0xff0278f4) //  3
NSTUB(strcat                                  ,0xff0a5738) //  1
NSTUB(strchr                                  ,0xff0040b8) //  1
NSTUB(strcmp                                  ,0xff0108a4) //101
NSTUB(strcpy                                  ,0xff01088c) //101
NSTUB(strftime                                ,0xff0a5980) //113
NSTUB(strlen                                  ,0xff004104) //101
NSTUB(strncmp                                 ,0xff00406c) //  1
NSTUB(strncpy                                 ,0xff004030) //  1
NSTUB(strrchr                                 ,0xff0040dc) //  1
NSTUB(strtol                                  ,0xff0312bc) //101
NSTUB(strtolx                                 ,0xff0310c0) //109
  DEF(task_CaptSeq                            ,0xff074f1c) //110
  DEF(task_ExpDrv                             ,0xff0bdd18) //110
  DEF(task_InitFileModules                    ,0xff090ab0) //110
  DEF(task_MovieRecord                        ,0xff17fc00) //110
  DEF(task_PhySw                              ,0xff0249c8) //110
NSTUB(time                                    ,0xff081e4c) //  6
NSTUB(vsprintf                                ,0xff01084c) //  6
NSTUB(write                                   ,0xff0276e4) //101
