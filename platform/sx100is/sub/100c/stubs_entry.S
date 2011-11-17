// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00C
//   Canon PowerShot SX100 IS

// Values for makefile.inc
//   PLATFORMID = 12638 (0x315e) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d3                 // Found @ 0xffff1a04
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff19e4

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetCCDTemperature                     ,0xffc3a2e0) //102        *** != 0xffc3a474
//NSTUB(GetOpticalTemperature                 ,0xffc3a3c0) //102        *** != 0xffdc4fc4
//NSTUB(GetZoomLensCurrentPosition            ,0xffdeac9c) //102        *** != 0xffd0e3a0
//NSTUB(kbd_pwr_off                           ,0xffc37f44) //  2 67%    *** != 0xffc00958
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc00958
//NSTUB(rename                                ,0xffc14860) //  1        *** != 0xffc15120
//NSTUB(write                                 ,0xffc150f8) //101        *** != 0xffc0a4a0

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc63700 -> ffc5fb1c -> ffd25820 -> ffdf5dd8 -> ffe9e824
// Mode  2598 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_INDOOR              32785

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00010c1c) // Found @0xffc130f4,          stubs_min = 0x00010c1c (0x10C1C)
//DEF(physw_run                               ,0x00001ca4) // Found @0xffc12da0,          stubs_min = 0x00001ca4 (0x1CA4)
//DEF(levent_table                            ,0xffe7cb64) // Found @0xffe7cb64,          stubs_min = 0xffe7cb64 (0xFFE7CB64)
//DEF(FlashParamsTable                        ,0xffe9e9dc) // Found @0xffe9e9dc,          stubs_min = 0xffe9e9dc (0xFFE9E9DC)
//DEF(movie_status                            ,0x00005588) // Found @0xffc4abe4,          stubs_min = 0x00005588 (0x5588)
//DEF(canon_menu_active                       ,0x0000bafc) // Found @0xffd60be0,          stubs_min = 0x0000bafc (0xBAFC)
//DEF(canon_shoot_menu_active                 ,0x0000b1fd) // Found @0xffd380a8,          stubs_min = 0x0000b1fd (0xB1FD)
//DEF(playrec_mode                            ,0x00005724) // Found @0xffc51684,          stubs_min = 0x00005724 (0x5724)
//DEF(zoom_status                             ,0x0000de14) // Found @0xffdf75d0,          stubs_min = 0x0000de14 (0xDE14)
//DEF(some_flag_for_af_scan                   ,0x0000dd08) // Found @0xffdef988,          stubs_min = 0x0000dd08 (0xDD08)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc33cb8
//void *vid_get_viewport_fb()      { return (void*)0x1065a4d0; } // Found @0xffdc3ec0
//char *camera_jpeg_count_str()    { return (char*)0x00059a1c; } // Found @0xffd6d358
//long hook_raw_size()             { return 0x009dcce0; }        // Found @0xffdc5dbc
//int get_flash_params_count(void) { return 0x72; }              // Found @0xffd268dc

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe5f9fc, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe5fa04, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x0000000c }, // Found @0xffe5f93c, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000008 }, // Found @0xffe5f93c, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000004 }, // Found @0xffe5f934, levent 0x00
//    { 1, KEY_ZOOM_IN         ,0x00000100 }, // Found @0xffe5f98c, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00000200 }, // Found @0xffe5f994, levent 0x03
//    { 1, KEY_SET             ,0x00010000 }, // Found @0xffe5f99c, levent 0x08
//    { 1, KEY_UP              ,0x00020000 }, // Found @0xffe5f9a4, levent 0x04
//    { 1, KEY_LEFT            ,0x00040000 }, // Found @0xffe5f9ac, levent 0x06
//    { 1, KEY_DOWN            ,0x00080000 }, // Found @0xffe5f9b4, levent 0x05
//    { 1, KEY_RIGHT           ,0x00100000 }, // Found @0xffe5f9bc, levent 0x07
//    { 1, KEY_MENU            ,0x02000000 }, // Found @0xffe5f9cc, levent 0x09
//    { 1, KEY_DISPLAY         ,0x04000000 }, // Found @0xffe5f9d4, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3336 // Found @0xffdbddc0
//#define CAM_RAW_ROWS      2480 // Found @0xffdbddc8
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc19e6c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffdf2ef4) //103
NSTUB(AllocateUncacheableMemory               ,0xffc19e30) //112
NSTUB(Close                                   ,0xffc1504c) //101
NSTUB(CreateTask                              ,0xffc0bbb8) //101
NSTUB(DebugAssert                             ,0xffc0c090) //111
NSTUB(DeleteFile_Fut                          ,0xffc148b4) //112
//NSTUB(DoAFLock                              ,0xffc16f5c) //103            == 0xffc16f5c
NSTUB(EnterToCompensationEVF                  ,0xffc172d4) //104
NSTUB(ExecuteEventProcedure                   ,0xffc0c270) //  1
NSTUB(ExitFromCompensationEVF                 ,0xffc17324) //104
NSTUB(ExitTask                                ,0xffc0be48) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc249b8) //104            == 0xffc249b8
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc24b78) //104            == 0xffc24b78
NSTUB(Fclose_Fut                              ,0xffc14a30) //101
NSTUB(Feof_Fut                                ,0xffc14c1c) //  1
NSTUB(Fflush_Fut                              ,0xffc14c58) //  1
NSTUB(Fgets_Fut                               ,0xffc14b84) //  1
NSTUB(Fopen_Fut                               ,0xffc149f0) //101
NSTUB(Fread_Fut                               ,0xffc14adc) //101
NSTUB(FreeMemory                              ,0xffdf2ee0) //103
NSTUB(FreeUncacheableMemory                   ,0xffc19e64) //112
NSTUB(Fseek_Fut                               ,0xffc14bd0) //101
NSTUB(Fwrite_Fut                              ,0xffc14b30) //101
//NSTUB(GetBatteryTemperature                 ,0xffc3a350) //102            == 0xffc3a350
NSTUB(GetCurrentAvValue                       ,0xffd0b008) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc406a0) //  1
NSTUB(GetDrive_FreeClusters                   ,0xffc40740) //  1
NSTUB(GetDrive_TotalClusters                  ,0xffc406d4) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xffd08e9c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd091a8) //  1
NSTUB(GetKbdState                             ,0xffc37df4) //109
NSTUB(GetMemInfo                              ,0xffc03c58) //  1
NSTUB(GetParameterData                        ,0xffd2689c) //101
NSTUB(GetPropertyCase                         ,0xffc5bcc0) //101
NSTUB(GetSystemTime                           ,0xffdf2ffc) //  1
NSTUB(GetZoomLensCurrentPoint                 ,0xffd0e3c8) //102
//NSTUB(GiveSemaphore                         ,0xffc0bb24) //112            == 0xffc0bb24
NSTUB(IsStrobeChargeCompleted                 ,0xffc9ef9c) //102
NSTUB(LEDDrive                                ,0xffc373e8) //103
NSTUB(LocalTime                               ,0xffc580ec) //  1
NSTUB(LockMainPower                           ,0xffc5f748) //103
NSTUB(Lseek                                   ,0xffc1518c) //101
NSTUB(MakeDirectory_Fut                       ,0xffc14928) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffdc0d60) //102
NSTUB(MoveIrisWithAv                          ,0xffd0b3e8) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffd0ee74) //102
NSTUB(NewTaskShell                            ,0xffc5b744) //103
NSTUB(Open                                    ,0xffc15024) //101
//NSTUB(PB2Rec                                ,0xffc6296c) //104            == 0xffc6296c
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc53460) //103
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc53428) //103
//NSTUB(PT_PlaySound                          ,0xffc52fd4) //103            == 0xffc52fd4
NSTUB(PostLogicalEventForNotPowerType         ,0xffc5d6e4) //103
NSTUB(PostLogicalEventToUI                    ,0xffc5d730) //103
NSTUB(PutInNdFilter                           ,0xffdbf16c) //102
NSTUB(PutOutNdFilter                          ,0xffdbf1a4) //102
NSTUB(Read                                    ,0xffc0a440) //101
NSTUB(ReadFastDir                             ,0xffddc6b0) //  1
//NSTUB(Rec2PB                                ,0xffc61598) //104            == 0xffc61598
NSTUB(RefreshPhysicalScreen                   ,0xffd79fd4) //104
NSTUB(Remove                                  ,0xffc15094) //  1
NSTUB(RenameFile_Fut                          ,0xffc14860) //  1
NSTUB(Restart                                 ,0xffc1be8c) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffdc30bc) //102
NSTUB(SetAutoShutdownTime                     ,0xffc5f7bc) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc66244) //101
NSTUB(SetFileTimeStamp                        ,0xffc15328) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5f480) //  1
NSTUB(SetParameterData                        ,0xffd2680c) //101
NSTUB(SetPropertyCase                         ,0xffc5bbb8) //103
//NSTUB(SetScriptMode                         ,0xffc5f4d0) //101            == 0xffc5f4d0
NSTUB(SleepTask                               ,0xffc19cb8) //101
NSTUB(TakeSemaphore                           ,0xffc0ba54) //101
NSTUB(TurnOffBackLight                        ,0xffc6bd88) //104
NSTUB(TurnOnBackLight                         ,0xffc6bd70) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd61674) //103
//NSTUB(UnlockAF                              ,0xffc16fc8) //103            == 0xffc16fc8
NSTUB(UnlockMainPower                         ,0xffc5f69c) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd2cfcc) //104            == 0xffd2cfcc
NSTUB(UpdateMBROnFlash                        ,0xffc40468) //  1
NSTUB(VbattGet                                ,0xffc119cc) //101
NSTUB(Write                                   ,0xffc150f8) //101
//NSTUB(WriteSDCard                           ,0xffcff51c) //108            == 0xffcff51c
NSTUB(_log                                    ,0xffe58024) //111
NSTUB(_log10                                  ,0xffe56f68) //112
NSTUB(_pow                                    ,0xffe570d8) //114
NSTUB(_sqrt                                   ,0xffe5938c) //  1
NSTUB(add_ptp_handler                         ,0xffcb53d8) //  1
NSTUB(apex2us                                 ,0xffd7b48c) //  4
NSTUB(close                                   ,0xffc0a258) //  1
NSTUB(closedir                                ,0xffddc780) //  1
NSTUB(err_init_task                           ,0xffc04eb0) //  4
NSTUB(exmem_alloc                             ,0xffc58bd8) //  1
NSTUB(free                                    ,0xffc03ab0) //112
NSTUB(kbd_p1_f                                ,0xffc131f0) //109
NSTUB(kbd_p1_f_cont                           ,0xffc131fc) //109
NSTUB(kbd_p2_f                                ,0xffc12a40) //109
NSTUB(kbd_read_keys                           ,0xffc130f4) //109
//NSTUB(kbd_read_keys_r2                      ,0xffc37900) //109            == 0xffc37900
NSTUB(lseek                                   ,0xffc1518c) //101
NSTUB(malloc                                  ,0xffc039dc) //112
NSTUB(memcmp                                  ,0xffc0e8f0) //101
NSTUB(memcpy                                  ,0xffc76678) //101
NSTUB(memset                                  ,0xffe2aac0) //101
NSTUB(mkdir                                   ,0xffc153f0) //  1
// ALT: NSTUB(mkdir, 0xffc15490) // 1 32/0
NSTUB(mktime_ext                              ,0xffc76ee4) //  1
NSTUB(open                                    ,0xffc0a1a8) //  1
NSTUB(opendir                                 ,0xffddc61c) //  1
NSTUB(openfastdir                             ,0xffddc61c) //  1
NSTUB(qsort                                   ,0xffd7a864) //  1
NSTUB(rand                                    ,0xffc0e9f8) //  1
NSTUB(read                                    ,0xffc0a440) //101
NSTUB(readfastdir                             ,0xffddc6b0) //  1
NSTUB(reboot_fw_update                        ,0xffde1050) //  1
NSTUB(set_control_event                       ,0xffc5f184) //  1
NSTUB(srand                                   ,0xffc0e9ec) //  1
NSTUB(stat                                    ,0xffc15258) //  1
NSTUB(strcat                                  ,0xffc765a4) //  1
NSTUB(strchr                                  ,0xffc7662c) //  1
NSTUB(strcmp                                  ,0xffc0e888) //101
NSTUB(strcpy                                  ,0xffc0e834) //101
NSTUB(strftime                                ,0xffc768ec) //  1
NSTUB(strlen                                  ,0xffc0e8cc) //101
NSTUB(strncmp                                 ,0xffc765e0) //  1
NSTUB(strncpy                                 ,0xffc0e84c) //  1
NSTUB(strrchr                                 ,0xffc76650) //  1
NSTUB(strtol                                  ,0xffc20338) //101
NSTUB(strtolx                                 ,0xffc2013c) //109
  DEF(task_CaptSeq                            ,0xffc4e2e0) //107
  DEF(task_ExpDrv                             ,0xffc98f18) //110
  DEF(task_InitFileModules                    ,0xffc6358c) //107
  DEF(task_MovieRecord                        ,0xffc4ae48) //107
  DEF(task_PhySw                              ,0xffc12d9c) //107
NSTUB(time                                    ,0xffc57fa0) //  1
NSTUB(vsprintf                                ,0xffc0e7b4) //  1
