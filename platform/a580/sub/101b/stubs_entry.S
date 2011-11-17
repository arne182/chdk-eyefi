// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.01B
//   Canon PowerShot A580

// Values for makefile.inc
//   PLATFORMID = 12663 (0x3177) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d3enc              // Found @ 0xffff1ac0
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1aa0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xffc3193c) //  2 67%    *** != 0x00000000
NSTUB(kbd_pwr_on                              ,0xffc318fc) //  2 86%

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc60014 -> ffc5cbf0 -> ffd2bdd4 -> ffdf11e0 -> ffe9ed50
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000ebdc) // Found @0xffc11c24,          stubs_min = 0x0000ebdc (0x0EBDC)
//DEF(physw_run                               ,0x00001bf0) // Found @0xffc118c0,          stubs_min = 0x00001bf0 (0x1BF0)
//DEF(levent_table                            ,0xffe7fb40) // Found @0xffe7fb40,          stubs_min = 0xffe7fb40 (0xFFE7fB40)
//DEF(FlashParamsTable                        ,0xffe9ef08) // Found @0xffe9ef08,          stubs_min = 0xffe9ef08 (0xFFE9EF08)
//DEF(movie_status                            ,0x000051b0) // Found @0xffc46414,          stubs_min = 0x000051b0 (0x51B0)
//DEF(canon_menu_active                       ,0x00008bdc) // Found @0xffd2170c,          stubs_min = 0x00008bdc (0x8BDC)
//DEF(canon_shoot_menu_active                 ,0x000094b9) // Found @0xffd3a7e0,          stubs_min = 0x000094b9 (0x94B9)
//DEF(playrec_mode                            ,0x00005320) // Found @0xffc4c9f4,          stubs_min = 0x00005320 (0x5320)
//DEF(zoom_status                             ,0x0000ba7c) // Found @0xffdf29e0,          stubs_min = 0x0000ba7c (0xBA7C)
//DEF(some_flag_for_af_scan                   ,0x0000b808) // Found @0xffde1ab8,          stubs_min = 0x0000b808 (0xB808)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc2d5c4
//void *vid_get_viewport_fb()      { return (void*)0x10659e80; } // Found @0xffe3658c
//char *camera_jpeg_count_str()    { return (char*)0x00048ae0; } // Found @0xffd67320
//long hook_raw_size()             { return 0x009e6fc4; }        // Found @0xffe38818
//int get_flash_params_count(void) { return 0x73; }              // Found @0xffd2ce90

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe5c764, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe5c770, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_SHOOT_FULL      ,0xc0000000 }, // Found @0xffe5c68c, levent 0x01
//    { 1, KEY_SHOOT_FULL_ONLY ,0x80000000 }, // Found @0xffe5c68c, levent 0x01
//    { 1, KEY_SHOOT_HALF      ,0x40000000 }, // Found @0xffe5c680, levent 0x00
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffe5c6b0, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffe5c6bc, levent 0x03
//    { 2, KEY_UP              ,0x00000010 }, // Found @0xffe5c6c8, levent 0x04
//    { 2, KEY_DOWN            ,0x00000020 }, // Found @0xffe5c6d4, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000040 }, // Found @0xffe5c6e0, levent 0x07
//    { 2, KEY_LEFT            ,0x00000080 }, // Found @0xffe5c6ec, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe5c6f8, levent 0x08
//    { 2, KEY_MENU            ,0x00000200 }, // Found @0xffe5c704, levent 0x09
//    { 2, KEY_DISPLAY         ,0x00000400 }, // Found @0xffe5c710, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3336 // Found @0xffe2ff7c
//#define CAM_RAW_ROWS      2490 // Found @0xffe2ff80
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc17e64

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffde4fd0) //101
NSTUB(AllocateUncacheableMemory               ,0xffc17e28) //112
NSTUB(Close                                   ,0xffc13b7c) //101
NSTUB(CreateTask                              ,0xffc0b8e0) //101
NSTUB(DebugAssert                             ,0xffc0bdb8) //111
NSTUB(DeleteFile_Fut                          ,0xffc13428) //112
NSTUB(DoAFLock                                ,0xffc157b4) //102
NSTUB(EnterToCompensationEVF                  ,0xffc15aa4) //104
NSTUB(ExecuteEventProcedure                   ,0xffc5459c) //  1
NSTUB(ExitFromCompensationEVF                 ,0xffc15bf0) //104
NSTUB(ExitTask                                ,0xffc0bb70) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xffc218b8) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xffc219fc) //104
NSTUB(Fclose_Fut                              ,0xffc135a4) //101
NSTUB(Feof_Fut                                ,0xffc13790) //  1
NSTUB(Fflush_Fut                              ,0xffc137cc) //  1
NSTUB(Fgets_Fut                               ,0xffc136f8) //  1
NSTUB(Fopen_Fut                               ,0xffc13564) //101
NSTUB(Fread_Fut                               ,0xffc13650) //101
NSTUB(FreeMemory                              ,0xffde4fc8) //101
NSTUB(FreeUncacheableMemory                   ,0xffc17e5c) //112
NSTUB(Fseek_Fut                               ,0xffc13744) //101
NSTUB(Fwrite_Fut                              ,0xffc136a4) //101
NSTUB(GetBatteryTemperature                   ,0xffc33a38) //102
NSTUB(GetCCDTemperature                       ,0xffc339c8) //102
NSTUB(GetCurrentAvValue                       ,0xffd05b84) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc3d914) //  1
NSTUB(GetDrive_FreeClusters                   ,0xffc3d97c) //  1
NSTUB(GetDrive_TotalClusters                  ,0xffc3d948) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xffd04c7c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd04f88) //  1
NSTUB(GetKbdState                             ,0xffc318c8) //109
NSTUB(GetMemInfo                              ,0xffc03c40) //  1
NSTUB(GetOpticalTemperature                   ,0xffc33aa8) //102
NSTUB(GetParameterData                        ,0xffd2ce50) //101
NSTUB(GetPropertyCase                         ,0xffc5819c) //102
NSTUB(GetSystemTime                           ,0xffde5028) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd08940) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffddc3a8) //102
NSTUB(GiveSemaphore                           ,0xffc0b844) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc981b0) //102
NSTUB(LEDDrive                                ,0xffc30f6c) //103
NSTUB(LocalTime                               ,0xffc522bc) //  1
NSTUB(LockMainPower                           ,0xffc5c808) //103
NSTUB(Lseek                                   ,0xffc13cbc) //101
NSTUB(MakeDirectory_Fut                       ,0xffc1349c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe330b8) //102
NSTUB(MoveIrisWithAv                          ,0xffde12ec) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffde1870) //102
NSTUB(NewTaskShell                            ,0xffc57c60) //103
NSTUB(Open                                    ,0xffc13b54) //101
NSTUB(PB2Rec                                  ,0xffc5f428) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc47a88) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc47a60) //102
NSTUB(PT_PlaySound                            ,0xffc47374) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xffc5be78) //103
NSTUB(PostLogicalEventToUI                    ,0xffc5bec4) //103
NSTUB(PutInNdFilter                           ,0xffde16d4) //102
NSTUB(PutOutNdFilter                          ,0xffde16f8) //102
NSTUB(Read                                    ,0xffc0a15c) //101
NSTUB(ReadFastDir                             ,0xffdce860) //  1
NSTUB(Rec2PB                                  ,0xffc5f458) //104
NSTUB(RefreshPhysicalScreen                   ,0xffd70a80) //104
NSTUB(Remove                                  ,0xffc13bc4) //  1
NSTUB(RenameFile_Fut                          ,0xffc133d4) //  1
NSTUB(Restart                                 ,0xffc196a0) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffe3579c) //102
NSTUB(SetAutoShutdownTime                     ,0xffc5c87c) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc62ac4) //101
NSTUB(SetFileTimeStamp                        ,0xffc13e58) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5c5a4) //  1
NSTUB(SetParameterData                        ,0xffd2cdc0) //101
NSTUB(SetPropertyCase                         ,0xffc5809c) //102
NSTUB(SetScriptMode                           ,0xffc5c5f4) //101
NSTUB(SleepTask                               ,0xffc17cac) //101
NSTUB(TakeSemaphore                           ,0xffc0b774) //101
NSTUB(TurnOffBackLight                        ,0xffc66d58) //104
NSTUB(TurnOnBackLight                         ,0xffc66d40) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd220a8) //103
NSTUB(UnlockAF                                ,0xffc158cc) //102
NSTUB(UnlockMainPower                         ,0xffc5c75c) //103
NSTUB(UnsetZoomForMovie                       ,0xffd31f0c) //104
NSTUB(UpdateMBROnFlash                        ,0xffc3d754) //  1
NSTUB(VbattGet                                ,0xffc105e8) //103
NSTUB(Write                                   ,0xffc13c28) //101
NSTUB(WriteSDCard                             ,0xffcfaf54) //108
NSTUB(_log                                    ,0xffe5a024) //111
NSTUB(_log10                                  ,0xffe58f68) //112
NSTUB(_pow                                    ,0xffe590d8) //114
NSTUB(_sqrt                                   ,0xffe5b38c) //  1
NSTUB(add_ptp_handler                         ,0xffd9fb18) //  1
NSTUB(apex2us                                 ,0xffd71fbc) //  4
NSTUB(close                                   ,0xffc09f74) //  1
NSTUB(closedir                                ,0xffdce930) //  1
NSTUB(err_init_task                           ,0xffc04e98) //  4
NSTUB(exmem_alloc                             ,0xffc52d84) //103
NSTUB(free                                    ,0xffc03a98) //112
NSTUB(kbd_p1_f                                ,0xffc11d28) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11d34) //109
NSTUB(kbd_p2_f                                ,0xffc11560) //109
NSTUB(kbd_read_keys                           ,0xffc11c24) //109
NSTUB(kbd_read_keys_r2                        ,0xffc3138c) //109
NSTUB(lseek                                   ,0xffc13cbc) //101
NSTUB(malloc                                  ,0xffc039c4) //112
NSTUB(memcmp                                  ,0xffc0d90c) //101
NSTUB(memcpy                                  ,0xffc6f708) //101
NSTUB(memset                                  ,0xffd70e34) //101
NSTUB(mkdir                                   ,0xffc13f20) //  1
// ALT: NSTUB(mkdir, 0xffc13fc0) // 1 32/0
NSTUB(mktime_ext                              ,0xffc6ff74) //  1
NSTUB(open                                    ,0xffc09ec4) //  1
NSTUB(opendir                                 ,0xffdce7cc) //  1
NSTUB(openfastdir                             ,0xffdce7cc) //  1
NSTUB(qsort                                   ,0xffd7133c) //  1
NSTUB(rand                                    ,0xffc0da14) //  1
NSTUB(read                                    ,0xffc0a15c) //101
NSTUB(readfastdir                             ,0xffdce860) //  1
NSTUB(reboot_fw_update                        ,0xffdd3134) //  5
NSTUB(rename                                  ,0xffc133d4) //  1
NSTUB(set_control_event                       ,0xffc5c2f8) //  1
NSTUB(srand                                   ,0xffc0da08) //  1
NSTUB(stat                                    ,0xffc13d88) //  1
NSTUB(strcat                                  ,0xffc6f4f4) //  1
NSTUB(strchr                                  ,0xffc6f57c) //  1
NSTUB(strcmp                                  ,0xffc0d8a4) //101
NSTUB(strcpy                                  ,0xffc0d88c) //101
NSTUB(strftime                                ,0xffc6f97c) //  1
NSTUB(strlen                                  ,0xffc0d8e8) //101
NSTUB(strncmp                                 ,0xffc6f530) //  1
NSTUB(strncpy                                 ,0xffc1d80c) //  1
NSTUB(strrchr                                 ,0xffc6f5a0) //  1
NSTUB(strtol                                  ,0xffc1da44) //101
NSTUB(strtolx                                 ,0xffc1d848) //109
  DEF(task_CaptSeq                            ,0xffc49b38) //107
  DEF(task_ExpDrv                             ,0xffc91194) //110
  DEF(task_InitFileModules                    ,0xffc5fea0) //107
  DEF(task_MovieRecord                        ,0xffc46678) //107
  DEF(task_PhySw                              ,0xffc118bc) //107
NSTUB(time                                    ,0xffc52170) //  1
NSTUB(vsprintf                                ,0xffc0d80c) //  1
NSTUB(write                                   ,0xffc13c28) //101
