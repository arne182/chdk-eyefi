// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00D
//   Canon PowerShot G9

// Values for makefile.inc
//   PLATFORMID = 12634 (0x315a) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d3                 // Found @ 0xffff31f0
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff31d0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(PutInNdFilter                         ,0xff938468) //102        *** != 0xffa0c4e0
//NSTUB(PutOutNdFilter                        ,0xff93848c) //102        *** != 0xffa0c518
//NSTUB(kbd_pwr_off                           ,0xff84944c) //  2 67%    *** != 0xff810958
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810958
//NSTUB(rename                                ,0xff824d40) //  1        *** != 0xff825600
//NSTUB(strcmp                                ,0xff81e7cc) //101        *** != 0xff81e7f4
//NSTUB(write                                 ,0xff8255d8) //101        *** != 0xff81a3d8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8773f8 -> ff8735c4 -> ff95532c -> ffa4c6c8 -> ffb0807c
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0001563c) // Found @0xff8230cc,          stubs_min = 0x0001563c (0x01563C)
//DEF(physw_run                               ,0x00001ca4) // Found @0xff822d78,          stubs_min = 0x00001ca4 (0x1ca4)
//DEF(levent_table                            ,0xffae013c) // Found @0xffae013c,          stubs_min = 0xffae013c (0xFFAE013C)
//DEF(FlashParamsTable                        ,0xffb08248) // Found @0xffb08248,          stubs_min = 0xffb08248 (0xFFB08248)
//DEF(movie_status                            ,0x00005714) // Found @0xff85d220,          stubs_min = 0x00005714 (0x5714)
//DEF(canon_menu_active                       ,0x0000fdc8) // Found @0xff99b4d4,          stubs_min = 0x0000fdc8 (0xFDC8)
//DEF(canon_shoot_menu_active                 ,0x0000f33d) // Found @0xff96aba8,          stubs_min = 0x0000f33d (0xF33D)
//DEF(playrec_mode                            ,0x000058cc) // Found @0xff864a60,          stubs_min = 0x000058cc (0x58cc)
//DEF(zoom_status                             ,0x0001264c) // Found @0xffa4e38c,          stubs_min = 0x0001264c (0x1264C)
//DEF(some_flag_for_af_scan                   ,0x0001253c) // Found @0xffa44730,          stubs_min = 0x0001253c (0x1253C)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff8451d0
//void *vid_get_viewport_fb()      { return (void*)0x1067b540; } // Found @0xffa1126c
//char *camera_jpeg_count_str()    { return (char*)0x00060354; } // Found @0xff9afae4
//long hook_raw_size()             { return 0x00ee9710; }        // Found @0xffa13130
//int get_flash_params_count(void) { return 0x72; }              // Found @0xff95692c

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffac62e0, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffac62e8, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0xc0000000 }, // Found @0xffac6218, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x80000000 }, // Found @0xffac6218, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x40000000 }, // Found @0xffac6210, levent 0x00
//    { 1, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffac6238, levent 0x03
//    { 1, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffac6240, levent 0x02
//    { 1, KEY_LEFT            ,0x00010000 }, // Found @0xffac6270, levent 0x06
//    { 1, KEY_SET             ,0x00020000 }, // Found @0xffac6278, levent 0x08
//    { 1, KEY_RIGHT           ,0x00040000 }, // Found @0xffac6280, levent 0x07
//    { 1, KEY_DOWN            ,0x00080000 }, // Found @0xffac6288, levent 0x05
//    { 1, KEY_UP              ,0x00100000 }, // Found @0xffac6290, levent 0x04
//    { 1, KEY_DISPLAY         ,0x04000000 }, // Found @0xffac62a8, levent 0x0a
//    { 1, KEY_MENU            ,0x08000000 }, // Found @0xffac62b0, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4104 // Found @0xffa0b1f8
//#define CAM_RAW_ROWS      3048 // Found @0xffa0b200
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff82a7c4

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
//NSTUB(AllocateMemory                        ,0xffa47c58) //103            == 0xffa47c58
//NSTUB(AllocateUncacheableMemory             ,0xff82a788) //112            == 0xff82a788
//NSTUB(Close                                 ,0xff82552c) //101            == 0xff82552c
//NSTUB(CreateTask                            ,0xff81baf0) //101            == 0xff81baf0
NSTUB(DebugAssert                             ,0xff81bfc8) //111
NSTUB(DeleteFile_Fut                          ,0xff824d94) //112
//NSTUB(DoAFLock                              ,0xff8275cc) //103            == 0xff8275cc
//NSTUB(EnterToCompensationEVF                ,0xff8279a8) //104            == 0xff8279a8
//NSTUB(ExecuteEventProcedure                 ,0xff81c1a8) //  1            == 0xff81c1a8
//NSTUB(ExitFromCompensationEVF               ,0xff8279f8) //104            == 0xff8279f8
//NSTUB(ExitTask                              ,0xff81bd80) //101            == 0xff81bd80
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff835600) //104            == 0xff835600
//NSTUB(ExpCtrlTool_StopContiAE               ,0xff8357c0) //104            == 0xff8357c0
//NSTUB(Fclose_Fut                            ,0xff824f10) //101            == 0xff824f10
NSTUB(Feof_Fut                                ,0xff8250fc) //  1
NSTUB(Fflush_Fut                              ,0xff825138) //  1
NSTUB(Fgets_Fut                               ,0xff825064) //  1
//NSTUB(Fopen_Fut                             ,0xff824ed0) //101            == 0xff824ed0
//NSTUB(Fread_Fut                             ,0xff824fbc) //101            == 0xff824fbc
//NSTUB(FreeMemory                            ,0xffa47c44) //103            == 0xffa47c44
//NSTUB(FreeUncacheableMemory                 ,0xff82a7bc) //112            == 0xff82a7bc
//NSTUB(Fseek_Fut                             ,0xff8250b0) //101            == 0xff8250b0
//NSTUB(Fwrite_Fut                            ,0xff825010) //101            == 0xff825010
//NSTUB(GetBatteryTemperature                 ,0xff84bee8) //102            == 0xff84bee8
//NSTUB(GetCCDTemperature                     ,0xff84be78) //102            == 0xff84be78
//NSTUB(GetCurrentAvValue                     ,0xff936d58) //102            == 0xff936d58
//NSTUB(GetDrive_ClusterSize                  ,0xff852754) //  1            == 0xff852754
//NSTUB(GetDrive_FreeClusters                 ,0xff8527f4) //  1            == 0xff8527f4
//NSTUB(GetDrive_TotalClusters                ,0xff852788) //  1            == 0xff852788
NSTUB(GetFocusLensSubjectDistance             ,0xff934bec) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff934ef8) //  1
//NSTUB(GetKbdState                           ,0xff849300) //109            == 0xff849300
NSTUB(GetMemInfo                              ,0xff813c58) //  1
//NSTUB(GetOpticalTemperature                 ,0xff84bf58) //102            == 0xff84bf58
//NSTUB(GetParameterData                      ,0xff9568ec) //  1            == 0xff9568ec
//NSTUB(GetPropertyCase                       ,0xff86f768) //101            == 0xff86f768
//NSTUB(GetSystemTime                         ,0xffa47d60) //  1            == 0xffa47d60
//NSTUB(GetZoomLensCurrentPoint               ,0xff93a220) //102            == 0xff93a220
//NSTUB(GetZoomLensCurrentPosition            ,0xffa3e5e8) //102            == 0xffa3e5e8
//NSTUB(GiveSemaphore                         ,0xff81ba5c) //112            == 0xff81ba5c
//NSTUB(IsStrobeChargeCompleted               ,0xff8c1344) //102            == 0xff8c1344
NSTUB(LEDDrive                                ,0xff848890) //103
//NSTUB(LocalTime                             ,0xff86b538) //  1            == 0xff86b538
//NSTUB(LockMainPower                         ,0xff8731f0) //103            == 0xff8731f0
//NSTUB(Lseek                                 ,0xff82566c) //101            == 0xff82566c
NSTUB(MakeDirectory_Fut                       ,0xff824e08) //  1
//NSTUB(MoveFocusLensToDistance               ,0xffa0e0c4) //102            == 0xffa0e0c4
NSTUB(MoveIrisWithAv                          ,0xff937138) //102
//NSTUB(MoveZoomLensWithPoint                 ,0xff93accc) //102            == 0xff93accc
//NSTUB(NewTaskShell                          ,0xff86f1ec) //103            == 0xff86f1ec
//NSTUB(Open                                  ,0xff825504) //101            == 0xff825504
//NSTUB(PB2Rec                                ,0xff876664) //104            == 0xff876664
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8668e0) //103
NSTUB(PT_MoveOpticalZoomAt                    ,0xff8668a8) //103
//NSTUB(PT_PlaySound                          ,0xff866454) //103            == 0xff866454
NSTUB(PostLogicalEventForNotPowerType         ,0xff87118c) //103
NSTUB(PostLogicalEventToUI                    ,0xff8711d8) //103
//NSTUB(Read                                  ,0xff81a378) //101            == 0xff81a378
//NSTUB(ReadFastDir                           ,0xffa2cb3c) //  1            == 0xffa2cb3c
//NSTUB(Rec2PB                                ,0xff875024) //104            == 0xff875024
//NSTUB(RefreshPhysicalScreen                 ,0xff9bdb74) //104            == 0xff9bdb74
//NSTUB(Remove                                ,0xff825574) //  1            == 0xff825574
NSTUB(RenameFile_Fut                          ,0xff824d40) //  1
NSTUB(Restart                                 ,0xff82c7e4) //106
//NSTUB(SetAE_ShutterSpeed                    ,0xffa10420) //102            == 0xffa10420
NSTUB(SetAutoShutdownTime                     ,0xff873264) //103
NSTUB(SetCurrentCaptureModeType               ,0xff879f7c) //101
//NSTUB(SetFileTimeStamp                      ,0xff825808) //  1            == 0xff825808
NSTUB(SetLogicalEventActive                   ,0xff872f28) //  1
//NSTUB(SetParameterData                      ,0xff9567c8) //101            == 0xff9567c8
NSTUB(SetPropertyCase                         ,0xff86f660) //103
//NSTUB(SetScriptMode                         ,0xff872f78) //101            == 0xff872f78
//NSTUB(SleepTask                             ,0xff82a610) //101            == 0xff82a610
//NSTUB(TakeSemaphore                         ,0xff81b98c) //101            == 0xff81b98c
NSTUB(TurnOffBackLight                        ,0xff87ff88) //104
NSTUB(TurnOnBackLight                         ,0xff87ff70) //104
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff99c320) //103            == 0xff99c320
//NSTUB(UnlockAF                              ,0xff827638) //103            == 0xff827638
//NSTUB(UnlockMainPower                       ,0xff873144) //103            == 0xff873144
//NSTUB(UnsetZoomForMovie                     ,0xff95cfcc) //104            == 0xff95cfcc
//NSTUB(UpdateMBROnFlash                      ,0xff85251c) //  1            == 0xff85251c
//NSTUB(VbattGet                              ,0xff82199c) //101            == 0xff82199c
//NSTUB(Write                                 ,0xff8255d8) //101            == 0xff8255d8
//NSTUB(WriteSDCard                           ,0xff928c84) //108            == 0xff928c84
//NSTUB(_log                                  ,0xffabe644) //111            == 0xffabe644
//NSTUB(_log10                                ,0xffabd588) //112            == 0xffabd588
//NSTUB(_pow                                  ,0xffabd6f8) //114            == 0xffabd6f8
//NSTUB(_sqrt                                 ,0xffabf9ac) //  1            == 0xffabf9ac
NSTUB(add_ptp_handler                         ,0xff8d897c) //  1
//NSTUB(apex2us                               ,0xff9bf02c) //  4            == 0xff9bf02c
//NSTUB(close                                 ,0xff81a190) //  1            == 0xff81a190
//NSTUB(closedir                              ,0xffa2cc0c) //  1            == 0xffa2cc0c
NSTUB(err_init_task                           ,0xff814eb0) //  4
NSTUB(exmem_alloc                             ,0xff86c680) //  1
//NSTUB(free                                  ,0xff813ab0) //112            == 0xff813ab0
//NSTUB(kbd_p1_f                              ,0xff8231c8) //109            == 0xff8231c8
//NSTUB(kbd_p1_f_cont                         ,0xff8231d4) //109            == 0xff8231d4
//NSTUB(kbd_p2_f                              ,0xff822a18) //109            == 0xff822a18
NSTUB(kbd_read_keys                           ,0xff8230cc) //109
//NSTUB(kbd_read_keys_r2                      ,0xff848dc8) //109            == 0xff848dc8
//NSTUB(lseek                                 ,0xff82566c) //101            == 0xff82566c
//NSTUB(malloc                                ,0xff8139dc) //112            == 0xff8139dc
//NSTUB(memcmp                                ,0xff81e834) //101            == 0xff81e834
//NSTUB(memcpy                                ,0xff895cf0) //101            == 0xff895cf0
//NSTUB(memset                                ,0xffa8d394) //101            == 0xffa8d394
//NSTUB(mkdir                                 ,0xff8258d0) //  1            == 0xff8258d0
// ALT: NSTUB(mkdir, 0xff825970) // 1 32/0
NSTUB(mktime_ext                              ,0xff89655c) //  1
//NSTUB(open                                  ,0xff81a0e0) //  1            == 0xff81a0e0
//NSTUB(opendir                               ,0xffa2caa8) //  1            == 0xffa2caa8
//NSTUB(openfastdir                           ,0xffa2caa8) //  1            == 0xffa2caa8
//NSTUB(qsort                                 ,0xff9be404) //  1            == 0xff9be404
//NSTUB(rand                                  ,0xff81e93c) //  1            == 0xff81e93c
//NSTUB(read                                  ,0xff81a378) //101            == 0xff81a378
//NSTUB(readfastdir                           ,0xffa2cb3c) //  1            == 0xffa2cb3c
NSTUB(reboot_fw_update                        ,0xffa34500) //  1
NSTUB(set_control_event                       ,0xff872c2c) //  1
//NSTUB(srand                                 ,0xff81e930) //  1            == 0xff81e930
//NSTUB(stat                                  ,0xff825738) //  1            == 0xff825738
//NSTUB(strcat                                ,0xff895c1c) //  1            == 0xff895c1c
//NSTUB(strchr                                ,0xff895ca4) //  1            == 0xff895ca4
//NSTUB(strcpy                                ,0xff81e778) //101            == 0xff81e778
NSTUB(strftime                                ,0xff895f64) //  1
//NSTUB(strlen                                ,0xff81e810) //101            == 0xff81e810
//NSTUB(strncmp                               ,0xff895c58) //  1            == 0xff895c58
//NSTUB(strncpy                               ,0xff81e790) //  1            == 0xff81e790
//NSTUB(strrchr                               ,0xff895cc8) //  1            == 0xff895cc8
//NSTUB(strtol                                ,0xff830d90) //101            == 0xff830d90
NSTUB(strtolx                                 ,0xff830b94) //109
  DEF(task_CaptSeq                            ,0xff861210) //107
  DEF(task_ExpDrv                             ,0xff8b8b90) //110
  DEF(task_InitFileModules                    ,0xff877284) //107
  DEF(task_MovieRecord                        ,0xff85d4c0) //107
  DEF(task_PhySw                              ,0xff822d74) //107
NSTUB(time                                    ,0xff86ba3c) //  2
//NSTUB(vsprintf                              ,0xff81e6f8) //  1            == 0xff81e6f8
