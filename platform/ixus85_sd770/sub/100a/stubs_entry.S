// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00A
//   Canon PowerShot SD770 IS

// Values for makefile.inc
//   PLATFORMID = 12661 (0x3175) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d3enc              // Found @ 0xffff33e0
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff33c0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DebugAssert                           ,0xff81bcf0) //111        *** != 0xff81bcf8
//NSTUB(PutInNdFilter                         ,0xffa25968) //102        *** != 0xffa7cbdc
//NSTUB(PutOutNdFilter                        ,0xffa2598c) //102        *** != 0xffa7cc10
//NSTUB(rename                                ,0xff8235e4) //  1        *** != 0xff823e60
//NSTUB(write                                 ,0xff823e38) //101        *** != 0xff81a0f4

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff877310 -> ff873cd8 -> ff95b7e4 -> ffa398b0 -> ffaf0bf0
// Mode 32774 in firmware but not in current modemap
// Mode 32779 in firmware but not in current modemap
// Mode 32781 in firmware but not in current modemap
// Mode 16407 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_PORTRAIT            16397
// Current modemap entry not found in firmware - MODE_NIGHT_SNAPSHOT      16395

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x000104d0) // Found @0xff821e34,          stubs_min = 0x000104d0 (0x104D0)
//DEF(physw_run                               ,0x00001c00) // Found @0xff821ad0,          stubs_min = 0x00001c00 (0x1BF4+0xC)
//DEF(levent_table                            ,0xffacd870) // Found @0xffacd870,          stubs_min = 0xffacd870 (0xFFACD870)
//DEF(FlashParamsTable                        ,0xffaf0db4) // Found @0xffaf0db4,          stubs_min = 0xffaf0db4 (0xFFAF0DB4)
//DEF(movie_status                            ,0x000053a4) // Found @0xff859b6c,          stubs_min = 0x000053a4 (0x5368+0x3C)
//DEF(canon_menu_active                       ,0x00009608) // Found @0xff94df84,          stubs_min = 0x00009608 (0x9604+4)
//DEF(canon_shoot_menu_active                 ,0x00009f4d) // Found @0xff96b2bc,          stubs_min = 0x00009f4d (0x9F4C+1)
//DEF(playrec_mode                            ,0x00005534) // Found @0xff860f44,          stubs_min = 0x00005534 (0x5530+0x4)
//DEF(zoom_status                             ,0x0000d328) // Found @0xffa3b0b0,          stubs_min = 0x0000d328 (0xD328)
//DEF(some_flag_for_af_scan                   ,0x0000d0ac) // Found @0xffa262e0,          stubs_min = 0x0000d0ac (0xD0AC)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff83e868
//void *vid_get_viewport_fb()      { return (void*)0x1065adc0; } // Found @0xffa81ed0
//char *camera_jpeg_count_str()    { return (char*)0x0004c73c; } // Found @0xff9a22a0
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffa84154
//int get_flash_params_count(void) { return 0x73; }              // Found @0xff95c8a0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffaaacbc, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffaaacc8, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffaaac2c, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffaaac38, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffaaac44, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffaaac50, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffaaac5c, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffaaac68, levent 0x04
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffaaac74, levent 0x08
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffaaac80, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffaaac20, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffaaac20, levent 0x01
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffaaac8c, levent 0x09
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffaaac14, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffa7b800
//#define CAM_RAW_ROWS      2772 // Found @0xffa7b808
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff8285a4

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa29178) //101
NSTUB(AllocateUncacheableMemory               ,0xff828568) //112
NSTUB(Close                                   ,0xff823d8c) //101
NSTUB(CreateTask                              ,0xff81b818) //101
NSTUB(DeleteFile_Fut                          ,0xff823638) //112
//NSTUB(DoAFLock                              ,0xff825b84) //102            == 0xff825b84
NSTUB(EnterToCompensationEVF                  ,0xff825e80) //104
NSTUB(ExecuteEventProcedure                   ,0xff8691dc) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff825ed0) //104
NSTUB(ExitTask                                ,0xff81baa8) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff8329d0) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff832b14) //104
NSTUB(Fclose_Fut                              ,0xff8237b4) //101
NSTUB(Feof_Fut                                ,0xff8239a0) //  1
NSTUB(Fflush_Fut                              ,0xff8239dc) //  1
NSTUB(Fgets_Fut                               ,0xff823908) //  1
NSTUB(Fopen_Fut                               ,0xff823774) //101
NSTUB(Fread_Fut                               ,0xff823860) //101
NSTUB(FreeMemory                              ,0xffa29170) //101
NSTUB(FreeUncacheableMemory                   ,0xff82859c) //112
NSTUB(Fseek_Fut                               ,0xff823954) //101
NSTUB(Fwrite_Fut                              ,0xff8238b4) //101
NSTUB(GetBatteryTemperature                   ,0xff845160) //102
NSTUB(GetCCDTemperature                       ,0xff8450f0) //102
NSTUB(GetCurrentAvValue                       ,0xff92d7c0) //102
NSTUB(GetDrive_ClusterSize                    ,0xff84f080) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff84f0e8) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff84f0b4) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff92c8b8) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff92cbc4) //  1
NSTUB(GetKbdState                             ,0xff842950) //109
NSTUB(GetMemInfo                              ,0xff813c40) //  1
NSTUB(GetOpticalTemperature                   ,0xff8451d0) //102
NSTUB(GetParameterData                        ,0xff95c860) //101
NSTUB(GetPropertyCase                         ,0xff86cddc) //102
NSTUB(GetSystemTime                           ,0xffa291d0) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff930564) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa1f220) //102
NSTUB(GiveSemaphore                           ,0xff81b77c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8bb92c) //102
//NSTUB(LEDDrive                              ,0xff842174) //103            == 0xff842174
NSTUB(LocalTime                               ,0xff8668a0) //  1
NSTUB(LockMainPower                           ,0xff8738f0) //103
NSTUB(Lseek                                   ,0xff823ecc) //101
NSTUB(MakeDirectory_Fut                       ,0xff8236ac) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffa7ea0c) //102
NSTUB(MoveIrisWithAv                          ,0xffa25580) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa25b04) //102
NSTUB(NewTaskShell                            ,0xff86c8a0) //103
NSTUB(Open                                    ,0xff823d64) //101
NSTUB(PB2Rec                                  ,0xff876594) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff85b9d8) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff85b9b0) //102
NSTUB(PT_PlaySound                            ,0xff85b034) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff872f60) //103            == 0xff872f60
//NSTUB(PostLogicalEventToUI                  ,0xff872fac) //103            == 0xff872fac
NSTUB(Read                                    ,0xff81a094) //101
NSTUB(ReadFastDir                             ,0xffa0e2a0) //  1
NSTUB(Rec2PB                                  ,0xff8765c4) //104
NSTUB(RefreshPhysicalScreen                   ,0xff9ac06c) //104
NSTUB(Remove                                  ,0xff823dd4) //  1
NSTUB(RenameFile_Fut                          ,0xff8235e4) //  1
NSTUB(Restart                                 ,0xff829de0) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffa810e0) //102
NSTUB(SetAutoShutdownTime                     ,0xff873964) //103
NSTUB(SetCurrentCaptureModeType               ,0xff87a50c) //101
NSTUB(SetFileTimeStamp                        ,0xff824068) //  1
NSTUB(SetLogicalEventActive                   ,0xff87368c) //  1
NSTUB(SetParameterData                        ,0xff95c7d0) //101
NSTUB(SetPropertyCase                         ,0xff86ccdc) //102
//NSTUB(SetScriptMode                         ,0xff8736dc) //101            == 0xff8736dc
NSTUB(SleepTask                               ,0xff8283ec) //101
NSTUB(TakeSemaphore                           ,0xff81b6ac) //101
NSTUB(TurnOffBackLight                        ,0xff87fdd8) //104
NSTUB(TurnOnBackLight                         ,0xff87fdc0) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff94eeec) //103
//NSTUB(UnlockAF                              ,0xff825bc8) //102            == 0xff825bc8
NSTUB(UnlockMainPower                         ,0xff873844) //103
//NSTUB(UnsetZoomForMovie                     ,0xff961ebc) //104            == 0xff961ebc
NSTUB(UpdateMBROnFlash                        ,0xff84eec0) //  1
NSTUB(VbattGet                                ,0xff82071c) //103
NSTUB(Write                                   ,0xff823e38) //101
//NSTUB(WriteSDCard                           ,0xff920458) //108            == 0xff920458
NSTUB(_log                                    ,0xffaa8268) //111
NSTUB(_log10                                  ,0xffaa71ac) //112
NSTUB(_pow                                    ,0xffaa731c) //114
NSTUB(_sqrt                                   ,0xffaa9688) //  1
NSTUB(add_ptp_handler                         ,0xff9dc8cc) //  1
//NSTUB(apex2us                               ,0xff9ad5a8) //  4            == 0xff9ad5a8
NSTUB(close                                   ,0xff819eac) //  1
NSTUB(closedir                                ,0xffa0e370) //  1
NSTUB(err_init_task                           ,0xff814e98) //  4
NSTUB(exmem_alloc                             ,0xff8679c4) //103
NSTUB(free                                    ,0xff813a98) //112
NSTUB(kbd_p1_f                                ,0xff821f38) //109
NSTUB(kbd_p1_f_cont                           ,0xff821f44) //109
NSTUB(kbd_p2_f                                ,0xff821770) //109
NSTUB(kbd_pwr_off                             ,0xff8429d4) //  2
NSTUB(kbd_pwr_on                              ,0xff842984) //  2
NSTUB(kbd_read_keys                           ,0xff821e34) //109
NSTUB(kbd_read_keys_r2                        ,0xff842534) //109
NSTUB(lseek                                   ,0xff823ecc) //101
NSTUB(malloc                                  ,0xff8139c4) //112
NSTUB(memcmp                                  ,0xff81d844) //101
NSTUB(memcpy                                  ,0xff892290) //101
NSTUB(memset                                  ,0xff9ac420) //101
NSTUB(mkdir                                   ,0xff824130) //  1
// ALT: NSTUB(mkdir, 0xff8241d0) // 1 32/0
NSTUB(mktime_ext                              ,0xff892afc) //  1
NSTUB(open                                    ,0xff819dfc) //  1
NSTUB(opendir                                 ,0xffa0e20c) //  1
NSTUB(openfastdir                             ,0xffa0e20c) //  1
NSTUB(qsort                                   ,0xff9ac928) //  1
NSTUB(rand                                    ,0xff81d94c) //  1
NSTUB(read                                    ,0xff81a094) //101
NSTUB(readfastdir                             ,0xffa0e2a0) //  1
NSTUB(reboot_fw_update                        ,0xffa15ca0) //  5
NSTUB(set_control_event                       ,0xff8733e0) //  1
NSTUB(srand                                   ,0xff81d940) //  1
NSTUB(stat                                    ,0xff823f98) //  1
NSTUB(strcat                                  ,0xff89207c) //  1
NSTUB(strchr                                  ,0xff892104) //  1
NSTUB(strcmp                                  ,0xff81d7dc) //101
NSTUB(strcpy                                  ,0xff81d7c4) //101
NSTUB(strftime                                ,0xff892504) //  1
NSTUB(strlen                                  ,0xff81d820) //101
NSTUB(strncmp                                 ,0xff8920b8) //  1
NSTUB(strncpy                                 ,0xff82e0cc) //  1
//NSTUB(strrchr                               ,0xff892128) //  1            == 0xff892128
NSTUB(strtol                                  ,0xff82e304) //101
NSTUB(strtolx                                 ,0xff82e108) //109
  DEF(task_CaptSeq                            ,0xff85de30) //107
  DEF(task_ExpDrv                             ,0xff8b478c) //110
  DEF(task_InitFileModules                    ,0xff87719c) //107
  DEF(task_MovieRecord                        ,0xff859df8) //107
  DEF(task_PhySw                              ,0xff821acc) //107
NSTUB(time                                    ,0xff866da4) //  2
NSTUB(vsprintf                                ,0xff81d744) //  1
