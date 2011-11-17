// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.00E
//   Canon DIGITAL IXUS 120 IS

// Values for makefile.inc
//   PLATFORMID = 12774 (0x31e6) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff3564
//   NEED_ENCODED_DISKBOOT = 3   // Found @ 0xffff3574

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(SetScriptMode                         ,0xff88a82c) //101        *** != 0xff810f4c
//NSTUB(kbd_pwr_off                           ,0xff858e10) //  2 64%    *** != 0x00000000
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff88e694 -> ff88ae44 -> ff96a330 -> ffa759ac -> ffb970c0
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00031b78) // Found @0xff833554,          stubs_min = 0x00031b78 (0x31B78)
//DEF(physw_run                               ,0x00001c44) // Found @0xff8331c8,          stubs_min = 0x00001c44 (0x1C38+0x0C)
//DEF(levent_table                            ,0xffb41ee0) // Found @0xffb41ee0,          stubs_min = 0xffb41ee0 (0xffb41ee0)
//DEF(FlashParamsTable                        ,0xffb972a8) // Found @0xffb972a8,          stubs_min = 0xffb972a8 (0xFFB972A8)
//DEF(movie_status                            ,0x00006260) // Found @0xff93d344,          stubs_min = 0x00006260 (0x6228+0x38)
//DEF(full_screen_refresh                     ,0x00008bb0) // Found @0xff9cf9a0,          stubs_min = 0x00008bb0 (0x00008bb0)
//DEF(canon_menu_active                       ,0x00002d48) // Found @0xff8854d4,          stubs_min = 0x00002d48 (0x2D44+4)
//DEF(canon_shoot_menu_active                 ,0x0000774d) // Found @0xff97b980,          stubs_min = 0x0000774d (0x774d)
//DEF(playrec_mode                            ,0x00002a7c) // Found @0xff877af0,          stubs_min = 0x00002a7c (0x2A78+0x4)
//DEF(zoom_status                             ,0x0000b9dc) // Found @0xffa78244,          stubs_min = 0x0000b9dc (0xB9DC)
//DEF(some_flag_for_af_scan                   ,0x0000673c) // Found @0xff940334,          stubs_min = 0x0000673c (0x673C)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xff8532dc
//void *vid_get_viewport_fb()      { return (void*)0x4088b700; } // Found @0xffad4700
//char *camera_jpeg_count_str()    { return (char*)0x000700b0; } // Found @0xff9c40fc
//long hook_raw_size()             { return 0x011ca240; }        // Found @0xffad6e88
//int get_flash_params_count(void) { return 0x84; }              // Found @0xff96b3ec

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb0c720, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00080000 // Found @0xffb0c738, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SET             ,0x00000004 }, // Found @0xffb0c660, levent 0x08
//    { 0, KEY_DISPLAY         ,0x00000008 }, // Found @0xffb0c66c, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000300 }, // Found @0xffb0c6e4, levent 0x01
//    { 2, KEY_MENU            ,0x00000001 }, // Found @0xffb0c684, levent 0x09
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffb0c690, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffb0c69c, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffb0c6a8, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffb0c6b4, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffb0c6c0, levent 0x05
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000200 }, // Found @0xffb0c6e4, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000100 }, // Found @0xffb0c6d8, levent 0x00
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffb0c6cc, levent 0x04
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    4080 // Found @0xff9111d4
//#define CAM_RAW_ROWS      3048 // Found @0xff9111dc
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff8388dc

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa69c80) //101
NSTUB(AllocateUncacheableMemory               ,0xff838898) //112
NSTUB(Close                                   ,0xff8353b4) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff834d40) //112
//NSTUB(DoAFLock                              ,0xff83687c) //102            == 0xff83687c
//NSTUB(EnterToCompensationEVF                ,0xff8369d4) //104            == 0xff8369d4
NSTUB(ExecuteEventProcedure                   ,0xff880bf8) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff836a18) //104            == 0xff836a18
//NSTUB(ExitTask                              ,0xff81e844) //101            == 0xff81e844
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff844034) //104            == 0xff844034
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff84410c) //104
NSTUB(Fclose_Fut                              ,0xff834ebc) //101
NSTUB(Feof_Fut                                ,0xff8350a8) //  1
NSTUB(Fflush_Fut                              ,0xff8350e4) //  1
NSTUB(Fgets_Fut                               ,0xff835010) //  1
NSTUB(Fopen_Fut                               ,0xff834e7c) //101
NSTUB(Fread_Fut                               ,0xff834f68) //101
NSTUB(FreeMemory                              ,0xffa69c78) //101
//NSTUB(FreeUncacheableMemory                 ,0xff8388d8) //112            == 0xff8388d8
NSTUB(Fseek_Fut                               ,0xff83505c) //101
NSTUB(Fwrite_Fut                              ,0xff834fbc) //101
//NSTUB(GetBatteryTemperature                 ,0xff85bd0c) //102            == 0xff85bd0c
//NSTUB(GetCCDTemperature                     ,0xff85bc98) //102            == 0xff85bc98
//NSTUB(GetCurrentAvValue                     ,0xff93653c) //102            == 0xff93653c
NSTUB(GetDrive_ClusterSize                    ,0xff868774) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff8687d4) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff8687a8) //  3
//NSTUB(GetFocusLensSubjectDistance           ,0xff935708) //102            == 0xff935708
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff935b50) //  3
//NSTUB(GetImageFolder                        ,0xff919000) //106            == 0xff919000
NSTUB(GetKbdState                             ,0xff858df8) //109
NSTUB(GetMemInfo                              ,0xff81a070) //  3
//NSTUB(GetOpticalTemperature                 ,0xff85bd80) //102            == 0xff85bd80
//NSTUB(GetParameterData                      ,0xff96b3ac) //101            == 0xff96b3ac
//NSTUB(GetPropertyCase                       ,0xff884948) //102            == 0xff884948
//NSTUB(GetSystemTime                         ,0xffa69cd8) //101            == 0xffa69cd8
//NSTUB(GetZoomLensCurrentPoint               ,0xff93a78c) //102            == 0xff93a78c
//NSTUB(GetZoomLensCurrentPosition            ,0xffa5d8e8) //102            == 0xffa5d8e8
NSTUB(GiveSemaphore                           ,0xff8382b4) //112
//NSTUB(IsStrobeChargeCompleted               ,0xff8bc24c) //102            == 0xff8bc24c
//NSTUB(LEDDrive                              ,0xff8582f4) //103            == 0xff8582f4
NSTUB(LocalTime                               ,0xff87e56c) //  1
//NSTUB(LockMainPower                         ,0xff88aa60) //103            == 0xff88aa60
//NSTUB(Lseek                                 ,0xff8354d0) //101            == 0xff8354d0
//NSTUB(MakeDirectory_Fut                     ,0xff834db4) //  1            == 0xff834db4
//NSTUB(MoveFocusLensToDistance               ,0xffad108c) //102            == 0xffad108c
NSTUB(MoveIrisWithAv                          ,0xffa677c0) //102
//NSTUB(MoveZoomLensWithPoint                 ,0xffa67d4c) //102            == 0xffa67d4c
//NSTUB(NewTaskShell                          ,0xff88440c) //103            == 0xff88440c
NSTUB(Open                                    ,0xff83535c) //101
NSTUB(PB2Rec                                  ,0xff88d9fc) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff870934) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff87090c) //102
//NSTUB(PT_PlaySound                          ,0xff879708) //102            == 0xff879708
//NSTUB(PostLogicalEventForNotPowerType       ,0xff88a298) //103            == 0xff88a298
//NSTUB(PostLogicalEventToUI                  ,0xff88a2e4) //103            == 0xff88a2e4
//NSTUB(PutInNdFilter                         ,0xffa67bb0) //102            == 0xffa67bb0
//NSTUB(PutOutNdFilter                        ,0xffa67bd4) //102            == 0xffa67bd4
NSTUB(Read                                    ,0xff81ab78) //101
NSTUB(ReadFastDir                             ,0xffa4d0a0) //  3
NSTUB(Rec2PB                                  ,0xff88da3c) //104
//NSTUB(RefreshPhysicalScreen                 ,0xff9d1e70) //104            == 0xff9d1e70
//NSTUB(Remove                                ,0xff8353e8) //  4            == 0xff8353e8
//NSTUB(RenameFile_Fut                        ,0xff834cac) //  4            == 0xff834cac
NSTUB(Restart                                 ,0xff839ff0) //106
//NSTUB(ScreenLock                            ,0xff9d1c48) // 10            == 0xff9d1c48
//NSTUB(ScreenUnlock                          ,0xff9d1c88) //  3            == 0xff9d1c88
NSTUB(SetAE_ShutterSpeed                      ,0xffad3878) //102
//NSTUB(SetAutoShutdownTime                   ,0xff88aad4) //103            == 0xff88aad4
//NSTUB(SetCurrentCaptureModeType             ,0xff891b0c) //101            == 0xff891b0c
//NSTUB(SetFileTimeStamp                      ,0xff835640) //  3            == 0xff835640
//NSTUB(SetLogicalEventActive                 ,0xff88a7dc) //101            == 0xff88a7dc
//NSTUB(SetParameterData                      ,0xff96b31c) //101            == 0xff96b31c
//NSTUB(SetPropertyCase                       ,0xff88484c) //102            == 0xff88484c
//NSTUB(SleepTask                             ,0xff83851c) //101            == 0xff83851c
//NSTUB(TakeSemaphore                         ,0xff8381e4) //101            == 0xff8381e4
//NSTUB(TurnOffBackLight                      ,0xff89764c) //104            == 0xff89764c
//NSTUB(TurnOnBackLight                       ,0xff897634) //104            == 0xff897634
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff956720) //105            == 0xff956720
//NSTUB(UnlockAF                              ,0xff8368b4) //102            == 0xff8368b4
//NSTUB(UnlockMainPower                       ,0xff88a9b4) //103            == 0xff88a9b4
//NSTUB(UnsetZoomForMovie                     ,0xff9712b8) //104            == 0xff9712b8
NSTUB(UpdateMBROnFlash                        ,0xff8685f4) //  3
NSTUB(VbattGet                                ,0xff831df4) //103
NSTUB(Write                                   ,0xff835444) //101
//NSTUB(WriteSDCard                           ,0xff926644) //108            == 0xff926644
NSTUB(_log                                    ,0xffb08c9c) //111
NSTUB(_log10                                  ,0xffb07be0) //112
NSTUB(_pow                                    ,0xffb07d50) //114
NSTUB(_sqrt                                   ,0xffb0a004) //  1
NSTUB(add_ptp_handler                         ,0xffa16dec) //  3
//NSTUB(apex2us                               ,0xff9d5360) //  4            == 0xff9d5360
NSTUB(close                                   ,0xff81a990) //  1
NSTUB(closedir                                ,0xffa4cf28) //  3
NSTUB(err_init_task                           ,0xff815f28) //  4
NSTUB(exmem_alloc                             ,0xff87f42c) //103
//NSTUB(free                                  ,0xff814138) //112            == 0xff814138
//NSTUB(kbd_p1_f                              ,0xff8335d0) //109            == 0xff8335d0
//NSTUB(kbd_p1_f_cont                         ,0xff8335dc) //109            == 0xff8335dc
NSTUB(kbd_p2_f                                ,0xff832e94) //109
//NSTUB(kbd_read_keys                         ,0xff833554) //109            == 0xff833554
//NSTUB(kbd_read_keys_r2                      ,0xff8587b8) //109            == 0xff8587b8
NSTUB(lseek                                   ,0xff8354d0) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203d8) //101
NSTUB(memcpy                                  ,0xff83de48) //101
NSTUB(memset                                  ,0xff9d43b0) //101
NSTUB(mkdir                                   ,0xff835828) //  3
NSTUB(mktime_ext                              ,0xff89ea7c) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
NSTUB(opendir                                 ,0xffa4cf6c) //  3
//NSTUB(openfastdir                           ,0xffa4cf6c) //  3            == 0xffa4cf6c
NSTUB(qsort                                   ,0xffab56b4) //  1
//NSTUB(rand                                  ,0xff8204e0) //  1            == 0xff8204e0
NSTUB(read                                    ,0xff81ab78) //101
//NSTUB(readfastdir                           ,0xffa4d0a0) //  3            == 0xffa4d0a0
//NSTUB(reboot_fw_update                      ,0xffa525b0) //  1            == 0xffa525b0
//NSTUB(rename                                ,0xff834cac) //  4            == 0xff834cac
//NSTUB(set_control_event                     ,0xff88a500) //111            == 0xff88a500
//NSTUB(srand                                 ,0xff8204d4) //  1            == 0xff8204d4
//NSTUB(stat                                  ,0xff83550c) //  3            == 0xff83550c
// ALT: NSTUB(stat, 0xff865bb8) // 3 31/0
//NSTUB(strcat                                ,0xff89e238) //  1            == 0xff89e238
//NSTUB(strchr                                ,0xff813fc0) //  1            == 0xff813fc0
NSTUB(strcmp                                  ,0xff820394) //101
NSTUB(strcpy                                  ,0xff82037c) //101
NSTUB(strftime                                ,0xff89e484) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
//NSTUB(strncpy                               ,0xff813f38) //  1            == 0xff813f38
//NSTUB(strrchr                               ,0xff813fe4) //  1            == 0xff813fe4
//NSTUB(strtol                                ,0xff83e128) //101            == 0xff83e128
NSTUB(strtolx                                 ,0xff83df2c) //109
  DEF(task_CaptSeq                            ,0xff872f84) //107
  DEF(task_ExpDrv                             ,0xff8b2f58) //110
  DEF(task_InitFileModules                    ,0xff88e520) //107
  DEF(task_MovieRecord                        ,0xff93d62c) //107
  DEF(task_PhySw                              ,0xff8331c4) //107
//NSTUB(time                                  ,0xff87eae4) //  2            == 0xff87eae4
NSTUB(vsprintf                                ,0xff820340) //  1
//NSTUB(write                                 ,0xff835444) //101            == 0xff835444
