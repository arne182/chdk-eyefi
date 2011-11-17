// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R45 (DRYOS version 2.3, release #0045)
//   Firmware Ver GM1.00H
//   Canon PowerShot S95

// Values for makefile.inc
//   PLATFORMID = 12818 (0x3212) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4b                // Found @ 0xffff3624
//   NEED_ENCODED_DISKBOOT = 5   // Found @ 0xffff3634

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xff865728) //  2 60%    *** != 0x00000000
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8a0c14 -> ff89d474 -> ff9ba948 -> ffb0f330 -> ffc722bc
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00034cb4) // Found @0xff83498c,          stubs_min = 0x00034cb4 (0x34CB4)
//DEF(physw_run                               ,0x00001c3c) // Found @0xff834580,          stubs_min = 0x00001c3c (0x1C30+0x0C)
//DEF(levent_table                            ,0xffbf5e0c) // Found @0xffbf5e0c,          stubs_min = 0xffbf5e0c (0xFFBF5E0C)
//DEF(FlashParamsTable                        ,0xffc724c4) // Found @0xffc724c4,          stubs_min = 0xffc724c4 (0xFFC724C4)
//DEF(movie_status                            ,0x0000716c) // Found @0xff986120,          stubs_min = 0x0000716c (0x7128+0x44)
//DEF(full_screen_refresh                     ,0x0000a0d4) // Found @0xffa47620
//DEF(canon_menu_active                       ,0x00003250) // Found @0xff896fc0,          stubs_min = 0x00003250 (0x324c+4)
//DEF(canon_shoot_menu_active                 ,0x00008759) // Found @0xff9d7e04,          stubs_min = 0x00008759 (0x8758+1)
//DEF(playrec_mode                            ,0x00002f78) // Found @0xff88910c,          stubs_min = 0x00002f78 (0x2f74+0x4)
//DEF(zoom_status                             ,0x0000835c) // Found @0xff9c3390,          stubs_min = 0x0000835c (0x835C)
//DEF(some_flag_for_af_scan                   ,0x00007534) // Found @0xff9894c0,          stubs_min = 0x00007534 (0x7534)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff85e704
//void *vid_get_viewport_fb()      { return (void*)0x40587700; } // Found @0xffb61b74
//char *camera_jpeg_count_str()    { return (char*)0x000bbc9c; } // Found @0xffa3acd0
//long hook_raw_size()             { return 0x00ee9200; }        // Found @0xffb65034
//int get_flash_params_count(void) { return 0x9a; }              // Found @0xff9bbee0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffba53fc, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x04000000 // Found @0xffba5424, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffba5364, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00000020 }, // Found @0xffba536c, levent 0x03
//    { 1, KEY_LEFT            ,0x00000100 }, // Found @0xffba5384, levent 0x06
//    { 1, KEY_RIGHT           ,0x00000200 }, // Found @0xffba538c, levent 0x07
//    { 1, KEY_DOWN            ,0x00000400 }, // Found @0xffba5394, levent 0x05
//    { 1, KEY_DISPLAY         ,0x00001000 }, // Found @0xffba53a4, levent 0x0a
//    { 1, KEY_MENU            ,0x00002000 }, // Found @0xffba53ac, levent 0x09
//    { 1, KEY_UP              ,0x00004000 }, // Found @0xffba53b4, levent 0x04
//    { 1, KEY_SET             ,0x00008000 }, // Found @0xffba53bc, levent 0x08
//    { 2, KEY_SHOOT_FULL      ,0x00000300 }, // Found @0xffba53cc, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000200 }, // Found @0xffba53cc, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000100 }, // Found @0xffba53c4, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3744 // Found @0xff956f20
//#define CAM_RAW_ROWS      2784 // Found @0xff956f28
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff83ae0c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffafae8c) //101
NSTUB(AllocateUncacheableMemory               ,0xff83adc8) //112
//NSTUB(Close                                 ,0xff837030) //101            == 0xff837030
NSTUB(CreateTask                              ,0xff81e8a0) //101
NSTUB(DebugAssert                             ,0xff81eb78) //111
NSTUB(DeleteFile_Fut                          ,0xff8369a8) //112
//NSTUB(DoAFLock                              ,0xff8388a0) //102            == 0xff8388a0
//NSTUB(EnterToCompensationEVF                ,0xff838b40) //104            == 0xff838b40
NSTUB(ExecuteEventProcedure                   ,0xff89270c) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff838be4) //104            == 0xff838be4
//NSTUB(ExitTask                              ,0xff81eb30) //101            == 0xff81eb30
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff84734c) //104            == 0xff84734c
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff8474e4) //104
NSTUB(Fclose_Fut                              ,0xff836b24) //101
NSTUB(Feof_Fut                                ,0xff836d10) //  1
NSTUB(Fflush_Fut                              ,0xff836d4c) //  1
NSTUB(Fgets_Fut                               ,0xff836c78) //  1
NSTUB(Fopen_Fut                               ,0xff836ae4) //101
NSTUB(Fread_Fut                               ,0xff836bd0) //101
NSTUB(FreeMemory                              ,0xffafae84) //101
//NSTUB(FreeUncacheableMemory                 ,0xff83ae08) //112            == 0xff83ae08
NSTUB(Fseek_Fut                               ,0xff836cc4) //101
NSTUB(Fwrite_Fut                              ,0xff836c24) //101
//NSTUB(GetBatteryTemperature                 ,0xff869038) //102            == 0xff869038
//NSTUB(GetCCDTemperature                     ,0xff868fc4) //102            == 0xff868fc4
//NSTUB(GetCurrentAvValue                     ,0xff97e4b4) //102            == 0xff97e4b4
//NSTUB(GetDrive_ClusterSize                  ,0xff8769c8) //  4            == 0xff8769c8
//NSTUB(GetDrive_FreeClusters                 ,0xff876a28) //  4            == 0xff876a28
//NSTUB(GetDrive_TotalClusters                ,0xff8769fc) //  3            == 0xff8769fc
//NSTUB(GetFocusLensSubjectDistance           ,0xff97cb44) //102            == 0xff97cb44
//NSTUB(GetFocusLensSubjectDistanceFromLens   ,0xff97cf90) //  3            == 0xff97cf90
//NSTUB(GetImageFolder                        ,0xff95e84c) //106            == 0xff95e84c
//NSTUB(GetKbdState                           ,0xff8655f0) //109            == 0xff8655f0
//NSTUB(GetMemInfo                            ,0xff81a264) //  3            == 0xff81a264
//NSTUB(GetOpticalTemperature                 ,0xff8690ac) //102            == 0xff8690ac
//NSTUB(GetParameterData                      ,0xff9bbea4) //101            == 0xff9bbea4
//NSTUB(GetPropertyCase                       ,0xff896414) //102            == 0xff896414
//NSTUB(GetSystemTime                         ,0xffafaee4) //101            == 0xffafaee4
//NSTUB(GetZoomLensCurrentPoint               ,0xff980d38) //102            == 0xff980d38
//NSTUB(GetZoomLensCurrentPosition            ,0xffae90f4) //102            == 0xffae90f4
NSTUB(GiveSemaphore                           ,0xff83a7e4) //112
//NSTUB(IsStrobeChargeCompleted               ,0xff8eae58) //102            == 0xff8eae58
//NSTUB(LEDDrive                              ,0xff86491c) //103            == 0xff86491c
NSTUB(LocalTime                               ,0xff88fff4) //  1
//NSTUB(LockMainPower                         ,0xff89d078) //103            == 0xff89d078
//NSTUB(Lseek                                 ,0xff83714c) //101            == 0xff83714c
//NSTUB(MakeDirectory_Fut                     ,0xff836a1c) //  1            == 0xff836a1c
//NSTUB(MoveFocusLensToDistance               ,0xffb5e59c) //102            == 0xffb5e59c
NSTUB(MoveIrisWithAv                          ,0xffaf7418) //102
//NSTUB(MoveZoomLensWithPoint                 ,0xffaf7b04) //102            == 0xffaf7b04
//NSTUB(NewTaskShell                          ,0xff895e30) //103            == 0xff895e30
//NSTUB(Open                                  ,0xff836fc4) //101            == 0xff836fc4
//NSTUB(PB2Rec                                ,0xff8a0008) //104            == 0xff8a0008
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8806a4) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff88067c) //102
//NSTUB(PT_PlaySound                          ,0xff88b0a8) //  4            == 0xff88b0a8
//NSTUB(PostLogicalEventForNotPowerType       ,0xff89aa88) //103            == 0xff89aa88
//NSTUB(PostLogicalEventToUI                  ,0xff89aad4) //103            == 0xff89aad4
NSTUB(PutInNdFilter                           ,0xffb5c2bc) //102
NSTUB(PutOutNdFilter                          ,0xffb5c2f4) //102
NSTUB(Read                                    ,0xff81ad74) //101
//NSTUB(ReadFastDir                           ,0xffad413c) //  4            == 0xffad413c
//NSTUB(Rec2PB                                ,0xff8a0048) //104            == 0xff8a0048
//NSTUB(RefreshPhysicalScreen                 ,0xff8b6c8c) //104            == 0xff8b6c8c
//NSTUB(Remove                                ,0xff837064) //  4            == 0xff837064
//NSTUB(RenameFile_Fut                        ,0xff836914) //  4            == 0xff836914
//NSTUB(Restart                               ,0xff83c5b8) //106            == 0xff83c5b8
//NSTUB(ScreenLock                            ,0xff8b7e50) //  4            == 0xff8b7e50
//NSTUB(ScreenUnlock                          ,0xff8b7eb4) //  9            == 0xff8b7eb4
NSTUB(SetAE_ShutterSpeed                      ,0xffb60cec) //102
//NSTUB(SetAutoShutdownTime                   ,0xff89d0ec) //103            == 0xff89d0ec
//NSTUB(SetCurrentCaptureModeType             ,0xff8a5444) //101            == 0xff8a5444
//NSTUB(SetFileTimeStamp                      ,0xff8372cc) //  4            == 0xff8372cc
//NSTUB(SetLogicalEventActive                 ,0xff89cdb4) //101            == 0xff89cdb4
//NSTUB(SetParameterData                      ,0xff9bbd7c) //101            == 0xff9bbd7c
//NSTUB(SetPropertyCase                       ,0xff8962ec) //102            == 0xff8962ec
//NSTUB(SetScriptMode                         ,0xff89ce04) //101            == 0xff89ce04
//NSTUB(SleepTask                             ,0xff83aa4c) //101            == 0xff83aa4c
//NSTUB(TakeSemaphore                         ,0xff83a714) //101            == 0xff83a714
//NSTUB(TurnOffBackLight                      ,0xff8af278) //104            == 0xff8af278
//NSTUB(TurnOnBackLight                       ,0xff8af260) //104            == 0xff8af260
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff9a7d6c) //101            == 0xff9a7d6c
//NSTUB(UnlockAF                              ,0xff8388d8) //102            == 0xff8388d8
//NSTUB(UnlockMainPower                       ,0xff89cfcc) //103            == 0xff89cfcc
//NSTUB(UnsetZoomForMovie                     ,0xff8ab114) //104            == 0xff8ab114
NSTUB(UpdateMBROnFlash                        ,0xff876848) //  3
//NSTUB(VbattGet                              ,0xff833188) //103            == 0xff833188
NSTUB(Write                                   ,0xff8370c0) //101
//NSTUB(WriteSDCard                           ,0xff96dd64) //108            == 0xff96dd64
NSTUB(_log                                    ,0xffba0c5c) //111
NSTUB(_log10                                  ,0xffb9f8e8) //112
NSTUB(_pow                                    ,0xffb9fa58) //114
NSTUB(_sqrt                                   ,0xffba2864) //  1
//NSTUB(add_ptp_handler                       ,0xffa8e800) //  3            == 0xffa8e800
//NSTUB(apex2us                               ,0xffa50d94) //  4            == 0xffa50d94
NSTUB(close                                   ,0xff81ab8c) //  1
//NSTUB(closedir                              ,0xffad3f98) //  4            == 0xffad3f98
NSTUB(err_init_task                           ,0xff815fd4) //  4
NSTUB(exmem_alloc                             ,0xff890f40) //103
//NSTUB(free                                  ,0xff814244) //112            == 0xff814244
//NSTUB(kbd_p1_f                              ,0xff834a04) //109            == 0xff834a04
//NSTUB(kbd_p1_f_cont                         ,0xff834a10) //109            == 0xff834a10
//NSTUB(kbd_p2_f                              ,0xff83424c) //109            == 0xff83424c
//NSTUB(kbd_read_keys                         ,0xff83498c) //109            == 0xff83498c
//NSTUB(kbd_read_keys_r2                      ,0xff864ee8) //109            == 0xff864ee8
//NSTUB(lseek                                 ,0xff83714c) //101            == 0xff83714c
NSTUB(malloc                                  ,0xff8141e8) //112
NSTUB(memcmp                                  ,0xff8206e0) //101
NSTUB(memcpy                                  ,0xff840588) //101
NSTUB(memset                                  ,0xffa4fd7c) //101
//NSTUB(mkdir                                 ,0xff8374cc) //  4            == 0xff8374cc
NSTUB(mktime_ext                              ,0xff8b8c58) //  1
NSTUB(open                                    ,0xff81aadc) //  1
//NSTUB(opendir                               ,0xffad3fe8) //  4            == 0xffad3fe8
//NSTUB(openfastdir                           ,0xffad3fe8) //  4            == 0xffad3fe8
//NSTUB(qsort                                 ,0xffb4c038) //  4            == 0xffb4c038
//NSTUB(rand                                  ,0xffa4febc) //  4            == 0xffa4febc
NSTUB(read                                    ,0xff81ad74) //101
//NSTUB(readfastdir                           ,0xffad413c) //  4            == 0xffad413c
//NSTUB(reboot_fw_update                      ,0xffad955c) //  4            == 0xffad955c
//NSTUB(rename                                ,0xff836914) //  4            == 0xff836914
//NSTUB(set_control_event                     ,0xff89c9a4) //111            == 0xff89c9a4
//NSTUB(srand                                 ,0xffa4feb0) //  4            == 0xffa4feb0
NSTUB(stat                                    ,0xff837194) //  3
//NSTUB(strcat                                ,0xff8b8414) //  1            == 0xff8b8414
//NSTUB(strchr                                ,0xff8140b4) //  1            == 0xff8140b4
NSTUB(strcmp                                  ,0xff82069c) //101
NSTUB(strcpy                                  ,0xff820684) //101
NSTUB(strftime                                ,0xff8b8660) //113
//NSTUB(strlen                                ,0xff814100) //101            == 0xff814100
NSTUB(strncmp                                 ,0xff814068) //  1
//NSTUB(strncpy                               ,0xff81402c) //  1            == 0xff81402c
//NSTUB(strrchr                               ,0xff8140d8) //  1            == 0xff8140d8
//NSTUB(strtol                                ,0xff840868) //101            == 0xff840868
NSTUB(strtolx                                 ,0xff84066c) //109
  DEF(task_CaptSeq                            ,0xff88322c) //107
  DEF(task_ExpDrv                             ,0xff8cf1a8) //110
  DEF(task_InitFileModules                    ,0xff8a0aa0) //107
  DEF(task_MovieRecord                        ,0xff98642c) //107
  DEF(task_PhySw                              ,0xff83457c) //107
  DEF(task_RotaryEncoder                      ,0xff865894) //107
//NSTUB(time                                  ,0xff8905d4) //  2            == 0xff8905d4
NSTUB(vsprintf                                ,0xff820648) //  4
//NSTUB(write                                 ,0xff8370c0) //101            == 0xff8370c0
