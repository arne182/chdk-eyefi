// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.01C
//   Possible corrupt firmware dump - file size to small for start address 0xff810000
//     file size = 7.15MB, should be 7.94MB
//   Could not find Camera name - possible corrupt firmware dump

// Values for makefile.inc
//   MAXRAMADDR = 0x03ffffff

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(SetScriptMode                         ,0xff894498) //101        *** != 0xff810f4c
//NSTUB(kbd_pwr_off                           ,0xff85e3a4) //  2 60%    *** != 0xff833350
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b04
//NSTUB(rename                                ,0xff834d0c) //  4        *** != 0xff8354f0
//NSTUB(write                                 ,0xff8354a4) //101        *** != 0xff81abd8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8984d8 -> ff894adc -> ff9936cc -> ffaaea90 -> ffbefb90
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x000330d8) // Found @0xff8335b4,          stubs_min = 0x000330d8 (0x330d8)
//DEF(physw_run                               ,0x00001c44) // Found @0xff83320c,          stubs_min = 0x00001c44 (0x1C38+0x0C)
//DEF(levent_table                            ,0xffb8b680) // Found @0xffb8b680, ** != ** stubs_min = 0xff9915bc (0xFF9915BC)
//DEF(FlashParamsTable                        ,0xffbefd80) // Found @0xffbefd80,          stubs_min = 0xffbefd80 (0xFFBEFD80)
//DEF(movie_status                            ,0x00007ae8) // Found @0xff961658,          stubs_min = 0x00007ae8 (0x7ab0+0x38)
//DEF(full_screen_refresh                     ,0x0000a36c) // Found @0xffa07f84
//DEF(canon_menu_active                       ,0x00003038) // Found @0xff88d6ac,          stubs_min = 0x00003038 (0x3034+4)
//DEF(canon_shoot_menu_active                 ,0x00008dd1) // Found @0xff9ab95c,          stubs_min = 0x00008dd1 (0x8DD0+1)
//DEF(playrec_mode                            ,0x00002d64) // Found @0xff87fa70,          stubs_min = 0x00002d64 (0x2d60+0x4)
//DEF(zoom_status                             ,0x00008aa4) // Found @0xff99bd30,          stubs_min = 0x00008aa4 (0x8AA4)
//DEF(some_flag_for_af_scan                   ,0x00007ff4) // Found @0xff9646e8,          stubs_min = 0x00007ff4 (0x7FF4)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff858728
//void *vid_get_viewport_fb()      { return (void*)0x407e8a00; } // Found @0xffaff4ec
//char *camera_jpeg_count_str()    { return (char*)0x0009792c; } // Found @0xff9fc148
//long hook_raw_size()             { return 0x00ee9200; }        // Found @0xffb027b8
//int get_flash_params_count(void) { return 0x85; }              // Found @0xff994ccc

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb3ac60, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00200000 // Found @0xffb3ac78, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000300 }, // Found @0xffb3ab4c, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000200 }, // Found @0xffb3ab4c, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000100 }, // Found @0xffb3ab40, levent 0x00
//    { 1, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffb3abc4, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00000020 }, // Found @0xffb3abd0, levent 0x03
//    { 1, KEY_LEFT            ,0x00000100 }, // Found @0xffb3abf4, levent 0x06
//    { 1, KEY_RIGHT           ,0x00000200 }, // Found @0xffb3ac00, levent 0x07
//    { 1, KEY_DOWN            ,0x00000400 }, // Found @0xffb3ac0c, levent 0x05
//    { 1, KEY_DISPLAY         ,0x00001000 }, // Found @0xffb3ac24, levent 0x0a
//    { 1, KEY_MENU            ,0x00002000 }, // Found @0xffb3ac30, levent 0x09
//    { 1, KEY_UP              ,0x00004000 }, // Found @0xffb3ac3c, levent 0x04
//    { 1, KEY_SET             ,0x00008000 }, // Found @0xffb3ac48, levent 0x08
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3744 // Found @0xff934648
//#define CAM_RAW_ROWS      2784 // Found @0xff934650
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff838e10

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa9d378) //101
NSTUB(AllocateUncacheableMemory               ,0xff838dcc) //112
NSTUB(Close                                   ,0xff835414) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff834da0) //112
//NSTUB(DoAFLock                              ,0xff836b98) //102            == 0xff836b98
//NSTUB(EnterToCompensationEVF                ,0xff836d3c) //104            == 0xff836d3c
NSTUB(ExecuteEventProcedure                   ,0xff888d78) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff836d80) //104            == 0xff836d80
NSTUB(ExitTask                                ,0xff81e844) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff844700) //104            == 0xff844700
//NSTUB(ExpCtrlTool_StopContiAE               ,0xff8447d8) //104            == 0xff8447d8
NSTUB(Fclose_Fut                              ,0xff834f1c) //101
NSTUB(Feof_Fut                                ,0xff835108) //  1
NSTUB(Fflush_Fut                              ,0xff835144) //  1
NSTUB(Fgets_Fut                               ,0xff835070) //  1
NSTUB(Fopen_Fut                               ,0xff834edc) //101
NSTUB(Fread_Fut                               ,0xff834fc8) //101
NSTUB(FreeMemory                              ,0xffa9d370) //101
NSTUB(FreeUncacheableMemory                   ,0xff838e0c) //112
NSTUB(Fseek_Fut                               ,0xff8350bc) //101
NSTUB(Fwrite_Fut                              ,0xff83501c) //101
NSTUB(GetBatteryTemperature                   ,0xff8615f0) //102
NSTUB(GetCCDTemperature                       ,0xff86157c) //102
NSTUB(GetCurrentAvValue                       ,0xff95a53c) //102
NSTUB(GetDrive_ClusterSize                    ,0xff86e380) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff86e3e0) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff86e3b4) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff958b10) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff958f58) //  3
NSTUB(GetImageFolder                          ,0xff93c4d4) //106
//NSTUB(GetKbdState                           ,0xff85e258) //109            == 0xff85e258
NSTUB(GetMemInfo                              ,0xff81a070) //  3
NSTUB(GetOpticalTemperature                   ,0xff861664) //102
NSTUB(GetParameterData                        ,0xff994c8c) //101
NSTUB(GetPropertyCase                         ,0xff88cae0) //102
NSTUB(GetSystemTime                           ,0xffa9d3d0) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff95dbfc) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa9101c) //102
//NSTUB(GiveSemaphore                         ,0xff8387e8) //112            == 0xff8387e8
NSTUB(IsStrobeChargeCompleted                 ,0xff8d878c) //102
//NSTUB(LEDDrive                              ,0xff85d648) //103            == 0xff85d648
NSTUB(LocalTime                               ,0xff8866ec) //  1
NSTUB(LockMainPower                           ,0xff8946f8) //103
//NSTUB(Lseek                                 ,0xff835530) //101            == 0xff835530
NSTUB(MakeDirectory_Fut                       ,0xff834e14) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffafbf00) //102
NSTUB(MoveIrisWithAv                          ,0xffa9ad44) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa9b3b8) //102
NSTUB(NewTaskShell                            ,0xff88c58c) //103
NSTUB(Open                                    ,0xff8353bc) //101
NSTUB(PB2Rec                                  ,0xff897840) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff87772c) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff877704) //102
//NSTUB(PT_PlaySound                          ,0xff881888) //102            == 0xff881888
NSTUB(PostLogicalEventForNotPowerType         ,0xff892524) //103
NSTUB(PostLogicalEventToUI                    ,0xff892570) //103
NSTUB(PutInNdFilter                           ,0xffaf9c50) //102
NSTUB(PutOutNdFilter                          ,0xffaf9c88) //102
NSTUB(Read                                    ,0xff81ab78) //101
NSTUB(ReadFastDir                             ,0xffa7d958) //  3
NSTUB(Rec2PB                                  ,0xff897880) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffa090fc) //104            == 0xffa090fc
//NSTUB(Remove                                ,0xff835448) //  4            == 0xff835448
//NSTUB(RenameFile_Fut                        ,0xff834d0c) //  4            == 0xff834d0c
NSTUB(Restart                                 ,0xff83a520) //106
//NSTUB(ScreenLock                            ,0xffa0a31c) //  3            == 0xffa0a31c
//NSTUB(ScreenUnlock                          ,0xffa0a344) //  3            == 0xffa0a344
NSTUB(SetAE_ShutterSpeed                      ,0xffafe6ac) //102
NSTUB(SetAutoShutdownTime                     ,0xff89476c) //103
NSTUB(SetCurrentCaptureModeType               ,0xff89b830) //101
//NSTUB(SetFileTimeStamp                      ,0xff8356a0) //  3            == 0xff8356a0
NSTUB(SetLogicalEventActive                   ,0xff894448) //101
NSTUB(SetParameterData                        ,0xff994b68) //101
NSTUB(SetPropertyCase                         ,0xff88c9dc) //102
NSTUB(SleepTask                               ,0xff838a50) //101
NSTUB(TakeSemaphore                           ,0xff838718) //101
//NSTUB(TurnOffBackLight                      ,0xff8a49c8) //104            == 0xff8a49c8
//NSTUB(TurnOnBackLight                       ,0xff8a49b0) //104            == 0xff8a49b0
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff97ec10) //105            == 0xff97ec10
//NSTUB(UnlockAF                              ,0xff836bd0) //102            == 0xff836bd0
NSTUB(UnlockMainPower                         ,0xff89464c) //103
//NSTUB(UnsetZoomForMovie                     ,0xff8a0f30) //104            == 0xff8a0f30
NSTUB(UpdateMBROnFlash                        ,0xff86e200) //  3
NSTUB(VbattGet                                ,0xff831e04) //103
NSTUB(Write                                   ,0xff8354a4) //101
//NSTUB(WriteSDCard                           ,0xff94a63c) //108            == 0xff94a63c
NSTUB(_log                                    ,0xffb36808) //111
NSTUB(_log10                                  ,0xffb35494) //112
NSTUB(_pow                                    ,0xffb35604) //114
NSTUB(_sqrt                                   ,0xffb383ac) //  1
NSTUB(add_ptp_handler                         ,0xffa471d0) //  3
//NSTUB(apex2us                               ,0xffa0d9b8) //  4            == 0xffa0d9b8
NSTUB(close                                   ,0xff81a990) //  1
NSTUB(closedir                                ,0xffa7d7e0) //  3
NSTUB(err_init_task                           ,0xff815f28) //  4
NSTUB(exmem_alloc                             ,0xff8875ac) //103
NSTUB(free                                    ,0xff814138) //112
NSTUB(kbd_p1_f                                ,0xff833630) //109
NSTUB(kbd_p1_f_cont                           ,0xff83363c) //109
NSTUB(kbd_p2_f                                ,0xff832ed8) //109
NSTUB(kbd_read_keys                           ,0xff8335b4) //109
NSTUB(kbd_read_keys_r2                        ,0xff85db5c) //109
NSTUB(lseek                                   ,0xff835530) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203e8) //101
NSTUB(memcpy                                  ,0xff83e43c) //101
NSTUB(memset                                  ,0xffa0ca08) //101
NSTUB(mkdir                                   ,0xff835888) //  3
NSTUB(mktime_ext                              ,0xff8ac380) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
NSTUB(opendir                                 ,0xffa7d824) //  3
//NSTUB(openfastdir                           ,0xffa7d824) //  3            == 0xffa7d824
NSTUB(qsort                                   ,0xffaec5e8) //  1
NSTUB(rand                                    ,0xff8204f0) //  1
NSTUB(read                                    ,0xff81ab78) //101
//NSTUB(readfastdir                           ,0xffa7d958) //  3            == 0xffa7d958
NSTUB(reboot_fw_update                        ,0xffa82e68) //  1
NSTUB(set_control_event                       ,0xff89409c) //111
NSTUB(srand                                   ,0xff8204e4) //  1
NSTUB(stat                                    ,0xff83556c) //  3
// ALT: NSTUB(stat, 0xff86b7c4) // 3 31/0
//NSTUB(strcat                                ,0xff8abb3c) //  1            == 0xff8abb3c
NSTUB(strchr                                  ,0xff813fc0) //  1
NSTUB(strcmp                                  ,0xff8203a4) //101
NSTUB(strcpy                                  ,0xff82038c) //101
NSTUB(strftime                                ,0xff8abd88) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
//NSTUB(strncpy                               ,0xff813f38) //  1            == 0xff813f38
//NSTUB(strrchr                               ,0xff813fe4) //  1            == 0xff813fe4
NSTUB(strtol                                  ,0xff83e71c) //101
NSTUB(strtolx                                 ,0xff83e520) //109
  DEF(task_CaptSeq                            ,0xff87a258) //107
  DEF(task_ExpDrv                             ,0xff8c0ed0) //110
  DEF(task_InitFileModules                    ,0xff898364) //107
  DEF(task_MovieRecord                        ,0xff96193c) //107
  DEF(task_PhySw                              ,0xff833208) //107
  DEF(task_RotaryEncoder                      ,0xff85e508) //107
NSTUB(time                                    ,0xff886c64) //  2
NSTUB(vsprintf                                ,0xff820350) //  1
