// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R43 (DRYOS version 2.3, release #0043)
//   Firmware Ver GM1.00F
//   Canon PowerShot A495

// Values for makefile.inc
//   PLATFORMID = 12783 (0x31ef) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d4a                // Found @ 0xffff1a2c
//   NEED_ENCODED_DISKBOOT = 4   // Found @ 0xffff1a3c

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetDrive_FreeClusters                 ,0xffc23810) //  3        *** != 0xffc51320
// ALT: NSTUB(GetDrive_FreeClusters, 0xffc51320) // 4 9/0
//NSTUB(SetScriptMode                         ,0xffc6cc58) //101        *** != 0xffc00f70
//NSTUB(kbd_pwr_off                           ,0xffc435e4) //  2 64%        == 0xffc435e4
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc00b20

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc70720 -> ffc6d288 -> ffd2e1e4 -> ffe0aa64 -> ffecf6a0
// Mode 16417 in firmware but not in current modemap
// Mode 16399 in firmware but not in current modemap
// Mode 16934 in firmware but not in current modemap
// Mode 16935 in firmware but not in current modemap
// Mode 16936 in firmware but not in current modemap
// Mode 16407 in firmware but not in current modemap
// Mode  2609 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_SUPER_MACRO         16905
// Current modemap entry not found in firmware - MODE_SCN_SNOW            16404
// Current modemap entry not found in firmware - MODE_SCN_INDOOR          16401
// Current modemap entry not found in firmware - MODE_SCN_KIDS_PETS       16400
// Current modemap entry not found in firmware - MODE_SCN_NIGHT_SCENE     16395
// Current modemap entry not found in firmware - MODE_VIDEO_STD            2598

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0002e7f4) // Found @0xffc23b2c,          stubs_min = 0x0002e7f4 (0x2E7F4)
//DEF(physw_run                               ,0x00001bf0) // Found @0xffc23790,          stubs_min = 0x00001bf0 (0x1BE4+0x0C)
//DEF(levent_table                            ,0xffea2d14) // Found @0xffea2d14,          stubs_min = 0xffea2d14 (0xFFEA2D14)
//DEF(FlashParamsTable                        ,0xffecf894) // Found @0xffecf894,          stubs_min = 0xffecf894 (0xFFECF894)
//DEF(movie_status                            ,0x000054a0) // Found @0xffd0c7d8,          stubs_min = 0x000054a0 (0x5468+0x38)
//DEF(full_screen_refresh                     ,0x00007370) // Found @0xffd7aa20,          stubs_min = 0x00007370 (0x7370)
//DEF(canon_menu_active                       ,0x00002a3c) // Found @0xffc6a11c,          stubs_min = 0x00002a3c (0x2A38+4)
//DEF(canon_shoot_menu_active                 ,0x000065b5) // Found @0xffd40144,          stubs_min = 0x000065b5 (0x000065b5)
//DEF(playrec_mode                            ,0x00002798) // Found @0xffc5d900,          stubs_min = 0x00002798 (0x2794+0x4)
//DEF(zoom_status                             ,0x00009648) // Found @0xffe0d940,          stubs_min = 0x00009648 (0x00009648)
//DEF(some_flag_for_af_scan                   ,0x00005848) // Found @0xffd0f144,          stubs_min = 0x00005848 (0x5848)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc3f020
//void *vid_get_viewport_fb()      { return (void*)0x10648cc0; } // Found @0xffe569d8
//char *camera_jpeg_count_str()    { return (char*)0x0007486c; } // Found @0xffd72050
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffe59d60
//int get_flash_params_count(void) { return 0x94; }              // Found @0xffd2f2a0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00040000 // Found @0xffe84f40, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00080000 // Found @0xffe84f4c, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_RIGHT           ,0x00000004 }, // Found @0xffe84ee0, levent 0x07
//    { 2, KEY_ZOOM_OUT        ,0x00000040 }, // Found @0xffe84f04, levent 0x03
//    { 2, KEY_ZOOM_IN         ,0x00000080 }, // Found @0xffe84f10, levent 0x02
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe84f1c, levent 0x08
//    { 2, KEY_UP              ,0x00100000 }, // Found @0xffe84f58, levent 0x04
//    { 2, KEY_DOWN            ,0x00200000 }, // Found @0xffe84f64, levent 0x05
//    { 2, KEY_LEFT            ,0x00400000 }, // Found @0xffe84f70, levent 0x06
//    { 2, KEY_MENU            ,0x01000000 }, // Found @0xffe84f88, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000030 }, // Found @0xffe84ef8, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000020 }, // Found @0xffe84ef8, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000010 }, // Found @0xffe84eec, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3720 // Found @0xffcea4b8
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc2931c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffdfd16c) //101
NSTUB(AllocateUncacheableMemory               ,0xffc292d8) //112
NSTUB(Close                                   ,0xffc26108) //101
NSTUB(CreateTask                              ,0xffc0f1a8) //101
NSTUB(DebugAssert                             ,0xffc0f680) //111
NSTUB(DeleteFile_Fut                          ,0xffc25a80) //112
//NSTUB(DoAFLock                              ,0xffc27554) //102            == 0xffc27554
//NSTUB(EnterToCompensationEVF                ,0xffc27604) //104            == 0xffc27604
NSTUB(ExecuteEventProcedure                   ,0xffc65870) //  1
//NSTUB(ExitFromCompensationEVF               ,0xffc27648) //104            == 0xffc27648
NSTUB(ExitTask                                ,0xffc0f438) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc34ce4) //104            == 0xffc34ce4
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc34dbc) //104            == 0xffc34dbc
NSTUB(Fclose_Fut                              ,0xffc25bfc) //101
NSTUB(Feof_Fut                                ,0xffc25de8) //  1
NSTUB(Fflush_Fut                              ,0xffc25e24) //  1
NSTUB(Fgets_Fut                               ,0xffc25d50) //  1
NSTUB(Fopen_Fut                               ,0xffc25bbc) //101
NSTUB(Fread_Fut                               ,0xffc25ca8) //101
NSTUB(FreeMemory                              ,0xffdfd164) //101
NSTUB(FreeUncacheableMemory                   ,0xffc29318) //112
NSTUB(Fseek_Fut                               ,0xffc25d9c) //101
NSTUB(Fwrite_Fut                              ,0xffc25cfc) //101
//NSTUB(GetBatteryTemperature                 ,0xffc4561c) //102            == 0xffc4561c
//NSTUB(GetCCDTemperature                     ,0xffc455a8) //102            == 0xffc455a8
NSTUB(GetCurrentAvValue                       ,0xffd088c0) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc512c0) //  4
NSTUB(GetDrive_TotalClusters                  ,0xffc512f4) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xffd07bb8) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd08010) //  3
//NSTUB(GetImageFolder                        ,0xffcf1478) //106            == 0xffcf1478
NSTUB(GetKbdState                             ,0xffc435cc) //109
NSTUB(GetMemInfo                              ,0xffc0a7f8) //  3
//NSTUB(GetOpticalTemperature                 ,0xffc45694) //102            == 0xffc45694
NSTUB(GetParameterData                        ,0xffd2f260) //101
NSTUB(GetPropertyCase                         ,0xffc6957c) //102
NSTUB(GetSystemTime                           ,0xffdfd1c4) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd09d80) //102
//NSTUB(GetZoomLensCurrentPosition            ,0xffdf5210) //102            == 0xffdf5210
NSTUB(GiveSemaphore                           ,0xffc0f104) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffca72b0) //102
//NSTUB(LEDDrive                              ,0xffc42bc4) //103            == 0xffc42bc4
NSTUB(LocalTime                               ,0xffc63580) //  1
NSTUB(LockMainPower                           ,0xffc6ce90) //103
//NSTUB(Lseek                                 ,0xffc26224) //101            == 0xffc26224
NSTUB(MakeDirectory_Fut                       ,0xffc25af4) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe53458) //102
NSTUB(MoveIrisWithAv                          ,0xffdfa8b4) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdfae44) //102
NSTUB(NewTaskShell                            ,0xffc68f88) //103
//NSTUB(Open                                  ,0xffc2609c) //101            == 0xffc2609c
NSTUB(PB2Rec                                  ,0xffc6fae4) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc571c0) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc57198) //102
//NSTUB(PT_PlaySound                          ,0xffc5f400) //  7            == 0xffc5f400
NSTUB(PostLogicalEventForNotPowerType         ,0xffc6c6c0) //103
NSTUB(PostLogicalEventToUI                    ,0xffc6c70c) //103
//NSTUB(PutInNdFilter                         ,0xffdfaca8) //102            == 0xffdfaca8
//NSTUB(PutOutNdFilter                        ,0xffdfaccc) //102            == 0xffdfaccc
NSTUB(Read                                    ,0xffc0b308) //101
//NSTUB(ReadFastDir                           ,0xffdebbf8) //  4            == 0xffdebbf8
NSTUB(Rec2PB                                  ,0xffc6fb24) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffd7b3fc) //104            == 0xffd7b3fc
//NSTUB(Remove                                ,0xffc2613c) //  4            == 0xffc2613c
//NSTUB(RenameFile_Fut                        ,0xffc259ec) //  4            == 0xffc259ec
NSTUB(Restart                                 ,0xffc2aab0) //106
NSTUB(ScreenLock                              ,0xffd7c5a8) //  3
NSTUB(ScreenUnlock                            ,0xffd7c5ec) //  7
//NSTUB(SetAE_ShutterSpeed                    ,0xffe55be8) //102            == 0xffe55be8
NSTUB(SetAutoShutdownTime                     ,0xffc6cf04) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc7323c) //101
//NSTUB(SetFileTimeStamp                      ,0xffc263a4) //  4            == 0xffc263a4
NSTUB(SetLogicalEventActive                   ,0xffc6cc08) //101
NSTUB(SetParameterData                        ,0xffd2f1d0) //101
NSTUB(SetPropertyCase                         ,0xffc6944c) //102
NSTUB(SleepTask                               ,0xffc2915c) //101
NSTUB(TakeSemaphore                           ,0xffc0f034) //101
//NSTUB(TurnOffBackLight                      ,0xffc77f9c) //104            == 0xffc77f9c
//NSTUB(TurnOnBackLight                       ,0xffc77f84) //104            == 0xffc77f84
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xffd1f9d4) //101            == 0xffd1f9d4
//NSTUB(UnlockAF                              ,0xffc2758c) //102            == 0xffc2758c
NSTUB(UnlockMainPower                         ,0xffc6cde4) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd3594c) //104            == 0xffd3594c
//NSTUB(UpdateMBROnFlash                      ,0xffc51140) //  3            == 0xffc51140
NSTUB(VbattGet                                ,0xffc22be4) //103
NSTUB(Write                                   ,0xffc26198) //101
//NSTUB(WriteSDCard                           ,0xffcfcbcc) //108            == 0xffcfcbcc
NSTUB(_log                                    ,0xffe8233c) //111
NSTUB(_log10                                  ,0xffe81280) //112
NSTUB(_pow                                    ,0xffe813f0) //114
NSTUB(_sqrt                                   ,0xffe836a4) //  1
NSTUB(add_ptp_handler                         ,0xffdbeb58) //  3
//NSTUB(apex2us                               ,0xffd7d8f8) //  4            == 0xffd7d8f8
NSTUB(close                                   ,0xffc0b120) //  1
//NSTUB(closedir                              ,0xffdeba54) //  4            == 0xffdeba54
NSTUB(err_init_task                           ,0xffc05f50) //  4
NSTUB(exmem_alloc                             ,0xffc64220) //103
NSTUB(free                                    ,0xffc04160) //112
NSTUB(kbd_p1_f                                ,0xffc23ba4) //109
NSTUB(kbd_p1_f_cont                           ,0xffc23bb0) //109
NSTUB(kbd_p2_f                                ,0xffc2345c) //109
//NSTUB(kbd_read_keys                         ,0xffc23b2c) //109            == 0xffc23b2c
//NSTUB(kbd_read_keys_r2                      ,0xffc42fb0) //109            == 0xffc42fb0
//NSTUB(lseek                                 ,0xffc26224) //101            == 0xffc26224
NSTUB(malloc                                  ,0xffc04104) //112
NSTUB(memcmp                                  ,0xffc11318) //101
NSTUB(memcpy                                  ,0xffc2e860) //101
NSTUB(memset                                  ,0xffd7c930) //101
NSTUB(mkdir                                   ,0xffc265a4) //  4
NSTUB(mktime_ext                              ,0xffc7cdbc) //  1
NSTUB(open                                    ,0xffc0b070) //  1
NSTUB(opendir                                 ,0xffdebaa4) //  4
//NSTUB(openfastdir                           ,0xffdebaa4) //  4            == 0xffdebaa4
//NSTUB(qsort                                 ,0xffe3c194) //  4            == 0xffe3c194
NSTUB(rand                                    ,0xffc11420) //  1
NSTUB(read                                    ,0xffc0b308) //101
//NSTUB(readfastdir                           ,0xffdebbf8) //  4            == 0xffdebbf8
NSTUB(reboot_fw_update                        ,0xffded46c) //  1
//NSTUB(rename                                ,0xffc259ec) //  4            == 0xffc259ec
NSTUB(set_control_event                       ,0xffc6c928) //111
NSTUB(srand                                   ,0xffc11414) //  1
NSTUB(stat                                    ,0xffc2626c) //  3
//NSTUB(strcat                                ,0xffc7c578) //  1            == 0xffc7c578
NSTUB(strchr                                  ,0xffc03fe8) //  1
NSTUB(strcmp                                  ,0xffc112d4) //101
NSTUB(strcpy                                  ,0xffc112bc) //101
NSTUB(strftime                                ,0xffc7c7c4) //113
NSTUB(strlen                                  ,0xffc04034) //101
NSTUB(strncmp                                 ,0xffc03f9c) //  1
NSTUB(strncpy                                 ,0xffc03f60) //  1
//NSTUB(strrchr                               ,0xffc0400c) //  1            == 0xffc0400c
NSTUB(strtol                                  ,0xffc2eb40) //101
NSTUB(strtolx                                 ,0xffc2e944) //109
  DEF(task_CaptSeq                            ,0xffc59274) //107
  DEF(task_ExpDrv                             ,0xffc91654) //110
  DEF(task_InitFileModules                    ,0xffc705ac) //107
  DEF(task_MovieRecord                        ,0xffd0ca2c) //107
  DEF(task_PhySw                              ,0xffc2378c) //107
NSTUB(time                                    ,0xffc63434) //  1
NSTUB(vsprintf                                ,0xffc11280) //  4
//NSTUB(write                                 ,0xffc26198) //101            == 0xffc26198
