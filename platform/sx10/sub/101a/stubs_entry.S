// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.01A
//   Canon PowerShot SX10 IS

// Values for makefile.inc
//   PLATFORMID = 12685 (0x318d) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff3570
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff3580

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xff84b810) //  2 60%    *** != 0xff81093c
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff81093c
//NSTUB(rename                                ,0xff8232bc) //  1        *** != 0xff823b38
//NSTUB(write                                 ,0xff823b10) //101        *** != 0xff819aac

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff884bc8 -> ff881358 -> ff973e74 -> ffa79988 -> ffb74388
// Current modemap entry not found in firmware - MODE_VIDEO_STD            3622

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00011ec4) // Found @0xff821b14,          stubs_min = 0x00011ec4 (0x11EC4)
//DEF(physw_run                               ,0x00001c30) // Found @0xff821788,          stubs_min = 0x00001c30 (0x1C24+0x0C)
//DEF(levent_table                            ,0xffb4acc8) // Found @0xffb4acc8,          stubs_min = 0xffb4acc8 (0xFFB4ACC8)
//DEF(FlashParamsTable                        ,0xffb7455c) // Found @0xffb7455c,          stubs_min = 0xffb7455c (0xFFB7455C)
//DEF(movie_status                            ,0x00005430) // Found @0xff864304,          stubs_min = 0x00005430 (0x53F8+0x38)
//DEF(canon_menu_active                       ,0x000058d8) // Found @0xff87a1ec,          stubs_min = 0x000058d8 (0x58D4+4)
//DEF(canon_shoot_menu_active                 ,0x0000ac29) // Found @0xff98cb24,          stubs_min = 0x0000ac29 (0xAC28+1)
//DEF(playrec_mode                            ,0x00005640) // Found @0xff86d218,          stubs_min = 0x00005640 (0x563C+0x4)
//DEF(zoom_status                             ,0x0000e3e0) // Found @0xffa7b654,          stubs_min = 0x0000e3e0 (0xE3E0)
//DEF(some_flag_for_af_scan                   ,0x00009b58) // Found @0xff94a2bc

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403b1000; } // Found @0xff846c28
//void *vid_get_viewport_fb()      { return (void*)0x4070d9d0; } // Found @0xffad15ac
//char *camera_jpeg_count_str()    { return (char*)0x0004c138; } // Found @0xff9d284c
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffad3a30
//int get_flash_params_count(void) { return 0x78; }              // Found @0xff975474

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb0ad5c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb0ad68, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb0abe8, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb0abe8, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb0abdc, levent 0x00
//    { 1, KEY_SET             ,0x00000100 }, // Found @0xffb0ac84, levent 0x08
//    { 1, KEY_DISPLAY         ,0x00000200 }, // Found @0xffb0ac90, levent 0x0a
//    { 1, KEY_UP              ,0x00000400 }, // Found @0xffb0ac9c, levent 0x04
//    { 1, KEY_DOWN            ,0x00000800 }, // Found @0xffb0aca8, levent 0x05
//    { 1, KEY_RIGHT           ,0x00001000 }, // Found @0xffb0acb4, levent 0x07
//    { 1, KEY_LEFT            ,0x00002000 }, // Found @0xffb0acc0, levent 0x06
//    { 1, KEY_MENU            ,0x00004000 }, // Found @0xffb0accc, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffaca170
//#define CAM_RAW_ROWS      2772 // Found @0xffaca178
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff828010

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa67af4) //101
NSTUB(AllocateUncacheableMemory               ,0xff827fcc) //112
NSTUB(Close                                   ,0xff823a64) //101
NSTUB(CreateTask                              ,0xff81aef4) //101
NSTUB(DebugAssert                             ,0xff81b1cc) //111
NSTUB(DeleteFile_Fut                          ,0xff823310) //112
//NSTUB(DoAFLock                              ,0xff825864) //102            == 0xff825864
//NSTUB(EnterToCompensationEVF                ,0xff825b10) //104            == 0xff825b10
NSTUB(ExecuteEventProcedure                   ,0xff8759f0) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff825b54) //104            == 0xff825b54
NSTUB(ExitTask                                ,0xff81b184) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff8311d8) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff83131c) //104
NSTUB(Fclose_Fut                              ,0xff82348c) //101
NSTUB(Feof_Fut                                ,0xff823678) //  1
NSTUB(Fflush_Fut                              ,0xff8236b4) //  1
NSTUB(Fgets_Fut                               ,0xff8235e0) //  1
NSTUB(Fopen_Fut                               ,0xff82344c) //101
NSTUB(Fread_Fut                               ,0xff823538) //101
NSTUB(FreeMemory                              ,0xffa67aec) //101
NSTUB(FreeUncacheableMemory                   ,0xff82800c) //112
NSTUB(Fseek_Fut                               ,0xff82362c) //101
NSTUB(Fwrite_Fut                              ,0xff82358c) //101
NSTUB(GetBatteryTemperature                   ,0xff84e660) //102
NSTUB(GetCCDTemperature                       ,0xff84e5f0) //102
NSTUB(GetCurrentAvValue                       ,0xff93be84) //102
//NSTUB(GetDrive_ClusterSize                  ,0xff85ae98) //  1            == 0xff85ae98
//NSTUB(GetDrive_FreeClusters                 ,0xff85af00) //  1            == 0xff85af00
//NSTUB(GetDrive_TotalClusters                ,0xff85aecc) //  1            == 0xff85aecc
NSTUB(GetFocusLensSubjectDistance             ,0xff93a30c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff93a618) //  3
NSTUB(GetKbdState                             ,0xff84b660) //109
NSTUB(GetMemInfo                              ,0xff813c24) //  1
NSTUB(GetOpticalTemperature                   ,0xff84e6d0) //102
NSTUB(GetParameterData                        ,0xff975434) //101
NSTUB(GetPropertyCase                         ,0xff8796d8) //102
NSTUB(GetSystemTime                           ,0xffa67b4c) //101
//NSTUB(GetZoomLensCurrentPoint               ,0xff941130) //102            == 0xff941130
//NSTUB(GetZoomLensCurrentPosition            ,0xffa5b24c) //102            == 0xffa5b24c
NSTUB(GiveSemaphore                           ,0xff8279e8) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8b6a00) //102
//NSTUB(LEDDrive                              ,0xff84ab48) //103            == 0xff84ab48
NSTUB(LocalTime                               ,0xff87318c) //  1
NSTUB(LockMainPower                           ,0xff880f70) //103
NSTUB(Lseek                                   ,0xff823ba4) //101
NSTUB(MakeDirectory_Fut                       ,0xff823384) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffacd92c) //102
NSTUB(MoveIrisWithAv                          ,0xffa63120) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa63848) //102
NSTUB(NewTaskShell                            ,0xff879180) //103
NSTUB(Open                                    ,0xff823a3c) //101
//NSTUB(PB2Rec                                ,0xff883fd8) //104            == 0xff883fd8
NSTUB(PT_MoveDigitalZoomToWide                ,0xff86608c) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff866064) //102
NSTUB(PT_PlaySound                            ,0xff8659dc) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff87ec9c) //103            == 0xff87ec9c
NSTUB(PostLogicalEventToUI                    ,0xff87ece8) //103
NSTUB(PutInNdFilter                           ,0xffa636cc) //102
NSTUB(PutOutNdFilter                          ,0xffa636f0) //102
NSTUB(Read                                    ,0xff819a4c) //101
NSTUB(ReadFastDir                             ,0xffa49124) //  1
//NSTUB(Rec2PB                                ,0xff882960) //104            == 0xff882960
//NSTUB(RefreshPhysicalScreen                 ,0xff9df040) //104            == 0xff9df040
NSTUB(Remove                                  ,0xff823aac) //  1
NSTUB(RenameFile_Fut                          ,0xff8232bc) //  1
//NSTUB(Restart                               ,0xff829848) //106            == 0xff829848
NSTUB(SetAE_ShutterSpeed                      ,0xffad07bc) //102
NSTUB(SetAutoShutdownTime                     ,0xff880fe4) //103
NSTUB(SetCurrentCaptureModeType               ,0xff8886b4) //101
NSTUB(SetFileTimeStamp                        ,0xff823d40) //  1
NSTUB(SetLogicalEventActive                   ,0xff880c30) //101
NSTUB(SetParameterData                        ,0xff975310) //101
NSTUB(SetPropertyCase                         ,0xff8795d0) //102
//NSTUB(SetScriptMode                         ,0xff880c80) //101            == 0xff880c80
NSTUB(SleepTask                               ,0xff827c50) //101
NSTUB(TakeSemaphore                           ,0xff827918) //101
//NSTUB(TurnOffBackLight                      ,0xff88f28c) //104            == 0xff88f28c
NSTUB(TurnOnBackLight                         ,0xff88f274) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff963744) //103
//NSTUB(UnlockAF                              ,0xff82589c) //102            == 0xff82589c
NSTUB(UnlockMainPower                         ,0xff880ec4) //103
NSTUB(UpdateMBROnFlash                        ,0xff85acd8) //  1
//NSTUB(VbattGet                              ,0xff82046c) //103            == 0xff82046c
NSTUB(Write                                   ,0xff823b10) //101
//NSTUB(WriteSDCard                           ,0xff92a9a4) //108            == 0xff92a9a4
NSTUB(_log                                    ,0xffb018e4) //111
NSTUB(_log10                                  ,0xffb00570) //112
NSTUB(_pow                                    ,0xffb006e0) //114
NSTUB(_sqrt                                   ,0xffb03540) //  1
NSTUB(add_ptp_handler                         ,0xffa1727c) //  3
//NSTUB(apex2us                               ,0xff9e0128) //  4            == 0xff9e0128
NSTUB(close                                   ,0xff819864) //  1
NSTUB(closedir                                ,0xffa491f4) //  1
NSTUB(err_init_task                           ,0xff814e80) //  4
NSTUB(exmem_alloc                             ,0xff8740cc) //103
NSTUB(free                                    ,0xff813a7c) //112
NSTUB(kbd_p1_f                                ,0xff821c10) //109
NSTUB(kbd_p1_f_cont                           ,0xff821c1c) //109
NSTUB(kbd_p2_f                                ,0xff821428) //109
NSTUB(kbd_read_keys                           ,0xff821b14) //109
//NSTUB(kbd_read_keys_r2                      ,0xff84af6c) //109            == 0xff84af6c
NSTUB(lseek                                   ,0xff823ba4) //101
NSTUB(malloc                                  ,0xff8139a8) //112
NSTUB(memcmp                                  ,0xff81cba4) //101
NSTUB(memcpy                                  ,0xff89ba88) //101
NSTUB(memset                                  ,0xff9df460) //101
NSTUB(mkdir                                   ,0xff823e08) //  1
// ALT: NSTUB(mkdir, 0xff823ea8) // 1 32/0
NSTUB(mktime_ext                              ,0xff89c2f4) //  1
NSTUB(open                                    ,0xff8197b4) //  1
NSTUB(opendir                                 ,0xffa49090) //  1
NSTUB(openfastdir                             ,0xffa49090) //  1
//NSTUB(qsort                                 ,0xffab815c) //  1            == 0xffab815c
NSTUB(rand                                    ,0xff81ccac) //  1
NSTUB(read                                    ,0xff819a4c) //101
NSTUB(readfastdir                             ,0xffa49124) //  1
NSTUB(reboot_fw_update                        ,0xffa50b24) //  5
NSTUB(set_control_event                       ,0xff88088c) //111
NSTUB(srand                                   ,0xff81cca0) //  1
NSTUB(stat                                    ,0xff823c70) //  1
NSTUB(strcat                                  ,0xff89b89c) //  1
//NSTUB(strchr                                ,0xff89b924) //  1            == 0xff89b924
NSTUB(strcmp                                  ,0xff81cb3c) //101
NSTUB(strcpy                                  ,0xff81cb24) //101
NSTUB(strftime                                ,0xff89bcfc) //  1
NSTUB(strlen                                  ,0xff81cb80) //101
NSTUB(strncmp                                 ,0xff89b8d8) //  1
NSTUB(strncpy                                 ,0xff82db14) //  1
//NSTUB(strrchr                               ,0xff9df438) //  1            == 0xff9df438
NSTUB(strtol                                  ,0xff82dd4c) //101
NSTUB(strtolx                                 ,0xff82db50) //109
  DEF(task_CaptSeq                            ,0xff868b98) //107
  DEF(task_ExpDrv                             ,0xff8ad7cc) //110
  DEF(task_InitFileModules                    ,0xff884a54) //107
  DEF(task_MovieRecord                        ,0xff86458c) //107
  DEF(task_PhySw                              ,0xff821784) //107
NSTUB(time                                    ,0xff87376c) //  2
NSTUB(vsprintf                                ,0xff81cae8) //  1
