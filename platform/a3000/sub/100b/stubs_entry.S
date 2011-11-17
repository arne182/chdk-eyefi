// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R43 (DRYOS version 2.3, release #0043)
//   Firmware Ver GM1.00B
//   Canon PowerShot A3000 IS

// Values for makefile.inc
//   PLATFORMID = 12786 (0x31f2) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d4a                // Found @ 0xffff1aac
//   NEED_ENCODED_DISKBOOT = 4   // Found @ 0xffff1abc

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DoAFLock                              ,0xffc27744) //102        *** != 0xffc59f28
//NSTUB(GetDrive_FreeClusters                 ,0xffc239b8) //  3        *** != 0xffc524a0
// ALT: NSTUB(GetDrive_FreeClusters, 0xffc524a0) // 4 9/0
//NSTUB(LEDDrive                              ,0xffc43a04) //103        *** != 0xffc43acc
//NSTUB(ScreenLock                            ,0xffd86cec) //  3        *** != 0xffd86ef4
//NSTUB(ScreenUnlock                          ,0xffd86d30) //  7        *** != 0xffd85ba4
//NSTUB(SetScriptMode                         ,0xffc6fce8) //101        *** != 0xffc00f70
//NSTUB(UnlockAF                              ,0xffc2777c) //102        *** != 0xffc59f38
//NSTUB(kbd_pwr_off                           ,0xffc445a0) //  2 64%    *** != 0xffc43e0c
NSTUB(kbd_pwr_on                              ,0xffc44560) //  2 82%
//NSTUB(rename                                ,0xffc25b9c) //  4        *** != 0xffc26394

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc737e8 -> ffc70318 -> ffd35be4 -> ffe16178 -> ffeddac4
// Mode  2609 in firmware but not in current modemap

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0002eed4) // Found @0xffc23cd4,          stubs_min = 0x0002eed4 (0x2EED4)
//DEF(physw_run                               ,0x00001bf0) // Found @0xffc23938,          stubs_min = 0x00001bf0 (0x1BE4+0x0C)
//DEF(levent_table                            ,0xffeafd60) // Found @0xffeafd60,          stubs_min = 0xffeafd60 (0xFFEAFD60)
//DEF(FlashParamsTable                        ,0xffeddcbc) // Found @0xffeddcbc,          stubs_min = 0xffeddcbc (0xFFEDDCBC)
//DEF(movie_status                            ,0x000056f8) // Found @0xffd135c8,          stubs_min = 0x000056f8 (0x56C0+0x38)
//DEF(full_screen_refresh                     ,0x000076cc) // Found @0xffd8515c,          stubs_min = 0x000076cc (0x76CC)
//DEF(canon_menu_active                       ,0x00002b7c) // Found @0xffc6d1bc,          stubs_min = 0x00002b7c (0x2B78+4)
//DEF(canon_shoot_menu_active                 ,0x000068b1) // Found @0xffd481ac,          stubs_min = 0x000068b1 (0x68B0+1)
//DEF(playrec_mode                            ,0x000028d8) // Found @0xffc608f4,          stubs_min = 0x000028d8 (0x28D4+0x4)
//DEF(zoom_status                             ,0x00009cd8) // Found @0xffe184b8,          stubs_min = 0x00009cd8 (0x9CD8)
//DEF(some_flag_for_af_scan                   ,0x00005aa0) // Found @0xffd15f54,          stubs_min = 0x00005aa0 (0x5AA0)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc3fc80
//void *vid_get_viewport_fb()      { return (void*)0x10650100; } // Found @0xffe626a8
//char *camera_jpeg_count_str()    { return (char*)0x00075120; } // Found @0xffd7bce0
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffe65a38
//int get_flash_params_count(void) { return 0x94; }              // Found @0xffd36ca0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe916bc, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe916c8, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffe91608, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffe91614, levent 0x03
//    { 2, KEY_UP              ,0x00000010 }, // Found @0xffe91620, levent 0x04
//    { 2, KEY_DOWN            ,0x00000020 }, // Found @0xffe9162c, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000040 }, // Found @0xffe91638, levent 0x07
//    { 2, KEY_LEFT            ,0x00000080 }, // Found @0xffe91644, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe91650, levent 0x08
//    { 2, KEY_MENU            ,0x00000200 }, // Found @0xffe9165c, levent 0x09
//    { 2, KEY_DISPLAY         ,0x00000400 }, // Found @0xffe91668, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffe915fc, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffe915fc, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffe915f0, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3720 // Found @0xffcee5ec
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc296f0

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffe081b0) //101
NSTUB(AllocateUncacheableMemory               ,0xffc296ac) //112
NSTUB(Close                                   ,0xffc262b8) //101
NSTUB(CreateTask                              ,0xffc0f110) //101
NSTUB(DebugAssert                             ,0xffc0f5e8) //111
NSTUB(DeleteFile_Fut                          ,0xffc25c30) //112
//NSTUB(EnterToCompensationEVF                ,0xffc277f4) //104            == 0xffc277f4
NSTUB(ExecuteEventProcedure                   ,0xffc68908) //  1
//NSTUB(ExitFromCompensationEVF               ,0xffc27838) //104            == 0xffc27838
NSTUB(ExitTask                                ,0xffc0f3a0) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc35110) //104            == 0xffc35110
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc351e8) //104            == 0xffc351e8
NSTUB(Fclose_Fut                              ,0xffc25dac) //101
NSTUB(Feof_Fut                                ,0xffc25f98) //  1
NSTUB(Fflush_Fut                              ,0xffc25fd4) //  1
NSTUB(Fgets_Fut                               ,0xffc25f00) //  1
NSTUB(Fopen_Fut                               ,0xffc25d6c) //101
NSTUB(Fread_Fut                               ,0xffc25e58) //101
NSTUB(FreeMemory                              ,0xffe081a8) //101
NSTUB(FreeUncacheableMemory                   ,0xffc296ec) //112
NSTUB(Fseek_Fut                               ,0xffc25f4c) //101
NSTUB(Fwrite_Fut                              ,0xffc25eac) //101
NSTUB(GetBatteryTemperature                   ,0xffc46680) //102
NSTUB(GetCCDTemperature                       ,0xffc4660c) //102
NSTUB(GetCurrentAvValue                       ,0xffd0c980) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc52440) //  4
NSTUB(GetDrive_TotalClusters                  ,0xffc52474) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xffd0bc78) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd0c0d0) //  3
NSTUB(GetImageFolder                          ,0xffcf55a8) //106
NSTUB(GetKbdState                             ,0xffc4452c) //109
NSTUB(GetMemInfo                              ,0xffc0a760) //  3
NSTUB(GetOpticalTemperature                   ,0xffc466f4) //102
NSTUB(GetParameterData                        ,0xffd36c60) //101
NSTUB(GetPropertyCase                         ,0xffc6c614) //102
NSTUB(GetSystemTime                           ,0xffe08208) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd0fa4c) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffdff83c) //102
NSTUB(GiveSemaphore                           ,0xffc0f06c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffcaac20) //102
NSTUB(LocalTime                               ,0xffc66618) //  1
NSTUB(LockMainPower                           ,0xffc6ff20) //103
//NSTUB(Lseek                                 ,0xffc263d4) //101            == 0xffc263d4
NSTUB(MakeDirectory_Fut                       ,0xffc25ca4) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe5f128) //102
NSTUB(MoveIrisWithAv                          ,0xffe04ffc) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffe0558c) //102
NSTUB(NewTaskShell                            ,0xffc6c020) //103
NSTUB(Open                                    ,0xffc2624c) //101
//NSTUB(PB2Rec                                ,0xffc72ce8) //104            == 0xffc72ce8
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc59ed8) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc59eb0) //102
//NSTUB(PT_PlaySound                          ,0xffc62498) //  7            == 0xffc62498
NSTUB(PostLogicalEventForNotPowerType         ,0xffc6f750) //103
NSTUB(PostLogicalEventToUI                    ,0xffc6f79c) //103
//NSTUB(PutInNdFilter                         ,0xffe053f0) //102            == 0xffe053f0
//NSTUB(PutOutNdFilter                        ,0xffe05414) //102            == 0xffe05414
NSTUB(Read                                    ,0xffc0b270) //101
//NSTUB(ReadFastDir                           ,0xffdf6364) //  4            == 0xffdf6364
//NSTUB(Rec2PB                                ,0xffc72d28) //104            == 0xffc72d28
//NSTUB(RefreshPhysicalScreen                 ,0xffd85b40) //104            == 0xffd85b40
//NSTUB(Remove                                ,0xffc262ec) //  4            == 0xffc262ec
//NSTUB(RenameFile_Fut                        ,0xffc25b9c) //  4            == 0xffc25b9c
NSTUB(Restart                                 ,0xffc2ae90) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffe618b8) //102
NSTUB(SetAutoShutdownTime                     ,0xffc6ff94) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc76624) //101
//NSTUB(SetFileTimeStamp                      ,0xffc26554) //  4            == 0xffc26554
NSTUB(SetLogicalEventActive                   ,0xffc6fc98) //101
NSTUB(SetParameterData                        ,0xffd36bd0) //101
NSTUB(SetPropertyCase                         ,0xffc6c4e4) //102
NSTUB(SleepTask                               ,0xffc29530) //101
NSTUB(TakeSemaphore                           ,0xffc0ef9c) //101
//NSTUB(TurnOffBackLight                      ,0xffc7b3f0) //104            == 0xffc7b3f0
//NSTUB(TurnOnBackLight                       ,0xffc7b3d8) //104            == 0xffc7b3d8
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xffd272e8) //103            == 0xffd272e8
NSTUB(UnlockMainPower                         ,0xffc6fe74) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd3cba4) //104            == 0xffd3cba4
NSTUB(UpdateMBROnFlash                        ,0xffc522c0) //  3
NSTUB(VbattGet                                ,0xffc22cf0) //103
NSTUB(Write                                   ,0xffc26348) //101
NSTUB(WriteSDCard                             ,0xffd00c9c) //108
NSTUB(_log                                    ,0xffe8ea34) //111
NSTUB(_log10                                  ,0xffe8d978) //112
NSTUB(_pow                                    ,0xffe8dae8) //114
NSTUB(_sqrt                                   ,0xffe8fd9c) //  1
//NSTUB(add_ptp_handler                       ,0xffdc8de4) //  3            == 0xffdc8de4
//NSTUB(apex2us                               ,0xffd8803c) //  4            == 0xffd8803c
NSTUB(close                                   ,0xffc0b088) //  1
//NSTUB(closedir                              ,0xffdf61c0) //  4            == 0xffdf61c0
NSTUB(err_init_task                           ,0xffc05f50) //  4
NSTUB(exmem_alloc                             ,0xffc672b8) //103
NSTUB(free                                    ,0xffc04160) //112
NSTUB(kbd_p1_f                                ,0xffc23d54) //109
NSTUB(kbd_p1_f_cont                           ,0xffc23d60) //109
NSTUB(kbd_p2_f                                ,0xffc23604) //109
NSTUB(kbd_read_keys                           ,0xffc23cd4) //109
//NSTUB(kbd_read_keys_r2                      ,0xffc43eac) //109            == 0xffc43eac
//NSTUB(lseek                                 ,0xffc263d4) //101            == 0xffc263d4
NSTUB(malloc                                  ,0xffc04104) //112
NSTUB(memcmp                                  ,0xffc11280) //101
NSTUB(memcpy                                  ,0xffc2ec8c) //101
NSTUB(memset                                  ,0xffd87074) //101
NSTUB(mkdir                                   ,0xffc26754) //  4
NSTUB(mktime_ext                              ,0xffc806ac) //  1
NSTUB(open                                    ,0xffc0afd8) //  1
NSTUB(opendir                                 ,0xffdf6210) //  4
//NSTUB(openfastdir                           ,0xffdf6210) //  4            == 0xffdf6210
//NSTUB(qsort                                 ,0xffe4719c) //  4            == 0xffe4719c
NSTUB(rand                                    ,0xffc11388) //  1
NSTUB(read                                    ,0xffc0b270) //101
//NSTUB(readfastdir                           ,0xffdf6364) //  4            == 0xffdf6364
//NSTUB(reboot_fw_update                      ,0xffdf7bd8) //  1            == 0xffdf7bd8
//NSTUB(set_control_event                     ,0xffc6f9b8) //111            == 0xffc6f9b8
NSTUB(srand                                   ,0xffc1137c) //  1
NSTUB(stat                                    ,0xffc2641c) //  3
//NSTUB(strcat                                ,0xffc7fe68) //  1            == 0xffc7fe68
NSTUB(strchr                                  ,0xffc03fe8) //  1
NSTUB(strcmp                                  ,0xffc1123c) //101
NSTUB(strcpy                                  ,0xffc11224) //101
NSTUB(strftime                                ,0xffc800b4) //113
NSTUB(strlen                                  ,0xffc04034) //101
NSTUB(strncmp                                 ,0xffc03f9c) //  1
NSTUB(strncpy                                 ,0xffc03f60) //  1
//NSTUB(strrchr                               ,0xffc0400c) //  1            == 0xffc0400c
NSTUB(strtol                                  ,0xffc2ef6c) //101
NSTUB(strtolx                                 ,0xffc2ed70) //109
  DEF(task_CaptSeq                            ,0xffc5c198) //107
  DEF(task_ExpDrv                             ,0xffc94ff8) //110
  DEF(task_InitFileModules                    ,0xffc73674) //107
  DEF(task_MovieRecord                        ,0xffd1381c) //107
  DEF(task_PhySw                              ,0xffc23934) //107
NSTUB(time                                    ,0xffc664cc) //  1
NSTUB(vsprintf                                ,0xffc111e8) //  4
NSTUB(write                                   ,0xffc26348) //101
