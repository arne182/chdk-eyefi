// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00E
//   Canon PowerShot A470

// Values for makefile.inc
//   PLATFORMID = 12666 (0x317a) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d3enc              // Found @ 0xffff1a98
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1a78

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(PutInNdFilter                         ,0xffdd6fc4) //102        *** != 0xffe267b4
//NSTUB(PutOutNdFilter                        ,0xffdd6fe8) //102        *** != 0xffe267ec
//NSTUB(kbd_pwr_off                           ,0xffc30b30) //  2 67%    *** != 0xffc00948
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc00948
//NSTUB(rename                                ,0xffc133b4) //  1        *** != 0xffc13c30
//NSTUB(write                                 ,0xffc13c08) //101        *** != 0xffc0a1bc

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc5ed6c -> ffc5b950 -> ffd28c20 -> ffde7148 -> ffe8fab4
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0001007c) // Found @0xffc11c0c,          stubs_min = 0x0001007c (0x1007C)
//DEF(physw_run                               ,0x00001bf0) // Found @0xffc118a8,          stubs_min = 0x00001bf0 (0x1BF0)
//DEF(levent_table                            ,0xffe72ec8) // Found @0xffe72ec8,          stubs_min = 0xffe72ec8 (0xFFE72EC8)
//DEF(FlashParamsTable                        ,0xffe8fc68) // Found @0xffe8fc68, ** != ** stubs_min = 0xffe961cc (0xFFE961CC)
//DEF(movie_status                            ,0x000051d8) // Found @0xffc45174, ** != ** stubs_min = 0x00005200 (0x5200)
//DEF(canon_menu_active                       ,0x00009014) // Found @0xffd1eec4,          stubs_min = 0x00009014 (0x9014)
//DEF(canon_shoot_menu_active                 ,0x000097e1) // Found @0xffd37684, ** != ** stubs_min = 0x00009768 (0x9768)
//DEF(playrec_mode                            ,0x00005348) // Found @0xffc4b760,          stubs_min = 0x00005348 (0x5344+4)
//DEF(zoom_status                             ,0x0000d020) // Found @0xffde8948, ** != ** stubs_min = 0x0000d7c4 (0xD7C4)
//DEF(some_flag_for_af_scan                   ,0x0000cd9c) // Found @0xffdd73a8, ** != ** stubs_min = 0x0000cdec (0xCDEC)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc2cc48
//void *vid_get_viewport_fb()      { return (void*)0x10659d50; } // Found @0xffe2b908
//char *camera_jpeg_count_str()    { return (char*)0x00049a00; } // Found @0xffd5de80
//long hook_raw_size()             { return 0x008d0a68; }        // Found @0xffe2db84
//int get_flash_params_count(void) { return 0x73; }              // Found @0xffd29cdc

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe51bbc, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe51bc4, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_UP              ,0x00000001 }, // Found @0xffe51b3c, levent 0x04
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffe51b84, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000030 }, // Found @0xffe51b64, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000020 }, // Found @0xffe51b64, levent 0x01
//    { 2, KEY_DOWN            ,0x00000002 }, // Found @0xffe51b44, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000004 }, // Found @0xffe51b4c, levent 0x07
//    { 2, KEY_LEFT            ,0x00000008 }, // Found @0xffe51b54, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe51b7c, levent 0x08
//    { 2, KEY_SHOOT_HALF      ,0x00000010 }, // Found @0xffe51b5c, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3152 // Found @0xffe25328
//#define CAM_RAW_ROWS      2346 // Found @0xffe2532c
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc17e54

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffdda868) //101
NSTUB(AllocateUncacheableMemory               ,0xffc17e18) //112
NSTUB(Close                                   ,0xffc13b5c) //101
NSTUB(CreateTask                              ,0xffc0b8e0) //101
NSTUB(DebugAssert                             ,0xffc0bdb8) //111
NSTUB(DeleteFile_Fut                          ,0xffc13408) //112
//NSTUB(DoAFLock                              ,0xffc157a0) //102            == 0xffc157a0
//NSTUB(EnterToCompensationEVF                ,0xffc15a90) //104            == 0xffc15a90
NSTUB(ExecuteEventProcedure                   ,0xffc53308) //  1
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
NSTUB(FreeMemory                              ,0xffdda860) //101
NSTUB(FreeUncacheableMemory                   ,0xffc17e4c) //112
NSTUB(Fseek_Fut                               ,0xffc13724) //101
NSTUB(Fwrite_Fut                              ,0xffc13684) //101
//NSTUB(GetBatteryTemperature                 ,0xffc32bd8) //102            == 0xffc32bd8
NSTUB(GetCCDTemperature                       ,0xffc32b68) //102
NSTUB(GetCurrentAvValue                       ,0xffd032e4) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc3c8d0) //  1
NSTUB(GetDrive_FreeClusters                   ,0xffc3c938) //  1
NSTUB(GetDrive_TotalClusters                  ,0xffc3c904) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xffd023dc) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd026e8) //  1
NSTUB(GetKbdState                             ,0xffc30b18) //109
NSTUB(GetMemInfo                              ,0xffc03c40) //  1
//NSTUB(GetOpticalTemperature                 ,0xffc32c48) //102            == 0xffc32c48
NSTUB(GetParameterData                        ,0xffd29c9c) //101
NSTUB(GetPropertyCase                         ,0xffc56f08) //102
NSTUB(GetSystemTime                           ,0xffdda8c0) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd060a0) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffdd1c94) //102
NSTUB(GiveSemaphore                           ,0xffc0b844) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc97108) //102
NSTUB(LEDDrive                                ,0xffc303c0) //103
NSTUB(LocalTime                               ,0xffc51028) //  1
NSTUB(LockMainPower                           ,0xffc5b568) //103
NSTUB(Lseek                                   ,0xffc13c9c) //101
NSTUB(MakeDirectory_Fut                       ,0xffc1347c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe28454) //102
NSTUB(MoveIrisWithAv                          ,0xffdd6bdc) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdd7160) //102
NSTUB(NewTaskShell                            ,0xffc569cc) //103
NSTUB(Open                                    ,0xffc13b34) //101
NSTUB(PB2Rec                                  ,0xffc5e188) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc467e8) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc467c0) //102
NSTUB(PT_PlaySound                            ,0xffc460d4) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xffc5abd8) //103            == 0xffc5abd8
NSTUB(PostLogicalEventToUI                    ,0xffc5ac24) //103
NSTUB(Read                                    ,0xffc0a15c) //101
NSTUB(ReadFastDir                             ,0xffdc4160) //  1
NSTUB(Rec2PB                                  ,0xffc5e1b8) //104
NSTUB(RefreshPhysicalScreen                   ,0xffd66e5c) //104
NSTUB(Remove                                  ,0xffc13ba4) //  1
NSTUB(RenameFile_Fut                          ,0xffc133b4) //  1
NSTUB(Restart                                 ,0xffc19690) //106
//NSTUB(SetAE_ShutterSpeed                    ,0xffe2ab18) //102            == 0xffe2ab18
NSTUB(SetAutoShutdownTime                     ,0xffc5b5dc) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc61880) //101
NSTUB(SetFileTimeStamp                        ,0xffc13e38) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5b304) //  1
NSTUB(SetParameterData                        ,0xffd29c0c) //101
NSTUB(SetPropertyCase                         ,0xffc56e08) //102
//NSTUB(SetScriptMode                         ,0xffc5b354) //101            == 0xffc5b354
NSTUB(SleepTask                               ,0xffc17c9c) //101
NSTUB(TakeSemaphore                           ,0xffc0b774) //101
NSTUB(TurnOffBackLight                        ,0xffc65db0) //104
NSTUB(TurnOnBackLight                         ,0xffc65d98) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd1f7a4) //103
//NSTUB(UnlockAF                              ,0xffc158b8) //102            == 0xffc158b8
NSTUB(UnlockMainPower                         ,0xffc5b4bc) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd2ed10) //104            == 0xffd2ed10
NSTUB(UpdateMBROnFlash                        ,0xffc3c710) //  1
NSTUB(VbattGet                                ,0xffc105d0) //103
NSTUB(Write                                   ,0xffc13c08) //101
//NSTUB(WriteSDCard                           ,0xffcf8a00) //108            == 0xffcf8a00
NSTUB(_log                                    ,0xffe4f520) //111
NSTUB(_log10                                  ,0xffe4e464) //112
NSTUB(_pow                                    ,0xffe4e5d4) //114
NSTUB(_sqrt                                   ,0xffe50888) //  1
NSTUB(add_ptp_handler                         ,0xffd960e4) //  1
NSTUB(apex2us                                 ,0xffd68398) //  4
NSTUB(close                                   ,0xffc09f74) //  1
NSTUB(closedir                                ,0xffdc4230) //  1
NSTUB(err_init_task                           ,0xffc04e98) //  4
NSTUB(exmem_alloc                             ,0xffc51af0) //103
NSTUB(free                                    ,0xffc03a98) //112
NSTUB(kbd_p1_f                                ,0xffc11d08) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11d14) //109
NSTUB(kbd_p2_f                                ,0xffc11548) //109
NSTUB(kbd_read_keys                           ,0xffc11c0c) //109
NSTUB(kbd_read_keys_r2                        ,0xffc30728) //109
NSTUB(lseek                                   ,0xffc13c9c) //101
NSTUB(malloc                                  ,0xffc039c4) //112
NSTUB(memcmp                                  ,0xffc0d90c) //101
NSTUB(memcpy                                  ,0xffc6e698) //101
NSTUB(memset                                  ,0xffd67210) //101
NSTUB(mkdir                                   ,0xffc13f00) //  1
// ALT: NSTUB(mkdir, 0xffc13fa0) // 1 32/0
NSTUB(mktime_ext                              ,0xffc6ef04) //  1
NSTUB(open                                    ,0xffc09ec4) //  1
NSTUB(opendir                                 ,0xffdc40cc) //  1
NSTUB(openfastdir                             ,0xffdc40cc) //  1
NSTUB(qsort                                   ,0xffd67718) //  1
NSTUB(rand                                    ,0xffc0da14) //  1
NSTUB(read                                    ,0xffc0a15c) //101
NSTUB(readfastdir                             ,0xffdc4160) //  1
NSTUB(reboot_fw_update                        ,0xffdc8a34) //  5
NSTUB(set_control_event                       ,0xffc5b058) //  1
NSTUB(srand                                   ,0xffc0da08) //  1
NSTUB(stat                                    ,0xffc13d68) //  1
NSTUB(strcat                                  ,0xffc6e484) //  1
NSTUB(strchr                                  ,0xffc6e50c) //  1
NSTUB(strcmp                                  ,0xffc0d8a4) //101
NSTUB(strcpy                                  ,0xffc0d88c) //101
NSTUB(strftime                                ,0xffc6e90c) //  1
NSTUB(strlen                                  ,0xffc0d8e8) //101
NSTUB(strncmp                                 ,0xffc6e4c0) //  1
NSTUB(strncpy                                 ,0xffc1d81c) //  1
NSTUB(strrchr                                 ,0xffc6e530) //  1
NSTUB(strtol                                  ,0xffc1da54) //101
NSTUB(strtolx                                 ,0xffc1d858) //109
  DEF(task_CaptSeq                            ,0xffc488a4) //107
  DEF(task_ExpDrv                             ,0xffc900b8) //110
  DEF(task_InitFileModules                    ,0xffc5ebf8) //107
  DEF(task_MovieRecord                        ,0xffc453d8) //107
  DEF(task_PhySw                              ,0xffc118a4) //107
NSTUB(time                                    ,0xffc50edc) //  1
NSTUB(vsprintf                                ,0xffc0d80c) //  1
