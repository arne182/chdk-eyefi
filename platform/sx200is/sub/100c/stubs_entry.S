// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00C
//   Possible corrupt firmware dump - file size to small for start address 0xff810000
//     file size = 4.00MB, should be 7.94MB
//   Could not find Camera name - possible corrupt firmware dump

// Values for makefile.inc
//   MAXRAMADDR = 0x03ffffff

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetSystemTime                         ,0xffa695a4) //101        *** != 0xff8606ac
//NSTUB(PB2Rec                                ,0xff87d780) //104        *** != 0xff87ee10
//NSTUB(kbd_pwr_off                           ,0xff848480) //  2 60%    *** != 0xff810950
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810950
//NSTUB(rename                                ,0xff823548) //  1        *** != 0xff823dc4
//NSTUB(write                                 ,0xff823d9c) //101        *** != 0xff819b44

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff87f990 -> ff87c0c8 -> ff962264 -> ffa751d8 -> ffb6d0a4
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000f058) // Found @0xff821e24,          stubs_min = 0x0000f058 (0xF058)
//DEF(physw_run                               ,0x00001c34) // Found @0xff821a94,          stubs_min = 0x00001c34 (0x1C28+0x0C)
//DEF(levent_table                            ,0xffb399f0) // Found @0xffb399f0,          stubs_min = 0xffb399f0 (0xFFB399F0)
//DEF(FlashParamsTable                        ,0xffb6d284) // Found @0xffb6d284,          stubs_min = 0xffb6d284 (0xFFB6D284)
//DEF(movie_status                            ,0x000065c0) // Found @0xff937fd0,          stubs_min = 0x000065c0 (0x6588+0x38)
//DEF(canon_menu_active                       ,0x00002f10) // Found @0xff874e3c,          stubs_min = 0x00002f10 (0x2F0C+4)
//DEF(canon_shoot_menu_active                 ,0x0000786d) // Found @0xff97761c,          stubs_min = 0x0000786d (0x786C+1)
//DEF(playrec_mode                            ,0x00002c70) // Found @0xff868020,          stubs_min = 0x00002c70 (0x2C6C+0x4)
//DEF(zoom_status                             ,0x0000b850) // Found @0xffa775d0,          stubs_min = 0x0000b850 (0xb850)
//DEF(some_flag_for_af_scan                   ,0x00006af8) // Found @0xff93b340,          stubs_min = 0x00006af8 (0x6AF8)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xff842ac8
//void *vid_get_viewport_fb()      { return (void*)0x415f9e20; } // Found @0xffac67f0
//char *camera_jpeg_count_str()    { return (char*)0x0005408c; } // Found @0xff9c1f28
//long hook_raw_size()             { return 0x011ca240; }        // Found @0xffac8d6c
//int get_flash_params_count(void) { return 0x7a; }              // Found @0xff963320

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffafe514, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00200000 // Found @0xffafe544, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000300 }, // Found @0xffafe418, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000200 }, // Found @0xffafe418, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000100 }, // Found @0xffafe40c, levent 0x00
//    { 1, KEY_UP              ,0x00000100 }, // Found @0xffafe4a8, levent 0x04
//    { 1, KEY_LEFT            ,0x00000200 }, // Found @0xffafe4b4, levent 0x06
//    { 1, KEY_SET             ,0x00000400 }, // Found @0xffafe4c0, levent 0x08
//    { 1, KEY_MENU            ,0x00000800 }, // Found @0xffafe4cc, levent 0x09
//    { 1, KEY_DOWN            ,0x00001000 }, // Found @0xffafe4d8, levent 0x05
//    { 1, KEY_RIGHT           ,0x00002000 }, // Found @0xffafe4e4, levent 0x07
//    { 1, KEY_DISPLAY         ,0x00008000 }, // Found @0xffafe4fc, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4080 // Found @0xff9025b0
//#define CAM_RAW_ROWS      3048 // Found @0xff9025b4
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff827850

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
//NSTUB(AllocateMemory                        ,0xffa6954c) //101            == 0xffa6954c
NSTUB(AllocateUncacheableMemory               ,0xff82780c) //112
NSTUB(Close                                   ,0xff823cf0) //101
NSTUB(CreateTask                              ,0xff81afac) //101
NSTUB(DebugAssert                             ,0xff81b284) //111
NSTUB(DeleteFile_Fut                          ,0xff82359c) //112
//NSTUB(DoAFLock                              ,0xff82560c) //102            == 0xff82560c
//NSTUB(EnterToCompensationEVF                ,0xff825748) //104            == 0xff825748
NSTUB(ExecuteEventProcedure                   ,0xff87057c) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff8257f4) //104            == 0xff8257f4
NSTUB(ExitTask                                ,0xff81b23c) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff8303c0) //104            == 0xff8303c0
//NSTUB(ExpCtrlTool_StopContiAE               ,0xff830504) //104            == 0xff830504
NSTUB(Fclose_Fut                              ,0xff823718) //101
NSTUB(Feof_Fut                                ,0xff823904) //  1
NSTUB(Fflush_Fut                              ,0xff823940) //  1
NSTUB(Fgets_Fut                               ,0xff82386c) //  1
NSTUB(Fopen_Fut                               ,0xff8236d8) //101
NSTUB(Fread_Fut                               ,0xff8237c4) //101
NSTUB(FreeMemory                              ,0xffa69544) //101
NSTUB(FreeUncacheableMemory                   ,0xff82784c) //112
NSTUB(Fseek_Fut                               ,0xff8238b8) //101
NSTUB(Fwrite_Fut                              ,0xff823818) //101
NSTUB(GetBatteryTemperature                   ,0xff84b5a8) //102
NSTUB(GetCCDTemperature                       ,0xff84b534) //102
NSTUB(GetCurrentAvValue                       ,0xff931328) //102
//NSTUB(GetDrive_ClusterSize                  ,0xff857acc) //  5            == 0xff857acc
//NSTUB(GetDrive_FreeClusters                 ,0xff857b24) //  5            == 0xff857b24
//NSTUB(GetDrive_TotalClusters                ,0xff857af8) //  5            == 0xff857af8
//NSTUB(GetFocusLensSubjectDistance           ,0xff92f7e4) //102            == 0xff92f7e4
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff92fbc0) //  3
NSTUB(GetKbdState                             ,0xff848340) //109
NSTUB(GetMemInfo                              ,0xff813be4) //  1
NSTUB(GetOpticalTemperature                   ,0xff84b61c) //102
NSTUB(GetParameterData                        ,0xff9632e0) //101
NSTUB(GetPropertyCase                         ,0xff8742e8) //102
NSTUB(GetZoomLensCurrentPoint                 ,0xff93462c) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa5cb24) //102
//NSTUB(GiveSemaphore                         ,0xff827228) //112            == 0xff827228
NSTUB(IsStrobeChargeCompleted                 ,0xff8abb04) //102
//NSTUB(LEDDrive                              ,0xff847614) //103            == 0xff847614
NSTUB(LocalTime                               ,0xff86df6c) //  1
NSTUB(LockMainPower                           ,0xff87bce0) //103
NSTUB(Lseek                                   ,0xff823e30) //101
NSTUB(MakeDirectory_Fut                       ,0xff823610) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffac3188) //102
NSTUB(MoveIrisWithAv                          ,0xffa675d8) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa67c24) //102
NSTUB(NewTaskShell                            ,0xff873d8c) //103
NSTUB(Open                                    ,0xff823cc8) //101
NSTUB(PT_MoveDigitalZoomToWide                ,0xff860884) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff86085c) //102
NSTUB(PT_PlaySound                            ,0xff86046c) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff879a08) //103            == 0xff879a08
NSTUB(PostLogicalEventToUI                    ,0xff879a54) //103
NSTUB(PutInNdFilter                           ,0xffac0f60) //102
NSTUB(PutOutNdFilter                          ,0xffac0f98) //102
NSTUB(Read                                    ,0xff819ae4) //101
NSTUB(ReadFastDir                             ,0xffa4794c) //  1
NSTUB(Rec2PB                                  ,0xff87ee50) //104
//NSTUB(RefreshPhysicalScreen                 ,0xff9d4f7c) //104            == 0xff9d4f7c
NSTUB(Remove                                  ,0xff823d38) //  1
NSTUB(RenameFile_Fut                          ,0xff823548) //  1
NSTUB(Restart                                 ,0xff828f5c) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffac5968) //102
NSTUB(SetAutoShutdownTime                     ,0xff87bd54) //103
NSTUB(SetCurrentCaptureModeType               ,0xff882d6c) //101
NSTUB(SetFileTimeStamp                        ,0xff823fcc) //  1
NSTUB(SetLogicalEventActive                   ,0xff87ba30) //101
NSTUB(SetParameterData                        ,0xff963250) //101
NSTUB(SetPropertyCase                         ,0xff8741e0) //102
//NSTUB(SetScriptMode                         ,0xff87ba80) //101            == 0xff87ba80
NSTUB(SleepTask                               ,0xff827490) //101
NSTUB(TakeSemaphore                           ,0xff827158) //101
//NSTUB(TurnOffBackLight                      ,0xff889254) //104            == 0xff889254
NSTUB(TurnOnBackLight                         ,0xff88923c) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff94f9d8) //103
//NSTUB(UnlockAF                              ,0xff825644) //102            == 0xff825644
NSTUB(UnlockMainPower                         ,0xff87bc34) //103
//NSTUB(UnsetZoomForMovie                     ,0xff969764) //104            == 0xff969764
//NSTUB(UpdateMBROnFlash                      ,0xff857924) //  3            == 0xff857924
NSTUB(VbattGet                                ,0xff820644) //103
NSTUB(Write                                   ,0xff823d9c) //101
//NSTUB(WriteSDCard                           ,0xff920e8c) //108            == 0xff920e8c
NSTUB(_log                                    ,0xffafa3c0) //111
NSTUB(_log10                                  ,0xffaf904c) //112
NSTUB(_pow                                    ,0xffaf91bc) //114
NSTUB(_sqrt                                   ,0xffafbf64) //  1
NSTUB(add_ptp_handler                         ,0xffa125d4) //  3
//NSTUB(apex2us                               ,0xff9d8170) //  4            == 0xff9d8170
NSTUB(close                                   ,0xff8198fc) //  1
NSTUB(closedir                                ,0xffa47a1c) //  1
NSTUB(err_init_task                           ,0xff814e2c) //  4
NSTUB(exmem_alloc                             ,0xff86ee2c) //103
NSTUB(free                                    ,0xff813a3c) //112
NSTUB(kbd_p1_f                                ,0xff821ea0) //109
NSTUB(kbd_p1_f_cont                           ,0xff821eac) //109
NSTUB(kbd_p2_f                                ,0xff821760) //109
NSTUB(kbd_read_keys                           ,0xff821e24) //109
//NSTUB(kbd_read_keys_r2                      ,0xff847b04) //109            == 0xff847b04
NSTUB(lseek                                   ,0xff823e30) //101
NSTUB(malloc                                  ,0xff813968) //112
NSTUB(memcmp                                  ,0xff81cc5c) //101
NSTUB(memcpy                                  ,0xff88fe10) //101
NSTUB(memset                                  ,0xff9d7458) //101
NSTUB(mkdir                                   ,0xff824094) //  1
// ALT: NSTUB(mkdir, 0xff824134) // 1 32/0
NSTUB(mktime_ext                              ,0xff89067c) //  1
NSTUB(open                                    ,0xff81984c) //  1
NSTUB(opendir                                 ,0xffa478b8) //  1
NSTUB(openfastdir                             ,0xffa478b8) //  1
//NSTUB(qsort                                 ,0xffaaf200) //  1            == 0xffaaf200
NSTUB(rand                                    ,0xff81cd64) //  1
NSTUB(read                                    ,0xff819ae4) //101
NSTUB(readfastdir                             ,0xffa4794c) //  1
NSTUB(reboot_fw_update                        ,0xffa4effc) //  5
NSTUB(set_control_event                       ,0xff87b694) //111
NSTUB(srand                                   ,0xff81cd58) //  1
NSTUB(stat                                    ,0xff823efc) //  1
NSTUB(strcat                                  ,0xff88fc24) //  1
//NSTUB(strchr                                ,0xff88fcac) //  1            == 0xff88fcac
NSTUB(strcmp                                  ,0xff81cbf4) //101
NSTUB(strcpy                                  ,0xff81cbdc) //101
NSTUB(strftime                                ,0xff890084) //  1
NSTUB(strlen                                  ,0xff81cc38) //101
NSTUB(strncmp                                 ,0xff88fc60) //  1
NSTUB(strncpy                                 ,0xff82d1bc) //  1
//NSTUB(strrchr                               ,0xff9d7430) //  1            == 0xff9d7430
NSTUB(strtol                                  ,0xff82d3f4) //101
NSTUB(strtolx                                 ,0xff82d1f8) //109
  DEF(task_CaptSeq                            ,0xff86327c) //107
  DEF(task_ExpDrv                             ,0xff8a2214) //110
  DEF(task_InitFileModules                    ,0xff87f81c) //107
  DEF(task_MovieRecord                        ,0xff9382b8) //107
  DEF(task_PhySw                              ,0xff821a90) //107
NSTUB(time                                    ,0xff86e4e4) //  2
NSTUB(vsprintf                                ,0xff81cba0) //  1
