// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.02C
//   Canon PowerShot A470

// Values for makefile.inc
//   PLATFORMID = 12666 (0x317a) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d3enc              // Found @ 0xffff1a98
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1a78

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(PutInNdFilter                         ,0xffdd7a00) //102        *** != 0xffe271f0
//NSTUB(PutOutNdFilter                        ,0xffdd7a24) //102        *** != 0xffe27228
//NSTUB(kbd_pwr_off                           ,0xffc30ff4) //  2 67%    *** != 0xffc00948
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc00948
//NSTUB(rename                                ,0xffc133b4) //  1        *** != 0xffc13c30
//NSTUB(write                                 ,0xffc13c08) //101        *** != 0xffc0a1bc

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc5f288 -> ffc5be6c -> ffd29660 -> ffde7b84 -> ffe90570
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x000100bc) // Found @0xffc11c0c,          stubs_min = 0x000100bc (0x100BC)
//DEF(physw_run                               ,0x00001bf0) // Found @0xffc118a8,          stubs_min = 0x00001bf0 (0x1BF0)
//DEF(levent_table                            ,0xffe73984) // Found @0xffe73984,          stubs_min = 0xffe73984 (0xFFE73984)
//DEF(FlashParamsTable                        ,0xffe90724) // Found @0xffe90724, ** != ** stubs_min = 0xffe96c8c (0xFFE96C8C)
//DEF(movie_status                            ,0x00005200) // Found @0xffc45690,          stubs_min = 0x00005200 (0x5200)
//DEF(canon_menu_active                       ,0x00009064) // Found @0xffd1f904,          stubs_min = 0x00009064 (0x9064)
//DEF(canon_shoot_menu_active                 ,0x00009831) // Found @0xffd380c4, ** != ** stubs_min = 0x00009768 (0x9768)
//DEF(playrec_mode                            ,0x00005370) // Found @0xffc4bc7c,          stubs_min = 0x00005370 (0x536C+4)
//DEF(zoom_status                             ,0x0000d070) // Found @0xffde9384, ** != ** stubs_min = 0x0000d7c4 (0xD7C4)
//DEF(some_flag_for_af_scan                   ,0x0000cdec) // Found @0xffdd7de4,          stubs_min = 0x0000cdec (0xCDEC)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc2cc88
//void *vid_get_viewport_fb()      { return (void*)0x10659d50; } // Found @0xffe2c344
//char *camera_jpeg_count_str()    { return (char*)0x00049a80; } // Found @0xffd5e8c0
//long hook_raw_size()             { return 0x008d0a68; }        // Found @0xffe2e5c0
//int get_flash_params_count(void) { return 0x73; }              // Found @0xffd2a71c

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe52658, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe52660, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_UP              ,0x00000001 }, // Found @0xffe525d8, levent 0x04
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffe52620, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000030 }, // Found @0xffe52600, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000020 }, // Found @0xffe52600, levent 0x01
//    { 2, KEY_DOWN            ,0x00000002 }, // Found @0xffe525e0, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000004 }, // Found @0xffe525e8, levent 0x07
//    { 2, KEY_LEFT            ,0x00000008 }, // Found @0xffe525f0, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe52618, levent 0x08
//    { 2, KEY_SHOOT_HALF      ,0x00000010 }, // Found @0xffe525f8, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3152 // Found @0xffe25d64
//#define CAM_RAW_ROWS      2346 // Found @0xffe25d68
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc17e54

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffddb2a4) //101
NSTUB(AllocateUncacheableMemory               ,0xffc17e18) //112
NSTUB(Close                                   ,0xffc13b5c) //101
NSTUB(CreateTask                              ,0xffc0b8e0) //101
NSTUB(DebugAssert                             ,0xffc0bdb8) //111
NSTUB(DeleteFile_Fut                          ,0xffc13408) //112
//NSTUB(DoAFLock                              ,0xffc157a0) //102            == 0xffc157a0
//NSTUB(EnterToCompensationEVF                ,0xffc15a90) //104            == 0xffc15a90
NSTUB(ExecuteEventProcedure                   ,0xffc53824) //  1
NSTUB(ExitFromCompensationEVF                 ,0xffc15bdc) //104
NSTUB(ExitTask                                ,0xffc0bb70) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc218c8) //104            == 0xffc218c8
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc21a0c) //104            == 0xffc21a0c
NSTUB(Fclose_Fut                              ,0xffc13584) //101
NSTUB(Feof_Fut                                ,0xffc13770) //  1
NSTUB(Fflush_Fut                              ,0xffc137ac) //  1
NSTUB(Fgets_Fut                               ,0xffc136d8) //  1
NSTUB(Fopen_Fut                               ,0xffc13544) //101
NSTUB(Fread_Fut                               ,0xffc13630) //101
NSTUB(FreeMemory                              ,0xffddb29c) //101
NSTUB(FreeUncacheableMemory                   ,0xffc17e4c) //112
NSTUB(Fseek_Fut                               ,0xffc13724) //101
NSTUB(Fwrite_Fut                              ,0xffc13684) //101
//NSTUB(GetBatteryTemperature                 ,0xffc3309c) //102            == 0xffc3309c
NSTUB(GetCCDTemperature                       ,0xffc3302c) //102
NSTUB(GetCurrentAvValue                       ,0xffd03d24) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc3cdec) //  1
NSTUB(GetDrive_FreeClusters                   ,0xffc3ce54) //  1
NSTUB(GetDrive_TotalClusters                  ,0xffc3ce20) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xffd02e1c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd03128) //  1
NSTUB(GetKbdState                             ,0xffc30fdc) //109
NSTUB(GetMemInfo                              ,0xffc03c40) //  1
//NSTUB(GetOpticalTemperature                 ,0xffc3310c) //102            == 0xffc3310c
NSTUB(GetParameterData                        ,0xffd2a6dc) //101
NSTUB(GetPropertyCase                         ,0xffc57424) //102
NSTUB(GetSystemTime                           ,0xffddb2fc) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd06ae0) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffdd26d0) //102
NSTUB(GiveSemaphore                           ,0xffc0b844) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc97624) //102
NSTUB(LEDDrive                                ,0xffc30884) //103
NSTUB(LocalTime                               ,0xffc51544) //  1
NSTUB(LockMainPower                           ,0xffc5ba84) //103
NSTUB(Lseek                                   ,0xffc13c9c) //101
NSTUB(MakeDirectory_Fut                       ,0xffc1347c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe28e90) //102
NSTUB(MoveIrisWithAv                          ,0xffdd7618) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdd7b9c) //102
NSTUB(NewTaskShell                            ,0xffc56ee8) //103
NSTUB(Open                                    ,0xffc13b34) //101
NSTUB(PB2Rec                                  ,0xffc5e6a4) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc46d04) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc46cdc) //102
NSTUB(PT_PlaySound                            ,0xffc465f0) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xffc5b0f4) //103            == 0xffc5b0f4
NSTUB(PostLogicalEventToUI                    ,0xffc5b140) //103
NSTUB(Read                                    ,0xffc0a15c) //101
NSTUB(ReadFastDir                             ,0xffdc4b9c) //  1
NSTUB(Rec2PB                                  ,0xffc5e6d4) //104
NSTUB(RefreshPhysicalScreen                   ,0xffd6789c) //104
NSTUB(Remove                                  ,0xffc13ba4) //  1
NSTUB(RenameFile_Fut                          ,0xffc133b4) //  1
NSTUB(Restart                                 ,0xffc19690) //106
//NSTUB(SetAE_ShutterSpeed                    ,0xffe2b554) //102            == 0xffe2b554
NSTUB(SetAutoShutdownTime                     ,0xffc5baf8) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc61d9c) //101
NSTUB(SetFileTimeStamp                        ,0xffc13e38) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5b820) //  1
NSTUB(SetParameterData                        ,0xffd2a64c) //101
NSTUB(SetPropertyCase                         ,0xffc57324) //102
//NSTUB(SetScriptMode                         ,0xffc5b870) //101            == 0xffc5b870
NSTUB(SleepTask                               ,0xffc17c9c) //101
NSTUB(TakeSemaphore                           ,0xffc0b774) //101
NSTUB(TurnOffBackLight                        ,0xffc662cc) //104
NSTUB(TurnOnBackLight                         ,0xffc662b4) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd201e4) //103
//NSTUB(UnlockAF                              ,0xffc158b8) //102            == 0xffc158b8
NSTUB(UnlockMainPower                         ,0xffc5b9d8) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd2f750) //104            == 0xffd2f750
NSTUB(UpdateMBROnFlash                        ,0xffc3cc2c) //  1
NSTUB(VbattGet                                ,0xffc105d0) //103
NSTUB(Write                                   ,0xffc13c08) //101
//NSTUB(WriteSDCard                           ,0xffcf9440) //108            == 0xffcf9440
NSTUB(_log                                    ,0xffe4ff5c) //111
NSTUB(_log10                                  ,0xffe4eea0) //112
NSTUB(_pow                                    ,0xffe4f010) //114
NSTUB(_sqrt                                   ,0xffe512c4) //  1
NSTUB(add_ptp_handler                         ,0xffd96b20) //  1
NSTUB(apex2us                                 ,0xffd68dd8) //  4
NSTUB(close                                   ,0xffc09f74) //  1
NSTUB(closedir                                ,0xffdc4c6c) //  1
NSTUB(err_init_task                           ,0xffc04e98) //  4
NSTUB(exmem_alloc                             ,0xffc5200c) //103
NSTUB(free                                    ,0xffc03a98) //112
NSTUB(kbd_p1_f                                ,0xffc11d08) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11d14) //109
NSTUB(kbd_p2_f                                ,0xffc11548) //109
NSTUB(kbd_read_keys                           ,0xffc11c0c) //109
NSTUB(kbd_read_keys_r2                        ,0xffc30bec) //109
NSTUB(lseek                                   ,0xffc13c9c) //101
NSTUB(malloc                                  ,0xffc039c4) //112
NSTUB(memcmp                                  ,0xffc0d90c) //101
NSTUB(memcpy                                  ,0xffc6ebb4) //101
NSTUB(memset                                  ,0xffd67c50) //101
NSTUB(mkdir                                   ,0xffc13f00) //  1
// ALT: NSTUB(mkdir, 0xffc13fa0) // 1 32/0
NSTUB(mktime_ext                              ,0xffc6f420) //  1
NSTUB(open                                    ,0xffc09ec4) //  1
NSTUB(opendir                                 ,0xffdc4b08) //  1
NSTUB(openfastdir                             ,0xffdc4b08) //  1
NSTUB(qsort                                   ,0xffd68158) //  1
NSTUB(rand                                    ,0xffc0da14) //  1
NSTUB(read                                    ,0xffc0a15c) //101
NSTUB(readfastdir                             ,0xffdc4b9c) //  1
NSTUB(reboot_fw_update                        ,0xffdc9470) //  5
NSTUB(set_control_event                       ,0xffc5b574) //  1
NSTUB(srand                                   ,0xffc0da08) //  1
NSTUB(stat                                    ,0xffc13d68) //  1
NSTUB(strcat                                  ,0xffc6e9a0) //  1
NSTUB(strchr                                  ,0xffc6ea28) //  1
NSTUB(strcmp                                  ,0xffc0d8a4) //101
NSTUB(strcpy                                  ,0xffc0d88c) //101
NSTUB(strftime                                ,0xffc6ee28) //  1
NSTUB(strlen                                  ,0xffc0d8e8) //101
NSTUB(strncmp                                 ,0xffc6e9dc) //  1
NSTUB(strncpy                                 ,0xffc1d81c) //  1
NSTUB(strrchr                                 ,0xffc6ea4c) //  1
NSTUB(strtol                                  ,0xffc1da54) //101
NSTUB(strtolx                                 ,0xffc1d858) //109
  DEF(task_CaptSeq                            ,0xffc48dc0) //107
  DEF(task_ExpDrv                             ,0xffc905d4) //110
  DEF(task_InitFileModules                    ,0xffc5f114) //107
  DEF(task_MovieRecord                        ,0xffc458f4) //107
  DEF(task_PhySw                              ,0xffc118a4) //107
NSTUB(time                                    ,0xffc513f8) //  1
NSTUB(vsprintf                                ,0xffc0d80c) //  1
