// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00C
//   Canon DIGITAL IXUS 95 IS

// Values for makefile.inc
//   PLATFORMID = 12740 (0x31c4) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff1be4
//   NEED_ENCODED_DISKBOOT = 2   // Found @ 0xffff1bf4

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DoAFLock                              ,0xffc15298) //102        *** != 0xffc47b8c
//NSTUB(GetFocusLensSubjectDistance           ,0xffcf0434) //102        *** != 0xffc00950
//NSTUB(SetScriptMode                         ,0xffc5d99c) //101        *** != 0xffc00950
//NSTUB(UnlockAF                              ,0xffc152d0) //102        *** != 0xffc47b9c
//NSTUB(WriteSDCard                           ,0xffce4300) //108        *** != 0xffce4118
//NSTUB(kbd_pwr_off                           ,0xffc30e1c) //  2 64%    *** != 0xffc00950
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc00950
//NSTUB(kbd_read_keys                         ,0xffc11d70) //109        *** != 0xffc11d80
//NSTUB(rename                                ,0xffc13494) //  1        *** != 0xffc13d10
//NSTUB(strrchr                               ,0xffd64ff8) //  1        *** != 0xffc6cad0
//NSTUB(write                                 ,0xffc13ce8) //101        *** != 0xffc09b44

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc614e8 -> ffc5dfb8 -> ffd1af7c -> ffdf7360 -> ffeb35d8
// Mode  2598 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_VIDEO_COLOR_SWAP     2600
// Current modemap entry not found in firmware - MODE_VIDEO_COLOR_ACCENT   2599
// Current modemap entry not found in firmware - MODE_VIDEO_STD            2601
// Current modemap entry not found in firmware - MODE_STITCH              16906
// Current modemap entry not found in firmware - MODE_SCN_COLOR_SWAP      16924
// Current modemap entry not found in firmware - MODE_SCN_COLOR_ACCENT    16923
// Current modemap entry not found in firmware - MODE_M                   32769

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000c338) // Found @0xffc11d70,          stubs_min = 0x0000c338 (0xC338)
//DEF(physw_run                               ,0x00001c34) // Found @0xffc119e4,          stubs_min = 0x00001c34 (0x1C28+0x0C)
//DEF(levent_table                            ,0xffe8c7c4) // Found @0xffe8c7c4,          stubs_min = 0xffe8c7c4 (0xFFE8C7C4)
//DEF(FlashParamsTable                        ,0xffeb37a8) // Found @0xffeb37a8,          stubs_min = 0xffeb37a8 (0xFFEB37A8)
//DEF(movie_status                            ,0x00005680) // Found @0xffcf8060, ** != ** stubs_min = 0x00005684 (0x5648+0x3c)
//DEF(canon_menu_active                       ,0x00002bb0) // Found @0xffc5adf8,          stubs_min = 0x00002bb0 (0x2BAC+0x04)
//DEF(canon_shoot_menu_active                 ,0x0000681d) // Found @0xffd2a1ac,          stubs_min = 0x0000681d (0x681C+0x01)
//DEF(playrec_mode                            ,0x00002924) // Found @0xffc4e4ec,          stubs_min = 0x00002924 (0x2924)
//DEF(zoom_status                             ,0x000096b4) // Found @0xffdf8b90,          stubs_min = 0x000096b4 (0x96B4)
//DEF(some_flag_for_af_scan                   ,0x00005b4c) // Found @0xffcfa7ac,          stubs_min = 0x00005b4c (0x5B4C)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xffc2c9a8
//void *vid_get_viewport_fb()      { return (void*)0x4076f088; } // Found @0xffe38210
//char *camera_jpeg_count_str()    { return (char*)0x0002f1d4; } // Found @0xffd57dc0
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffe3a7a0
//int get_flash_params_count(void) { return 0x7a; }              // Found @0xffd1c038

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe65ad0, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe65adc, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffe65a40, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffe65a4c, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffe65a58, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffe65a64, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffe65a70, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffe65a7c, levent 0x04
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe65a88, levent 0x08
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffe65a94, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffe65a34, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffe65a34, levent 0x01
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffe65aa0, levent 0x09
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffe65a28, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffcc787c
//#define CAM_RAW_ROWS      2772 // Found @0xffcc7884
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xffc172cc

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffded8e8) //101
//NSTUB(AllocateUncacheableMemory             ,0xffc17288) //112            == 0xffc17288
NSTUB(Close                                   ,0xffc13c3c) //101
NSTUB(CreateTask                              ,0xffc0afac) //101
NSTUB(DebugAssert                             ,0xffc0b284) //111
NSTUB(DeleteFile_Fut                          ,0xffc134e8) //112
//NSTUB(EnterToCompensationEVF                ,0xffc15348) //104            == 0xffc15348
NSTUB(ExecuteEventProcedure                   ,0xffc565a8) //  1
//NSTUB(ExitFromCompensationEVF               ,0xffc1538c) //104            == 0xffc1538c
NSTUB(ExitTask                                ,0xffc0b23c) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xffc1fcc4) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xffc1fe08) //104
NSTUB(Fclose_Fut                              ,0xffc13664) //101
NSTUB(Feof_Fut                                ,0xffc13850) //  1
NSTUB(Fflush_Fut                              ,0xffc1388c) //  1
NSTUB(Fgets_Fut                               ,0xffc137b8) //  1
NSTUB(Fopen_Fut                               ,0xffc13624) //101
NSTUB(Fread_Fut                               ,0xffc13710) //101
NSTUB(FreeMemory                              ,0xffded8e0) //101
NSTUB(FreeUncacheableMemory                   ,0xffc172c8) //112
NSTUB(Fseek_Fut                               ,0xffc13804) //101
NSTUB(Fwrite_Fut                              ,0xffc13764) //101
NSTUB(GetBatteryTemperature                   ,0xffc338cc) //102
NSTUB(GetCCDTemperature                       ,0xffc33858) //102
NSTUB(GetCurrentAvValue                       ,0xffcf1384) //102
//NSTUB(GetDrive_ClusterSize                  ,0xffc3f81c) //  5            == 0xffc3f81c
//NSTUB(GetDrive_FreeClusters                 ,0xffc3f874) //  5            == 0xffc3f874
//NSTUB(GetDrive_TotalClusters                ,0xffc3f848) //  5            == 0xffc3f848
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffcf0810) //  3
NSTUB(GetKbdState                             ,0xffc30e04) //109
NSTUB(GetMemInfo                              ,0xffc03be4) //  1
//NSTUB(GetOpticalTemperature                 ,0xffc33940) //102            == 0xffc33940
NSTUB(GetParameterData                        ,0xffd1bff8) //101
NSTUB(GetPropertyCase                         ,0xffc5a2e8) //102
NSTUB(GetSystemTime                           ,0xffded940) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffcf4ad4) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffde56b4) //102
NSTUB(GiveSemaphore                           ,0xffc16ca4) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc88190) //102
//NSTUB(LEDDrive                              ,0xffc3043c) //103            == 0xffc3043c
NSTUB(LocalTime                               ,0xffc5426c) //  1
NSTUB(LockMainPower                           ,0xffc5dbd0) //103
NSTUB(Lseek                                   ,0xffc13d7c) //101
NSTUB(MakeDirectory_Fut                       ,0xffc1355c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe34c40) //102
NSTUB(MoveIrisWithAv                          ,0xffdea9c4) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdeaf4c) //102
NSTUB(NewTaskShell                            ,0xffc59d94) //103
NSTUB(Open                                    ,0xffc13c14) //101
NSTUB(PB2Rec                                  ,0xffc608a0) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc47b54) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc47b2c) //102
//NSTUB(PT_PlaySound                          ,0xffc47764) //102            == 0xffc47764
//NSTUB(PostLogicalEventForNotPowerType       ,0xffc5d1f8) //103            == 0xffc5d1f8
NSTUB(PostLogicalEventToUI                    ,0xffc5d244) //103
//NSTUB(PutInNdFilter                         ,0xffdeadb0) //102            == 0xffdeadb0
//NSTUB(PutOutNdFilter                        ,0xffdeadd4) //102            == 0xffdeadd4
NSTUB(Read                                    ,0xffc09ae4) //101
NSTUB(ReadFastDir                             ,0xffdd7a18) //  1
NSTUB(Rec2PB                                  ,0xffc608e0) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffd64c80) //104            == 0xffd64c80
NSTUB(Remove                                  ,0xffc13c84) //  1
NSTUB(RenameFile_Fut                          ,0xffc13494) //  1
NSTUB(Restart                                 ,0xffc189d8) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffe37420) //102
NSTUB(SetAutoShutdownTime                     ,0xffc5dc44) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc6421c) //101
NSTUB(SetFileTimeStamp                        ,0xffc13f18) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5d94c) //101
NSTUB(SetParameterData                        ,0xffd1bf68) //101
NSTUB(SetPropertyCase                         ,0xffc5a1e4) //102
NSTUB(SleepTask                               ,0xffc16f0c) //101
NSTUB(TakeSemaphore                           ,0xffc16bd4) //101
//NSTUB(TurnOffBackLight                      ,0xffc68aa8) //104            == 0xffc68aa8
//NSTUB(TurnOnBackLight                       ,0xffc68a90) //104            == 0xffc68a90
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd0d51c) //103
NSTUB(UnlockMainPower                         ,0xffc5db24) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd21b70) //104            == 0xffd21b70
//NSTUB(UpdateMBROnFlash                      ,0xffc3f674) //  3            == 0xffc3f674
//NSTUB(VbattGet                              ,0xffc10644) //103            == 0xffc10644
NSTUB(Write                                   ,0xffc13ce8) //101
NSTUB(_log                                    ,0xffe61ec0) //111
NSTUB(_log10                                  ,0xffe60b4c) //112
NSTUB(_pow                                    ,0xffe60cbc) //114
NSTUB(_sqrt                                   ,0xffe63a64) //  1
NSTUB(add_ptp_handler                         ,0xffdaa1a0) //  3
NSTUB(apex2us                                 ,0xffd65d38) //  4
NSTUB(close                                   ,0xffc098fc) //  1
NSTUB(closedir                                ,0xffdd7ae8) //  1
NSTUB(err_init_task                           ,0xffc04e2c) //  4
NSTUB(exmem_alloc                             ,0xffc54ea0) //103
NSTUB(free                                    ,0xffc03a3c) //112
NSTUB(kbd_p1_f                                ,0xffc11dec) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11df8) //109
//NSTUB(kbd_p2_f                              ,0xffc116b0) //109            == 0xffc116b0
//NSTUB(kbd_read_keys_r2                      ,0xffc30824) //109            == 0xffc30824
NSTUB(lseek                                   ,0xffc13d7c) //101
NSTUB(malloc                                  ,0xffc03968) //112
NSTUB(memcmp                                  ,0xffc0cc5c) //101
NSTUB(memcpy                                  ,0xffc6cc38) //101
NSTUB(memset                                  ,0xffd65020) //101
NSTUB(mkdir                                   ,0xffc13fe0) //  1
// ALT: NSTUB(mkdir, 0xffc14080) // 1 32/0
NSTUB(mktime_ext                              ,0xffc6d4a4) //  1
NSTUB(open                                    ,0xffc0984c) //  1
NSTUB(opendir                                 ,0xffdd7984) //  1
NSTUB(openfastdir                             ,0xffdd7984) //  1
//NSTUB(qsort                                 ,0xffe1cc78) //  1            == 0xffe1cc78
NSTUB(rand                                    ,0xffc0cd64) //  1
NSTUB(read                                    ,0xffc09ae4) //101
NSTUB(readfastdir                             ,0xffdd7a18) //  1
NSTUB(reboot_fw_update                        ,0xffddb4fc) //  5
NSTUB(set_control_event                       ,0xffc5d680) //111
NSTUB(srand                                   ,0xffc0cd58) //  1
NSTUB(stat                                    ,0xffc13e48) //  1
NSTUB(strcat                                  ,0xffc6ca4c) //  1
//NSTUB(strchr                                ,0xffc6cad4) //  1            == 0xffc6cad4
NSTUB(strcmp                                  ,0xffc0cbf4) //101
NSTUB(strcpy                                  ,0xffc0cbdc) //101
NSTUB(strftime                                ,0xffc6ceac) //  1
NSTUB(strlen                                  ,0xffc0cc38) //101
NSTUB(strncmp                                 ,0xffc6ca88) //  1
NSTUB(strncpy                                 ,0xffc1cac0) //  1
NSTUB(strtol                                  ,0xffc1ccf8) //101
NSTUB(strtolx                                 ,0xffc1cafc) //109
  DEF(task_CaptSeq                            ,0xffc49fe0) //107
  DEF(task_ExpDrv                             ,0xffc7ee88) //110
  DEF(task_InitFileModules                    ,0xffc61374) //107
  DEF(task_MovieRecord                        ,0xffcf82b4) //107
  DEF(task_PhySw                              ,0xffc119e0) //107
NSTUB(time                                    ,0xffc54120) //  1
//NSTUB(vsprintf                              ,0xffc0cba0) //  1            == 0xffc0cba0
