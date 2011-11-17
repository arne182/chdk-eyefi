// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00I
//   Possible corrupt firmware dump - file size to small for start address 0xff810000
//     file size = 3.19MB, should be 7.94MB
//   Could not find Camera name - possible corrupt firmware dump

// Values for makefile.inc
//   MAXRAMADDR = 0x03ffffff

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetZoomLensCurrentPosition            ,0xffa3e680) //102        *** != 0xff93ae1c
//NSTUB(PutInNdFilter                         ,0xff9384e4) //102        *** != 0xffa0c578
//NSTUB(PutOutNdFilter                        ,0xff938508) //102        *** != 0xffa0c5b0
//NSTUB(kbd_pwr_off                           ,0xff84944c) //  2 67%    *** != 0xff810958
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810958
//NSTUB(rename                                ,0xff824d40) //  1        *** != 0xff825600
//NSTUB(write                                 ,0xff8255d8) //101        *** != 0xff81a3d8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8773f8 -> ff8735c4 -> ff9553a8 -> ffa4c760 -> ffb08114
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0001563c) // Found @0xff8230cc,          stubs_min = 0x0001563c (0x01563C)
//DEF(physw_run                               ,0x00001ca4) // Found @0xff822d78,          stubs_min = 0x00001ca4 (0x1ca4)
//DEF(levent_table                            ,0xffae01d4) // Found @0xffae01d4,          stubs_min = 0xffae01d4 (0xFFAE01D4)
//DEF(FlashParamsTable                        ,0xffb082e0) // Found @0xffb082e0, ** != ** stubs_min = 0xffb082b8 (0xFFB082B8)
//DEF(movie_status                            ,0x00005714) // Found @0xff85d220,          stubs_min = 0x00005714 (0x5714)
//DEF(canon_menu_active                       ,0x0000fdc8) // Found @0xff99b56c,          stubs_min = 0x0000fdc8 (0xFDC8)
//DEF(canon_shoot_menu_active                 ,0x0000f33d) // Found @0xff96ac40,          stubs_min = 0x0000f33d (0xF33D)
//DEF(playrec_mode                            ,0x000058cc) // Found @0xff864a60,          stubs_min = 0x000058cc (0x58cc)
//DEF(zoom_status                             ,0x0001264c) // Found @0xffa4e424,          stubs_min = 0x0001264c (0x1264C)
//DEF(some_flag_for_af_scan                   ,0x0001253c) // Found @0xffa447c8,          stubs_min = 0x0001253c (0x1253C)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff8451d0
//void *vid_get_viewport_fb()      { return (void*)0x1067b540; } // Found @0xffa11304
//char *camera_jpeg_count_str()    { return (char*)0x00060354; } // Found @0xff9afb7c
//long hook_raw_size()             { return 0x00ee9710; }        // Found @0xffa131c8
//int get_flash_params_count(void) { return 0x72; }              // Found @0xff9569a8

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffac6378, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffac6380, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0xc0000000 }, // Found @0xffac62b0, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x80000000 }, // Found @0xffac62b0, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x40000000 }, // Found @0xffac62a8, levent 0x00
//    { 1, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffac62d0, levent 0x03
//    { 1, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffac62d8, levent 0x02
//    { 1, KEY_LEFT            ,0x00010000 }, // Found @0xffac6308, levent 0x06
//    { 1, KEY_SET             ,0x00020000 }, // Found @0xffac6310, levent 0x08
//    { 1, KEY_RIGHT           ,0x00040000 }, // Found @0xffac6318, levent 0x07
//    { 1, KEY_DOWN            ,0x00080000 }, // Found @0xffac6320, levent 0x05
//    { 1, KEY_UP              ,0x00100000 }, // Found @0xffac6328, levent 0x04
//    { 1, KEY_DISPLAY         ,0x04000000 }, // Found @0xffac6340, levent 0x0a
//    { 1, KEY_MENU            ,0x08000000 }, // Found @0xffac6348, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4104 // Found @0xffa0b290
//#define CAM_RAW_ROWS      3048 // Found @0xffa0b298
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff82a7c4

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa47cf0) //103
NSTUB(AllocateUncacheableMemory               ,0xff82a788) //112
NSTUB(Close                                   ,0xff82552c) //101
NSTUB(CreateTask                              ,0xff81baf0) //101
NSTUB(DebugAssert                             ,0xff81bfc8) //111
NSTUB(DeleteFile_Fut                          ,0xff824d94) //112
//NSTUB(DoAFLock                              ,0xff8275cc) //103            == 0xff8275cc
NSTUB(EnterToCompensationEVF                  ,0xff8279a8) //104
NSTUB(ExecuteEventProcedure                   ,0xff81c1a8) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff8279f8) //104            == 0xff8279f8
NSTUB(ExitTask                                ,0xff81bd80) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff835600) //104            == 0xff835600
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff8357c0) //104
NSTUB(Fclose_Fut                              ,0xff824f10) //101
NSTUB(Feof_Fut                                ,0xff8250fc) //  1
NSTUB(Fflush_Fut                              ,0xff825138) //  1
NSTUB(Fgets_Fut                               ,0xff825064) //  1
NSTUB(Fopen_Fut                               ,0xff824ed0) //101
NSTUB(Fread_Fut                               ,0xff824fbc) //101
NSTUB(FreeMemory                              ,0xffa47cdc) //103
NSTUB(FreeUncacheableMemory                   ,0xff82a7bc) //112
NSTUB(Fseek_Fut                               ,0xff8250b0) //101
NSTUB(Fwrite_Fut                              ,0xff825010) //101
NSTUB(GetBatteryTemperature                   ,0xff84bee8) //102
NSTUB(GetCCDTemperature                       ,0xff84be78) //102
NSTUB(GetCurrentAvValue                       ,0xff936dd4) //102
NSTUB(GetDrive_ClusterSize                    ,0xff852754) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff8527f4) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff852788) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff934c68) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff934f74) //  1
//NSTUB(GetKbdState                           ,0xff849300) //109            == 0xff849300
NSTUB(GetMemInfo                              ,0xff813c58) //  1
NSTUB(GetOpticalTemperature                   ,0xff84bf58) //102
NSTUB(GetParameterData                        ,0xff956968) //  1
NSTUB(GetPropertyCase                         ,0xff86f768) //101
NSTUB(GetSystemTime                           ,0xffa47df8) //  1
NSTUB(GetZoomLensCurrentPoint                 ,0xff93a29c) //102
//NSTUB(GiveSemaphore                         ,0xff81ba5c) //112            == 0xff81ba5c
NSTUB(IsStrobeChargeCompleted                 ,0xff8c1344) //102
NSTUB(LEDDrive                                ,0xff848890) //103
NSTUB(LocalTime                               ,0xff86b538) //  1
NSTUB(LockMainPower                           ,0xff8731f0) //103
NSTUB(Lseek                                   ,0xff82566c) //101
NSTUB(MakeDirectory_Fut                       ,0xff824e08) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffa0e15c) //102
NSTUB(MoveIrisWithAv                          ,0xff9371b4) //102
NSTUB(MoveZoomLensWithPoint                   ,0xff93ad48) //102
NSTUB(NewTaskShell                            ,0xff86f1ec) //103
NSTUB(Open                                    ,0xff825504) //101
//NSTUB(PB2Rec                                ,0xff876664) //104            == 0xff876664
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8668e0) //103
NSTUB(PT_MoveOpticalZoomAt                    ,0xff8668a8) //103
//NSTUB(PT_PlaySound                          ,0xff866454) //103            == 0xff866454
NSTUB(PostLogicalEventForNotPowerType         ,0xff87118c) //103
NSTUB(PostLogicalEventToUI                    ,0xff8711d8) //103
NSTUB(Read                                    ,0xff81a378) //101
NSTUB(ReadFastDir                             ,0xffa2cbd4) //  1
//NSTUB(Rec2PB                                ,0xff875024) //104            == 0xff875024
NSTUB(RefreshPhysicalScreen                   ,0xff9bdc0c) //104
NSTUB(Remove                                  ,0xff825574) //  1
NSTUB(RenameFile_Fut                          ,0xff824d40) //  1
NSTUB(Restart                                 ,0xff82c7e4) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffa104b8) //102
NSTUB(SetAutoShutdownTime                     ,0xff873264) //103
NSTUB(SetCurrentCaptureModeType               ,0xff879f7c) //101
NSTUB(SetFileTimeStamp                        ,0xff825808) //  1
NSTUB(SetLogicalEventActive                   ,0xff872f28) //  1
NSTUB(SetParameterData                        ,0xff956844) //101
NSTUB(SetPropertyCase                         ,0xff86f660) //103
//NSTUB(SetScriptMode                         ,0xff872f78) //101            == 0xff872f78
NSTUB(SleepTask                               ,0xff82a610) //101
NSTUB(TakeSemaphore                           ,0xff81b98c) //101
NSTUB(TurnOffBackLight                        ,0xff87ff88) //104
NSTUB(TurnOnBackLight                         ,0xff87ff70) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff99c3b8) //103
//NSTUB(UnlockAF                              ,0xff827638) //103            == 0xff827638
NSTUB(UnlockMainPower                         ,0xff873144) //103
//NSTUB(UnsetZoomForMovie                     ,0xff95d048) //104            == 0xff95d048
NSTUB(UpdateMBROnFlash                        ,0xff85251c) //  1
NSTUB(VbattGet                                ,0xff82199c) //101
NSTUB(Write                                   ,0xff8255d8) //101
//NSTUB(WriteSDCard                           ,0xff928d00) //108            == 0xff928d00
NSTUB(_log                                    ,0xffabe6dc) //111
NSTUB(_log10                                  ,0xffabd620) //112
NSTUB(_pow                                    ,0xffabd790) //114
NSTUB(_sqrt                                   ,0xffabfa44) //  1
NSTUB(add_ptp_handler                         ,0xff8d897c) //  1
//NSTUB(apex2us                               ,0xff9bf0c4) //  4            == 0xff9bf0c4
NSTUB(close                                   ,0xff81a190) //  1
NSTUB(closedir                                ,0xffa2cca4) //  1
NSTUB(err_init_task                           ,0xff814eb0) //  4
NSTUB(exmem_alloc                             ,0xff86c680) //  1
NSTUB(free                                    ,0xff813ab0) //112
NSTUB(kbd_p1_f                                ,0xff8231c8) //109
NSTUB(kbd_p1_f_cont                           ,0xff8231d4) //109
NSTUB(kbd_p2_f                                ,0xff822a18) //109
NSTUB(kbd_read_keys                           ,0xff8230cc) //109
//NSTUB(kbd_read_keys_r2                      ,0xff848dc8) //109            == 0xff848dc8
NSTUB(lseek                                   ,0xff82566c) //101
NSTUB(malloc                                  ,0xff8139dc) //112
NSTUB(memcmp                                  ,0xff81e834) //101
NSTUB(memcpy                                  ,0xff895cf0) //101
NSTUB(memset                                  ,0xffa8d42c) //101
NSTUB(mkdir                                   ,0xff8258d0) //  1
// ALT: NSTUB(mkdir, 0xff825970) // 1 32/0
NSTUB(mktime_ext                              ,0xff89655c) //  1
NSTUB(open                                    ,0xff81a0e0) //  1
NSTUB(opendir                                 ,0xffa2cb40) //  1
NSTUB(openfastdir                             ,0xffa2cb40) //  1
NSTUB(qsort                                   ,0xff9be49c) //  1
NSTUB(rand                                    ,0xff81e93c) //  1
NSTUB(read                                    ,0xff81a378) //101
NSTUB(readfastdir                             ,0xffa2cbd4) //  1
NSTUB(reboot_fw_update                        ,0xffa34598) //  1
NSTUB(set_control_event                       ,0xff872c2c) //  1
NSTUB(srand                                   ,0xff81e930) //  1
NSTUB(stat                                    ,0xff825738) //  1
NSTUB(strcat                                  ,0xff895c1c) //  1
NSTUB(strchr                                  ,0xff895ca4) //  1
NSTUB(strcmp                                  ,0xff81e7cc) //101
NSTUB(strcpy                                  ,0xff81e778) //101
NSTUB(strftime                                ,0xff895f64) //  1
NSTUB(strlen                                  ,0xff81e810) //101
NSTUB(strncmp                                 ,0xff895c58) //  1
NSTUB(strncpy                                 ,0xff81e790) //  1
NSTUB(strrchr                                 ,0xff895cc8) //  1
NSTUB(strtol                                  ,0xff830d90) //101
NSTUB(strtolx                                 ,0xff830b94) //109
  DEF(task_CaptSeq                            ,0xff861210) //107
  DEF(task_ExpDrv                             ,0xff8b8b90) //110
  DEF(task_InitFileModules                    ,0xff877284) //107
  DEF(task_MovieRecord                        ,0xff85d4c0) //107
  DEF(task_PhySw                              ,0xff822d74) //107
NSTUB(time                                    ,0xff86ba3c) //  2
NSTUB(vsprintf                                ,0xff81e6f8) //  1
