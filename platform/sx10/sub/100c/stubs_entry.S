// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00C
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
//NSTUB(strrchr                               ,0xff9df428) //  1        *** != 0xff9df430
//NSTUB(write                                 ,0xff823b10) //101        *** != 0xff819aac

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff884bc0 -> ff881350 -> ff973e64 -> ffa79978 -> ffb74378
// Current modemap entry not found in firmware - MODE_VIDEO_STD            3622

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00011ec4) // Found @0xff821b14,          stubs_min = 0x00011ec4 (0x11EC4)
//DEF(physw_run                               ,0x00001c30) // Found @0xff821788,          stubs_min = 0x00001c30 (0x1C24+0x0C)
//DEF(levent_table                            ,0xffb4acb8) // Found @0xffb4acb8,          stubs_min = 0xffb4acb8 (0xFFB4ACB8)
//DEF(FlashParamsTable                        ,0xffb7454c) // Found @0xffb7454c,          stubs_min = 0xffb7454c (0xFFB7454C)
//DEF(movie_status                            ,0x00005430) // Found @0xff8642fc,          stubs_min = 0x00005430 (0x53F8+0x38)
//DEF(canon_menu_active                       ,0x000058d8) // Found @0xff87a1e4,          stubs_min = 0x000058d8 (0x58D4+4)
//DEF(canon_shoot_menu_active                 ,0x0000ac29) // Found @0xff98cb14,          stubs_min = 0x0000ac29 (0xAC28+1)
//DEF(playrec_mode                            ,0x00005640) // Found @0xff86d210,          stubs_min = 0x00005640 (0x563C+0x4)
//DEF(zoom_status                             ,0x0000e3e0) // Found @0xffa7b644,          stubs_min = 0x0000e3e0 (0xE3E0)
//DEF(some_flag_for_af_scan                   ,0x00009b58) // Found @0xff94a2ac

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403b1000; } // Found @0xff846c28
//void *vid_get_viewport_fb()      { return (void*)0x4070d9d0; } // Found @0xffad159c
//char *camera_jpeg_count_str()    { return (char*)0x0004c138; } // Found @0xff9d283c
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffad3a20
//int get_flash_params_count(void) { return 0x78; }              // Found @0xff975464

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb0ad4c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb0ad58, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb0abd8, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb0abd8, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb0abcc, levent 0x00
//    { 1, KEY_SET             ,0x00000100 }, // Found @0xffb0ac74, levent 0x08
//    { 1, KEY_DISPLAY         ,0x00000200 }, // Found @0xffb0ac80, levent 0x0a
//    { 1, KEY_UP              ,0x00000400 }, // Found @0xffb0ac8c, levent 0x04
//    { 1, KEY_DOWN            ,0x00000800 }, // Found @0xffb0ac98, levent 0x05
//    { 1, KEY_RIGHT           ,0x00001000 }, // Found @0xffb0aca4, levent 0x07
//    { 1, KEY_LEFT            ,0x00002000 }, // Found @0xffb0acb0, levent 0x06
//    { 1, KEY_MENU            ,0x00004000 }, // Found @0xffb0acbc, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffaca160
//#define CAM_RAW_ROWS      2772 // Found @0xffaca168
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff828010

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa67ae4) //101
NSTUB(AllocateUncacheableMemory               ,0xff827fcc) //112
NSTUB(Close                                   ,0xff823a64) //101
NSTUB(CreateTask                              ,0xff81aef4) //101
NSTUB(DebugAssert                             ,0xff81b1cc) //111
NSTUB(DeleteFile_Fut                          ,0xff823310) //112
//NSTUB(DoAFLock                              ,0xff825864) //102            == 0xff825864
//NSTUB(EnterToCompensationEVF                ,0xff825b10) //104            == 0xff825b10
NSTUB(ExecuteEventProcedure                   ,0xff8759e8) //  1
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
NSTUB(FreeMemory                              ,0xffa67adc) //101
NSTUB(FreeUncacheableMemory                   ,0xff82800c) //112
NSTUB(Fseek_Fut                               ,0xff82362c) //101
NSTUB(Fwrite_Fut                              ,0xff82358c) //101
NSTUB(GetBatteryTemperature                   ,0xff84e658) //102
NSTUB(GetCCDTemperature                       ,0xff84e5e8) //102
NSTUB(GetCurrentAvValue                       ,0xff93be7c) //102
//NSTUB(GetDrive_ClusterSize                  ,0xff85ae90) //  1            == 0xff85ae90
//NSTUB(GetDrive_FreeClusters                 ,0xff85aef8) //  1            == 0xff85aef8
//NSTUB(GetDrive_TotalClusters                ,0xff85aec4) //  1            == 0xff85aec4
NSTUB(GetFocusLensSubjectDistance             ,0xff93a304) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff93a610) //  3
NSTUB(GetKbdState                             ,0xff84b660) //109
NSTUB(GetMemInfo                              ,0xff813c24) //  1
NSTUB(GetOpticalTemperature                   ,0xff84e6c8) //102
NSTUB(GetParameterData                        ,0xff975424) //101
NSTUB(GetPropertyCase                         ,0xff8796d0) //102
NSTUB(GetSystemTime                           ,0xffa67b3c) //101
//NSTUB(GetZoomLensCurrentPoint               ,0xff941128) //102            == 0xff941128
//NSTUB(GetZoomLensCurrentPosition            ,0xffa5b23c) //102            == 0xffa5b23c
NSTUB(GiveSemaphore                           ,0xff8279e8) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8b69f8) //102
//NSTUB(LEDDrive                              ,0xff84ab48) //103            == 0xff84ab48
NSTUB(LocalTime                               ,0xff873184) //  1
NSTUB(LockMainPower                           ,0xff880f68) //103
NSTUB(Lseek                                   ,0xff823ba4) //101
NSTUB(MakeDirectory_Fut                       ,0xff823384) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffacd91c) //102
NSTUB(MoveIrisWithAv                          ,0xffa63110) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa63838) //102
NSTUB(NewTaskShell                            ,0xff879178) //103
NSTUB(Open                                    ,0xff823a3c) //101
//NSTUB(PB2Rec                                ,0xff883fd0) //104            == 0xff883fd0
NSTUB(PT_MoveDigitalZoomToWide                ,0xff866084) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff86605c) //102
NSTUB(PT_PlaySound                            ,0xff8659d4) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff87ec94) //103            == 0xff87ec94
NSTUB(PostLogicalEventToUI                    ,0xff87ece0) //103
NSTUB(PutInNdFilter                           ,0xffa636bc) //102
NSTUB(PutOutNdFilter                          ,0xffa636e0) //102
NSTUB(Read                                    ,0xff819a4c) //101
NSTUB(ReadFastDir                             ,0xffa49114) //  1
//NSTUB(Rec2PB                                ,0xff882958) //104            == 0xff882958
//NSTUB(RefreshPhysicalScreen                 ,0xff9df030) //104            == 0xff9df030
NSTUB(Remove                                  ,0xff823aac) //  1
NSTUB(RenameFile_Fut                          ,0xff8232bc) //  1
//NSTUB(Restart                               ,0xff829848) //106            == 0xff829848
NSTUB(SetAE_ShutterSpeed                      ,0xffad07ac) //102
NSTUB(SetAutoShutdownTime                     ,0xff880fdc) //103
NSTUB(SetCurrentCaptureModeType               ,0xff8886ac) //101
NSTUB(SetFileTimeStamp                        ,0xff823d40) //  1
NSTUB(SetLogicalEventActive                   ,0xff880c28) //101
NSTUB(SetParameterData                        ,0xff975300) //101
NSTUB(SetPropertyCase                         ,0xff8795c8) //102
//NSTUB(SetScriptMode                         ,0xff880c78) //101            == 0xff880c78
NSTUB(SleepTask                               ,0xff827c50) //101
NSTUB(TakeSemaphore                           ,0xff827918) //101
//NSTUB(TurnOffBackLight                      ,0xff88f284) //104            == 0xff88f284
NSTUB(TurnOnBackLight                         ,0xff88f26c) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff963734) //103
//NSTUB(UnlockAF                              ,0xff82589c) //102            == 0xff82589c
NSTUB(UnlockMainPower                         ,0xff880ebc) //103
NSTUB(UpdateMBROnFlash                        ,0xff85acd0) //  1
//NSTUB(VbattGet                              ,0xff82046c) //103            == 0xff82046c
NSTUB(Write                                   ,0xff823b10) //101
//NSTUB(WriteSDCard                           ,0xff92a99c) //108            == 0xff92a99c
NSTUB(_log                                    ,0xffb018d4) //111
NSTUB(_log10                                  ,0xffb00560) //112
NSTUB(_pow                                    ,0xffb006d0) //114
NSTUB(_sqrt                                   ,0xffb03530) //  1
NSTUB(add_ptp_handler                         ,0xffa1726c) //  3
//NSTUB(apex2us                               ,0xff9e0118) //  4            == 0xff9e0118
NSTUB(close                                   ,0xff819864) //  1
NSTUB(closedir                                ,0xffa491e4) //  1
NSTUB(err_init_task                           ,0xff814e80) //  4
NSTUB(exmem_alloc                             ,0xff8740c4) //103
NSTUB(free                                    ,0xff813a7c) //112
NSTUB(kbd_p1_f                                ,0xff821c10) //109
NSTUB(kbd_p1_f_cont                           ,0xff821c1c) //109
NSTUB(kbd_p2_f                                ,0xff821428) //109
NSTUB(kbd_read_keys                           ,0xff821b14) //109
//NSTUB(kbd_read_keys_r2                      ,0xff84af6c) //109            == 0xff84af6c
NSTUB(lseek                                   ,0xff823ba4) //101
NSTUB(malloc                                  ,0xff8139a8) //112
NSTUB(memcmp                                  ,0xff81cba4) //101
NSTUB(memcpy                                  ,0xff89ba80) //101
NSTUB(memset                                  ,0xff9df450) //101
NSTUB(mkdir                                   ,0xff823e08) //  1
// ALT: NSTUB(mkdir, 0xff823ea8) // 1 32/0
NSTUB(mktime_ext                              ,0xff89c2ec) //  1
NSTUB(open                                    ,0xff8197b4) //  1
NSTUB(opendir                                 ,0xffa49080) //  1
NSTUB(openfastdir                             ,0xffa49080) //  1
//NSTUB(qsort                                 ,0xffab814c) //  1            == 0xffab814c
NSTUB(rand                                    ,0xff81ccac) //  1
NSTUB(read                                    ,0xff819a4c) //101
NSTUB(readfastdir                             ,0xffa49114) //  1
NSTUB(reboot_fw_update                        ,0xffa50b14) //  5
NSTUB(set_control_event                       ,0xff880884) //111
NSTUB(srand                                   ,0xff81cca0) //  1
NSTUB(stat                                    ,0xff823c70) //  1
NSTUB(strcat                                  ,0xff89b894) //  1
//NSTUB(strchr                                ,0xff89b91c) //  1            == 0xff89b91c
NSTUB(strcmp                                  ,0xff81cb3c) //101
NSTUB(strcpy                                  ,0xff81cb24) //101
NSTUB(strftime                                ,0xff89bcf4) //  1
NSTUB(strlen                                  ,0xff81cb80) //101
NSTUB(strncmp                                 ,0xff89b8d0) //  1
NSTUB(strncpy                                 ,0xff82db14) //  1
NSTUB(strtol                                  ,0xff82dd4c) //101
NSTUB(strtolx                                 ,0xff82db50) //109
  DEF(task_CaptSeq                            ,0xff868b90) //107
  DEF(task_ExpDrv                             ,0xff8ad7c4) //110
  DEF(task_InitFileModules                    ,0xff884a4c) //107
  DEF(task_MovieRecord                        ,0xff864584) //107
  DEF(task_PhySw                              ,0xff821784) //107
NSTUB(time                                    ,0xff873764) //  2
NSTUB(vsprintf                                ,0xff81cae8) //  1
