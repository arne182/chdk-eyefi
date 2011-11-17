// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.02D
//   Canon PowerShot SX20 IS

// Values for makefile.inc
//   PLATFORMID = 12772 (0x31e4) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff35a0
//   NEED_ENCODED_DISKBOOT = 3   // Found @ 0xffff35b0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DoAFLock                              ,0xff836a9c) //102        *** != 0xff879704
//NSTUB(SetFileTimeStamp                      ,0xff835508) //  3        *** != 0xff810b04
//NSTUB(TurnOffBackLight                      ,0xff8a5b30) //104        *** != 0xff89b6f4
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff979b78) //105        *** != 0xdeadc0de
//NSTUB(UnlockAF                              ,0xff836b38) //102        *** != 0xff879714
//NSTUB(VbattGet                              ,0xff831cec) //103        *** != 0xff95d27c
//NSTUB(kbd_pwr_off                           ,0xff85f2c4) //  2 60%    *** != 0xff810b04
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b04
//NSTUB(openfastdir                           ,0xffa7d5a0) //  3        *** != 0xdeadc0de
//NSTUB(readfastdir                           ,0xffa7d6d4) //  3        *** != 0xdeadc0de
//NSTUB(rename                                ,0xff834b74) //  4        *** != 0xdeadc0de

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff89aa90 -> ff8972e0 -> ff98f1e0 -> ffaac914 -> ffbe87b4
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00032464) // Found @0xff83341c,          stubs_min = 0x00032464 (0x32464)
//DEF(physw_run                               ,0x00001c44) // Found @0xff83308c,          stubs_min = 0x00001c44 (0x1C38+0xC)
//DEF(levent_table                            ,0xffba33a8) // Found @0xffba33a8,          stubs_min = 0xffba33a8 (0xFFBA33A8)
//DEF(FlashParamsTable                        ,0xffbe899c) // Found @0xffbe899c,          stubs_min = 0xffbe899c (0xFFBE899C)
//DEF(movie_status                            ,0x00002c30) // Found @0xff878e00,          stubs_min = 0x00002c30 (0x2BF8+0x38)
//DEF(full_screen_refresh                     ,0x00009cf4) // Found @0xffa02778,          stubs_min = 0x00009cf4 (0x9CF4)
//DEF(canon_menu_active                       ,0x0000312c) // Found @0xff88fee0,          stubs_min = 0x0000312c (0x3128+4)
//DEF(canon_shoot_menu_active                 ,0x00008845) // Found @0xff9aa1e4,          stubs_min = 0x00008845 (0x8844+1)
//DEF(playrec_mode                            ,0x00002e58) // Found @0xff882278,          stubs_min = 0x00002e58 (0x2E54+0x4)
//DEF(zoom_status                             ,0x0000c6c0) // Found @0xffaaf648,          stubs_min = 0x0000c6c0 (0xC6C0)
//DEF(some_flag_for_af_scan                   ,0x00007934) // Found @0xff95fd00

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xff859684
//void *vid_get_viewport_fb()      { return (void*)0x41020120; } // Found @0xffb03448
//char *camera_jpeg_count_str()    { return (char*)0x00072dfc; } // Found @0xff9f7368
//long hook_raw_size()             { return 0x011ca240; }        // Found @0xffb05bac
//int get_flash_params_count(void) { return 0x84; }              // Found @0xff9907e0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb44d84, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb44d90, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb44c1c, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb44c1c, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb44c10, levent 0x00
//    { 1, KEY_SET             ,0x00000100 }, // Found @0xffb44cac, levent 0x08
//    { 1, KEY_DISPLAY         ,0x00000200 }, // Found @0xffb44cb8, levent 0x0a
//    { 1, KEY_UP              ,0x00000400 }, // Found @0xffb44cc4, levent 0x04
//    { 1, KEY_DOWN            ,0x00000800 }, // Found @0xffb44cd0, levent 0x05
//    { 1, KEY_RIGHT           ,0x00001000 }, // Found @0xffb44cdc, levent 0x07
//    { 1, KEY_LEFT            ,0x00002000 }, // Found @0xffb44ce8, levent 0x06
//    { 1, KEY_MENU            ,0x00004000 }, // Found @0xffb44cf4, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    4080 // Found @0xff92b724
//#define CAM_RAW_ROWS      3048 // Found @0xff92b72c
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff838e2c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa9b828) //101
NSTUB(AllocateUncacheableMemory               ,0xff838de8) //112
NSTUB(Close                                   ,0xff83527c) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff834c08) //112
//NSTUB(EnterToCompensationEVF                ,0xff836d84) //104            == 0xff836d84
NSTUB(ExecuteEventProcedure                   ,0xff88b598) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff836dc8) //104            == 0xff836dc8
//NSTUB(ExitTask                              ,0xff81e844) //101            == 0xff81e844
NSTUB(ExpCtrlTool_StartContiAE                ,0xff84465c) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff844734) //104
NSTUB(Fclose_Fut                              ,0xff834d84) //101
NSTUB(Feof_Fut                                ,0xff834f70) //  1
NSTUB(Fflush_Fut                              ,0xff834fac) //  1
NSTUB(Fgets_Fut                               ,0xff834ed8) //  1
NSTUB(Fopen_Fut                               ,0xff834d44) //101
NSTUB(Fread_Fut                               ,0xff834e30) //101
NSTUB(FreeMemory                              ,0xffa9b820) //101
NSTUB(FreeUncacheableMemory                   ,0xff838e28) //112
NSTUB(Fseek_Fut                               ,0xff834f24) //101
NSTUB(Fwrite_Fut                              ,0xff834e84) //101
//NSTUB(GetBatteryTemperature                 ,0xff862744) //102            == 0xff862744
//NSTUB(GetCCDTemperature                     ,0xff8626d0) //102            == 0xff8626d0
NSTUB(GetCurrentAvValue                       ,0xff9526d8) //102
NSTUB(GetDrive_ClusterSize                    ,0xff86f1c8) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff86f228) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff86f1fc) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff950bcc) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff951000) //  3
NSTUB(GetImageFolder                          ,0xff933568) //106
NSTUB(GetKbdState                             ,0xff85f11c) //109
NSTUB(GetMemInfo                              ,0xff81a070) //  3
//NSTUB(GetOpticalTemperature                 ,0xff8627b8) //102            == 0xff8627b8
NSTUB(GetParameterData                        ,0xff9907a0) //101
NSTUB(GetPropertyCase                         ,0xff88f32c) //102
//NSTUB(GetSystemTime                         ,0xffa9b880) //101            == 0xffa9b880
//NSTUB(GetZoomLensCurrentPoint               ,0xff956864) //102            == 0xff956864
//NSTUB(GetZoomLensCurrentPosition            ,0xffa8ed0c) //102            == 0xffa8ed0c
NSTUB(GiveSemaphore                           ,0xff838804) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8ce3f4) //102
//NSTUB(LEDDrive                              ,0xff85e338) //103            == 0xff85e338
NSTUB(LocalTime                               ,0xff888f0c) //  1
//NSTUB(LockMainPower                         ,0xff896efc) //103            == 0xff896efc
//NSTUB(Lseek                                 ,0xff835398) //101            == 0xff835398
NSTUB(MakeDirectory_Fut                       ,0xff834c7c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffaff710) //102
NSTUB(MoveIrisWithAv                          ,0xffa971a8) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa978d0) //102
//NSTUB(NewTaskShell                          ,0xff88edf0) //103            == 0xff88edf0
NSTUB(Open                                    ,0xff835224) //101
//NSTUB(PB2Rec                                ,0xff899e38) //104            == 0xff899e38
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8796b4) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff87968c) //102
//NSTUB(PT_PlaySound                          ,0xff8840a8) //102            == 0xff8840a8
//NSTUB(PostLogicalEventForNotPowerType       ,0xff894df8) //103            == 0xff894df8
//NSTUB(PostLogicalEventToUI                  ,0xff894e44) //103            == 0xff894e44
NSTUB(PutInNdFilter                           ,0xffa97754) //102
NSTUB(PutOutNdFilter                          ,0xffa97778) //102
NSTUB(Read                                    ,0xff81ab78) //101
NSTUB(ReadFastDir                             ,0xffa7d6d4) //  3
//NSTUB(Rec2PB                                ,0xff8988a4) //104            == 0xff8988a4
//NSTUB(RefreshPhysicalScreen                 ,0xffa04ad8) //104            == 0xffa04ad8
//NSTUB(Remove                                ,0xff8352b0) //  4            == 0xff8352b0
//NSTUB(RenameFile_Fut                        ,0xff834b74) //  4            == 0xff834b74
//NSTUB(Restart                               ,0xff83a53c) //106            == 0xff83a53c
NSTUB(ScreenLock                              ,0xffa04aa4) //  8
NSTUB(ScreenUnlock                            ,0xffa04b48) //  8
NSTUB(SetAE_ShutterSpeed                      ,0xffb025c0) //102
//NSTUB(SetAutoShutdownTime                   ,0xff896f70) //103            == 0xff896f70
//NSTUB(SetCurrentCaptureModeType             ,0xff89eb78) //101            == 0xff89eb78
//NSTUB(SetLogicalEventActive                 ,0xff896c4c) //101            == 0xff896c4c
NSTUB(SetParameterData                        ,0xff99067c) //101
//NSTUB(SetPropertyCase                       ,0xff88f230) //102            == 0xff88f230
//NSTUB(SetScriptMode                         ,0xff896c9c) //101            == 0xff896c9c
//NSTUB(SleepTask                             ,0xff838a6c) //101            == 0xff838a6c
//NSTUB(TakeSemaphore                         ,0xff838734) //101            == 0xff838734
//NSTUB(TurnOnBackLight                       ,0xff8a5b18) //104            == 0xff8a5b18
//NSTUB(UnlockMainPower                       ,0xff896e50) //103            == 0xff896e50
NSTUB(UpdateMBROnFlash                        ,0xff86f048) //  3
NSTUB(Write                                   ,0xff83530c) //101
//NSTUB(WriteSDCard                           ,0xff940c34) //108            == 0xff940c34
NSTUB(_log                                    ,0xffb37ed8) //111
NSTUB(_log10                                  ,0xffb36e1c) //112
NSTUB(_pow                                    ,0xffb36f8c) //114
NSTUB(_sqrt                                   ,0xffb39240) //  1
//NSTUB(add_ptp_handler                       ,0xffa49320) //  3            == 0xffa49320
//NSTUB(apex2us                               ,0xffa08264) //  4            == 0xffa08264
NSTUB(close                                   ,0xff81a990) //  1
NSTUB(closedir                                ,0xffa7d55c) //  3
NSTUB(err_init_task                           ,0xff815f28) //  4
//NSTUB(exmem_alloc                           ,0xff889dcc) //103            == 0xff889dcc
NSTUB(free                                    ,0xff814138) //112
//NSTUB(kbd_p1_f                              ,0xff833498) //109            == 0xff833498
NSTUB(kbd_p1_f_cont                           ,0xff8334a4) //109
NSTUB(kbd_p2_f                                ,0xff832d58) //109
NSTUB(kbd_read_keys                           ,0xff83341c) //109
NSTUB(kbd_read_keys_r2                        ,0xff85e850) //109
NSTUB(lseek                                   ,0xff835398) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203d8) //101
NSTUB(memcpy                                  ,0xff83e458) //101
NSTUB(memset                                  ,0xffa072b4) //101
NSTUB(mkdir                                   ,0xff8356f0) //  3
NSTUB(mktime_ext                              ,0xff8ad110) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
NSTUB(opendir                                 ,0xffa7d5a0) //  3
NSTUB(qsort                                   ,0xffaeb65c) //  1
NSTUB(rand                                    ,0xff8204e0) //  1
NSTUB(read                                    ,0xff81ab78) //101
NSTUB(reboot_fw_update                        ,0xffa82be4) //  1
NSTUB(set_control_event                       ,0xff8968a0) //111
NSTUB(srand                                   ,0xff8204d4) //  1
NSTUB(stat                                    ,0xff8353d4) //  3
// ALT: NSTUB(stat, 0xff86c60c) // 3 31/0
//NSTUB(strcat                                ,0xff8ac8cc) //  1            == 0xff8ac8cc
NSTUB(strchr                                  ,0xff813fc0) //  1
NSTUB(strcmp                                  ,0xff820394) //101
NSTUB(strcpy                                  ,0xff82037c) //101
NSTUB(strftime                                ,0xff8acb18) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
NSTUB(strncpy                                 ,0xff813f38) //  1
//NSTUB(strrchr                               ,0xff813fe4) //  1            == 0xff813fe4
NSTUB(strtol                                  ,0xff83e738) //101
NSTUB(strtolx                                 ,0xff83e53c) //109
  DEF(task_CaptSeq                            ,0xff87cd90) //107
  DEF(task_ExpDrv                             ,0xff8c1480) //110
  DEF(task_InitFileModules                    ,0xff89a91c) //107
  DEF(task_MovieRecord                        ,0xff879084) //107
  DEF(task_PhySw                              ,0xff833088) //107
  DEF(task_RotaryEncoder                      ,0xff85f3cc) //107
//NSTUB(time                                  ,0xff889484) //  2            == 0xff889484
NSTUB(vsprintf                                ,0xff820340) //  1
NSTUB(write                                   ,0xff83530c) //101
