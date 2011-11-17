// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R45 (DRYOS version 2.3, release #0045)
//   Firmware Ver GM1.00E
//   Canon PowerShot G12

// Values for makefile.inc
//   PLATFORMID = 12815 (0x320f) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4b                // Found @ 0xffff36ac
//   NEED_ENCODED_DISKBOOT = 5   // Found @ 0xffff36bc

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xff865690) //  2 60%    *** != 0xff810b1c
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b1c

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff89fdf0 -> ff89c600 -> ff9bd794 -> ffb1ee38 -> ffc89700
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00034474) // Found @0xff8349f4,          stubs_min = 0x00034474 (0x34474)
//DEF(physw_run                               ,0x00001c3c) // Found @0xff8345f0,          stubs_min = 0x00001c3c (0x1C30+0xC)
//DEF(levent_table                            ,0xffc0c040) // Found @0xffc0c040,          stubs_min = 0xffc0c040 (0xFFC0C040)
//DEF(FlashParamsTable                        ,0xffc89910) // Found @0xffc89910,          stubs_min = 0xffc89910 (0xFFC89910)
//DEF(movie_status                            ,0x000072d4) // Found @0xff986d88,          stubs_min = 0x000072d4 (0x7290+0x44)
//DEF(full_screen_refresh                     ,0x0000a5dc) // Found @0xffa53cb4,          stubs_min = 0x0000a5dc (0xA5DC)
//DEF(canon_menu_active                       ,0x00003214) // Found @0xff896098,          stubs_min = 0x00003214 (0x3210+4)
//DEF(canon_shoot_menu_active                 ,0x00008afd) // Found @0xff9dc738,          stubs_min = 0x00008afd (0x8AFC+1)
//DEF(playrec_mode                            ,0x00002f38) // Found @0xff8880fc,          stubs_min = 0x00002f38 (0x2F34+0x4)
//DEF(zoom_status                             ,0x0000e590) // Found @0xffb22900,          stubs_min = 0x0000e590 (0xE590)
//DEF(some_flag_for_af_scan                   ,0x000076b4) // Found @0xff98a814,          stubs_min = 0x000076b4 (0x76B4)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff85ea60
//void *vid_get_viewport_fb()      { return (void*)0x40587700; } // Found @0xffb75718
//char *camera_jpeg_count_str()    { return (char*)0x000bb618; } // Found @0xffa43614
//long hook_raw_size()             { return 0x00ee9200; }        // Found @0xffb78bd8
//int get_flash_params_count(void) { return 0x9a; }              // Found @0xff9bed2c

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffbb95f8, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x04000000 // Found @0xffbb9628, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_ZOOM_IN         ,0x00000020 }, // Found @0xffbb9500, levent 0x02
//    { 0, KEY_ZOOM_OUT        ,0x00000800 }, // Found @0xffbb9530, levent 0x03
//    { 0, KEY_LEFT            ,0x00001000 }, // Found @0xffbb9538, levent 0x06
//    { 0, KEY_SET             ,0x00002000 }, // Found @0xffbb9540, levent 0x08
//    { 0, KEY_RIGHT           ,0x00004000 }, // Found @0xffbb9548, levent 0x07
//    { 0, KEY_DOWN            ,0x00008000 }, // Found @0xffbb9550, levent 0x05
//    { 0, KEY_UP              ,0x00010000 }, // Found @0xffbb9558, levent 0x04
//    { 0, KEY_DISPLAY         ,0x00100000 }, // Found @0xffbb9570, levent 0x0a
//    { 0, KEY_MENU            ,0x00200000 }, // Found @0xffbb9578, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffbb95d0, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffbb95d0, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffbb95c8, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3744 // Found @0xff9579d0
//#define CAM_RAW_ROWS      2784 // Found @0xff9579d8
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff83af74

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffb08e90) //101
NSTUB(AllocateUncacheableMemory               ,0xff83af30) //112
NSTUB(Close                                   ,0xff8370e0) //101
NSTUB(CreateTask                              ,0xff81e8a0) //101
NSTUB(DebugAssert                             ,0xff81eb78) //111
NSTUB(DeleteFile_Fut                          ,0xff836a58) //112
NSTUB(DoAFLock                                ,0xff838940) //102
NSTUB(EnterToCompensationEVF                  ,0xff838d24) //104
NSTUB(ExecuteEventProcedure                   ,0xff8917a4) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff838d68) //104
NSTUB(ExitTask                                ,0xff81eb30) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff847454) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff8475ec) //104
NSTUB(Fclose_Fut                              ,0xff836bd4) //101
NSTUB(Feof_Fut                                ,0xff836dc0) //  1
NSTUB(Fflush_Fut                              ,0xff836dfc) //  1
NSTUB(Fgets_Fut                               ,0xff836d28) //  1
NSTUB(Fopen_Fut                               ,0xff836b94) //101
NSTUB(Fread_Fut                               ,0xff836c80) //101
NSTUB(FreeMemory                              ,0xffb08e88) //101
NSTUB(FreeUncacheableMemory                   ,0xff83af70) //112
NSTUB(Fseek_Fut                               ,0xff836d74) //101
NSTUB(Fwrite_Fut                              ,0xff836cd4) //101
NSTUB(GetBatteryTemperature                   ,0xff868f80) //102
NSTUB(GetCCDTemperature                       ,0xff868f0c) //102
NSTUB(GetCurrentAvValue                       ,0xff97fcb8) //102
NSTUB(GetDrive_ClusterSize                    ,0xff876948) //  4
NSTUB(GetDrive_FreeClusters                   ,0xff8769a8) //  4
NSTUB(GetDrive_TotalClusters                  ,0xff87697c) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff97e348) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff97e794) //  3
NSTUB(GetImageFolder                          ,0xff95f2fc) //106
NSTUB(GetKbdState                             ,0xff865678) //109
NSTUB(GetMemInfo                              ,0xff81a264) //  3
NSTUB(GetOpticalTemperature                   ,0xff868ff4) //102
NSTUB(GetParameterData                        ,0xff9becf0) //101
NSTUB(GetPropertyCase                         ,0xff8954f0) //102
NSTUB(GetSystemTime                           ,0xffb08ee8) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff9819e0) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffaf6880) //102
NSTUB(GiveSemaphore                           ,0xff83a94c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8ea5f0) //102
NSTUB(LEDDrive                                ,0xff8647ec) //103
NSTUB(LocalTime                               ,0xff88f08c) //  1
NSTUB(LockMainPower                           ,0xff89c204) //103
NSTUB(Lseek                                   ,0xff8371fc) //101
NSTUB(MakeDirectory_Fut                       ,0xff836acc) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffb72148) //102
NSTUB(MoveIrisWithAv                          ,0xffb04a28) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffb051b8) //102
NSTUB(NewTaskShell                            ,0xff894f0c) //103
NSTUB(Open                                    ,0xff837074) //101
NSTUB(PB2Rec                                  ,0xff89f18c) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff87f5c0) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff87f598) //102
NSTUB(PT_PlaySound                            ,0xff88a140) //  4
NSTUB(PostLogicalEventForNotPowerType         ,0xff899b70) //103
NSTUB(PostLogicalEventToUI                    ,0xff899bbc) //103
NSTUB(PutInNdFilter                           ,0xffb0501c) //102
NSTUB(PutOutNdFilter                          ,0xffb05040) //102
NSTUB(Read                                    ,0xff81ad74) //101
NSTUB(ReadFastDir                             ,0xffae2c20) //  4
NSTUB(Rec2PB                                  ,0xff89f1cc) //104
NSTUB(RefreshPhysicalScreen                   ,0xff8b3a68) //104
NSTUB(Remove                                  ,0xff837114) //  4
NSTUB(RenameFile_Fut                          ,0xff8369c4) //  4
NSTUB(Restart                                 ,0xff83c71c) //106
NSTUB(ScreenLock                              ,0xff8b4c98) //  4
NSTUB(ScreenUnlock                            ,0xff8b4cfc) //  3
NSTUB(SetAE_ShutterSpeed                      ,0xffb74890) //102
NSTUB(SetAutoShutdownTime                     ,0xff89c278) //103
NSTUB(SetCurrentCaptureModeType               ,0xff8a4d44) //101
NSTUB(SetFileTimeStamp                        ,0xff83737c) //  4
NSTUB(SetLogicalEventActive                   ,0xff89bf40) //101
NSTUB(SetParameterData                        ,0xff9bebc8) //101
NSTUB(SetPropertyCase                         ,0xff8953c8) //102
NSTUB(SetScriptMode                           ,0xff89bf90) //101
NSTUB(SleepTask                               ,0xff83abb4) //101
NSTUB(TakeSemaphore                           ,0xff83a87c) //101
NSTUB(TurnOffBackLight                        ,0xff8abd94) //104
NSTUB(TurnOnBackLight                         ,0xff8abd7c) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff9a9e9c) //101
NSTUB(UnlockAF                                ,0xff838978) //102
NSTUB(UnlockMainPower                         ,0xff89c158) //103
NSTUB(UnsetZoomForMovie                       ,0xff9c57dc) //104
NSTUB(UpdateMBROnFlash                        ,0xff8767c8) //  3
NSTUB(VbattGet                                ,0xff833180) //103
NSTUB(Write                                   ,0xff837170) //101
NSTUB(WriteSDCard                             ,0xff96e820) //108
NSTUB(_log                                    ,0xffbb4e00) //111
NSTUB(_log10                                  ,0xffbb3a8c) //112
NSTUB(_pow                                    ,0xffbb3bfc) //114
NSTUB(_sqrt                                   ,0xffbb6a08) //  1
NSTUB(add_ptp_handler                         ,0xffa9d218) //  3
NSTUB(apex2us                                 ,0xffa5c248) //  4
NSTUB(close                                   ,0xff81ab8c) //  1
NSTUB(closedir                                ,0xffae2a7c) //  4
NSTUB(err_init_task                           ,0xff815fd4) //  4
NSTUB(exmem_alloc                             ,0xff88ffd8) //103
NSTUB(free                                    ,0xff814244) //112
NSTUB(kbd_p1_f                                ,0xff834a6c) //109
NSTUB(kbd_p1_f_cont                           ,0xff834a78) //109
NSTUB(kbd_p2_f                                ,0xff8342bc) //109
NSTUB(kbd_read_keys                           ,0xff8349f4) //109
NSTUB(kbd_read_keys_r2                        ,0xff864d8c) //109
NSTUB(lseek                                   ,0xff8371fc) //101
NSTUB(malloc                                  ,0xff8141e8) //112
NSTUB(memcmp                                  ,0xff8206d8) //101
NSTUB(memcpy                                  ,0xff840674) //101
NSTUB(memset                                  ,0xffa5b230) //101
NSTUB(mkdir                                   ,0xff83757c) //  4
NSTUB(mktime_ext                              ,0xff8b5b6c) //  1
NSTUB(open                                    ,0xff81aadc) //  1
NSTUB(opendir                                 ,0xffae2acc) //  4
NSTUB(openfastdir                             ,0xffae2acc) //  4
NSTUB(qsort                                   ,0xffb5fbdc) //  4
NSTUB(rand                                    ,0xffa5b370) //  4
NSTUB(read                                    ,0xff81ad74) //101
NSTUB(readfastdir                             ,0xffae2c20) //  4
NSTUB(reboot_fw_update                        ,0xffae8040) //  4
NSTUB(rename                                  ,0xff8369c4) //  4
NSTUB(set_control_event                       ,0xff89bb30) //111
NSTUB(srand                                   ,0xffa5b364) //  4
NSTUB(stat                                    ,0xff837244) //  3
NSTUB(strcat                                  ,0xff8b5328) //  1
NSTUB(strchr                                  ,0xff8140b4) //  1
NSTUB(strcmp                                  ,0xff820694) //101
NSTUB(strcpy                                  ,0xff82067c) //101
NSTUB(strftime                                ,0xff8b5574) //113
NSTUB(strlen                                  ,0xff814100) //101
NSTUB(strncmp                                 ,0xff814068) //  1
NSTUB(strncpy                                 ,0xff81402c) //  1
NSTUB(strrchr                                 ,0xff8140d8) //  1
NSTUB(strtol                                  ,0xff840954) //101
NSTUB(strtolx                                 ,0xff840758) //109
  DEF(task_CaptSeq                            ,0xff88261c) //107
  DEF(task_ExpDrv                             ,0xff8cc0d0) //110
  DEF(task_InitFileModules                    ,0xff89fc7c) //107
  DEF(task_MovieRecord                        ,0xff987094) //107
  DEF(task_PhySw                              ,0xff8345ec) //107
  DEF(task_RotaryEncoder                      ,0xff8657ec) //107
NSTUB(time                                    ,0xff88f66c) //  2
NSTUB(vsprintf                                ,0xff820640) //  4
NSTUB(write                                   ,0xff837170) //101
