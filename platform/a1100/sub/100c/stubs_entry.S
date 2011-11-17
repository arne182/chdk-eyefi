// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00C
//   Canon PowerShot A1100 IS

// Values for makefile.inc
//   PLATFORMID = 12739 (0x31c3) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff1d04
//   NEED_ENCODED_DISKBOOT = 2   // Found @ 0xffff1d14

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc1f9c4) //104        *** != 0xffc1faac
//NSTUB(SetAE_ShutterSpeed                    ,0xffe425b8) //102        *** != 0xffe3d994
//NSTUB(kbd_pwr_off                           ,0xffc30b9c) //  2 64%    *** != 0xffc30b40
NSTUB(kbd_pwr_on                              ,0xffc30b5c) //  2 82%

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc6067c -> ffc5d0d0 -> ffd1ba78 -> ffdfeb44 -> ffebbd0c
// Mode 16398 in firmware but not in current modemap

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000c624) // Found @0xffc11a0c,          stubs_min = 0x0000c624 (0xC624)
//DEF(physw_run                               ,0x00001c24) // Found @0xffc11680,          stubs_min = 0x00001c24 (0x1C24)
//DEF(levent_table                            ,0xffe93cdc) // Found @0xffe93cdc,          stubs_min = 0xffe93cdc (0xFFE93CDC)
//DEF(FlashParamsTable                        ,0xffebbee0) // Found @0xffebbee0,          stubs_min = 0xffebbee0 (0xFFEBBEE0)
//DEF(movie_status                            ,0x00005630) // Found @0xffcf8080,          stubs_min = 0x00005630 (0x55F8+0x38)
//DEF(canon_menu_active                       ,0x00002b7c) // Found @0xffc59f18,          stubs_min = 0x00002b7c (0x2B7C)
//DEF(canon_shoot_menu_active                 ,0x000068c9) // Found @0xffd2bd58,          stubs_min = 0x000068c9 (0x68c9)
//DEF(playrec_mode                            ,0x000028f0) // Found @0xffc4d504,          stubs_min = 0x000028f0 (0x28EC+0x4)
//DEF(zoom_status                             ,0x000098d0) // Found @0xffe00374,          stubs_min = 0x000098d0 (0x98D0)
//DEF(some_flag_for_af_scan                   ,0x00005af4) // Found @0xffcfa7a4,          stubs_min = 0x00005af4 (0x5AF4)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xffc2c594
//void *vid_get_viewport_fb()      { return (void*)0x4076fcc0; } // Found @0xffe433a8
//char *camera_jpeg_count_str()    { return (char*)0x0002f4a8; } // Found @0xffd60210
//long hook_raw_size()             { return 0x011e4ee0; }        // Found @0xffe45910
//int get_flash_params_count(void) { return 0x7a; }              // Found @0xffd1cb34

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe70c7c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe70c88, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_UP              ,0x00000100 }, // Found @0xffe70b68, levent 0x04
//    { 1, KEY_DOWN            ,0x00000200 }, // Found @0xffe70b74, levent 0x05
//    { 1, KEY_RIGHT           ,0x00000400 }, // Found @0xffe70b80, levent 0x07
//    { 1, KEY_LEFT            ,0x00000800 }, // Found @0xffe70b8c, levent 0x06
//    { 1, KEY_SET             ,0x00001000 }, // Found @0xffe70b98, levent 0x08
//    { 1, KEY_MENU            ,0x00002000 }, // Found @0xffe70ba4, levent 0x09
//    { 1, KEY_DISPLAY         ,0x00004000 }, // Found @0xffe70bb0, levent 0x0a
//    { 2, KEY_ZOOM_IN         ,0x00000040 }, // Found @0xffe70c28, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000080 }, // Found @0xffe70c34, levent 0x03
//    { 2, KEY_SHOOT_FULL      ,0x00000030 }, // Found @0xffe70c1c, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000020 }, // Found @0xffe70c1c, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000010 }, // Found @0xffe70c10, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4104 // Found @0xffcc7c84
//#define CAM_RAW_ROWS      3048 // Found @0xffcc7c8c
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xffc16e84

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffdf53ac) //101
NSTUB(AllocateUncacheableMemory               ,0xffc16e40) //112
NSTUB(Close                                   ,0xffc138e0) //101
NSTUB(CreateTask                              ,0xffc0afac) //101
NSTUB(DebugAssert                             ,0xffc0b284) //111
NSTUB(DeleteFile_Fut                          ,0xffc1318c) //112
//NSTUB(DoAFLock                              ,0xffc14f40) //102            == 0xffc14f40
//NSTUB(EnterToCompensationEVF                ,0xffc14ff0) //104            == 0xffc14ff0
NSTUB(ExecuteEventProcedure                   ,0xffc555c0) //  1
//NSTUB(ExitFromCompensationEVF               ,0xffc15034) //104            == 0xffc15034
NSTUB(ExitTask                                ,0xffc0b23c) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc1f880) //104            == 0xffc1f880
NSTUB(Fclose_Fut                              ,0xffc13308) //101
NSTUB(Feof_Fut                                ,0xffc134f4) //  1
NSTUB(Fflush_Fut                              ,0xffc13530) //  1
NSTUB(Fgets_Fut                               ,0xffc1345c) //  1
NSTUB(Fopen_Fut                               ,0xffc132c8) //101
NSTUB(Fread_Fut                               ,0xffc133b4) //101
NSTUB(FreeMemory                              ,0xffdf53a4) //101
NSTUB(FreeUncacheableMemory                   ,0xffc16e80) //112
NSTUB(Fseek_Fut                               ,0xffc134a8) //101
NSTUB(Fwrite_Fut                              ,0xffc13408) //101
//NSTUB(GetBatteryTemperature                 ,0xffc32c44) //102            == 0xffc32c44
//NSTUB(GetCCDTemperature                     ,0xffc32bd0) //102            == 0xffc32bd0
NSTUB(GetCurrentAvValue                       ,0xffcf18a8) //102
//NSTUB(GetDrive_ClusterSize                  ,0xffc3ed84) //  5            == 0xffc3ed84
//NSTUB(GetDrive_FreeClusters                 ,0xffc3eddc) //  5            == 0xffc3eddc
//NSTUB(GetDrive_TotalClusters                ,0xffc3edb0) //  5            == 0xffc3edb0
//NSTUB(GetFocusLensSubjectDistance           ,0xffcf08f4) //102            == 0xffcf08f4
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffcf0cd4) //  3
//NSTUB(GetKbdState                           ,0xffc30b28) //109            == 0xffc30b28
NSTUB(GetMemInfo                              ,0xffc03be4) //  1
NSTUB(GetOpticalTemperature                   ,0xffc32cbc) //102
NSTUB(GetParameterData                        ,0xffd1caf4) //101
NSTUB(GetPropertyCase                         ,0xffc593fc) //102
NSTUB(GetSystemTime                           ,0xffdf5404) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffcf4b00) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffded338) //102
NSTUB(GiveSemaphore                           ,0xffc1685c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc870ec) //102
//NSTUB(LEDDrive                              ,0xffc30088) //103            == 0xffc30088
NSTUB(LocalTime                               ,0xffc53284) //  1
NSTUB(LockMainPower                           ,0xffc5cce8) //103
NSTUB(Lseek                                   ,0xffc13a20) //101
NSTUB(MakeDirectory_Fut                       ,0xffc13200) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe3fdd8) //102
NSTUB(MoveIrisWithAv                          ,0xffdf2648) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdf2bd4) //102
NSTUB(NewTaskShell                            ,0xffc58ea8) //103
NSTUB(Open                                    ,0xffc138b8) //101
//NSTUB(PB2Rec                                ,0xffc5e760) //104            == 0xffc5e760
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc46da8) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc46d80) //102
NSTUB(PT_PlaySound                            ,0xffc469bc) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xffc5c310) //103
NSTUB(PostLogicalEventToUI                    ,0xffc5c35c) //103
//NSTUB(PutInNdFilter                         ,0xffdf2a38) //102            == 0xffdf2a38
//NSTUB(PutOutNdFilter                        ,0xffdf2a5c) //102            == 0xffdf2a5c
NSTUB(Read                                    ,0xffc09ae4) //101
NSTUB(ReadFastDir                             ,0xffddf844) //  1
NSTUB(Rec2PB                                  ,0xffc5fb48) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffd6b630) //104            == 0xffd6b630
NSTUB(Remove                                  ,0xffc13928) //  1
NSTUB(RenameFile_Fut                          ,0xffc13138) //  1
NSTUB(Restart                                 ,0xffc18594) //106
NSTUB(SetAutoShutdownTime                     ,0xffc5cd5c) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc632cc) //101
NSTUB(SetFileTimeStamp                        ,0xffc13bbc) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5ca64) //101
NSTUB(SetParameterData                        ,0xffd1ca64) //101
NSTUB(SetPropertyCase                         ,0xffc592f8) //102
//NSTUB(SetScriptMode                         ,0xffc5cab4) //101            == 0xffc5cab4
NSTUB(SleepTask                               ,0xffc16ac4) //101
NSTUB(TakeSemaphore                           ,0xffc1678c) //101
//NSTUB(TurnOffBackLight                      ,0xffc67d48) //104            == 0xffc67d48
NSTUB(TurnOnBackLight                         ,0xffc67d30) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd0d490) //101
//NSTUB(UnlockAF                              ,0xffc14f78) //102            == 0xffc14f78
NSTUB(UnlockMainPower                         ,0xffc5cc3c) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd226ec) //104            == 0xffd226ec
//NSTUB(UpdateMBROnFlash                      ,0xffc3ebdc) //  3            == 0xffc3ebdc
NSTUB(VbattGet                                ,0xffc10318) //103
NSTUB(Write                                   ,0xffc1398c) //101
//NSTUB(WriteSDCard                           ,0xffce4748) //108            == 0xffce4748
NSTUB(_log                                    ,0xffe6d86c) //111
NSTUB(_log10                                  ,0xffe6c7b0) //112
NSTUB(_pow                                    ,0xffe6c920) //114
NSTUB(_sqrt                                   ,0xffe6ebd4) //  1
NSTUB(add_ptp_handler                         ,0xffdb1584) //  3
//NSTUB(apex2us                               ,0xffd6c6e8) //  4            == 0xffd6c6e8
NSTUB(close                                   ,0xffc098fc) //  1
NSTUB(closedir                                ,0xffddf914) //  1
NSTUB(err_init_task                           ,0xffc04e2c) //  4
NSTUB(exmem_alloc                             ,0xffc53eb8) //103
NSTUB(free                                    ,0xffc03a3c) //112
NSTUB(kbd_p1_f                                ,0xffc11a90) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11a9c) //109
NSTUB(kbd_p2_f                                ,0xffc1134c) //109
NSTUB(kbd_read_keys                           ,0xffc11a0c) //109
//NSTUB(kbd_read_keys_r2                      ,0xffc304a4) //109            == 0xffc304a4
NSTUB(lseek                                   ,0xffc13a20) //101
NSTUB(malloc                                  ,0xffc03968) //112
NSTUB(memcmp                                  ,0xffc0cc60) //101
NSTUB(memcpy                                  ,0xffc6b9dc) //101
NSTUB(memset                                  ,0xffd6b9d0) //101
NSTUB(mkdir                                   ,0xffc13c84) //  1
// ALT: NSTUB(mkdir, 0xffc13d24) // 1 32/0
NSTUB(mktime_ext                              ,0xffc6c248) //  1
NSTUB(open                                    ,0xffc0984c) //  1
NSTUB(opendir                                 ,0xffddf7b0) //  1
NSTUB(openfastdir                             ,0xffddf7b0) //  1
//NSTUB(qsort                                 ,0xffe265e4) //  1            == 0xffe265e4
NSTUB(rand                                    ,0xffc0cd68) //  1
NSTUB(read                                    ,0xffc09ae4) //101
NSTUB(readfastdir                             ,0xffddf844) //  1
NSTUB(reboot_fw_update                        ,0xffde3328) //  5
//NSTUB(rename                                ,0xffc13138) //  1            == 0xffc13138
NSTUB(set_control_event                       ,0xffc5c798) //111
NSTUB(srand                                   ,0xffc0cd5c) //  1
NSTUB(stat                                    ,0xffc13aec) //  1
NSTUB(strcat                                  ,0xffc6b7f0) //  1
//NSTUB(strchr                                ,0xffc6b878) //  1            == 0xffc6b878
NSTUB(strcmp                                  ,0xffc0cbf8) //101
NSTUB(strcpy                                  ,0xffc0cbe0) //101
NSTUB(strftime                                ,0xffc6bc50) //  1
NSTUB(strlen                                  ,0xffc0cc3c) //101
NSTUB(strncmp                                 ,0xffc6b82c) //  1
NSTUB(strncpy                                 ,0xffc1c67c) //  1
//NSTUB(strrchr                               ,0xffd6b9a8) //  1            == 0xffd6b9a8
NSTUB(strtol                                  ,0xffc1c8b4) //101
NSTUB(strtolx                                 ,0xffc1c6b8) //109
//  DEF(task_CaptSeq                          ,0xffc49060) //107            == 0xffc49060
//  DEF(task_ExpDrv                           ,0xffc7ddcc) //110            == 0xffc7ddcc
//  DEF(task_InitFileModules                  ,0xffc60508) //107            == 0xffc60508
//  DEF(task_MovieRecord                      ,0xffcf82d4) //107            == 0xffcf82d4
//  DEF(task_PhySw                            ,0xffc1167c) //107            == 0xffc1167c
NSTUB(time                                    ,0xffc53138) //  1
NSTUB(vsprintf                                ,0xffc0cba4) //  1
//NSTUB(write                                 ,0xffc1398c) //101            == 0xffc1398c
