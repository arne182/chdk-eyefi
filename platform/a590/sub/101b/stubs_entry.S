// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.01B
//   Canon PowerShot A590 IS

// Values for makefile.inc
//   PLATFORMID = 12662 (0x3176) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d3enc              // Found @ 0xffff1ad8
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1ab8

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
NSTUB(kbd_pwr_off                             ,0xffc356b8) //  2 67%
NSTUB(kbd_pwr_on                              ,0xffc35678) //  2 86%
//NSTUB(rename                                ,0xffc133e0) //  1        *** != 0xffc13c5c
//NSTUB(write                                 ,0xffc13c34) //101        *** != 0xffc0a1bc

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc65928 -> ffc62504 -> ffd3423c -> ffdfe960 -> ffeaed68
// Mode 32791 in firmware but not in current modemap

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000f11c) // Found @0xffc11c30,          stubs_min = 0x0000f11c (0xF11C)
//DEF(physw_run                               ,0x00001bf0) // Found @0xffc118cc,          stubs_min = 0x00001bf0 (0x1BF0)
//DEF(levent_table                            ,0xffe8de14) // Found @0xffe8de14,          stubs_min = 0xffe8de14 (0xFFE8DE14)
//DEF(FlashParamsTable                        ,0xffeaef24) // Found @0xffeaef24,          stubs_min = 0xffeaef24 (0xFFEAEF24)
//DEF(movie_status                            ,0x000053c8) // Found @0xffc4b958,          stubs_min = 0x000053c8 (0x53c8)
//DEF(canon_menu_active                       ,0x00008d20) // Found @0xffd29ef8,          stubs_min = 0x00008d20 (0x8D20)
//DEF(canon_shoot_menu_active                 ,0x00009641) // Found @0xffd444a4,          stubs_min = 0x00009641 (0x9641)
//DEF(playrec_mode                            ,0x00005538) // Found @0xffc52108,          stubs_min = 0x00005538 (0x5534+4)
//DEF(zoom_status                             ,0x0000bfbc) // Found @0xffe00160,          stubs_min = 0x0000bfbc (0xBFBC)
//DEF(some_flag_for_af_scan                   ,0x0000bd3c) // Found @0xffdee824,          stubs_min = 0x0000bd3c (0xBD3C)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc31338
//void *vid_get_viewport_fb()      { return (void*)0x10659e80; } // Found @0xffe42a2c
//char *camera_jpeg_count_str()    { return (char*)0x00049344; } // Found @0xffd727b0
//long hook_raw_size()             { return 0x009e6fc4; }        // Found @0xffe44cb8
//int get_flash_params_count(void) { return 0x73; }              // Found @0xffd352f8

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe6ed9c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe6eda8, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_SHOOT_FULL      ,0xc0000000 }, // Found @0xffe6ecc4, levent 0x01
//    { 1, KEY_SHOOT_FULL_ONLY ,0x80000000 }, // Found @0xffe6ecc4, levent 0x01
//    { 1, KEY_SHOOT_HALF      ,0x40000000 }, // Found @0xffe6ecb8, levent 0x00
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffe6ece8, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffe6ecf4, levent 0x03
//    { 2, KEY_UP              ,0x00000010 }, // Found @0xffe6ed00, levent 0x04
//    { 2, KEY_DOWN            ,0x00000020 }, // Found @0xffe6ed0c, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000040 }, // Found @0xffe6ed18, levent 0x07
//    { 2, KEY_LEFT            ,0x00000080 }, // Found @0xffe6ed24, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe6ed30, levent 0x08
//    { 2, KEY_MENU            ,0x00000200 }, // Found @0xffe6ed3c, levent 0x09
//    { 2, KEY_DISPLAY         ,0x00000400 }, // Found @0xffe6ed48, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3336 // Found @0xffe3c23c
//#define CAM_RAW_ROWS      2490 // Found @0xffe3c240
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc18320

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffdf1d70) //101
NSTUB(AllocateUncacheableMemory               ,0xffc182e4) //112
NSTUB(Close                                   ,0xffc13b88) //101
NSTUB(CreateTask                              ,0xffc0b8e0) //101
NSTUB(DebugAssert                             ,0xffc0bdb8) //111
NSTUB(DeleteFile_Fut                          ,0xffc13434) //112
//NSTUB(DoAFLock                              ,0xffc15b04) //102            == 0xffc15b04
NSTUB(EnterToCompensationEVF                  ,0xffc15f54) //104
//NSTUB(ExecuteEventProcedure                 ,0xffc59eb4) //  1            == 0xffc59eb4
//NSTUB(ExitFromCompensationEVF               ,0xffc15fa4) //104            == 0xffc15fa4
NSTUB(ExitTask                                ,0xffc0bb70) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc21f10) //104            == 0xffc21f10
NSTUB(ExpCtrlTool_StopContiAE                 ,0xffc22054) //104
NSTUB(Fclose_Fut                              ,0xffc135b0) //101
NSTUB(Feof_Fut                                ,0xffc1379c) //  1
NSTUB(Fflush_Fut                              ,0xffc137d8) //  1
NSTUB(Fgets_Fut                               ,0xffc13704) //  1
NSTUB(Fopen_Fut                               ,0xffc13570) //101
NSTUB(Fread_Fut                               ,0xffc1365c) //101
NSTUB(FreeMemory                              ,0xffdf1d68) //101
NSTUB(FreeUncacheableMemory                   ,0xffc18318) //112
NSTUB(Fseek_Fut                               ,0xffc13750) //101
NSTUB(Fwrite_Fut                              ,0xffc136b0) //101
NSTUB(GetBatteryTemperature                   ,0xffc377b4) //102
NSTUB(GetCCDTemperature                       ,0xffc37744) //102
NSTUB(GetCurrentAvValue                       ,0xffd0ce14) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc41688) //  1
NSTUB(GetDrive_FreeClusters                   ,0xffc416f0) //  1
NSTUB(GetDrive_TotalClusters                  ,0xffc416bc) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xffd0b310) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd0b61c) //  1
NSTUB(GetKbdState                             ,0xffc35644) //109
NSTUB(GetMemInfo                              ,0xffc03c40) //  1
NSTUB(GetOpticalTemperature                   ,0xffc37824) //102
NSTUB(GetParameterData                        ,0xffd352b8) //101
NSTUB(GetPropertyCase                         ,0xffc5dab4) //102
NSTUB(GetSystemTime                           ,0xffdf1dc8) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd0fcc0) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffde89dc) //102
NSTUB(GiveSemaphore                           ,0xffc0b844) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc9e3f0) //102
//NSTUB(LEDDrive                              ,0xffc34ce0) //103            == 0xffc34ce0
NSTUB(LocalTime                               ,0xffc57bd4) //  1
NSTUB(LockMainPower                           ,0xffc6211c) //103
NSTUB(Lseek                                   ,0xffc13cc8) //101
NSTUB(MakeDirectory_Fut                       ,0xffc134a8) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe3f558) //102
NSTUB(MoveIrisWithAv                          ,0xffded980) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdedfc8) //102
NSTUB(NewTaskShell                            ,0xffc5d578) //103
NSTUB(Open                                    ,0xffc13b60) //101
NSTUB(PB2Rec                                  ,0xffc64d3c) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc4cfcc) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc4cfa4) //102
NSTUB(PT_PlaySound                            ,0xffc4c8b8) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xffc6178c) //103
NSTUB(PostLogicalEventToUI                    ,0xffc617d8) //103
NSTUB(PutInNdFilter                           ,0xffe3d8d4) //102
NSTUB(PutOutNdFilter                          ,0xffe3d90c) //102
NSTUB(Read                                    ,0xffc0a15c) //101
NSTUB(ReadFastDir                             ,0xffdd96bc) //  1
NSTUB(Rec2PB                                  ,0xffc64d6c) //104
NSTUB(RefreshPhysicalScreen                   ,0xffd7c830) //104
NSTUB(Remove                                  ,0xffc13bd0) //  1
NSTUB(RenameFile_Fut                          ,0xffc133e0) //  1
NSTUB(Restart                                 ,0xffc19b5c) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffe41c3c) //102
NSTUB(SetAutoShutdownTime                     ,0xffc62190) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc68210) //101
NSTUB(SetFileTimeStamp                        ,0xffc13e64) //  1
NSTUB(SetLogicalEventActive                   ,0xffc61eb8) //  1
NSTUB(SetParameterData                        ,0xffd35228) //101
NSTUB(SetPropertyCase                         ,0xffc5d9b4) //102
//NSTUB(SetScriptMode                         ,0xffc61f08) //101            == 0xffc61f08
NSTUB(SleepTask                               ,0xffc18168) //101
NSTUB(TakeSemaphore                           ,0xffc0b774) //101
NSTUB(TurnOffBackLight                        ,0xffc6c570) //104
NSTUB(TurnOnBackLight                         ,0xffc6c558) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd2aa58) //103
//NSTUB(UnlockAF                              ,0xffc15c1c) //102            == 0xffc15c1c
NSTUB(UnlockMainPower                         ,0xffc62070) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd3a34c) //104            == 0xffd3a34c
NSTUB(UpdateMBROnFlash                        ,0xffc414c8) //  1
NSTUB(VbattGet                                ,0xffc105f4) //103
NSTUB(Write                                   ,0xffc13c34) //101
//NSTUB(WriteSDCard                           ,0xffd01548) //108            == 0xffd01548
NSTUB(_log                                    ,0xffe67dd8) //111
NSTUB(_log10                                  ,0xffe66d1c) //112
NSTUB(_pow                                    ,0xffe66e8c) //114
NSTUB(_sqrt                                   ,0xffe69140) //  1
NSTUB(add_ptp_handler                         ,0xffdaa4e4) //  1
//NSTUB(apex2us                               ,0xffd7dd6c) //  4            == 0xffd7dd6c
NSTUB(close                                   ,0xffc09f74) //  1
NSTUB(closedir                                ,0xffdd978c) //  1
NSTUB(err_init_task                           ,0xffc04e98) //  4
//NSTUB(exmem_alloc                           ,0xffc5869c) //103            == 0xffc5869c
NSTUB(free                                    ,0xffc03a98) //112
NSTUB(kbd_p1_f                                ,0xffc11d34) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11d40) //109
NSTUB(kbd_p2_f                                ,0xffc1156c) //109
NSTUB(kbd_read_keys                           ,0xffc11c30) //109
NSTUB(kbd_read_keys_r2                        ,0xffc35104) //109
NSTUB(lseek                                   ,0xffc13cc8) //101
NSTUB(malloc                                  ,0xffc039c4) //112
NSTUB(memcmp                                  ,0xffc0d90c) //101
NSTUB(memcpy                                  ,0xffc74f88) //101
NSTUB(memset                                  ,0xffd7cbe4) //101
NSTUB(mkdir                                   ,0xffc13f2c) //  1
// ALT: NSTUB(mkdir, 0xffc13fcc) // 1 32/0
NSTUB(mktime_ext                              ,0xffc757f4) //  1
NSTUB(open                                    ,0xffc09ec4) //  1
NSTUB(opendir                                 ,0xffdd9628) //  1
NSTUB(openfastdir                             ,0xffdd9628) //  1
NSTUB(qsort                                   ,0xffd7d0ec) //  1
NSTUB(rand                                    ,0xffc0da14) //  1
NSTUB(read                                    ,0xffc0a15c) //101
NSTUB(readfastdir                             ,0xffdd96bc) //  1
NSTUB(reboot_fw_update                        ,0xffdddf90) //  5
NSTUB(set_control_event                       ,0xffc61c0c) //  1
NSTUB(srand                                   ,0xffc0da08) //  1
NSTUB(stat                                    ,0xffc13d94) //  1
NSTUB(strcat                                  ,0xffc74d74) //  1
NSTUB(strchr                                  ,0xffc74dfc) //  1
NSTUB(strcmp                                  ,0xffc0d8a4) //101
NSTUB(strcpy                                  ,0xffc0d88c) //101
NSTUB(strftime                                ,0xffc751fc) //  1
NSTUB(strlen                                  ,0xffc0d8e8) //101
NSTUB(strncmp                                 ,0xffc74db0) //  1
NSTUB(strncpy                                 ,0xffc1dcc8) //  1
NSTUB(strrchr                                 ,0xffc74e20) //  1
NSTUB(strtol                                  ,0xffc1df00) //101
NSTUB(strtolx                                 ,0xffc1dd04) //109
  DEF(task_CaptSeq                            ,0xffc4f0f8) //107
  DEF(task_ExpDrv                             ,0xffc973e4) //110
  DEF(task_InitFileModules                    ,0xffc657b4) //107
  DEF(task_MovieRecord                        ,0xffc4bbbc) //107
  DEF(task_PhySw                              ,0xffc118c8) //107
NSTUB(time                                    ,0xffc57a88) //  1
NSTUB(vsprintf                                ,0xffc0d80c) //  1
