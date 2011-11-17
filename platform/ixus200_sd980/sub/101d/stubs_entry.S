// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.01D
//   Canon PowerShot SD980 IS

// Values for makefile.inc
//   PLATFORMID = 12773 (0x31e5) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff3564
//   NEED_ENCODED_DISKBOOT = 3   // Found @ 0xffff3574

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xff85ae98) //  2 64%        == 0xff85ae98
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b04
//NSTUB(write                                 ,0xff835498) //101        *** != 0xff81abd8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8946c4 -> ff890de4 -> ff978c5c -> ffaab40c -> ffbdab64
// Mode 32774 in firmware but not in current modemap
// Mode 33288 in firmware but not in current modemap
// Mode 33307 in firmware but not in current modemap
// Mode 33308 in firmware but not in current modemap
// Mode 32797 in firmware but not in current modemap
// Mode 32786 in firmware but not in current modemap
// Mode 32788 in firmware but not in current modemap
// Mode 32789 in firmware but not in current modemap
// Mode 32785 in firmware but not in current modemap
// Mode 33295 in firmware but not in current modemap
// Mode 32784 in firmware but not in current modemap
// Mode  2601 in firmware but not in current modemap
// Mode  2602 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_SCN_COLOR_SWAP      16924
// Current modemap entry not found in firmware - MODE_SCN_COLOR_ACCENT    16923
// Current modemap entry not found in firmware - MODE_SCN_ISO_3200        16413
// Current modemap entry not found in firmware - MODE_SCN_BEACH           16405
// Current modemap entry not found in firmware - MODE_SCN_SNOW            16404
// Current modemap entry not found in firmware - MODE_SCN_SUNSET          16402
// Current modemap entry not found in firmware - MODE_SCN_INDOOR          16401
// Current modemap entry not found in firmware - MODE_SCN_NIGHT_SCENE     16398
// Current modemap entry not found in firmware - MODE_SPORTS              33287
// Current modemap entry not found in firmware - MODE_VIDEO_STD            3622
// Current modemap entry not found in firmware - MODE_LANDSCAPE           32780
// Current modemap entry not found in firmware - MODE_M                   32769
// Current modemap entry not found in firmware - MODE_AV                  32770
// Current modemap entry not found in firmware - MODE_TV                  32771

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00044558) // Found @0xff8335a8,          stubs_min = 0x00044558 (0x44558)
//DEF(physw_run                               ,0x00001c44) // Found @0xff833200,          stubs_min = 0x00001c44 (0x1C38+0x0C)
//DEF(levent_table                            ,0xffb7a458) // Found @0xffb7a458,          stubs_min = 0xffb7a458 (0xffb7a458)
//DEF(FlashParamsTable                        ,0xffbdad4c) // Found @0xffbdad4c,          stubs_min = 0xffbdad4c (0xFFBDAD4C)
//DEF(movie_status                            ,0x000067e0) // Found @0xff94addc,          stubs_min = 0x000067e0 (0x000067e0)
//DEF(full_screen_refresh                     ,0x0001b2dc) // Found @0xff9f76d8
//DEF(canon_menu_active                       ,0x00002ec8) // Found @0xff889754,          stubs_min = 0x00002ec8 (0x2EC4+4)
//DEF(canon_shoot_menu_active                 ,0x00007b09) // Found @0xff98db68,          stubs_min = 0x00007b09 (0x7B08+1)
//DEF(playrec_mode                            ,0x00002bfc) // Found @0xff87bc2c,          stubs_min = 0x00002bfc (0x2BF8+0x4)
//DEF(zoom_status                             ,0x0001e3d4) // Found @0xffaade98,          stubs_min = 0x0001e3d4 (0x1E3D4)
//DEF(some_flag_for_af_scan                   ,0x00006cd4) // Found @0xff94ddf8,          stubs_min = 0x00006cd4 (0x6CD4)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40431000; } // Found @0xff853588
//void *vid_get_viewport_fb()      { return (void*)0x408cb700; } // Found @0xffb0ba3c
//char *camera_jpeg_count_str()    { return (char*)0x00084ca4; } // Found @0xff9e8c64
//long hook_raw_size()             { return 0x011ca240; }        // Found @0xffb0e8cc
//int get_flash_params_count(void) { return 0x84; }              // Found @0xff979d18

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb406a4, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00100000 // Found @0xffb406bc, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_SHOOT_FULL      ,0x00000300 }, // Found @0xffb40668, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000200 }, // Found @0xffb40668, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000100 }, // Found @0xffb4065c, levent 0x00
//    { 2, KEY_MENU            ,0x00000001 }, // Found @0xffb405fc, levent 0x09
//    { 2, KEY_SET             ,0x00000002 }, // Found @0xffb40608, levent 0x08
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffb40614, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffb40620, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffb4062c, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffb40638, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffb40644, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffb40650, levent 0x04
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    4080 // Found @0xff91c00c
//#define CAM_RAW_ROWS      3048 // Found @0xff91c014
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff838a1c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
//NSTUB(AllocateMemory                        ,0xffa9ef6c) //101            == 0xffa9ef6c
NSTUB(AllocateUncacheableMemory               ,0xff8389d8) //112
NSTUB(Close                                   ,0xff835408) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff834d94) //112
//NSTUB(DoAFLock                              ,0xff8368f0) //102            == 0xff8368f0
//NSTUB(EnterToCompensationEVF                ,0xff836ae0) //104            == 0xff836ae0
NSTUB(ExecuteEventProcedure                   ,0xff884e30) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff836b24) //104            == 0xff836b24
NSTUB(ExitTask                                ,0xff81e844) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff844254) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff84432c) //104
NSTUB(Fclose_Fut                              ,0xff834f10) //101
NSTUB(Feof_Fut                                ,0xff8350fc) //  1
NSTUB(Fflush_Fut                              ,0xff835138) //  1
NSTUB(Fgets_Fut                               ,0xff835064) //  1
NSTUB(Fopen_Fut                               ,0xff834ed0) //101
NSTUB(Fread_Fut                               ,0xff834fbc) //101
//NSTUB(FreeMemory                            ,0xffa9ef64) //101            == 0xffa9ef64
NSTUB(FreeUncacheableMemory                   ,0xff838a18) //112
NSTUB(Fseek_Fut                               ,0xff8350b0) //101
NSTUB(Fwrite_Fut                              ,0xff835010) //101
NSTUB(GetBatteryTemperature                   ,0xff85e2ac) //102
NSTUB(GetCCDTemperature                       ,0xff85e238) //102
NSTUB(GetCurrentAvValue                       ,0xff944888) //102
NSTUB(GetDrive_ClusterSize                    ,0xff86bb04) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff86bb64) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff86bb38) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff942e5c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff9432a4) //  3
NSTUB(GetImageFolder                          ,0xff923e38) //106
NSTUB(GetKbdState                             ,0xff85ae80) //109
NSTUB(GetMemInfo                              ,0xff81a070) //  3
NSTUB(GetOpticalTemperature                   ,0xff85e320) //102
NSTUB(GetParameterData                        ,0xff979cd8) //101
NSTUB(GetPropertyCase                         ,0xff888b98) //102
//NSTUB(GetSystemTime                         ,0xffa9efc4) //101            == 0xffa9efc4
NSTUB(GetZoomLensCurrentPoint                 ,0xff947330) //102
//NSTUB(GetZoomLensCurrentPosition            ,0xffa906b4) //102            == 0xffa906b4
NSTUB(GiveSemaphore                           ,0xff8383f4) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8c3a74) //102
//NSTUB(LEDDrive                              ,0xff85a31c) //103            == 0xff85a31c
NSTUB(LocalTime                               ,0xff8827a4) //  1
NSTUB(LockMainPower                           ,0xff890a00) //103
//NSTUB(Lseek                                 ,0xff835524) //101            == 0xff835524
NSTUB(MakeDirectory_Fut                       ,0xff834e08) //  1
//NSTUB(MoveFocusLensToDistance               ,0xffb08424) //102            == 0xffb08424
NSTUB(MoveIrisWithAv                          ,0xffa9c500) //102
//NSTUB(MoveZoomLensWithPoint                 ,0xffa9cb4c) //102            == 0xffa9cb4c
NSTUB(NewTaskShell                            ,0xff888644) //103
NSTUB(Open                                    ,0xff8353b0) //101
NSTUB(PB2Rec                                  ,0xff893a2c) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff87481c) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff8747f4) //102
//NSTUB(PT_PlaySound                          ,0xff87d8f8) //102            == 0xff87d8f8
NSTUB(PostLogicalEventForNotPowerType         ,0xff88e808) //103
NSTUB(PostLogicalEventToUI                    ,0xff88e854) //103
//NSTUB(PutInNdFilter                         ,0xffb06084) //102            == 0xffb06084
//NSTUB(PutOutNdFilter                        ,0xffb060bc) //102            == 0xffb060bc
NSTUB(Read                                    ,0xff81ab78) //101
//NSTUB(ReadFastDir                           ,0xffa7e3b0) //  3            == 0xffa7e3b0
NSTUB(Rec2PB                                  ,0xff893a6c) //104
//NSTUB(RefreshPhysicalScreen                 ,0xff9f8850) //104            == 0xff9f8850
//NSTUB(Remove                                ,0xff83543c) //  4            == 0xff83543c
//NSTUB(RenameFile_Fut                        ,0xff834d00) //  4            == 0xff834d00
NSTUB(Restart                                 ,0xff83a130) //106
//NSTUB(ScreenLock                            ,0xff9f9a70) //  3            == 0xff9f9a70
//NSTUB(ScreenUnlock                          ,0xff9f9a98) //  3            == 0xff9f9a98
NSTUB(SetAE_ShutterSpeed                      ,0xffb0abb4) //102
NSTUB(SetAutoShutdownTime                     ,0xff890a74) //103
NSTUB(SetCurrentCaptureModeType               ,0xff897d54) //101
//NSTUB(SetFileTimeStamp                      ,0xff835694) //  3            == 0xff835694
NSTUB(SetLogicalEventActive                   ,0xff89074c) //101
NSTUB(SetParameterData                        ,0xff979c48) //101
NSTUB(SetPropertyCase                         ,0xff888a94) //102
//NSTUB(SetScriptMode                         ,0xff89079c) //101            == 0xff89079c
NSTUB(SleepTask                               ,0xff83865c) //101
NSTUB(TakeSemaphore                           ,0xff838324) //101
//NSTUB(TurnOffBackLight                      ,0xff89e308) //104            == 0xff89e308
NSTUB(TurnOnBackLight                         ,0xff89e2f0) //104
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff964484) //105            == 0xff964484
//NSTUB(UnlockAF                              ,0xff836928) //102            == 0xff836928
NSTUB(UnlockMainPower                         ,0xff890954) //103
//NSTUB(UnsetZoomForMovie                     ,0xff97ff94) //104            == 0xff97ff94
NSTUB(UpdateMBROnFlash                        ,0xff86b984) //  3
NSTUB(VbattGet                                ,0xff831e04) //103
NSTUB(Write                                   ,0xff835498) //101
//NSTUB(WriteSDCard                           ,0xff933a1c) //108            == 0xff933a1c
//NSTUB(_log                                  ,0xffb3be28) //111            == 0xffb3be28
//NSTUB(_log10                                ,0xffb3aab4) //112            == 0xffb3aab4
//NSTUB(_pow                                  ,0xffb3ac24) //114            == 0xffb3ac24
//NSTUB(_sqrt                                 ,0xffb3daac) //  1            == 0xffb3daac
//NSTUB(add_ptp_handler                       ,0xffa3fb48) //  3            == 0xffa3fb48
//NSTUB(apex2us                               ,0xff9fd5e8) //  4            == 0xff9fd5e8
NSTUB(close                                   ,0xff81a990) //  1
//NSTUB(closedir                              ,0xffa7e238) //  3            == 0xffa7e238
NSTUB(err_init_task                           ,0xff815f28) //  4
NSTUB(exmem_alloc                             ,0xff883664) //103
NSTUB(free                                    ,0xff814138) //112
NSTUB(kbd_p1_f                                ,0xff833624) //109
NSTUB(kbd_p1_f_cont                           ,0xff833630) //109
NSTUB(kbd_p2_f                                ,0xff832ecc) //109
NSTUB(kbd_read_keys                           ,0xff8335a8) //109
NSTUB(kbd_read_keys_r2                        ,0xff85a83c) //109
NSTUB(lseek                                   ,0xff835524) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203e8) //101
NSTUB(memcpy                                  ,0xff83df94) //101
//NSTUB(memset                                ,0xff9fc15c) //101            == 0xff9fc15c
NSTUB(mkdir                                   ,0xff83587c) //  3
NSTUB(mktime_ext                              ,0xff8a5db8) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
//NSTUB(opendir                               ,0xffa7e27c) //  3            == 0xffa7e27c
//NSTUB(openfastdir                           ,0xffa7e27c) //  3            == 0xffa7e27c
//NSTUB(qsort                                 ,0xff9fc71c) //  1            == 0xff9fc71c
NSTUB(rand                                    ,0xff8204f0) //  1
NSTUB(read                                    ,0xff81ab78) //101
//NSTUB(readfastdir                           ,0xffa7e3b0) //  3            == 0xffa7e3b0
//NSTUB(reboot_fw_update                      ,0xffa838c0) //  1            == 0xffa838c0
//NSTUB(rename                                ,0xff834d00) //  4            == 0xff834d00
NSTUB(set_control_event                       ,0xff89037c) //111
NSTUB(srand                                   ,0xff8204e4) //  1
//NSTUB(stat                                  ,0xff835560) //  3            == 0xff835560
// ALT: NSTUB(stat, 0xff868f48) // 3 31/0
//NSTUB(strcat                                ,0xff8a5574) //  1            == 0xff8a5574
NSTUB(strchr                                  ,0xff813fc0) //  1
NSTUB(strcmp                                  ,0xff8203a4) //101
NSTUB(strcpy                                  ,0xff82038c) //101
NSTUB(strftime                                ,0xff8a57c0) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
NSTUB(strncpy                                 ,0xff813f38) //  1
//NSTUB(strrchr                               ,0xff813fe4) //  1            == 0xff813fe4
NSTUB(strtol                                  ,0xff83e274) //101
NSTUB(strtolx                                 ,0xff83e078) //109
//  DEF(task_CaptSeq                          ,0xff876ec0) //107            == 0xff876ec0
//  DEF(task_ExpDrv                           ,0xff8ba324) //110            == 0xff8ba324
//  DEF(task_InitFileModules                  ,0xff894550) //107            == 0xff894550
//  DEF(task_MovieRecord                      ,0xff94b0c4) //107            == 0xff94b0c4
  DEF(task_PhySw                              ,0xff8331fc) //107
//  DEF(task_RotaryEncoder                    ,0xff85afb0) //107            == 0xff85afb0
NSTUB(time                                    ,0xff882d1c) //  2
NSTUB(vsprintf                                ,0xff820350) //  1
