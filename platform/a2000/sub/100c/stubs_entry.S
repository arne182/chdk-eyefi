// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00C
//   Canon PowerShot A2000 IS

// Values for makefile.inc
//   PLATFORMID = 12689 (0x3191) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff1a98
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1aa8

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(ExecuteEventProcedure                 ,0xffc553c4) //  1        *** != 0xffc5543c
//NSTUB(GetBatteryTemperature                 ,0xffc33504) //102        *** != 0xffc33494
//NSTUB(Lseek                                 ,0xffc13484) //101        *** != 0xffc1354c
//NSTUB(Read                                  ,0xffc0a138) //101        *** != 0xffc133ec
//NSTUB(kbd_pwr_off                           ,0xffc31408) //  2 64%    *** != 0xffc31418
//NSTUB(kbd_pwr_on                            ,0xffc313c8) //  2 82%        == 0xffc313c8
//NSTUB(rename                                ,0xffc12b9c) //  1        *** != 0xffc13418
//NSTUB(write                                 ,0xffc133f0) //101        *** != 0xffc0a198

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc603dc -> ffc5cd98 -> ffd2c470 -> ffdfbf48 -> ffeb9b10
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000f418) // Found @0xffc113ec,          stubs_min = 0x0000f418 (0xF418)
//DEF(physw_run                               ,0x00001be4) // Found @0xffc11064,          stubs_min = 0x00001be4 (0x1BD8+0xC)
//DEF(levent_table                            ,0xffe9ac78) // Found @0xffe9ac78,          stubs_min = 0xffe9ac78 (0xFFE9AC78)
//DEF(FlashParamsTable                        ,0xffeb9cdc) // Found @0xffeb9cdc,          stubs_min = 0xffeb9cdc (0xFFEB9CDC)
//DEF(movie_status                            ,0x00005080) // Found @0xffc47950,          stubs_min = 0x00005080 (0x5048+0x38)
//DEF(canon_menu_active                       ,0x00005460) // Found @0xffc59b98,          stubs_min = 0x00005460 (0x545C+0x4)
//DEF(canon_shoot_menu_active                 ,0x00009735) // Found @0xffd3bcf4,          stubs_min = 0x00009735 (0x9734+0x1)
//DEF(playrec_mode                            ,0x00005208) // Found @0xffc4e8ac,          stubs_min = 0x00005208 (0x5204+0x4)
//DEF(zoom_status                             ,0x0000c0cc) // Found @0xffdfd75c,          stubs_min = 0x0000c0cc (0xC0CC)
//DEF(some_flag_for_af_scan                   ,0x000085a0) // Found @0xffd0a758,          stubs_min = 0x000085a0 (0x85A0)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc2cea0
//void *vid_get_viewport_fb()      { return (void*)0x10659de0; } // Found @0xffe44918
//char *camera_jpeg_count_str()    { return (char*)0x00045100; } // Found @0xffd71398
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffe46cbc
//int get_flash_params_count(void) { return 0x77; }              // Found @0xffd2d52c

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe75da0, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe75dac, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_SHOOT_FULL      ,0xc0000000 }, // Found @0xffe75cc8, levent 0x01
//    { 1, KEY_SHOOT_FULL_ONLY ,0x80000000 }, // Found @0xffe75cc8, levent 0x01
//    { 1, KEY_SHOOT_HALF      ,0x40000000 }, // Found @0xffe75cbc, levent 0x00
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffe75cec, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffe75cf8, levent 0x03
//    { 2, KEY_UP              ,0x00000010 }, // Found @0xffe75d04, levent 0x04
//    { 2, KEY_DOWN            ,0x00000020 }, // Found @0xffe75d10, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000040 }, // Found @0xffe75d1c, levent 0x07
//    { 2, KEY_LEFT            ,0x00000080 }, // Found @0xffe75d28, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe75d34, levent 0x08
//    { 2, KEY_MENU            ,0x00000200 }, // Found @0xffe75d40, levent 0x09
//    { 2, KEY_DISPLAY         ,0x00000400 }, // Found @0xffe75d4c, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffe3db80
//#define CAM_RAW_ROWS      2772 // Found @0xffe3db88
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc171b8

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
//NSTUB(AllocateMemory                        ,0xffdf0a50) //101            == 0xffdf0a50
NSTUB(AllocateUncacheableMemory               ,0xffc17174) //112
//NSTUB(Close                                 ,0xffc13344) //101            == 0xffc13344
//NSTUB(CreateTask                            ,0xffc0b8c0) //101            == 0xffc0b8c0
NSTUB(DebugAssert                             ,0xffc0bd98) //111
//NSTUB(DeleteFile_Fut                        ,0xffc12bf0) //112            == 0xffc12bf0
//NSTUB(DoAFLock                              ,0xffc14d9c) //102            == 0xffc14d9c
//NSTUB(EnterToCompensationEVF                ,0xffc14fec) //104            == 0xffc14fec
//NSTUB(ExitFromCompensationEVF               ,0xffc15030) //104            == 0xffc15030
//NSTUB(ExitTask                              ,0xffc0bb50) //101            == 0xffc0bb50
NSTUB(ExpCtrlTool_StartContiAE                ,0xffc1fa68) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xffc1fbac) //104
//NSTUB(Fclose_Fut                            ,0xffc12d6c) //101            == 0xffc12d6c
//NSTUB(Feof_Fut                              ,0xffc12f58) //  1            == 0xffc12f58
//NSTUB(Fflush_Fut                            ,0xffc12f94) //  1            == 0xffc12f94
//NSTUB(Fgets_Fut                             ,0xffc12ec0) //  1            == 0xffc12ec0
//NSTUB(Fopen_Fut                             ,0xffc12d2c) //101            == 0xffc12d2c
//NSTUB(Fread_Fut                             ,0xffc12e18) //101            == 0xffc12e18
//NSTUB(FreeMemory                            ,0xffdf0a48) //101            == 0xffdf0a48
//NSTUB(FreeUncacheableMemory                 ,0xffc171b4) //112            == 0xffc171b4
//NSTUB(Fseek_Fut                             ,0xffc12f0c) //101            == 0xffc12f0c
//NSTUB(Fwrite_Fut                            ,0xffc12e6c) //101            == 0xffc12e6c
//NSTUB(GetCCDTemperature                     ,0xffc33494) //102            == 0xffc33494
//NSTUB(GetCurrentAvValue                     ,0xffd0025c) //102            == 0xffd0025c
//NSTUB(GetDrive_ClusterSize                  ,0xffc3fc24) //  1            == 0xffc3fc24
//NSTUB(GetDrive_FreeClusters                 ,0xffc3fc8c) //  1            == 0xffc3fc8c
//NSTUB(GetDrive_TotalClusters                ,0xffc3fc58) //  1            == 0xffc3fc58
NSTUB(GetFocusLensSubjectDistance             ,0xffcff354) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffcff660) //  3
NSTUB(GetKbdState                             ,0xffc31394) //109
NSTUB(GetMemInfo                              ,0xffc03c28) //  1
//NSTUB(GetOpticalTemperature                 ,0xffc33574) //102            == 0xffc33574
//NSTUB(GetParameterData                      ,0xffd2d4ec) //101            == 0xffd2d4ec
//NSTUB(GetPropertyCase                       ,0xffc590ac) //102            == 0xffc590ac
//NSTUB(GetSystemTime                         ,0xffdf0aa8) //101            == 0xffdf0aa8
//NSTUB(GetZoomLensCurrentPoint               ,0xffd0349c) //102            == 0xffd0349c
//NSTUB(GetZoomLensCurrentPosition            ,0xffdea9dc) //102            == 0xffdea9dc
//NSTUB(GiveSemaphore                         ,0xffc0b81c) //112            == 0xffc0b81c
//NSTUB(IsStrobeChargeCompleted               ,0xffc8aef4) //102            == 0xffc8aef4
NSTUB(LEDDrive                                ,0xffc30a70) //103
//NSTUB(LocalTime                             ,0xffc533c8) //  1            == 0xffc533c8
//NSTUB(LockMainPower                         ,0xffc5c9b0) //103            == 0xffc5c9b0
//NSTUB(MakeDirectory_Fut                     ,0xffc12c64) //  1            == 0xffc12c64
//NSTUB(MoveFocusLensToDistance               ,0xffe4135c) //102            == 0xffe4135c
NSTUB(MoveIrisWithAv                          ,0xffded27c) //102
//NSTUB(MoveZoomLensWithPoint                 ,0xffded808) //102            == 0xffded808
//NSTUB(NewTaskShell                          ,0xffc58b54) //103            == 0xffc58b54
//NSTUB(Open                                  ,0xffc1331c) //101            == 0xffc1331c
//NSTUB(PB2Rec                                ,0xffc5e3ec) //104            == 0xffc5e3ec
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc48cec) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc48cc4) //102
NSTUB(PT_PlaySound                            ,0xffc488d4) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xffc5bff0) //103
NSTUB(PostLogicalEventToUI                    ,0xffc5c03c) //103
//NSTUB(PutInNdFilter                         ,0xffded66c) //102            == 0xffded66c
//NSTUB(PutOutNdFilter                        ,0xffded690) //102            == 0xffded690
//NSTUB(ReadFastDir                           ,0xffddce7c) //  1            == 0xffddce7c
//NSTUB(Rec2PB                                ,0xffc5e440) //104            == 0xffc5e440
//NSTUB(RefreshPhysicalScreen                 ,0xffd7af58) //104            == 0xffd7af58
//NSTUB(Remove                                ,0xffc1338c) //  1            == 0xffc1338c
//NSTUB(RenameFile_Fut                        ,0xffc12b9c) //  1            == 0xffc12b9c
//NSTUB(Restart                               ,0xffc189ec) //106            == 0xffc189ec
NSTUB(SetAE_ShutterSpeed                      ,0xffe43b28) //102
//NSTUB(SetAutoShutdownTime                   ,0xffc5ca24) //103            == 0xffc5ca24
NSTUB(SetCurrentCaptureModeType               ,0xffc6301c) //101
//NSTUB(SetFileTimeStamp                      ,0xffc13620) //  1            == 0xffc13620
NSTUB(SetLogicalEventActive                   ,0xffc5c72c) //101
//NSTUB(SetParameterData                      ,0xffd2d45c) //101            == 0xffd2d45c
NSTUB(SetPropertyCase                         ,0xffc58fa4) //102
//NSTUB(SetScriptMode                         ,0xffc5c77c) //101            == 0xffc5c77c
//NSTUB(SleepTask                             ,0xffc16ff8) //101            == 0xffc16ff8
//NSTUB(TakeSemaphore                         ,0xffc0b74c) //101            == 0xffc0b74c
//NSTUB(TurnOffBackLight                      ,0xffc67b10) //104            == 0xffc67b10
//NSTUB(TurnOnBackLight                       ,0xffc67af8) //104            == 0xffc67af8
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xffd20598) //103            == 0xffd20598
//NSTUB(UnlockAF                              ,0xffc14dd4) //102            == 0xffc14dd4
//NSTUB(UnlockMainPower                       ,0xffc5c904) //103            == 0xffc5c904
//NSTUB(UnsetZoomForMovie                     ,0xffd32ad8) //104            == 0xffd32ad8
//NSTUB(UpdateMBROnFlash                      ,0xffc3fa64) //  1            == 0xffc3fa64
NSTUB(VbattGet                                ,0xffc10314) //103
//NSTUB(Write                                 ,0xffc133f0) //101            == 0xffc133f0
NSTUB(WriteSDCard                             ,0xffcf4aa8) //108
//NSTUB(_log                                  ,0xffe7368c) //111            == 0xffe7368c
//NSTUB(_log10                                ,0xffe725d0) //112            == 0xffe725d0
//NSTUB(_pow                                  ,0xffe72740) //114            == 0xffe72740
//NSTUB(_sqrt                                 ,0xffe749f4) //  1            == 0xffe749f4
NSTUB(add_ptp_handler                         ,0xffdac444) //  1
NSTUB(apex2us                                 ,0xffd7bf74) //  4
//NSTUB(close                                 ,0xffc09f50) //  1            == 0xffc09f50
//NSTUB(closedir                              ,0xffddcf4c) //  1            == 0xffddcf4c
NSTUB(err_init_task                           ,0xffc04e84) //  4
NSTUB(exmem_alloc                             ,0xffc53bc8) //103
//NSTUB(free                                  ,0xffc03a80) //112            == 0xffc03a80
//NSTUB(kbd_p1_f                              ,0xffc114f0) //109            == 0xffc114f0
//NSTUB(kbd_p1_f_cont                         ,0xffc114fc) //109            == 0xffc114fc
//NSTUB(kbd_p2_f                              ,0xffc10d04) //109            == 0xffc10d04
//NSTUB(kbd_read_keys                         ,0xffc113ec) //109            == 0xffc113ec
//NSTUB(kbd_read_keys_r2                      ,0xffc30e84) //109            == 0xffc30e84
//NSTUB(lseek                                 ,0xffc13484) //101            == 0xffc13484
//NSTUB(malloc                                ,0xffc039ac) //112            == 0xffc039ac
//NSTUB(memcmp                                ,0xffc0d8b4) //101            == 0xffc0d8b4
//NSTUB(memcpy                                ,0xffc6cac8) //101            == 0xffc6cac8
//NSTUB(memset                                ,0xffd7b2ac) //101            == 0xffd7b2ac
//NSTUB(mkdir                                 ,0xffc136e8) //  1            == 0xffc136e8
// ALT: NSTUB(mkdir, 0xffc13788) // 1 32/0
//NSTUB(mktime_ext                            ,0xffc6d334) //  1            == 0xffc6d334
//NSTUB(open                                  ,0xffc09ea0) //  1            == 0xffc09ea0
//NSTUB(opendir                               ,0xffddcde8) //  1            == 0xffddcde8
//NSTUB(openfastdir                           ,0xffddcde8) //  1            == 0xffddcde8
//NSTUB(qsort                                 ,0xffe2cb98) //  1            == 0xffe2cb98
//NSTUB(rand                                  ,0xffc0d9bc) //  1            == 0xffc0d9bc
//NSTUB(read                                  ,0xffc0a138) //101            == 0xffc0a138
//NSTUB(readfastdir                           ,0xffddce7c) //  1            == 0xffddce7c
NSTUB(reboot_fw_update                        ,0xffde1750) //  5
NSTUB(set_control_event                       ,0xffc5c478) //  1
//NSTUB(srand                                 ,0xffc0d9b0) //  1            == 0xffc0d9b0
//NSTUB(stat                                  ,0xffc13550) //  1            == 0xffc13550
//NSTUB(strcat                                ,0xffc6c8dc) //  1            == 0xffc6c8dc
//NSTUB(strchr                                ,0xffc6c964) //  1            == 0xffc6c964
//NSTUB(strcmp                                ,0xffc0d84c) //101            == 0xffc0d84c
//NSTUB(strcpy                                ,0xffc0d834) //101            == 0xffc0d834
//NSTUB(strftime                              ,0xffc6cd3c) //  1            == 0xffc6cd3c
//NSTUB(strlen                                ,0xffc0d890) //101            == 0xffc0d890
//NSTUB(strncmp                               ,0xffc6c918) //  1            == 0xffc6c918
//NSTUB(strncpy                               ,0xffc1cb54) //  1            == 0xffc1cb54
//NSTUB(strrchr                               ,0xffd7b284) //  1            == 0xffd7b284
//NSTUB(strtol                                ,0xffc1cd8c) //101            == 0xffc1cd8c
NSTUB(strtolx                                 ,0xffc1cb90) //109
  DEF(task_CaptSeq                            ,0xffc4ae84) //107
  DEF(task_ExpDrv                             ,0xffc83eb0) //110
  DEF(task_InitFileModules                    ,0xffc60268) //107
  DEF(task_MovieRecord                        ,0xffc47bb4) //107
  DEF(task_PhySw                              ,0xffc11060) //107
//NSTUB(time                                  ,0xffc5327c) //  1            == 0xffc5327c
NSTUB(vsprintf                                ,0xffc0d7f8) //  1
